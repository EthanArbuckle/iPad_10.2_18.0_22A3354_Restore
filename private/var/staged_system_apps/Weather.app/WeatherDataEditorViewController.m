@implementation WeatherDataEditorViewController

- (_TtC7Weather31WeatherDataEditorViewController)initWithCoder:(id)a3
{
  sub_100799FF4();
}

- (void)viewWillLayoutSubviews
{
  _TtC7Weather31WeatherDataEditorViewController *v2;

  v2 = self;
  sub_10079A058();

}

- (void)viewDidLoad
{
  _TtC7Weather31WeatherDataEditorViewController *v2;

  v2 = self;
  sub_10079A14C();

}

- (_TtC7Weather31WeatherDataEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10079A304();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Weather31WeatherDataEditorViewController_hostingController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->hostingController[OBJC_IVAR____TtC7Weather31WeatherDataEditorViewController_locationName]);
}

@end
