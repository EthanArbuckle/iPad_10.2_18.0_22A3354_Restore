@implementation SharedLibrariesViewController

- (void)dealloc
{
  void *v3;
  _TtC16MusicApplication29SharedLibrariesViewController *v4;
  id v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_collectionView);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "setDataSource:", 0);
    objc_msgSend(v5, "setDelegate:", 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SharedLibrariesViewController();
  -[SharedLibrariesViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_bindings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_textDrawingCache));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_mediaLibraries));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController__lastSelectedMediaLibrary));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_cellBindings));
}

- (void)loadView
{
  _TtC16MusicApplication29SharedLibrariesViewController *v2;

  v2 = self;
  sub_190524();

}

- (void)viewDidLoad
{
  _TtC16MusicApplication29SharedLibrariesViewController *v2;

  v2 = self;
  sub_1907D4();

}

- (void)viewWillAppear:(BOOL)a3
{
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SharedLibrariesViewController();
  v3 = (char *)v4.receiver;
  -[SharedLibrariesViewController viewWillAppear:](&v4, "viewWillAppear:", 1);
  objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController__lastSelectedMediaLibrary], "disconnect", v4.receiver, v4.super_class);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication29SharedLibrariesViewController *v2;

  v2 = self;
  sub_191018();

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  _TtC16MusicApplication29SharedLibrariesViewController *v2;

  v2 = self;
  sub_1910E8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication29SharedLibrariesViewController *v6;

  v5 = a3;
  v6 = self;
  sub_19128C(a3);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication29SharedLibrariesViewController *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_mediaLibraries);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8));
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_mediaLibraries);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication29SharedLibrariesViewController *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = (void *)sub_191638((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
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
  _TtC16MusicApplication29SharedLibrariesViewController *v16;
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
  sub_192614(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  id v13;
  id v14;
  id v15;
  _TtC16MusicApplication29SharedLibrariesViewController *v16;
  uint64_t v17;
  __n128 v18;
  _BYTE v20[24];

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication29SharedLibrariesViewController_cellBindings, v20, 33, 0);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  v17 = sub_7071E8((uint64_t)v12);
  swift_endAccess(v20);

  v18 = swift_release(v17);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v10 + 8))(v12, v9, v18);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication29SharedLibrariesViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_191BC8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16MusicApplication29SharedLibrariesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication29SharedLibrariesViewController *v9;

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
  v9 = (_TtC16MusicApplication29SharedLibrariesViewController *)sub_1928F0(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication29SharedLibrariesViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication29SharedLibrariesViewController *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication29SharedLibrariesViewController *)sub_192A08((uint64_t)v3);

  return v4;
}

@end
