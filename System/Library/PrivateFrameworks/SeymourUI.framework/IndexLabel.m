@implementation IndexLabel

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI10IndexLabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B40F348();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI10IndexLabel_label), sel_firstBaselineAnchor);
}

- (_TtC9SeymourUI10IndexLabel)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI10IndexLabel *)sub_22B40F4BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC9SeymourUI10IndexLabel *v2;

  v2 = self;
  sub_22B40F9F4();

}

- (_TtC9SeymourUI10IndexLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B410154();
}

- (void)textSizeUpdated:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9SeymourUI10IndexLabel *v8;
  uint64_t v9;

  v4 = sub_22BA79344();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79320();
  v8 = self;
  sub_22B40FBD8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI10IndexLabel_labelCenterYConstraint));
}

@end
