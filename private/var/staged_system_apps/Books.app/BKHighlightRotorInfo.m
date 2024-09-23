@implementation BKHighlightRotorInfo

- (id)type
{
  return CFSTR("Highlight");
}

- (AEAnnotationAccessibility)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
