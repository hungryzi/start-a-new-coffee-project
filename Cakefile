fs = require 'fs'

{print} = require 'util'
{spawn} = require 'child_process'

sources = [
  'src/litterbox.coffee'
]

build = (options, callback) ->
  args = ['--compile']
  args = args.concat(['--output', options.output]) if options.output
  args = args.concat(['--join', options.join]) if options.join
  args = args.concat(['--watch']) if options.watch
  args = args.concat(options.sources || ['src'])
  coffee = spawn 'coffee', args
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'compile', 'Compile gen/ from src/', ->
  build join: 'app.js', output: 'gen', sources: sources

task 'spec', 'Compile spec files from spec/', ->
  build output: 'gen/spec', sources: ['spec']

task 'watch', 'Continously compile gen/ from src/', ->
  build join: 'app.js', output: 'gen', sources: sources, watch: true
  build output: 'gen/spec', sources: ['spec'], watch: true

