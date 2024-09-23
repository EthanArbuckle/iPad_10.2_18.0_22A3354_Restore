@implementation PFXReviewWidgetImageAnswer2

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetImageAnswer2;
  -[PFXReviewWidgetAnswer2 dealloc](&v3, "dealloc");
}

- (TSDImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
