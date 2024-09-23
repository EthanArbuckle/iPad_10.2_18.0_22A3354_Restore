@implementation FolderComposerSelectionViewController

- (void)viewDidLoad
{
  _TtC11MobileNotes37FolderComposerSelectionViewController *v2;

  v2 = self;
  sub_10032EDE4();

}

- (_TtC11MobileNotes37FolderComposerSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11MobileNotes37FolderComposerSelectionViewController *)sub_10032F6D4(v5, v7, a4);
}

- (_TtC11MobileNotes37FolderComposerSelectionViewController)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes37FolderComposerSelectionViewController *)sub_10032F848(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11MobileNotes37FolderComposerSelectionViewController_joinSummaryIdentifier;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes37FolderComposerSelectionViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes37FolderComposerSelectionViewController_contentSizeObservation));
}

@end
