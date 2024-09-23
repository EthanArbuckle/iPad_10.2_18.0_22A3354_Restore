@implementation TPKTipContentHintView

- (TPKTipContentHintView)initWithContentController:(id)a3 tipContent:(id)a4
{
  id v6;
  id v7;
  TPKTipContentHintView *v8;
  TPKTipContentHintView *v9;
  TPKTipContentHintView *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[TPKTipContentHintView initWithController:content:](self, sel_initWithController_content_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    sub_248A9AC58();

  }
  return v9;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TPKTipContentHintView();
  v2 = (char *)v6.receiver;
  -[TPKTipContentHintView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR___TPKBaseContentView_hostingView];
  if (v3)
  {
    v4 = (char *)objc_msgSend(v3, sel_layer, v6.receiver, v6.super_class);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, sel_setCornerCurve_, *MEMORY[0x24BDE58E8]);
      objc_msgSend(v5, sel_setCornerRadius_, 13.0);

      v2 = v5;
    }
  }

}

- (void)bottomSeperatorNeedsUpdate
{
  TPKTipContentHintView *v2;

  v2 = self;
  sub_248A9A6C0();

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  TPKTipContentHintView *v10;
  id v11;
  uint64_t v12;

  v4 = sub_248A9BF68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248A9BF5C();
  v8 = OBJC_IVAR___TPKBaseContentView_hostingView;
  v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_hostingView);
  v10 = self;
  v11 = objc_msgSend(v9, sel_superview);

  if (v11)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), sel_removeFromSuperview);
  sub_248A9AD34();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)resetHostingView
{
  uint64_t v3;
  void *v4;
  id v5;
  TPKTipContentHintView *v6;

  v3 = OBJC_IVAR___TPKBaseContentView_hostingView;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_hostingView);
  v6 = self;
  v5 = objc_msgSend(v4, sel_superview);

  if (v5)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), sel_removeFromSuperview);
  sub_248A9AD34();

}

- (void)updateContentBackgroundColor:(id)a3
{
  void *v4;
  id v5;
  TPKTipContentHintView *v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor) = (Class)a3;
  v5 = a3;
  v6 = self;

  objc_msgSend(*(id *)((char *)&v6->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_hostingView), sel_setBackgroundColor_, v5);
}

- (TPKTipContentHintView)initWithController:(id)a3 content:(id)a4
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView) = 0;
  return (TPKTipContentHintView *)TPKContentView.init(controller:content:)(a3, a4);
}

- (TPKTipContentHintView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPKTipContentHintView();
  return -[TPKContentView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (TPKTipContentHintView)initWithReusableTipView:(id)a3
{
  return (TPKTipContentHintView *)sub_248A9B240();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView));
}

@end
