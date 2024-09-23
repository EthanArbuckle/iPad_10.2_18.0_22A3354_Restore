@implementation UIWKDocumentRequest

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWKDocumentRequest;
  -[UIWKDocumentRequest dealloc](&v3, sel_dealloc);
}

- (NSCopying)inputElementIdentifier
{
  return self->_inputElementIdentifier;
}

- (void)setInputElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (int64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(int64_t)a3
{
  self->_flags = a3;
}

- (int64_t)surroundingGranularity
{
  return self->_surroundingGranularity;
}

- (void)setSurroundingGranularity:(int64_t)a3
{
  self->_surroundingGranularity = a3;
}

- (int64_t)granularityCount
{
  return self->_granularityCount;
}

- (void)setGranularityCount:(int64_t)a3
{
  self->_granularityCount = a3;
}

- (CGRect)documentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_documentRect.origin.x;
  y = self->_documentRect.origin.y;
  width = self->_documentRect.size.width;
  height = self->_documentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDocumentRect:(CGRect)a3
{
  self->_documentRect = a3;
}

@end
