@implementation ClearAllButton

- (_TtC7Measure14ClearAllButton)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC7Measure14ClearAllButton *result;

  v5 = OBJC_IVAR____TtC7Measure14ClearAllButton_separator;
  v6 = type metadata accessor for SeparatorView();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");

  result = (_TtC7Measure14ClearAllButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/ClearAllButton.swift", 28, 2, 42, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC7Measure14ClearAllButton *v3;
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure14ClearAllButton_separator));
}

@end
