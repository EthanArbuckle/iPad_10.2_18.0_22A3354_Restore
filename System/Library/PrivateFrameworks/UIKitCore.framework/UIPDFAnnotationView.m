@implementation UIPDFAnnotationView

- (UIPDFAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  self->_annotation = (UIPDFAnnotation *)a3;
}

@end
