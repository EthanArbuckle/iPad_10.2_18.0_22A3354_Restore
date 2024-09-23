@implementation PreviewViewController

- (_TtC13TipsQuicklook21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC13TipsQuicklook21PreviewViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PreviewViewController();
  v11 = -[PreviewViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC13TipsQuicklook21PreviewViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewViewController();
  return -[PreviewViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController));
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _TtC13TipsQuicklook21PreviewViewController *v15;

  v8 = _Block_copy(a5);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v12 = v10;
  if (a4)
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
    a4 = v14;
  }
  else
  {
    v13 = 0;
  }
  _Block_copy(v8);
  v15 = self;
  sub_1000049A0(v11, v12, v13, a4, (char *)v15, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(a4);
}

- (void)viewDidLoad
{
  _TtC13TipsQuicklook21PreviewViewController *v2;

  v2 = self;
  sub_100003D1C();

}

- (void)updateViewConstraints
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC13TipsQuicklook21PreviewViewController *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v3 = type metadata accessor for TipsLog(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  static TipsLog.default.getter();
  logDebug(_:_:)(v6, 0xD00000000000002DLL, 0x800000010000A330);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v8 = -[PreviewViewController view](v7, "view");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "updateConstraints");

  }
  else
  {
    __break(1u);
  }
}

@end
