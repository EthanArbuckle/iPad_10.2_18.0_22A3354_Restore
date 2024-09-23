@implementation _SSScreenCaptureResults

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)failureReasonIfImageIsNil
{
  return self->_failureReasonIfImageIsNil;
}

- (void)setFailureReasonIfImageIsNil:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureReasonIfImageIsNil, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
