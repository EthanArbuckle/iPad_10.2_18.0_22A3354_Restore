@implementation TPKTipContentPlainView

- (TPKTipContentPlainView)initWithContentController:(id)a3 tipContent:(id)a4
{
  id v6;
  id v7;
  TPKTipContentPlainView *v8;
  TPKTipContentPlainView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  TPKTipContentPlainView *v14;

  v6 = a3;
  v7 = a4;
  v8 = -[TPKTipContentPlainView initWithController:content:](self, sel_initWithController_content_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v10 = *MEMORY[0x24BEBD250];
    v11 = *(double *)(MEMORY[0x24BEBD250] + 8);
    v12 = *(double *)(MEMORY[0x24BEBD250] + 16);
    v13 = *(double *)(MEMORY[0x24BEBD250] + 24);
    v14 = v8;
    -[TPKTipContentPlainView setDirectionalLayoutMargins:](v14, sel_setDirectionalLayoutMargins_, v10, v11, v12, v13);
    sub_248A88BB0();

  }
  return v9;
}

- (void)resetHostingView
{
  uint64_t v3;
  void *v4;
  id v5;
  TPKTipContentPlainView *v6;

  v3 = OBJC_IVAR___TPKBaseContentView_hostingView;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_hostingView);
  v6 = self;
  v5 = objc_msgSend(v4, sel_superview);

  if (v5)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), sel_removeFromSuperview);
  sub_248A88BB0();

}

- (void)updateContentBackgroundColor:(id)a3
{
  void *v4;
  id v5;
  TPKTipContentPlainView *v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor) = (Class)a3;
  v5 = a3;
  v6 = self;

  objc_msgSend(*(id *)((char *)&v6->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_hostingView), sel_setBackgroundColor_, v5);
}

- (TPKTipContentPlainView)initWithController:(id)a3 content:(id)a4
{
  return (TPKTipContentPlainView *)TPKContentView.init(controller:content:)(a3, a4);
}

- (TPKTipContentPlainView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPKTipContentPlainView();
  return -[TPKContentView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (TPKTipContentPlainView)initWithReusableTipView:(id)a3
{
  uint64_t v4;
  void *v5;
  TPKTipContentPlainView *v6;
  uint64_t v7;
  TPKTipContentPlainView *v8;

  v4 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
  v5 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  v6 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)objc_msgSend(v5, sel_currentTraitCollection);
  *((_BYTE *)&v6->super.super.super.super.super.isa + OBJC_IVAR___TPKContentView_displayBottomSeparator) = 0;
  v7 = OBJC_IVAR___TPKContentView_imageProxy;
  type metadata accessor for TipImageProxy();
  *(Class *)((char *)&v6->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  v8 = (TPKTipContentPlainView *)-[TPKBaseContentView initWithReusableTipView:]_0((char *)v6);
  swift_unknownObjectRelease();
  return v8;
}

@end
