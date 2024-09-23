@implementation HotReloadStatusHUDViewController

- (void)viewDidLoad
{
  _TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController *v2;

  v2 = self;
  sub_53824();

}

- (void)viewDidLayoutSubviews
{
  _TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController *v2;

  v2 = self;
  sub_53998();

}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  NSString v10;
  _QWORD *v11;
  id v12;
  _TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView) = 0;
    v8 = (Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_text);
    *v8 = 0;
    v8[1] = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView) = 0;
    v11 = (Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_text);
    *v11 = 0;
    v11[1] = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for HotReloadStatusHUDViewController();
  v13 = -[HotReloadStatusHUDViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_text);
  v6 = (objc_class *)type metadata accessor for HotReloadStatusHUDViewController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[HotReloadStatusHUDViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->hudView[OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_text]);
}

@end
