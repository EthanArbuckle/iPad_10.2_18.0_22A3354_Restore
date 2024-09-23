@implementation PKTrailingAccessoryLabel

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKTrailingAccessoryLabel_textView), sel_attributedText);
}

- (void)setAttributedText:(id)a3
{
  void *v4;
  PKTrailingAccessoryLabel *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_textView);
  v6 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setAttributedText_, v6);
  -[PKTrailingAccessoryLabel setNeedsLayout](v5, sel_setNeedsLayout);

}

- (int64_t)maximumNumberOfLines
{
  void *v2;
  PKTrailingAccessoryLabel *v3;
  id v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_textView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_textContainer);
  v5 = objc_msgSend(v4, sel_maximumNumberOfLines);

  return (int64_t)v5;
}

- (void)setMaximumNumberOfLines:(int64_t)a3
{
  void *v4;
  PKTrailingAccessoryLabel *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_textView);
  v5 = self;
  v6 = objc_msgSend(v4, sel_textContainer);
  objc_msgSend(v6, sel_setMaximumNumberOfLines_, a3);

}

- (UIEdgeInsets)contentInsets
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = (double *)((char *)self + OBJC_IVAR___PKTrailingAccessoryLabel_contentInsets);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat *v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = (CGFloat *)((char *)self + OBJC_IVAR___PKTrailingAccessoryLabel_contentInsets);
  swift_beginAccess();
  *v8 = top;
  v8[1] = left;
  v8[2] = bottom;
  v8[3] = right;
  -[PKTrailingAccessoryLabel setNeedsLayout](self, sel_setNeedsLayout);
}

- (PKTrailingAccessoryLabel)initWithFrame:(CGRect)a3
{
  return (PKTrailingAccessoryLabel *)TrailingAccessoryLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKTrailingAccessoryLabel)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  PKTrailingAccessoryLabel *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR___PKTrailingAccessoryLabel_contentInsets);
  v5 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v4 = *MEMORY[0x1E0DC49E8];
  v4[1] = v5;
  v6 = OBJC_IVAR___PKTrailingAccessoryLabel_registeredAccessories;
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_19D6BBB74(MEMORY[0x1E0DEE9D8]);
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_maxAccessorySize);
  *v8 = 0;
  v8[1] = 0;

  result = (PKTrailingAccessoryLabel *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  PKTrailingAccessoryLabel *v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_19D692984(1, 0.0, 0.0, width, 1.79769313e308);

  v6 = width;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  -[PKTrailingAccessoryLabel layoutSubviews](&v7, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
  sub_19D692984(0, v3, v4, v5, v6);

}

- (void)registerAccessoryWithView:(id)a3 withSize:(CGSize)a4 for:(id)a5
{
  sub_19D692FAC(self, a4.width, a4.height, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(id, uint64_t, uint64_t, double, double))TrailingAccessoryLabel.registerAccessory(view:withSize:for:));
}

- (void)registerAccessoryWithLayer:(id)a3 withSize:(CGSize)a4 for:(id)a5
{
  sub_19D692FAC(self, a4.width, a4.height, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(id, uint64_t, uint64_t, double, double))TrailingAccessoryLabel.registerAccessory(layer:withSize:for:));
}

- (void)unregisterAccessories
{
  PKTrailingAccessoryLabel *v2;

  v2 = self;
  TrailingAccessoryLabel.unregisterAccessories()();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
