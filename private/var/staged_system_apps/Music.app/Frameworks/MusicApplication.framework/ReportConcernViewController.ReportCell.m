@implementation ReportConcernViewController.ReportCell

- (void)layoutSubviews
{
  _TtCC16MusicApplication27ReportConcernViewControllerP33_A42CB8B3206839F30574C2DC47C0C3B210ReportCell *v2;

  v2 = self;
  sub_5CA964();

}

- (_TtCC16MusicApplication27ReportConcernViewControllerP33_A42CB8B3206839F30574C2DC47C0C3B210ReportCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NSString v6;
  _TtCC16MusicApplication27ReportConcernViewControllerP33_A42CB8B3206839F30574C2DC47C0C3B210ReportCell *v7;
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

- (_TtCC16MusicApplication27ReportConcernViewControllerP33_A42CB8B3206839F30574C2DC47C0C3B210ReportCell)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication27ReportConcernViewControllerP33_A42CB8B3206839F30574C2DC47C0C3B210ReportCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ReportConcernViewController.ReportCell();
  v4 = a3;
  v5 = -[ReportConcernViewController.ReportCell initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
