@implementation PaddedShapeButton

- (BOOL)isEnabled
{
  _TtC5TeaUI17PaddedShapeButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1B13CA9AC((SEL *)&selRef_isEnabled);

  return v3 & 1;
}

- (BOOL)isHighlighted
{
  _TtC5TeaUI17PaddedShapeButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1B13CA9AC((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (_TtC5TeaUI17PaddedShapeButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17PaddedShapeButton *)PaddedShapeButton.init(frame:)();
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = sub_1B1520FA8();
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  sub_1B1520FF8(a3.x, a3.y);
}

- (_TtC5TeaUI17PaddedShapeButton)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  PaddedShapeButton.init(coder:)((uint64_t)v3, v4, v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC5TeaUI17PaddedShapeButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1B152119C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC5TeaUI17PaddedShapeButton *v4;

  v4 = self;
  sub_1B15212A4(a3);

}

- (void)setEnabled:(BOOL)a3
{
  _TtC5TeaUI17PaddedShapeButton *v4;

  v4 = self;
  sub_1B1521458(a3);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI17PaddedShapeButton_onMenuPresentation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI17PaddedShapeButton__backgroundColor));
}

@end
