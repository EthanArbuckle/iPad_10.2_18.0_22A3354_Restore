@implementation CircularLoadingViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication29CircularLoadingViewController *v2;

  v2 = self;
  sub_217344();

}

- (_TtC16MusicApplication29CircularLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication29CircularLoadingViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer) = 0;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer) = 0;
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[CircularLoadingViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC16MusicApplication29CircularLoadingViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC16MusicApplication29CircularLoadingViewController *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = a3;
  v7 = -[CircularLoadingViewController initWithCoder:](&v9, "initWithCoder:", v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer));
}

@end
