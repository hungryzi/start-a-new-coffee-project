describe "Litterbox", ->
  describe "#clean", ->
    it "makes the box clean", ->
      litterbox = new Litterbox()
      litterbox.dirty = true
      litterbox.clean()
      expect(litterbox.dirty).toEqual(false)
