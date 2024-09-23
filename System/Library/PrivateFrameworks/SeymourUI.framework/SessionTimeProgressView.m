@implementation SessionTimeProgressView

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI23SessionTimeProgressView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionTimeProgressView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  v7 = v6;
  if (qword_255B822D8 != -1)
    swift_once();
  v8 = *(double *)&qword_255B9AE48;

  v9 = v5 + v8 + 2.0;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SessionTimeProgressView intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI23SessionTimeProgressView *v2;

  v2 = self;
  sub_22B4F3FF0();

}

- (_TtC9SeymourUI23SessionTimeProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4F47E8();
}

- (_TtC9SeymourUI23SessionTimeProgressView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI23SessionTimeProgressView *result;

  result = (_TtC9SeymourUI23SessionTimeProgressView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionTimeProgressView_ringGroup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionTimeProgressView_ringsView));
}

- (BOOL)accessibilityShowRemaining
{
  _TtC9SeymourUI23SessionTimeProgressView *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = self;
  v3 = sub_22BA7C3E0();
  v5 = v4;
  if (v3 == sub_22BA7C3E0() && v5 == v6)
    v8 = 1;
  else
    v8 = sub_22BA81738();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8 & 1;
}

@end
