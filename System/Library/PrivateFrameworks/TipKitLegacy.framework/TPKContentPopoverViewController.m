@implementation TPKContentPopoverViewController

- (UIPopoverPresentationControllerDelegate)popoverDelegate
{
  return (UIPopoverPresentationControllerDelegate *)(id)MEMORY[0x2495A3F58]((char *)self+ OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate, a2);
}

- (void)setPopoverDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIViewController)sourceViewController
{
  return (UIViewController *)sub_248A75DC0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPKContentPopoverViewController_sourceViewController);
}

- (void)setSourceViewController:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (TPKContentView)contentView
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKContentPopoverViewController_contentView);
  swift_beginAccess();
  return (TPKContentView *)*v2;
}

- (void)setContentView:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKContentPopoverViewController_contentView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (UIPopoverPresentationController)popoverPresentationController
{
  TPKContentPopoverViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_248A782D8();

  return (UIPopoverPresentationController *)v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)sourceView
{
  return (UIView *)sub_248A75DC0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPKContentPopoverViewController_sourceView);
}

- (void)setSourceView:(id)a3
{
  id v4;
  TPKContentPopoverViewController *v5;
  UIPopoverPresentationController *v6;

  v4 = a3;
  v5 = self;
  v6 = -[TPKContentPopoverViewController popoverPresentationController](v5, sel_popoverPresentationController);
  -[UIPopoverPresentationController setSourceView:](v6, sel_setSourceView_, v4);

  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

- (CGRect)sourceRect
{
  TPKContentPopoverViewController *v2;
  UIPopoverPresentationController *v3;
  UIPopoverPresentationController *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v2 = self;
  v3 = -[TPKContentPopoverViewController popoverPresentationController](v2, sel_popoverPresentationController);
  if (v3)
  {
    v4 = v3;
    -[UIPopoverPresentationController sourceRect](v3, sel_sourceRect);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {

    v10 = 0.0;
    v12 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
  }
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TPKContentPopoverViewController *v7;
  UIPopoverPresentationController *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = -[TPKContentPopoverViewController popoverPresentationController](v7, sel_popoverPresentationController);
  -[UIPopoverPresentationController setSourceRect:](v8, sel_setSourceRect_, x, y, width, height);

}

- (unint64_t)permittedArrowDirections
{
  TPKContentPopoverViewController *v2;
  UIPopoverPresentationController *v3;
  TPKContentPopoverViewController *v4;
  UIPopoverArrowDirection v5;

  v2 = self;
  v3 = -[TPKContentPopoverViewController popoverPresentationController](v2, sel_popoverPresentationController);
  if (v3)
  {
    v4 = (TPKContentPopoverViewController *)v3;
    v5 = -[UIPopoverPresentationController permittedArrowDirections](v3, sel_permittedArrowDirections);

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  TPKContentPopoverViewController *v4;
  UIPopoverPresentationController *v5;

  v4 = self;
  v5 = -[TPKContentPopoverViewController popoverPresentationController](v4, sel_popoverPresentationController);
  -[UIPopoverPresentationController setPermittedArrowDirections:](v5, sel_setPermittedArrowDirections_, a3);

}

- (double)preferredPopoverWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___TPKContentPopoverViewController_preferredPopoverWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setPreferredPopoverWidth:(double)a3
{
  TPKContentPopoverViewController *v4;

  v4 = self;
  sub_248A76944(a3);

}

- (TPKContentPopoverViewController)initWithContentController:(id)a3 tipContent:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  return (TPKContentPopoverViewController *)TPKContentPopoverViewController.init(contentController:tipContent:sourceViewController:)(v7, v8, a5);
}

- (TPKContentPopoverViewController)initWithContentController:(id)a3 tipContent:(id)a4 sourceViewController:(id)a5 popoverDelegate:(id)a6
{
  TPKContentPopoverViewController *v10;

  swift_unknownObjectRetain();
  v10 = -[TPKContentPopoverViewController initWithContentController:tipContent:sourceViewController:](self, sel_initWithContentController_tipContent_sourceViewController_, a3, a4, a5);
  if (v10)
    swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v10;
}

- (TPKContentPopoverViewController)initWithCoder:(id)a3
{
  return (TPKContentPopoverViewController *)TPKContentPopoverViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TPKContentPopoverViewController();
  v2 = v3.receiver;
  -[TPKContentPopoverViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_248A77910();
  sub_248A781D8();

}

- (void)viewDidLayoutSubviews
{
  TPKContentPopoverViewController *v2;

  v2 = self;
  sub_248A77418();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  BOOL v9;
  TPKContentPopoverViewController *v10;

  v5 = a3;
  v10 = self;
  v6 = -[TPKContentPopoverViewController traitCollection](v10, sel_traitCollection);
  v7 = objc_msgSend(v6, sel_hasDifferentColorAppearanceComparedToTraitCollection_, v5);

  if (v7)
    sub_248A781D8();
  v8 = -[TPKContentPopoverViewController traitCollection](v10, sel_traitCollection);
  v9 = sub_248A7D478(a3);

  if (v9)
    sub_248A77CF0(1);

}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  TPKContentPopoverViewController *v4;
  TPKContentPopoverViewController *v5;
  TPKContentPopoverViewController *v6;
  TPKContentPopoverViewController *v7;

  v3 = a3;
  v7 = self;
  v4 = (TPKContentPopoverViewController *)-[TPKContentPopoverViewController presentingViewController](v7, sel_presentingViewController);
  if (v4)
  {
    v5 = v4;
    -[TPKContentPopoverViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, v3, 0);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (void)passthroughViewsNeedsUpdate
{
  UIPopoverPresentationController *v2;
  UIPopoverPresentationController *v3;
  char *v4;
  void *v5;
  void *v6;
  TPKContentPopoverViewController *v7;

  v7 = self;
  v2 = -[TPKContentPopoverViewController popoverPresentationController](v7, sel_popoverPresentationController);
  if (v2)
  {
    v3 = v2;
    v4 = (char *)v7 + OBJC_IVAR___TPKContentPopoverViewController_sourceView;
    swift_beginAccess();
    v5 = (void *)MEMORY[0x2495A3F58](v4);
    sub_248A78078(v5);

    sub_248A78B44(0, (unint64_t *)&qword_2577AEEA0);
    v6 = (void *)sub_248A9C67C();
    swift_bridgeObjectRelease();
    -[UIPopoverPresentationController setPassthroughViews:](v3, sel_setPassthroughViews_, v6);

  }
  else
  {

  }
}

- (TPKContentPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  TPKContentPopoverViewController *result;

  v4 = a4;
  result = (TPKContentPopoverViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_248A78B20((uint64_t)self + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  TPKContentPopoverViewController *v8;
  int64_t v9;

  v5 = (void *)MEMORY[0x2495A3F58]((char *)self + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate, a2);
  if (!v5)
    return -1;
  v6 = v5;
  if ((objc_msgSend(v5, sel_respondsToSelector_, sel_adaptivePresentationStyleForPresentationController_) & 1) != 0)
  {
    v7 = a3;
    v8 = self;
    v9 = (int64_t)objc_msgSend(v6, sel_adaptivePresentationStyleForPresentationController_, v7);

  }
  else
  {
    v9 = -1;
  }
  swift_unknownObjectRelease();
  return v9;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  TPKContentPopoverViewController *v11;
  int64_t v12;

  v7 = (void *)MEMORY[0x2495A3F58]((char *)self + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate, a2);
  if (!v7)
    return -1;
  v8 = v7;
  if ((objc_msgSend(v7, sel_respondsToSelector_, sel_adaptivePresentationStyleForPresentationController_traitCollection_) & 1) != 0)
  {
    v9 = a3;
    v10 = a4;
    v11 = self;
    v12 = (int64_t)objc_msgSend(v8, sel_adaptivePresentationStyleForPresentationController_traitCollection_, v9, v10);

  }
  else
  {
    v12 = -1;
  }
  swift_unknownObjectRelease();
  return v12;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  TPKContentPopoverViewController *v10;
  id v11;

  v7 = (void *)MEMORY[0x2495A3F58]((char *)self + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate, a2);
  if (v7)
  {
    v8 = v7;
    if ((objc_msgSend(v7, sel_respondsToSelector_, sel_presentationController_viewControllerForAdaptivePresentationStyle_) & 1) != 0)
    {
      v9 = a3;
      v10 = self;
      v11 = objc_msgSend(v8, sel_presentationController_viewControllerForAdaptivePresentationStyle_, v9, a4);

    }
    else
    {
      v11 = 0;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  sub_248A9A428((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_presentationControllerWillDismiss_);
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  sub_248A9A428((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_presentationControllerDidAttemptToDismiss_);
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  TPKContentPopoverViewController *v5;

  v4 = a3;
  v5 = self;
  TPKContentPopoverViewController.prepareForPopoverPresentation(_:)((UIPopoverPresentationController)v4);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void *v9;
  void *v10;
  id v11;
  TPKContentPopoverViewController *v12;

  v9 = (void *)MEMORY[0x2495A3F58]((char *)self + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate, a2);
  if (v9)
  {
    v10 = v9;
    if ((objc_msgSend(v9, sel_respondsToSelector_, sel_popoverPresentationController_willRepositionPopoverToRect_inView_) & 1) != 0)
    {
      v11 = a3;
      v12 = self;
      objc_msgSend(v10, sel_popoverPresentationController_willRepositionPopoverToRect_inView_, v11, a4, a5);

    }
    swift_unknownObjectRelease();
  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  TPKContentPopoverViewController *v8;
  unsigned __int8 v9;

  v5 = (void *)MEMORY[0x2495A3F58]((char *)self + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate, a2);
  if (!v5)
    return 0;
  v6 = v5;
  if ((objc_msgSend(v5, sel_respondsToSelector_, sel_presentationControllerShouldDismiss_) & 1) != 0)
  {
    v7 = a3;
    v8 = self;
    v9 = objc_msgSend(v6, sel_presentationControllerShouldDismiss_, v7);

  }
  else
  {
    v9 = 0;
  }
  swift_unknownObjectRelease();
  return v9;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  sub_248A9A428((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_presentationControllerDidDismiss_);
}

@end
