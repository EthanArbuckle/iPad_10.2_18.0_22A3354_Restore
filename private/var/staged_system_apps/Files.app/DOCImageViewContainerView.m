@implementation DOCImageViewContainerView

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  v4 = a3;
  v5 = v6.receiver;
  -[DOCImageViewContainerView effectiveAppearanceDidChange:](&v6, "effectiveAppearanceDidChange:", v4);
  sub_10004D4AC(1);

}

- (void)layoutSubviews
{
  _TtC5Files25DOCImageViewContainerView *v2;

  v2 = self;
  sub_10004D378();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCImageViewContainerView_containedView));
}

- (_TtC5Files25DOCImageViewContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC5Files25DOCImageViewContainerView *)sub_100039A84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[DOCImageViewContainerView tintColorDidChange](&v3, "tintColorDidChange");
  sub_10004D4AC(1);

}

@end
