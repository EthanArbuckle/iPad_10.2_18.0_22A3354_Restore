@implementation TipsTOCViewController

- (_TtC4Tips21TipsTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipsTOCViewController();
  return -[TPSViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0, 0);
}

- (void)dealloc
{
  void *v3;
  _TtC4Tips21TipsTOCViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", v4, UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", v4, UIApplicationDidEnterBackgroundNotification, 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for TipsTOCViewController();
  -[TPSViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask));
}

- (_TtC4Tips21TipsTOCViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipsTOCViewController();
  return -[TPSViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC4Tips21TipsTOCViewController *v4;

  v4 = self;
  sub_100058738(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipsTOCViewController();
  v4 = v6.receiver;
  -[TPSAppViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v4[OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount] = 0;
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask];
  if (v5)
  {
    swift_retain(*(_QWORD *)&v4[OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask]);
    Task.cancel()();

    swift_release(v5);
  }
  else
  {

  }
}

- (void)applicationWillEnterForeground
{
  _TtC4Tips21TipsTOCViewController *v2;

  v2 = self;
  sub_100057FCC();

}

- (void)applicationWillEnterBackground
{
  uint64_t v2;
  _TtC4Tips21TipsTOCViewController *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask);
  v3 = self;
  if (v2)
  {
    swift_retain(v2);
    Task.cancel()();
    swift_release(v2);
  }
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount) = 0;

}

- (_TtC4Tips21TipsTOCViewController)initWithAppController:(id)a3
{
  id v3;
  _TtC4Tips21TipsTOCViewController *result;

  v3 = a3;
  result = (_TtC4Tips21TipsTOCViewController *)_swift_stdlib_reportUnimplementedInitializer("Tips.TipsTOCViewController", 26, "init(appController:)", 20, 0);
  __break(1u);
  return result;
}

@end
