@implementation RoundedIconView

- (_TtC9SeymourUI15RoundedIconView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI15RoundedIconView *)sub_22B5AC4F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI15RoundedIconView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC9SeymourUI15RoundedIconView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI15RoundedIconView_imageView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD668]);
  v7 = a3;
  v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  result = (_TtC9SeymourUI15RoundedIconView *)sub_22BA815D0();
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
  v4.super_class = (Class)type metadata accessor for RoundedIconView();
  v2 = v4.receiver;
  -[RoundedIconView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);

}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedIconView();
  v2 = (char *)v5.receiver;
  -[RoundedIconView tintColorDidChange](&v5, sel_tintColorDidChange);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI15RoundedIconView_imageView];
  v4 = objc_msgSend(v2, sel_tintColor, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setTintColor_, v4);

}

- (void).cxx_destruct
{

}

@end
