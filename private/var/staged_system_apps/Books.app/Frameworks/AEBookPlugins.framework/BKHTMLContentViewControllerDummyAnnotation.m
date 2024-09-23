@implementation BKHTMLContentViewControllerDummyAnnotation

- (BKHTMLContentViewControllerDummyAnnotation)init
{
  BKHTMLContentViewControllerDummyAnnotation *v2;
  uint64_t v3;
  NSDate *date;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHTMLContentViewControllerDummyAnnotation;
  v2 = -[BKHTMLContentViewControllerDummyAnnotation init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    date = v2->_date;
    v2->_date = (NSDate *)v3;

    v2->_annotationStyle = 3;
    v2->_annotationIsUnderline = 0;
  }
  return v2;
}

- (int)annotationType
{
  return 2;
}

- (NSString)annotationLocation
{
  BKEpubCFILocation *dummyLocation2;
  NSString *v4;

  dummyLocation2 = self->_dummyLocation2;
  if (dummyLocation2)
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfiString](dummyLocation2, "cfiString"));
  else
    v4 = self->_cfi;
  return v4;
}

- (NSString)redactedAnnotationLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewControllerDummyAnnotation annotationLocation](self, "annotationLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bc_redactedCFIString"));

  return (NSString *)v3;
}

- (NSString)annotationNote
{
  return 0;
}

- (BOOL)annotationHasNote
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewControllerDummyAnnotation annotationNote](self, "annotationNote"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3));
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (NSString)annotationSelectedText
{
  return -[BKHTMLContentViewControllerDummyAnnotation annotationRepresentativeText](self, "annotationRepresentativeText");
}

- (NSString)annotationUuid
{
  return (NSString *)CFSTR("BKHTMLContentViewControllerDummyAnnotationUUID");
}

- (NSDate)annotationCreationDate
{
  return self->_date;
}

- (NSDate)annotationModificationDate
{
  return self->_date;
}

- (BOOL)isAnnotationDeleted
{
  return -[BKHTMLContentViewControllerDummyAnnotation removed](self, "removed");
}

- (BKLocation)location
{
  return (BKLocation *)self->_dummyLocation2;
}

- (int64_t)ordinal
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewControllerDummyAnnotation location](self, "location"));
  v3 = objc_msgSend(v2, "ordinal");

  return (int64_t)v3;
}

- (BKEpubCFILocation)dummyLocation2
{
  return self->_dummyLocation2;
}

- (void)setDummyLocation2:(id)a3
{
  objc_storeStrong((id *)&self->_dummyLocation2, a3);
}

- (DOMRange)existingAnnotationDOMRange
{
  return self->_existingAnnotationDOMRange;
}

- (void)setExistingAnnotationDOMRange:(id)a3
{
  objc_storeStrong((id *)&self->_existingAnnotationDOMRange, a3);
}

- (int)annotationStyle
{
  return self->_annotationStyle;
}

- (void)setAnnotationStyle:(int)a3
{
  self->_annotationStyle = a3;
}

- (BOOL)annotationIsUnderline
{
  return self->_annotationIsUnderline;
}

- (void)setAnnotationIsUnderline:(BOOL)a3
{
  self->_annotationIsUnderline = a3;
}

- (NSString)chapterTitle
{
  return self->_chapterTitle;
}

- (void)setChapterTitle:(id)a3
{
  objc_storeStrong((id *)&self->_chapterTitle, a3);
}

- (NSString)cfi
{
  return self->_cfi;
}

- (void)setCfi:(id)a3
{
  objc_storeStrong((id *)&self->_cfi, a3);
}

- (NSString)annotationRepresentativeText
{
  return self->_annotationRepresentativeText;
}

- (void)setAnnotationRepresentativeText:(id)a3
{
  objc_storeStrong((id *)&self->_annotationRepresentativeText, a3);
}

- (_NSRange)annotationSelectedTextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_annotationSelectedTextRange.length;
  location = self->_annotationSelectedTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAnnotationSelectedTextRange:(_NSRange)a3
{
  self->_annotationSelectedTextRange = a3;
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationRepresentativeText, 0);
  objc_storeStrong((id *)&self->_cfi, 0);
  objc_storeStrong((id *)&self->_chapterTitle, 0);
  objc_storeStrong((id *)&self->_existingAnnotationDOMRange, 0);
  objc_storeStrong((id *)&self->_dummyLocation2, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
