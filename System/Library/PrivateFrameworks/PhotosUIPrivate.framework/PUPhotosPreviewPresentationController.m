@implementation PUPhotosPreviewPresentationController

- (void)_revealTransitionDidComplete:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[PUPhotosPreviewPresentationController photosPreviewingDelegate](self, "photosPreviewingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosPreviewPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photosPreviewPresentationController:willPresentPreviewViewController:", self, v6);

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosPreviewPresentationController;
  -[_UIPreviewPresentationController _revealTransitionDidComplete:](&v7, sel__revealTransitionDidComplete_, v3);
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
