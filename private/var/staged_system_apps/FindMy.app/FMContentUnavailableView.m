@implementation FMContentUnavailableView

- (id)_titleFont
{
  void *v3;
  _TtC6FindMy24FMContentUnavailableView *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_self(UIFont);
  v4 = self;
  v5 = objc_msgSend(v3, "preferredFontForTextStyle:", UIFontTextStyleTitle2);
  v6 = (void *)sub_10003CEE8(0x8000);

  v7 = (void *)sub_10003CEE8(2);
  return v7;
}

- (id)_buttonFont
{
  void *v3;
  _TtC6FindMy24FMContentUnavailableView *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_opt_self(UIFont);
  v4 = self;
  v5 = objc_msgSend(v3, "preferredFontForTextStyle:", UIFontTextStyleBody);
  v6 = (void *)sub_10003CEE8(0x8000);

  return v6;
}

- (void)_updateViewHierarchy
{
  _TtC6FindMy24FMContentUnavailableView *v2;

  v2 = self;
  sub_10010C3CC();

}

- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  _TtC6FindMy24FMContentUnavailableView *v14;
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
  v16.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  v14 = -[FMContentUnavailableView initWithFrame:title:style:](&v16, "initWithFrame:title:style:", v13, a5, x, y, width, height);

  if (v14)
  return v14;
}

- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  _TtC6FindMy24FMContentUnavailableView *v16;
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
  v18.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  v16 = -[FMContentUnavailableView initWithFrame:title:style:includeBackdrop:](&v18, "initWithFrame:title:style:includeBackdrop:", v15, a5, v6, x, y, width, height);

  if (v16)
  return v16;
}

- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  return -[FMContentUnavailableView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy24FMContentUnavailableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  return -[FMContentUnavailableView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
