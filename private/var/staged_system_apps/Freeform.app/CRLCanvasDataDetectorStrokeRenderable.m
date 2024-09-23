@implementation CRLCanvasDataDetectorStrokeRenderable

- (CGRect)recognitionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_recognitionFrame.origin.x;
  y = self->_recognitionFrame.origin.y;
  width = self->_recognitionFrame.size.width;
  height = self->_recognitionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRecognitionFrame:(CGRect)a3
{
  self->_recognitionFrame = a3;
}

@end
