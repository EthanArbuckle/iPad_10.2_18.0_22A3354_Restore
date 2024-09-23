@implementation JSSettingsViewController

- (_TtC16MusicApplication24JSSettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8DFAB8();
}

- (void)dealloc
{
  uint64_t v2;
  _TtC16MusicApplication24JSSettingsViewController *v3;
  uint64_t v4;
  _TtC16MusicApplication24JSSettingsViewController *v5;
  objc_super v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = qword_14AAB08;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_14AAB08, sub_1E63B4);
  v4 = qword_157FA18;
  v7 = xmmword_1060DF0;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  v5 = v3;
  sub_8DF658((uint64_t)&v7, (uint64_t)v5, v4);

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for JSSettingsViewController(0);
  -[JSSettingsViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sizingFooterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sizingHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_settingsViewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_userDetailsItemIndexPath, (uint64_t *)&unk_14AD540);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_accountStoreDidChangeObserver));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_userProfileObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_profilePerson));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_greenTeaLogger));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_userSelectedImage));
}

- (void)loadView
{
  _TtC16MusicApplication24JSSettingsViewController *v2;

  v2 = self;
  sub_8D3C08();

}

- (NSString)playActivityFeatureName
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_settingsViewModel)
     + OBJC_IVAR____TtC11MusicJSCore11JSViewModel_playActivityFeatureName;
  swift_beginAccess(v2, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (NSData)playActivityRecommendationData
{
  uint64_t v2;
  unint64_t v3;
  Class isa;
  uint64_t v5;
  unint64_t v6;

  v2 = JSViewModel.playActivityRecommendationData.getter();
  if (v3 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    v5 = v2;
    v6 = v3;
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_50C4C(v5, v6);
  }
  return (NSData *)isa;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication24JSSettingsViewController *v2;

  v2 = self;
  sub_8D3F4C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16MusicApplication24JSSettingsViewController *v4;

  v3 = a3;
  v4 = self;
  sub_8D46F4(v3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication24JSSettingsViewController *v2;

  v2 = self;
  sub_8D4B94();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication24JSSettingsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_8D4CDC(a3);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  char *v3;
  _BYTE v5[24];

  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sections;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sections, v5, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  char *v5;
  int64_t result;
  _BYTE v7[24];

  v5 = (char *)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sections;
  result = swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication24JSSettingsViewController_sections, v7, 0, 0);
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v5 + 16) > (unint64_t)a4)
  {
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 56 * a4 + 32) + 16);
  }
  __break(1u);
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication24JSSettingsViewController *v13;
  double v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v15 = (void *)sub_8D5298(v14, (uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _TtC16MusicApplication24JSSettingsViewController *v19;
  void *v20;
  void *v21;
  uint64_t v23;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = self;
  sub_8D6640(v16, v13, v15, (uint64_t)v12);
  v21 = v20;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();

  return v21;
}

- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return sub_F34D8(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_8DFCD0);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_F34D8(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_8DFD94);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication24JSSettingsViewController *v13;
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
  sub_8DFEF4((uint64_t)v10);
  LOBYTE(self) = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication24JSSettingsViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_8D6E70();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC16MusicApplication24JSSettingsViewController *v13;

  type metadata accessor for InfoKey(0);
  v8 = v7;
  v9 = sub_4DD24((unint64_t *)&unk_14E8690, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_105EEEC);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_8D7630(v11, v10);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  _TtC16MusicApplication24JSSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_8D7F80(v4);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_F34D8(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_8DFEF4);
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC16MusicApplication24JSSettingsViewController *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;

  v6 = qword_14ABAB8;
  v7 = a3;
  v14 = a4;
  v8 = self;
  if (v6 != -1)
    swift_once(&qword_14ABAB8, sub_8D99E0);
  v9 = type metadata accessor for Logger(0);
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_14E8390);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter(v11);
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "AAUISignInController did complete", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  -[JSSettingsViewController dismissViewControllerAnimated:completion:](v8, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4;
  _TtC16MusicApplication24JSSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_8E01F0();

}

- (void)handleDoneButtonTapped
{
  _TtC16MusicApplication24JSSettingsViewController *v2;

  v2 = self;
  sub_8D9910();

}

- (_TtC16MusicApplication24JSSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.JSSettingsViewController", 41);
}

@end
