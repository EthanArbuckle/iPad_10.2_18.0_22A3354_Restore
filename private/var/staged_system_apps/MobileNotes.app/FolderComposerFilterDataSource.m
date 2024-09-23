@implementation FolderComposerFilterDataSource

- (_TtC11MobileNotes30FolderComposerFilterDataSource)init
{
  sub_100267C24();
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_100268D98(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&off_100556D28);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_100268D98(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&off_100556D50);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11MobileNotes30FolderComposerFilterDataSource *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10026E874();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource_collectionView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource_accountObjectID));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource_presentingViewController));
  swift_release(*(_QWORD *)&self->collectionView[OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource_presentViewControllerBlock]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource____lazy_storage___diffableDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource_filterSelection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource_popoverSelectionObservation));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterDataSource_enabledSections));
}

@end
