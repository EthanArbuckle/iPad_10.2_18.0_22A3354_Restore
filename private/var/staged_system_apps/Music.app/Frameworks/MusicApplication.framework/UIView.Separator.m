@implementation UIView.Separator

- (_TtCE16MusicApplicationCSo6UIView9Separator)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtCE16MusicApplicationCSo6UIView9Separator *v7;
  uint64_t v8;
  _TtCE16MusicApplicationCSo6UIView9Separator *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_s9SeparatorCMa();
  v7 = -[UIView.Separator initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  v8 = qword_14ABD18;
  v9 = v7;
  if (v8 != -1)
    swift_once(&qword_14ABD18, sub_9B6B70);
  -[UIView.Separator setBackgroundColor:](v9, "setBackgroundColor:", qword_15814A8);

  return v9;
}

- (_TtCE16MusicApplicationCSo6UIView9Separator)initWithCoder:(id)a3
{
  _TtCE16MusicApplicationCSo6UIView9Separator *result;

  result = (_TtCE16MusicApplicationCSo6UIView9Separator *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/DetailHeaderView.swift", 39, 2, 1636, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtCE16MusicApplicationCSo6UIView9Separator *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = -[UIView.Separator traitCollection](v2, "traitCollection");
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  v6 = 1.0 / v5;
  v7 = UIViewNoIntrinsicMetric;
  result.height = v6;
  result.width = v7;
  return result;
}

@end
