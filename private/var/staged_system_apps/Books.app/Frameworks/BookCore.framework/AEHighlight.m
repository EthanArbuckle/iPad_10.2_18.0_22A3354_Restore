@implementation AEHighlight

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AEAnnotationHighlightData)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (void)setIsVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_lines, 0);
}

@end
