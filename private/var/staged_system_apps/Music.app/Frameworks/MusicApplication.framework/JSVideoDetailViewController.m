@implementation JSVideoDetailViewController

- (_TtC16MusicApplication27JSVideoDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  NSString v7;
  id v8;
  _TtC16MusicApplication27JSVideoDetailViewController *v9;
  objc_super v11;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponseInvalidationObserver) = 0;
    v6 = a4;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponseInvalidationObserver) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for JSVideoDetailViewController();
  v9 = -[JSVideoDetailViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v7, a4);

  return v9;
}

- (_TtC16MusicApplication27JSVideoDetailViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication27JSVideoDetailViewController *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponseInvalidationObserver) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JSVideoDetailViewController();
  v4 = a3;
  v5 = -[JSVideoDetailViewController initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponseInvalidationObserver));
}

@end
