@implementation CardViewTitleView

- (_TtC5TeaUI17CardViewTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17CardViewTitleView *)CardViewTitleView.init(frame:)();
}

- (_TtC5TeaUI17CardViewTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CardViewTitleView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC5TeaUI17CardViewTitleView *v2;

  v2 = self;
  CardViewTitleView.layoutSubviews()();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC5TeaUI17CardViewTitleView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  CardViewTitleView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI17CardViewTitleView_closeAffordanceButton));

}

@end
