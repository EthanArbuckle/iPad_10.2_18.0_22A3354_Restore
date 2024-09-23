@implementation TVSignOutView

- (_TtC9SeymourUI13TVSignOutView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13TVSignOutView *)sub_22BA1E3CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13TVSignOutView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA1FF70();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI13TVSignOutView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22BA1FB20(v6, v7);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_imageTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_imageLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_imageBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_buttonTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_labelWidthConstraint));
}

@end
