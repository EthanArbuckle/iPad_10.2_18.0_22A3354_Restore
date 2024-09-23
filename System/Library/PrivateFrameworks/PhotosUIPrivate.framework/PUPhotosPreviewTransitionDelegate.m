@implementation PUPhotosPreviewTransitionDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  PUPhotosPreviewPresentationController *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = -[_UIPreviewPresentationController initWithPresentedViewController:presentingViewController:]([PUPhotosPreviewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  -[PUPhotosPreviewTransitionDelegate photosPreviewingDelegate](self, "photosPreviewingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosPreviewPresentationController setPhotosPreviewingDelegate:](v9, "setPhotosPreviewingDelegate:", v10);

  return v9;
}

- (PUPhotosPreviewPresentationControllerDelegate)photosPreviewingDelegate
{
  return (PUPhotosPreviewPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_photosPreviewingDelegate);
}

- (void)setPhotosPreviewingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photosPreviewingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photosPreviewingDelegate);
}

@end
