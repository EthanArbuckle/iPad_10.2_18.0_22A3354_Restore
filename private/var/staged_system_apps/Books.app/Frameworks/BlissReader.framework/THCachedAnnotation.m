@implementation THCachedAnnotation

- (THCachedAnnotation)initWithAnnotation:(id)a3 contentNode:(id)a4
{
  THCachedAnnotation *v6;
  NSUInteger v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THCachedAnnotation;
  v6 = -[THCachedAnnotation init](&v9, "init");
  if (v6)
  {
    v6->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
    v6->_annotationStyle = objc_msgSend(a3, "annotationStyle");
    v6->_annotationType = objc_msgSend(a3, "annotationType");
    v6->_annotationSelectedText = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationSelectedText"), "copy");
    v6->_annotationRepresentativeText = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationRepresentativeText"), "copy");
    v6->_annotationCreationDate = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationCreationDate"), "copy");
    v6->_annotationModificationDate = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationModificationDate"), "copy");
    v6->_annotationLocation = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationLocation"), "copy");
    v6->_annotationNote = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationNote"), "copy");
    v6->_annotationHasNote = objc_msgSend(a3, "annotationHasNote");
    v6->_annotationStorageRange.location = (NSUInteger)objc_msgSend(a3, "annotationStorageRange");
    v6->_annotationStorageRange.length = v7;
    v6->_annotationStorageUID = (NSString *)objc_msgSend(objc_msgSend(a3, "plStorageUUID"), "copy");
    v6->_annotationContentNodeID = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationContentNodeID"), "copy");
    v6->_annotationAbsolutePhysicalPageIndex = (unint64_t)objc_msgSend(a3, "absolutePhysicalPageIndex");
    v6->_annotationBookVersion = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationBookVersion"), "copy");
    v6->_physicalPageNumber = (NSString *)objc_msgSend(objc_msgSend(a3, "physicalPageNumber"), "copy");
    v6->_contentNode = (THModelContentNode *)a4;
  }
  return v6;
}

- (THCachedAnnotation)initWithCachedAnnotation:(id)a3 chapterTitle:(id)a4 physicalPageNumber:(id)a5
{
  THCachedAnnotation *v8;
  NSUInteger v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THCachedAnnotation;
  v8 = -[THCachedAnnotation init](&v11, "init");
  if (v8)
  {
    v8->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
    v8->_annotationStyle = objc_msgSend(a3, "annotationStyle");
    v8->_annotationType = objc_msgSend(a3, "annotationType");
    v8->_annotationRepresentativeText = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationRepresentativeText"), "copy");
    v8->_annotationCreationDate = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationCreationDate"), "copy");
    v8->_annotationModificationDate = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationModificationDate"), "copy");
    v8->_annotationLocation = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationLocation"), "copy");
    v8->_annotationNote = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationNote"), "copy");
    v8->_annotationHasNote = objc_msgSend(a3, "annotationHasNote");
    v8->_annotationStorageRange.location = (NSUInteger)objc_msgSend(a3, "annotationStorageRange");
    v8->_annotationStorageRange.length = v9;
    v8->_annotationStorageUID = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationStorageUID"), "copy");
    v8->_annotationContentNodeID = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationContentNodeID"), "copy");
    v8->_annotationAbsolutePhysicalPageIndex = (unint64_t)objc_msgSend(a3, "annotationAbsolutePhysicalPageIndex");
    v8->_annotationBookVersion = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationBookVersion"), "copy");
    v8->_physicalPageNumber = (NSString *)objc_msgSend(a5, "copy");
    v8->_chapterTitle = (NSString *)objc_msgSend(a4, "copy");
    v8->_contentNode = (THModelContentNode *)objc_msgSend(a3, "contentNode");
  }
  return v8;
}

- (id)initTemporaryWithStorage:(id)a3 range:(_NSRange)a4 contentNode:(id)a5 style:(int)a6 chapterTitle:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  THCachedAnnotation *v13;
  id v14;
  NSDate *v15;
  objc_super v17;

  length = a4.length;
  location = a4.location;
  v17.receiver = self;
  v17.super_class = (Class)THCachedAnnotation;
  v13 = -[THCachedAnnotation init](&v17, "init");
  if (v13)
  {
    v14 = objc_msgSend(a5, "annotationIDForInfo:", a3);
    v13->_annotationStorageUID = (NSString *)objc_msgSend(v14, "copy");
    v13->_annotationContentNodeID = (NSString *)objc_msgSend(objc_msgSend(a5, "nodeGUID"), "copy");
    v13->_annotationStorageRange.location = location;
    v13->_annotationStorageRange.length = length;
    v13->_annotationStyle = a6;
    v13->_annotationUuid = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-temporary"), v14);
    v13->_annotationLocation = (NSString *)objc_msgSend(objc_msgSend(a5, "cfiForRange:storageUID:includeFilename:pedantic:", location, length, objc_msgSend(a5, "nodeUniqueIDForInfo:", a3), 1, 0), "copy");
    v15 = (NSDate *)objc_alloc_init((Class)NSDate);
    v13->_annotationCreationDate = v15;
    v13->_annotationModificationDate = (NSDate *)-[NSDate copy](v15, "copy");
    v13->_annotationRepresentativeText = (NSString *)objc_msgSend(objc_msgSend(a3, "stringEquivalentFromRange:", location, length), "copy");
    v13->_annotationAbsolutePhysicalPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_chapterTitle = (NSString *)objc_msgSend(a7, "copy");
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THCachedAnnotation;
  -[THCachedAnnotation dealloc](&v3, "dealloc");
}

- (THCachedAnnotation)annotationWithChapterTitle:(id)a3 physicalPageNumber:(id)a4
{
  return (THCachedAnnotation *)objc_msgSend(objc_alloc((Class)objc_opt_class(self, a2)), "initWithCachedAnnotation:chapterTitle:physicalPageNumber:", self, a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(THCachedAnnotation, a2);
  return -[NSString isEqual:](self->_annotationUuid, "isEqual:", objc_msgSend((id)TSUDynamicCast(v5, a3), "annotationUuid"));
}

- (unint64_t)hash
{
  return -[NSString hash](self->_annotationUuid, "hash");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  NSRange v13;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[THCachedAnnotation annotationUuid](self, "annotationUuid");
  v6 = -[THCachedAnnotation annotationContentNodeID](self, "annotationContentNodeID");
  v7 = -[THCachedAnnotation annotationStorageUID](self, "annotationStorageUID");
  v13.location = (NSUInteger)-[THCachedAnnotation annotationStorageRange](self, "annotationStorageRange");
  v8 = NSStringFromRange(v13);
  if (-[THCachedAnnotation physicalPageNumber](self, "physicalPageNumber"))
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" pageNumber=%@"), -[THCachedAnnotation physicalPageNumber](self, "physicalPageNumber"));
  else
    v9 = &stru_43D7D8;
  if (-[THCachedAnnotation chapterTitle](self, "chapterTitle"))
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" chapterTitle=\"%@\"), -[THCachedAnnotation chapterTitle](self, "chapterTitle"));
  else
    v10 = &stru_43D7D8;
  if (-[THCachedAnnotation annotationNote](self, "annotationNote"))
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" note=\"%@\"), -[THCachedAnnotation annotationNote](self, "annotationNote"));
  else
    v11 = &stru_43D7D8;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p uid=%@ contentNodeID=%@ storageID=%@ range=%@%@%@%@>"), v4, self, v5, v6, v7, v8, v9, v10, v11);
}

- (id)theme
{
  return +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:");
}

- (NSString)annotationSelectedText
{
  if (-[NSString length](self->_annotationSelectedText, "length"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCachedAnnotation annotationSelectedText]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 233, CFSTR("didn't expect the selectedText field to be used"));
  return self->_annotationRepresentativeText;
}

- (BOOL)annotationIsUnderline
{
  return self->_annotationStyle == 6;
}

- (BOOL)annotationIsOrphan
{
  return self->_annotationLocation == 0;
}

- (BOOL)annotationIsBookmark
{
  return self->_annotationType == 1;
}

- (BOOL)annotationIsPlaceholder
{
  return self->_annotationType == 3;
}

- (NSString)annotationUuid
{
  return self->_annotationUuid;
}

- (int)annotationStyle
{
  return self->_annotationStyle;
}

- (int)annotationType
{
  return self->_annotationType;
}

- (NSString)annotationRepresentativeText
{
  return self->_annotationRepresentativeText;
}

- (NSDate)annotationCreationDate
{
  return self->_annotationCreationDate;
}

- (NSDate)annotationModificationDate
{
  return self->_annotationModificationDate;
}

- (NSString)annotationLocation
{
  return self->_annotationLocation;
}

- (NSString)annotationNote
{
  return self->_annotationNote;
}

- (BOOL)annotationHasNote
{
  return self->_annotationHasNote;
}

- (_NSRange)annotationStorageRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_annotationStorageRange.length;
  location = self->_annotationStorageRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)annotationStorageUID
{
  return self->_annotationStorageUID;
}

- (NSString)annotationContentNodeID
{
  return self->_annotationContentNodeID;
}

- (unint64_t)annotationAbsolutePhysicalPageIndex
{
  return self->_annotationAbsolutePhysicalPageIndex;
}

- (unint64_t)annotationContentNodeRelativePageIndex
{
  return self->_annotationContentNodeRelativePageIndex;
}

- (NSString)annotationBookVersion
{
  return self->_annotationBookVersion;
}

- (NSString)chapterTitle
{
  return self->_chapterTitle;
}

- (NSString)physicalPageNumber
{
  return self->_physicalPageNumber;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

@end
