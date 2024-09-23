@implementation CatalogTipPlainView

- (_TtC9SeymourUI19CatalogTipPlainView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19CatalogTipPlainView *)CatalogTipPlainView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19CatalogTipPlainView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4DFAFC();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_22B4DE504((char *)self, 0.5, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_22B4DE504((char *)self, 1.0, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_22B4DE504((char *)self, 1.0, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19CatalogTipPlainView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19CatalogTipPlainView_separatorView));

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI19CatalogTipPlainView_delegate);
}

@end
