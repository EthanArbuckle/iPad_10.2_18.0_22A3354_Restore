@implementation _PIParallaxInfillResult

- (NUImageBuffer)infilledImage
{
  return self->_infilledImage;
}

- (void)setInfilledImage:(id)a3
{
  objc_storeStrong((id *)&self->_infilledImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infilledImage, 0);
}

@end
