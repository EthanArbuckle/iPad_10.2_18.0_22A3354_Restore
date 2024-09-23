@implementation UIPDFPopupAnnotation

- (UIPDFPopupAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3
{
  UIPDFPopupAnnotation *result;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPDFPopupAnnotation;
  result = -[UIPDFAnnotation initWithAnnotationDictionary:](&v5, sel_initWithAnnotationDictionary_, a3);
  if (result)
  {
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_adjustedBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_adjustedBounds.size = v4;
  }
  return result;
}

- (UIPDFPopupAnnotation)init
{
  UIPDFPopupAnnotation *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPDFPopupAnnotation;
  result = -[UIPDFAnnotation init](&v4, sel_init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_adjustedBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_adjustedBounds.size = v3;
  }
  return result;
}

- (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (CGRect)bounds
{
  CGRect *p_adjustedBounds;
  double x;
  double y;
  double width;
  double height;
  objc_super v8;
  CGRect result;

  p_adjustedBounds = &self->_adjustedBounds;
  if (CGRectIsNull(self->_adjustedBounds))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPDFPopupAnnotation;
    -[UIPDFAnnotation bounds](&v8, sel_bounds);
  }
  else
  {
    x = p_adjustedBounds->origin.x;
    y = p_adjustedBounds->origin.y;
    width = p_adjustedBounds->size.width;
    height = p_adjustedBounds->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int)annotationType
{
  return 9;
}

- (BOOL)recognizeGestures
{
  return 1;
}

- (UIPDFAnnotation)parent
{
  return self->parent;
}

- (void)setParent:(id)a3
{
  self->parent = (UIPDFAnnotation *)a3;
}

- (CGRect)adjustedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_adjustedBounds.origin.x;
  y = self->_adjustedBounds.origin.y;
  width = self->_adjustedBounds.size.width;
  height = self->_adjustedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAdjustedBounds:(CGRect)a3
{
  self->_adjustedBounds = a3;
}

@end
