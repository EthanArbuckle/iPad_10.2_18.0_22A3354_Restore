@implementation AudiobookTOCViewController

- (_TtC5Books26AudiobookTOCViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10038AC8C();
}

- (void)dealloc
{
  void *v3;
  _TtC5Books26AudiobookTOCViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AudiobookTOCViewController();
  -[AudiobookTOCViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_headerHeightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_cancellables));
}

- (void)viewDidLoad
{
  _TtC5Books26AudiobookTOCViewController *v2;

  v2 = self;
  sub_100387190();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Books26AudiobookTOCViewController *v4;

  v4 = self;
  sub_100387CDC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookTOCViewController();
  v4 = v5.receiver;
  -[AudiobookTOCViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_1003C827C();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9[24];
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AudiobookTOCViewController();
  v4 = (char *)v10.receiver;
  -[AudiobookTOCViewController viewWillDisappear:](&v10, "viewWillDisappear:", v3);
  v5 = &v4[OBJC_IVAR____TtC5Books26AudiobookTOCViewController_cancellables];
  swift_beginAccess(&v4[OBJC_IVAR____TtC5Books26AudiobookTOCViewController_cancellables], v9, 1, 0);
  v6 = *(_QWORD *)v5;
  swift_bridgeObjectRetain(*(_QWORD *)v5);
  sub_1002FBE64(v7);
  swift_bridgeObjectRelease(v6);
  v8 = *(_QWORD *)v5;
  *(_QWORD *)v5 = &_swiftEmptySetSingleton;

  swift_bridgeObjectRelease(v8);
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC5Books26AudiobookTOCViewController *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_10038ADC0();

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void)updateTimeRemaining
{
  _TtC5Books26AudiobookTOCViewController *v2;

  v2 = self;
  sub_1003897B4();

}

- (void)onAppWillEnterForegroundWithNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _TtC5Books26AudiobookTOCViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = -[AudiobookTOCViewController view](v8, "view");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "window");

    if (v7)
      sub_1003C827C();

  }
  else
  {
    __break(1u);
  }
}

- (_TtC5Books26AudiobookTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Books26AudiobookTOCViewController *result;

  v4 = a4;
  result = (_TtC5Books26AudiobookTOCViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookTOCViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  id v9;
  _TtC5Books26AudiobookTOCViewController *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;

  v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_viewModel);
  KeyPath = swift_getKeyPath(&unk_10071E290);
  v8 = swift_getKeyPath(&unk_10071E2B8);
  v9 = a3;
  v10 = self;
  static Published.subscript.getter(&v15, v6, KeyPath, v8);
  swift_release(KeyPath);
  swift_release(v8);
  v11 = v15;
  if ((unint64_t)v15 >> 62)
  {
    if (v15 < 0)
      v14 = v15;
    else
      v14 = v15 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v15);
    v12 = _CocoaArrayWrapper.endIndex.getter(v14);

    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease(v11);

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Books26AudiobookTOCViewController *v12;
  __n128 v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v14 = sub_100389E78(v11, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Books26AudiobookTOCViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10038AFD4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5Books26AudiobookTOCViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10038A660(v4);

}

@end
