@implementation ArtistListViewController

- (_TtC16MusicApplication24ArtistListViewController)init
{
  return (_TtC16MusicApplication24ArtistListViewController *)sub_2DFD9C();
}

- (_TtC16MusicApplication24ArtistListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2E851C();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication24ArtistListViewController *v2;

  v2 = self;
  sub_2E0168();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication24ArtistListViewController *v4;

  v4 = self;
  sub_2E29D4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtistListViewController(0);
  v4 = v5.receiver;
  -[ArtistListViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication24ArtistListViewController *v6;

  v5 = a3;
  v6 = self;
  sub_2E2BE8((uint64_t)a3);

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  _TtC16MusicApplication24ArtistListViewController *v2;

  v2 = self;
  sub_2E2F68();

}

- (_TtC16MusicApplication24ArtistListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication24ArtistListViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication24ArtistListViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ArtistListViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_selectedArtistIdentifier, (uint64_t *)&unk_14C0300);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_requestResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_filterOptionsController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_noContentStateController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController____lazy_storage___contentFilteringController));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication24ArtistListViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_2E87E8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication24ArtistListViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_2E8980(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC16MusicApplication24ArtistListViewController *v14;
  id v15;
  uint64_t v17;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = sub_2E8C28(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _TtC16MusicApplication24ArtistListViewController *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;

  if (a5)
  {
    v9 = swift_allocObject(&unk_1357490, 24, 7);
    *(_QWORD *)(v9 + 16) = self;
    v15[4] = sub_2E87A0;
    v16 = v9;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_42D124;
    v15[3] = &block_descriptor_75;
    v10 = _Block_copy(v15);
    v11 = v16;
    v12 = self;
    v13 = a3;
    v14 = a4;
    swift_unknownObjectRetain(a5);
    objc_msgSend(a5, "addCompletion:", v10, swift_release(v11).n128_f64[0]);
    _Block_release(v10);

    swift_unknownObjectRelease(a5);
  }
}

@end
