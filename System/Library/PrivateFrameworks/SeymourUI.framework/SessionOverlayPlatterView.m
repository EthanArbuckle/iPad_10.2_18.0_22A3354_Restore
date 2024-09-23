@implementation SessionOverlayPlatterView

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionOverlayPlatterView();
  v2 = v5.receiver;
  -[SessionOverlayPlatterView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);

}

- (_TtC9SeymourUI25SessionOverlayPlatterView)initWithCoder:(id)a3
{
  _TtC9SeymourUI25SessionOverlayPlatterView *result;

  result = (_TtC9SeymourUI25SessionOverlayPlatterView *)sub_22BA815D0();
  __break(1u);
  return result;
}

@end
