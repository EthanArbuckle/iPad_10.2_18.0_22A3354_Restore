@implementation Interstellar.ViewController

- (_TtCO16MusicApplication12Interstellar14ViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_630694();
}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_s14ViewControllerCMa_1();
  v2 = v6.receiver;
  -[Interstellar.ViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = sub_629668();
  v4 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  _TtCO16MusicApplication12Interstellar14ViewController *v2;

  v2 = self;
  sub_6297A8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtCO16MusicApplication12Interstellar14ViewController *v6;

  v5 = a3;
  v6 = self;
  sub_62AFBC((uint64_t)a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtCO16MusicApplication12Interstellar14ViewController *v4;

  v3 = a3;
  v4 = self;
  sub_62B194(v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtCO16MusicApplication12Interstellar14ViewController *v4;

  v4 = self;
  sub_62B578(a3);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  _TtCO16MusicApplication12Interstellar14ViewController *v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_62BD68(v13, v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  _TtCO16MusicApplication12Interstellar14ViewController *v16;
  _QWORD *v17;
  __n128 v18;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  v17 = sub_62DB3C();
  sub_A114E4((uint64_t)v12);

  v18 = swift_release(v17);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v18);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtCO16MusicApplication12Interstellar14ViewController *v13;
  char v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = UICollectionView.isDraggingCell(at:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (v14 & 1) == 0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtCO16MusicApplication12Interstellar14ViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_62C54C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtCO16MusicApplication12Interstellar14ViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_6316AC(v9, a5);

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
  _TtCO16MusicApplication12Interstellar14ViewController *v14;
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
  v15 = sub_631930((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (_TtCO16MusicApplication12Interstellar14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCO16MusicApplication12Interstellar14ViewController *result;

  v4 = a4;
  result = (_TtCO16MusicApplication12Interstellar14ViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController____lazy_storage___collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_dragDropController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_mediaPickerAddController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController____lazy_storage___requestResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController____lazy_storage___impressionsTracker));
}

- (NSData)playActivityRecommendationData
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtCO16MusicApplication12Interstellar14ViewController *v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSData v10;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCO16MusicApplication12Interstellar14ViewController_viewModel);
  if (!v2)
    return (NSData *)0;
  v3 = *(uint64_t (**)(void))((char *)&stru_68.offset + (*v2 & swift_isaMask));
  v4 = self;
  v5 = v2;
  v6 = v3();
  v8 = v7;

  if (v8 >> 60 == 15)
    return (NSData *)0;
  v10.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_50C4C(v6, v8);
  return (NSData *)v10.super.isa;
}

@end
