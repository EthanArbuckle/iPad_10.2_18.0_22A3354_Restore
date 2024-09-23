@implementation THAnnotationNoteCardInfo

- (THAnnotationNoteCardInfo)init
{
  THAnnotationNoteCardInfo *v2;
  THAnnotationNoteCardInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THAnnotationNoteCardInfo;
  v2 = -[THAnnotationNoteCardInfo init](&v5, "init");
  v3 = v2;
  if (v2)
    -[THAnnotationNoteCardInfo setPageNumberString:](v2, "setPageNumberString:", 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAnnotationNoteCardInfo;
  -[THAnnotationNoteCardInfo dealloc](&v3, "dealloc");
}

- (unsigned)noteCardTypeSortOrder
{
  return 1;
}

- (int64_t)compareToNoteCard:(id)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  id v11;

  v5 = objc_opt_class(THAnnotationNoteCardInfo);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, a3).n128_u64[0];
  v8 = v7;
  if (!v7)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationNoteCardInfo compareToNoteCard:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"), 176, CFSTR("invalid nil value for '%s'"), "annotationCard");
  v9 = -[THAnnotationNoteCardInfo pageIndex](self, "pageIndex", v6);
  if (v9 == objc_msgSend(v8, "pageIndex"))
  {
    v10 = -[THAnnotationNoteCardInfo bodyPosition](self, "bodyPosition");
    v11 = objc_msgSend(v8, "bodyPosition");
  }
  else
  {
    v10 = -[THAnnotationNoteCardInfo pageIndex](self, "pageIndex");
    v11 = objc_msgSend(v8, "pageIndex");
  }
  if (v10 > (uint64_t)v11)
    return -1;
  else
    return 1;
}

- (BOOL)shouldShowWithStudyOptions:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "showAnnotations");
  if (v5)
    LOBYTE(v5) = objc_msgSend(a3, "shouldShowAnnotationStyle:", -[THAnnotation annotationStyle](self->annotation, "annotationStyle"));
  return v5;
}

- (BOOL)hasBackContent
{
  return -[THAnnotation annotationNote](self->annotation, "annotationNote") != 0;
}

- (BOOL)isEmptyCard
{
  return 0;
}

- (void)populateNoteCardFront:(id)a3
{
  id v5;
  id v6;
  TSUColor *v7;
  THNoteCardStorageLayer *v8;
  THWPStorage *storage;
  id v10;
  uint64_t v11;

  v5 = +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", -[THAnnotation annotationStyle](self->annotation, "annotationStyle"), 4, -[THAnnotation annotationIsUnderline](self->annotation, "annotationIsUnderline"));
  if (objc_msgSend(v5, "isUnderline") && (v6 = objc_msgSend(v5, "highlightColor")) != 0)
    v7 = +[TSUColor colorWithPlatformColor:](TSUColor, "colorWithPlatformColor:", v6);
  else
    v7 = 0;
  v8 = objc_alloc_init(THNoteCardStorageLayer);
  storage = self->storage;
  v10 = -[THAnnotation annotationStorageRange](self->annotation, "annotationStorageRange");
  -[THNoteCardStorageLayer setStorage:range:](v8, "setStorage:range:", storage, v10, v11);
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:](v8, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0), "familyName"), THNoteCardFrontTextColor(-[THAnnotationNoteCardInfo darkMode](self, "darkMode")), v7, 0, 4, 0.0, 1.0);
  objc_msgSend(a3, "setBodyLayer:", v8);
  objc_msgSend(a3, "setShowFlipGlyph:", -[THAnnotationNoteCardInfo hasBackContent](self, "hasBackContent"));

  objc_msgSend(a3, "setTitle:", self->title);
  if (self->pageNumberString)
    objc_msgSend(a3, "setPageNumber:");
  objc_msgSend(a3, "setColorBarColor:", objc_msgSend(objc_msgSend(v5, "notesSidebarBarColor"), "CGColor"));
}

- (void)populateNoteCardBack:(id)a3
{
  THNoteCardStorageLayer *v5;

  if (!-[THAnnotation annotationNote](self->annotation, "annotationNote"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationNoteCardInfo populateNoteCardBack:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"), 241, CFSTR("no content to put on back of card"));
  v5 = objc_alloc_init(THNoteCardStorageLayer);
  -[THNoteCardStorageLayer setText:context:](v5, "setText:context:", -[THAnnotation annotationNote](self->annotation, "annotationNote"), -[THWPStorage context](self->storage, "context"));
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:](v5, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0), "familyName"), THNoteCardBackTextColor(-[THAnnotationNoteCardInfo darkMode](self, "darkMode")), 0, 0, 4, -0.01, 1.0);
  objc_msgSend(a3, "setBodyLayer:", v5);
  objc_msgSend(a3, "setShowFlipGlyph:", -[THAnnotationNoteCardInfo hasBackContent](self, "hasBackContent"));

  objc_msgSend(a3, "setTitle:", self->title);
  if (self->pageNumberString)
    objc_msgSend(a3, "setPageNumber:");
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (THWPStorage)storage
{
  return self->storage;
}

- (void)setStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THAnnotation)annotation
{
  return self->annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)pageNumberString
{
  return self->pageNumberString;
}

- (void)setPageNumberString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int64_t)pageIndex
{
  return self->pageIndex;
}

- (void)setPageIndex:(int64_t)a3
{
  self->pageIndex = a3;
}

- (int64_t)bodyPosition
{
  return self->bodyPosition;
}

- (void)setBodyPosition:(int64_t)a3
{
  self->bodyPosition = a3;
}

@end
