@implementation LibraryMenuViewController

- (_TtC16MusicApplication25LibraryMenuViewController)init
{
  return -[LibraryMenuViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (_TtC16MusicApplication25LibraryMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication25LibraryMenuViewController *v9;

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
  v9 = (_TtC16MusicApplication25LibraryMenuViewController *)sub_4B52B4(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication25LibraryMenuViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4B5488();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication25LibraryMenuViewController *v2;

  v2 = self;
  sub_4AF5DC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMenuViewController();
  v4 = v5.receiver;
  -[LibraryMenuViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  objc_msgSend(v4, "loadViewIfNeeded", v5.receiver, v5.super_class);
  *((_BYTE *)v4 + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_pendingSelectedIdentifier) = 13;
  sub_4B2868();
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(1);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMenuViewController();
  v4 = v5.receiver;
  -[LibraryMenuViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_4B2868();
  v4[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_allowsAnimatedChanges] = 1;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMenuViewController();
  v4 = v5.receiver;
  -[LibraryMenuViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(0);
  v4[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_allowsAnimatedChanges] = 0;

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC16MusicApplication25LibraryMenuViewController *v6;

  v6 = self;
  sub_4B0D58(a3, a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication25LibraryMenuViewController *v6;

  v5 = a3;
  v6 = self;
  sub_4B205C((uint64_t)a3);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  sub_4B2684(self, (uint64_t)a2, a3, a4, (void (*)(char *))sub_4B55E8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  sub_4B2684(self, (uint64_t)a2, a3, a4, (void (*)(char *))sub_4B5B78);
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  _TtC16MusicApplication25LibraryMenuViewController *v16;
  void (*v17)(char *, uint64_t);
  Class isa;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD540);
  __chkstk_darwin(v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_4B2460((uint64_t)v10, (uint64_t)v13);

  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);

  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v17(v13, v7);
  }
  return isa;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  sub_4B2684(self, (uint64_t)a2, a3, a4, (void (*)(char *))sub_4B5CDC);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _TtC16MusicApplication25LibraryMenuViewController *v19;
  id v20;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = type metadata accessor for LibraryMenuViewController.Cell();
  v14 = swift_dynamicCastClass(a4, v13);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = a3;
    v17 = a4;
    v18 = a5;
    v19 = self;
    objc_msgSend(v15, "_setDrawsSeparatorAtTopOfSection:", 0);
    objc_msgSend(v15, "_setDrawsSeparatorAtBottomOfSection:", 1);
    objc_msgSend(v15, "_setShouldHaveFullLengthTopSeparator:", 0);

  }
  else
  {
    v20 = a5;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

}

- (_TtC16MusicApplication25LibraryMenuViewController)initWithStyle:(int64_t)a3
{
  _TtC16MusicApplication25LibraryMenuViewController *result;

  result = (_TtC16MusicApplication25LibraryMenuViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryMenuViewController", 42, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingDelegate);
  sub_2F9F9C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu), *(void **)&self->editingDelegate[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu], *(_QWORD *)&self->editingDelegate[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu + 8], *(_QWORD *)&self->editingMenu[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu], *(_QWORD *)&self->editingMenu[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu + 8], *(_QWORD *)&self->editingMenu[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu + 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_downloadManagerObserver));

  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_requestResponseController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_dataSource));
}

@end
