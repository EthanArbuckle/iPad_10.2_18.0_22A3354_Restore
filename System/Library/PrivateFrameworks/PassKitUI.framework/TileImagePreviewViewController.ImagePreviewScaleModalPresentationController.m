@implementation TileImagePreviewViewController.ImagePreviewScaleModalPresentationController

- (void)presentationTransitionWillBegin
{
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController *v2;

  v2 = self;
  sub_19D409314();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController *v3;
  id v4;

  if (!a3)
  {
    v3 = self;
    v4 = sub_19D409264();
    objc_msgSend(v4, sel_removeFromSuperview);

  }
}

- (void)dismissalTransitionWillBegin
{
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController *v2;

  v2 = self;
  sub_19D40957C();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController *v3;
  id v4;

  if (a3)
  {
    v3 = self;
    v4 = sub_19D409264();
    objc_msgSend(v4, sel_removeFromSuperview);

  }
}

- (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController *result;

  v5 = a3;
  v6 = a4;
  result = (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController_transitionController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController____lazy_storage___backgroundView));
}

@end
