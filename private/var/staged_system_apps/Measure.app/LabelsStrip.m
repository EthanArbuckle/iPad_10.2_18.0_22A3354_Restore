@implementation LabelsStrip

- (_TtC7Measure11LabelsStrip)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure11LabelsStrip *)sub_1000A83B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure11LabelsStrip)initWithCoder:(id)a3
{
  return (_TtC7Measure11LabelsStrip *)sub_1000A8ABC(a3);
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC7Measure11LabelsStrip *v3;
  uint64_t v4;
  id v5;
  id v6;
  double v7;
  double v8;
  CGSize result;

  v2 = qword_10047A750;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10047A750, sub_10000EF04);
  v4 = qword_1004AF088;
  v5 = objc_msgSend((id)objc_opt_self(UITraitCollection), "currentTraitCollection");
  v6 = objc_msgSend(v5, "preferredContentSizeCategory");

  LOBYTE(v5) = UIContentSizeCategory.isAccessibilityCategory.getter(v6);
  v7 = 222.0;
  if ((v5 & 1) == 0)
    v7 = 88.0;
  v8 = *(double *)&v4;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{

}

@end
