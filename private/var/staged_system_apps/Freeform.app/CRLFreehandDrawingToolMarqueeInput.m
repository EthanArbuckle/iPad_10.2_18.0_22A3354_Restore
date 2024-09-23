@implementation CRLFreehandDrawingToolMarqueeInput

- (CRLFreehandDrawingToolMarqueeInput)initWithUnscaledTapPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  CGFloat y;
  CGFloat x;
  CRLFreehandDrawingToolMarqueeInput *result;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingToolMarqueeInput;
  result = -[CRLFreehandDrawingToolMarqueeInput init](&v8, "init");
  if (result)
  {
    result->_unscaledTapPoint.x = x;
    result->_unscaledTapPoint.y = y;
    result->_inputType = a4;
  }
  return result;
}

- (CGPoint)unscaledTapPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unscaledTapPoint.x;
  y = self->_unscaledTapPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)inputType
{
  return self->_inputType;
}

@end
