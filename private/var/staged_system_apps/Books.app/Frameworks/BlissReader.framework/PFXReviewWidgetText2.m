@implementation PFXReviewWidgetText2

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetText2;
  -[PFXReviewWidgetAnswer2 dealloc](&v3, "dealloc");
}

- (TSWPStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (TSDInfoGeometry)textGeometry
{
  return self->_textGeometry;
}

- (void)setTextGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
}

@end
