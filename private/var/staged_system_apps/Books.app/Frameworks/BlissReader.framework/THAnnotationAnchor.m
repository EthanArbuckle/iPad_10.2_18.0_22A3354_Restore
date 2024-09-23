@implementation THAnnotationAnchor

- (THAnnotationAnchor)initWithContentNode:(id)a3 annotation:(id)a4 noteRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  THAnnotationAnchor *v8;
  objc_super v10;

  length = a5.length;
  location = a5.location;
  v10.receiver = self;
  v10.super_class = (Class)THAnnotationAnchor;
  v8 = -[THModelBoundAnchor initWithContentNode:](&v10, "initWithContentNode:", a3);
  if (v8)
  {
    v8->_annotation = (THAnnotation *)a4;
    v8->_noteRange.location = location;
    v8->_noteRange.length = length;
  }
  return v8;
}

+ (id)annotationAnchorWithContentNode:(id)a3 annotation:(id)a4 noteRange:(_NSRange)a5
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithContentNode:annotation:noteRange:", a3, a4, a5.location, a5.length);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAnnotationAnchor;
  -[THModelBoundAnchor dealloc](&v3, "dealloc");
}

- (unint64_t)absolutePageIndex
{
  return (unint64_t)-[THAnnotation annotationAbsolutePhysicalPageIndex](-[THAnnotationAnchor annotation](self, "annotation"), "annotationAbsolutePhysicalPageIndex");
}

- (THAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (_NSRange)noteRange
{
  _NSRange *p_noteRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_noteRange = &self->_noteRange;
  location = self->_noteRange.location;
  length = p_noteRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setNoteRange:(_NSRange)a3
{
  self->_noteRange = a3;
}

@end
