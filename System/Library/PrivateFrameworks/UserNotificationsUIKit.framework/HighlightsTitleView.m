@implementation HighlightsTitleView

- (_TtC22UserNotificationsUIKit19HighlightsTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC22UserNotificationsUIKit19HighlightsTitleView *)sub_1CFD44384(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22UserNotificationsUIKit19HighlightsTitleView)initWithCoder:(id)a3
{
  id v4;
  _TtC22UserNotificationsUIKit19HighlightsTitleView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_image) = 0;
  v4 = a3;

  result = (_TtC22UserNotificationsUIKit19HighlightsTitleView *)sub_1CFD7C814();
  __break(1u);
  return result;
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  _TtC22UserNotificationsUIKit19HighlightsTitleView *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = self;
    v5 = a3;
    v6 = objc_msgSend(v5, sel__visualStylingForStyle_, 0);
    objc_msgSend(*(id *)((char *)&v4->super.super.super.super.isa+ OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_label), sel_mt_applyVisualStyling_, v6);
    objc_msgSend(*(id *)((char *)&v4->super.super.super.super.isa+ OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageView), sel_mt_applyVisualStyling_, v6);

  }
  else
  {
    __break(1u);
  }
}

- (void)_updateTextAttributes
{
  _TtC22UserNotificationsUIKit19HighlightsTitleView *v2;

  v2 = self;
  sub_1CFD44D00();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_image));
}

@end
