@implementation RoundedVisualEffectView

- (_TtC9SeymourUI23RoundedVisualEffectView)initWithEffect:(id)a3
{
  id v4;
  _TtC9SeymourUI23RoundedVisualEffectView *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedVisualEffectView();
  v4 = a3;
  v5 = -[RoundedVisualEffectView initWithEffect:](&v8, sel_initWithEffect_, v4);
  -[RoundedVisualEffectView setClipsToBounds:](v5, sel_setClipsToBounds_, 1, v8.receiver, v8.super_class);
  v6 = -[RoundedVisualEffectView layer](v5, sel_layer);

  objc_msgSend(v6, sel_setCornerCurve_, *MEMORY[0x24BDE58E8]);
  return v5;
}

- (_TtC9SeymourUI23RoundedVisualEffectView)initWithCoder:(id)a3
{
  _TtC9SeymourUI23RoundedVisualEffectView *result;

  result = (_TtC9SeymourUI23RoundedVisualEffectView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RoundedVisualEffectView();
  v2 = v4.receiver;
  -[RoundedVisualEffectView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);

}

@end
