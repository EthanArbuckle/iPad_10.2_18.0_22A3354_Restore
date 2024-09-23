@implementation PlatterCopyButton

- (_TtC7Measure17PlatterCopyButton)initWithCoder:(id)a3
{
  _TtC7Measure17PlatterCopyButton *result;

  result = (_TtC7Measure17PlatterCopyButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/PlatterCopyButton.swift", 31, 2, 49, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC7Measure17PlatterCopyButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = qword_10047A750;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10047A750, sub_10000EF04);
  v4 = *(double *)&qword_1004AF088;
  if (qword_10047A748 != -1)
    swift_once(&qword_10047A748, sub_10000EE64);
  v5 = CGSize.init(_:_:)(v4, *(double *)&qword_1004AF080);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
