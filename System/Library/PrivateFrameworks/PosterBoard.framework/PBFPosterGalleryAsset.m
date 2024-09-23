@implementation PBFPosterGalleryAsset

- (UIImage)image
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_image);
}

- (void)setImage:(id)a3
{
  objc_storeWeak((id *)&self->_image, a3);
}

- (UIImage)keyFrameImage
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_keyFrameImage);
}

- (void)setKeyFrameImage:(id)a3
{
  objc_storeWeak((id *)&self->_keyFrameImage, a3);
}

- (UIView)imageView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (UIViewController)liveViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_liveViewController);
}

- (void)setLiveViewController:(id)a3
{
  objc_storeWeak((id *)&self->_liveViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_liveViewController);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_keyFrameImage);
  objc_destroyWeak((id *)&self->_image);
}

@end
