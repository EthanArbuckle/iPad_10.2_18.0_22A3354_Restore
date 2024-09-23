@implementation CRLSelectionDispatcher

- (id)receivers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_receivers));
}

- (void)snapshotSelectionState
{
  _TtC8Freeform22CRLSelectionDispatcher *v2;

  v2 = self;
  sub_100D196AC();

}

- (void)clearSelectionStateSnapshots
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_selectionStateSnapshots), "removeAllObjects");
}

- (void)validateSelections
{
  _TtC8Freeform22CRLSelectionDispatcher *v2;

  v2 = self;
  sub_100D1A1EC();

}

- (_TtC8Freeform22CRLSelectionDispatcher)init
{
  uint64_t v3;
  void *v4;
  _TtC8Freeform22CRLSelectionDispatcher *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_receivers;
  v4 = (void *)objc_opt_self(NSHashTable);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, "weakObjectsHashTable");
  v6 = OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_selectionStateSnapshots;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend((id)objc_opt_self(NSMapTable), "weakToStrongObjectsMapTable");

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CRLSelectionDispatcher();
  return -[CRLSelectionDispatcher init](&v8, "init");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_selectionStateSnapshots));
}

@end
