@implementation FolderComposerParticipantViewController

- (_TtC11MobileNotes39FolderComposerParticipantViewController)initWithCoder:(id)a3
{
  _TtC11MobileNotes39FolderComposerParticipantViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes39FolderComposerParticipantViewController____lazy_storage___diffableDataSource) = 0;

  result = (_TtC11MobileNotes39FolderComposerParticipantViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004796E0, "MobileNotes/FolderComposerParticipantViewController.swift", 57, 2, 24, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC11MobileNotes39FolderComposerParticipantViewController *v2;

  v2 = self;
  sub_10032855C();

}

- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  LOBYTE(a1) = sub_10032A880();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11MobileNotes39FolderComposerParticipantViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10032AA04((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC11MobileNotes39FolderComposerParticipantViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11MobileNotes39FolderComposerParticipantViewController *result;

  v4 = a4;
  result = (_TtC11MobileNotes39FolderComposerParticipantViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.FolderComposerParticipantViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes39FolderComposerParticipantViewController_participantSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes39FolderComposerParticipantViewController____lazy_storage___diffableDataSource));
}

@end
