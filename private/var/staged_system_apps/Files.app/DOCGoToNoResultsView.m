@implementation DOCGoToNoResultsView

- (double)_labelAlpha
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  -[DOCGoToNoResultsView _labelAlpha](&v4, "_labelAlpha");
  return v2 * 0.5;
}

- (_TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C20DOCGoToNoResultsView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  _TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C20DOCGoToNoResultsView *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v12 = v11;
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  v14 = -[DOCGoToNoResultsView initWithFrame:title:style:](&v16, "initWithFrame:title:style:", v13, a5, x, y, width, height);

  if (v14)
  return v14;
}

- (_TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C20DOCGoToNoResultsView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  _TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C20DOCGoToNoResultsView *v16;
  objc_super v18;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v14 = v13;
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v14);
  }
  else
  {
    v15 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  v16 = -[DOCGoToNoResultsView initWithFrame:title:style:includeBackdrop:](&v18, "initWithFrame:title:style:includeBackdrop:", v15, a5, v6, x, y, width, height);

  if (v16)
  return v16;
}

- (_TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C20DOCGoToNoResultsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  return -[DOCGoToNoResultsView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C20DOCGoToNoResultsView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  return -[DOCGoToNoResultsView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
