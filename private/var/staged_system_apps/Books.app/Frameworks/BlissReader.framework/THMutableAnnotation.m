@implementation THMutableAnnotation

- (THMutableAnnotation)initWithAEAnnotation:(id)a3
{
  THMutableAnnotation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THMutableAnnotation;
  v4 = -[THMutableAnnotation init](&v6, "init");
  if (v4)
    v4->_annotation = (AEAnnotation *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THMutableAnnotation;
  -[THMutableAnnotation dealloc](&v3, "dealloc");
}

- (NSString)annotationUuid
{
  return (NSString *)-[AEAnnotation annotationUuid](self->_annotation, "annotationUuid");
}

- (NSDate)annotationCreationDate
{
  return (NSDate *)-[AEAnnotation annotationCreationDate](self->_annotation, "annotationCreationDate");
}

- (NSDate)annotationModificationDate
{
  return (NSDate *)-[AEAnnotation annotationModificationDate](self->_annotation, "annotationModificationDate");
}

- (int)annotationStyle
{
  return -[AEAnnotation annotationStyle](self->_annotation, "annotationStyle");
}

- (void)setAnnotationStyle:(int)a3
{
  -[AEAnnotation setAnnotationStyle:](self->_annotation, "setAnnotationStyle:", *(_QWORD *)&a3);
}

- (int)annotationType
{
  return -[AEAnnotation annotationType](self->_annotation, "annotationType");
}

- (NSString)annotationLocation
{
  return (NSString *)-[AEAnnotation annotationLocation](self->_annotation, "annotationLocation");
}

- (NSString)redactedAnnotationLocation
{
  return (NSString *)-[AEAnnotation redactedAnnotationLocation](self->_annotation, "redactedAnnotationLocation");
}

- (NSString)annotationNote
{
  return (NSString *)-[AEAnnotation annotationNote](self->_annotation, "annotationNote");
}

- (void)setAnnotationNote:(id)a3
{
  -[AEAnnotation setAnnotationNote:](self->_annotation, "setAnnotationNote:", a3);
}

- (BOOL)annotationHasNote
{
  return -[NSString length](-[NSString stringByTrimmingCharactersInSet:](-[THMutableAnnotation annotationNote](self, "annotationNote"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), "length") != 0;
}

- (NSString)annotationSelectedText
{
  return (NSString *)-[AEAnnotation annotationSelectedText](self->_annotation, "annotationSelectedText");
}

- (NSString)annotationRepresentativeText
{
  return (NSString *)-[AEAnnotation annotationRepresentativeText](self->_annotation, "annotationRepresentativeText");
}

- (id)annotationStorageUID
{
  return -[AEAnnotation plStorageUUID](self->_annotation, "plStorageUUID");
}

- (_NSRange)annotationStorageRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[AEAnnotation annotationStorageRange](self->_annotation, "annotationStorageRange");
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)setAnnotationStorageRange:(_NSRange)a3
{
  -[AEAnnotation setAnnotationStorageRange:](self->_annotation, "setAnnotationStorageRange:", a3.location, a3.length);
}

- (BOOL)annotationIsUnderline
{
  return -[AEAnnotation annotationIsUnderline](self->_annotation, "annotationIsUnderline");
}

@end
