@implementation THGlossaryNoteCardInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryNoteCardInfo;
  -[THGlossaryNoteCardInfo dealloc](&v3, "dealloc");
}

- (unsigned)noteCardTypeSortOrder
{
  return 0;
}

- (int64_t)compareToNoteCard:(id)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  NSComparisonResult v9;
  int64_t v10;

  v5 = objc_opt_class(THGlossaryNoteCardInfo);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, a3).n128_u64[0];
  v8 = v7;
  if (!v7)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryNoteCardInfo compareToNoteCard:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"), 61, CFSTR("invalid nil value for '%s'"), "glossaryCard");
  v9 = -[NSString caseInsensitiveCompare:](-[THModelGlossaryEntry term](-[THGlossaryNoteCardInfo glossaryEntry](self, "glossaryEntry", v6), "term"), "caseInsensitiveCompare:", objc_msgSend(objc_msgSend(v8, "glossaryEntry"), "term"));
  if (v9 == NSOrderedDescending)
    v10 = -1;
  else
    v10 = v9;
  if (v9 == NSOrderedAscending)
    return 1;
  else
    return v10;
}

- (BOOL)shouldShowWithStudyOptions:(id)a3
{
  return objc_msgSend(a3, "showVocabulary");
}

- (BOOL)hasBackContent
{
  return 1;
}

- (BOOL)isEmptyCard
{
  return 0;
}

- (void)populateNoteCardFront:(id)a3
{
  THNoteCardStorageLayer *v5;

  v5 = objc_alloc_init(THNoteCardStorageLayer);
  -[THNoteCardStorageLayer setText:context:](v5, "setText:context:", -[THModelGlossaryEntry term](self->_glossaryEntry, "term"), -[THModelGlossaryEntry context](-[THGlossaryNoteCardInfo glossaryEntry](self, "glossaryEntry"), "context"));
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:](v5, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0), "familyName"), THNoteCardFrontTextColor(-[THGlossaryNoteCardInfo darkMode](self, "darkMode")), 0, 0, 2, 0.0, 1.0);
  objc_msgSend(a3, "setBodyLayer:", v5);
  objc_msgSend(a3, "setShowFlipGlyph:", -[THGlossaryNoteCardInfo hasBackContent](self, "hasBackContent"));

  objc_msgSend(a3, "setTitle:", self->_title);
}

- (void)populateNoteCardBack:(id)a3
{
  THNoteCardStorageLayer *v5;
  THModelGlossaryEntry *glossaryEntry;
  _QWORD v7[6];

  v5 = objc_alloc_init(THNoteCardStorageLayer);
  glossaryEntry = self->_glossaryEntry;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_E0B60;
  v7[3] = &unk_4296A0;
  v7[4] = v5;
  v7[5] = self;
  -[THModelGlossaryEntry synchronouslyLoadInfoOnComplete:](glossaryEntry, "synchronouslyLoadInfoOnComplete:", v7);
  objc_msgSend(a3, "setBodyLayer:", v5);
  objc_msgSend(a3, "setShowFlipGlyph:", -[THGlossaryNoteCardInfo hasBackContent](self, "hasBackContent"));

  objc_msgSend(a3, "setTitle:", self->_backTitle);
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (THModelGlossaryEntry)glossaryEntry
{
  return self->_glossaryEntry;
}

- (void)setGlossaryEntry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)backTitle
{
  return self->_backTitle;
}

- (void)setBackTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
