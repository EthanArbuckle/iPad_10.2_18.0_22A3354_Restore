@implementation FolderComposerFolderSelectionDataSource

- (_TtC11MobileNotes39FolderComposerFolderSelectionDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5
{
  void *v7;
  id v8;
  id v9;
  _TtC11MobileNotes39FolderComposerFolderSelectionDataSource *result;

  v7 = _Block_copy(a4);
  v8 = a3;
  v9 = a5;
  _Block_release(v7);
  result = (_TtC11MobileNotes39FolderComposerFolderSelectionDataSource *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.FolderComposerFolderSelectionDataSource", 51, "init(collectionView:cellProvider:indexer:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->ICCoreDataDataSource_opaque[OBJC_IVAR____TtC11MobileNotes39FolderComposerFolderSelectionDataSource_accountsChangeObservation]);
  sub_100012DDC((uint64_t)&self->ICCoreDataDataSource_opaque[OBJC_IVAR____TtC11MobileNotes39FolderComposerFolderSelectionDataSource____lazy_storage___accountsChangePublisher], &qword_1005D1C50);
}

@end
