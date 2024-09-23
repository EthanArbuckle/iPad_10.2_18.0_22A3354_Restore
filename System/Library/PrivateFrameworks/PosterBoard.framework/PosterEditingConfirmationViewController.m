@implementation PosterEditingConfirmationViewController

- (void)loadView
{
  _TtC11PosterBoard39PosterEditingConfirmationViewController *v2;

  v2 = self;
  sub_1CBAEBC58();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC11PosterBoard39PosterEditingConfirmationViewController *v8;

  v7 = a3;
  v8 = self;
  sub_1CBAED314(a3, a4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PosterEditingConfirmationViewController();
  swift_unknownObjectRetain();
  v7 = (char *)v8.receiver;
  -[PosterEditingConfirmationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  if (MEMORY[0x1D17A3DF0](&v7[OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_delegate]))
  {
    sub_1CBB14A34((uint64_t)v7, a4);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();

  }
}

- (_TtC11PosterBoard39PosterEditingConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1CBB824CC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11PosterBoard39PosterEditingConfirmationViewController *)sub_1CBAEDDB4(v5, v7, a4);
}

- (_TtC11PosterBoard39PosterEditingConfirmationViewController)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard39PosterEditingConfirmationViewController *)sub_1CBAEDFE4(a3);
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_previewStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewLoadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewLoadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_customizeHomeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_buttonFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewView));
}

@end
