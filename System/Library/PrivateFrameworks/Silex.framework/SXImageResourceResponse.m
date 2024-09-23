@implementation SXImageResourceResponse

- (unint64_t)imageQuality
{
  return self->_imageQuality;
}

- (void)setImageQuality:(unint64_t)a3
{
  self->_imageQuality = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
