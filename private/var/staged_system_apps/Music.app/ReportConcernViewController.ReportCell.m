@implementation ReportConcernViewController.ReportCell

- (void)layoutSubviews
{
  _TtCC5Music27ReportConcernViewControllerP33_03BD007C7BDDE8EDAF7F9A217E3D891910ReportCell *v2;

  v2 = self;
  sub_100554D54();

}

- (_TtCC5Music27ReportConcernViewControllerP33_03BD007C7BDDE8EDAF7F9A217E3D891910ReportCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NSString v6;
  _TtCC5Music27ReportConcernViewControllerP33_03BD007C7BDDE8EDAF7F9A217E3D891910ReportCell *v7;
  objc_super v9;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ReportConcernViewController.ReportCell();
  v7 = -[ReportConcernViewController.ReportCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, v6);

  return v7;
}

- (_TtCC5Music27ReportConcernViewControllerP33_03BD007C7BDDE8EDAF7F9A217E3D891910ReportCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ReportConcernViewController.ReportCell();
  return -[ReportConcernViewController.ReportCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
