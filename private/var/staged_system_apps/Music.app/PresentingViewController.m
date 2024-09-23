@implementation PresentingViewController

- (void)loadView
{
  id v3;
  _TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  v5 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[PresentingViewController setView:](v4, "setView:", v5);

}

- (_TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PresentingViewController();
  v11 = -[PresentingViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PresentingViewController();
  return -[PresentingViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
