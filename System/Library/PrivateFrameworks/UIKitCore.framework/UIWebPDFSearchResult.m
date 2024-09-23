@implementation UIWebPDFSearchResult

- (void)dealloc
{
  objc_super v3;

  -[UIWebPDFSearchResult setString:](self, "setString:", 0);
  -[UIWebPDFSearchResult setStrings:](self, "setStrings:", 0);
  -[UIWebPDFSearchResult setRects:](self, "setRects:", 0);
  -[UIWebPDFSearchResult setRotationAngles:](self, "setRotationAngles:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchResult;
  -[UIWebPDFSearchResult dealloc](&v3, sel_dealloc);
}

- (NSArray)rotationAngles
{
  return self->rotationAngles;
}

- (void)setRotationAngles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unint64_t)pageIndex
{
  return self->pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->pageIndex = a3;
}

- (NSArray)strings
{
  return self->strings;
}

- (void)setStrings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)string
{
  return self->string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->boundingBox.origin.x;
  y = self->boundingBox.origin.y;
  width = self->boundingBox.size.width;
  height = self->boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->boundingBox = a3;
}

- (NSArray)rects
{
  return self->rects;
}

- (void)setRects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
