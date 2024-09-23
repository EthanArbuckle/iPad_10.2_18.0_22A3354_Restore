@implementation TCMPSImageAnnotation

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v4, "setIdentifier:", -[TCMPSImageAnnotation identifier](self, "identifier"));
    -[TCMPSImageAnnotation boundingBox](self, "boundingBox");
    objc_msgSend(v4, "setBoundingBox:");
    -[TCMPSImageAnnotation confidence](self, "confidence");
    objc_msgSend(v4, "setConfidence:");
  }
  return v4;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

@end
