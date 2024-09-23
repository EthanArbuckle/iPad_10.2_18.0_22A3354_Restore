@implementation SynapseLinkingEngine

- (_TtC8PaperKit20SynapseLinkingEngine)init
{
  objc_class *ObjectType;
  id v4;
  _TtC8PaperKit20SynapseLinkingEngine *v5;
  objc_class *v6;
  _TtC8PaperKit20SynapseLinkingEngine *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->engine[OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4 = objc_allocWithZone(MEMORY[0x1E0DB0748]);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_engine) = v6;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  v7 = -[SynapseLinkingEngine init](&v9, sel_init);
  objc_msgSend(*(id *)((char *)&v7->super.isa + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_engine), sel_setDelegate_, v7);
  return v7;
}

- (void)linkableItemFinderItemsMightHaveChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _TtC8PaperKit20SynapseLinkingEngine *v11;

  v5 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_delegate, a2);
  if (v5)
  {
    v6 = v5;
    v7 = v5 + OBJC_IVAR____TtC8PaperKit32PKPaperTextViewLinkingController_delegate;
    swift_beginAccess();
    v8 = (void *)MEMORY[0x1DF0E666C](v7);
    if (v8)
    {
      v9 = v8;
      if ((objc_msgSend(v8, sel_respondsToSelector_, sel_linkingControllerLinksMightHaveChanged_) & 1) != 0)
      {
        v10 = a3;
        v11 = self;
        objc_msgSend(v9, sel_linkingControllerLinksMightHaveChanged_, v6);

      }
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{

  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_delegate);
}

@end
