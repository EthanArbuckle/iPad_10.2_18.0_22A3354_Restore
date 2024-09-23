@implementation SXAnimatedImageResourceResponse

- (SXAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (void)setAnimatedImage:(id)a3
{
  objc_storeStrong((id *)&self->_animatedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImage, 0);
}

@end
