@implementation TTRISeparator

- (_TtC15RemindersUICore13TTRISeparator)initWithFrame:(CGRect)a3
{
  _s15RemindersUICore13TTRISeparatorC5frameACSo6CGRectV_tcfc_0();
}

- (_TtC15RemindersUICore13TTRISeparator)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore13TTRISeparator *)TTRISeparator.init(coder:)(a3);
}

- (CGSize)intrinsicContentSize
{
  _TtC15RemindersUICore13TTRISeparator *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  TTRISeparator.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC15RemindersUICore13TTRISeparator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  TTRISeparator.intrinsicContentSize.getter();
  v7 = v6;
  v9 = v8;
  v10 = *MEMORY[0x1E0DC55F0];

  if (v7 == v10)
    v11 = width;
  else
    v11 = v7;
  if (v9 == v10)
    v12 = height;
  else
    v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtC15RemindersUICore13TTRISeparator *v2;

  v2 = self;
  TTRISeparator.layoutSubviews()();

}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC15RemindersUICore13TTRISeparator_internalBackgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  _TtC15RemindersUICore13TTRISeparator *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1B47D63B0(a3);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore13TTRISeparator_internalBackgroundColor));
}

@end
