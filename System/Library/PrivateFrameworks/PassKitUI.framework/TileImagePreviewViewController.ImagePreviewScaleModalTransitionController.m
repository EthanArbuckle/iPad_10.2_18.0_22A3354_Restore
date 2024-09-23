@implementation TileImagePreviewViewController.ImagePreviewScaleModalTransitionController

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_19D40A968();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id result;
  double *v6;
  double *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *v15;
  id v16;

  result = (id)swift_unknownObjectUnownedLoadStrong();
  v6 = (double *)((char *)self
                + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalCenter);
  if ((self->sourceImageView[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalCenter] & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v7 = (double *)((char *)self
                  + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalSize);
    if ((self->sourceImageView[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalSize] & 1) == 0)
    {
      v8 = result;
      v10 = *v7;
      v9 = v7[1];
      v12 = *v6;
      v11 = v6[1];
      v13 = objc_allocWithZone((Class)type metadata accessor for TileImagePreviewViewController.ImagePreviewScaleModalAnimationAnimatedTransitioninHandler());
      v14 = a3;
      v15 = self;
      v16 = sub_19D40A858(v12, v11, v10, v9, (uint64_t)v8, 0);

      return v16;
    }
  }
  __break(1u);
  return result;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v9;
  objc_class *v10;
  char *v11;
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *v12;
  id v13;
  id v14;
  id v15;
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *v16;
  id v17;
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *v18;
  objc_super v20;

  v9 = a4;
  if (!a4)
    v9 = a5;
  v10 = (objc_class *)type metadata accessor for TileImagePreviewViewController.ImagePreviewScaleModalPresentationController();
  v11 = (char *)objc_allocWithZone(v10);
  *(_QWORD *)&v11[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController____lazy_storage___backgroundView] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController_transitionController] = self;
  v20.receiver = v11;
  v20.super_class = v10;
  v12 = self;
  v13 = a4;
  v14 = a5;
  v15 = v13;
  v16 = v12;
  v17 = a3;
  v18 = -[TileImagePreviewViewController.ImagePreviewScaleModalTransitionController initWithPresentedViewController:presentingViewController:](&v20, sel_initWithPresentedViewController_presentingViewController_, v17, v9);

  return v18;
}

- (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController)init
{
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *result;

  result = (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_sourceImageView));
  swift_bridgeObjectRelease();
}

@end
