@implementation THEmptyNoteCardInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THEmptyNoteCardInfo;
  -[THEmptyNoteCardInfo dealloc](&v3, "dealloc");
}

- (unsigned)noteCardTypeSortOrder
{
  return 2;
}

- (int64_t)compareToNoteCard:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(a3, v4) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THEmptyNoteCardInfo compareToNoteCard:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"), 289, CFSTR("expected empty card info"));
  return 0;
}

- (BOOL)shouldShowWithStudyOptions:(id)a3
{
  return 1;
}

- (BOOL)hasBackContent
{
  return 0;
}

- (BOOL)isEmptyCard
{
  return 1;
}

- (void)populateNoteCardFront:(id)a3
{
  THNoteCardEmptyLayer *v4;

  v4 = -[THNoteCardEmptyLayer initWithStudyOptions:unfilteredContentAvailable:darkMode:]([THNoteCardEmptyLayer alloc], "initWithStudyOptions:unfilteredContentAvailable:darkMode:", -[THEmptyNoteCardInfo studyOptions](self, "studyOptions"), -[THEmptyNoteCardInfo isUnfilteredContentAvailable](self, "isUnfilteredContentAvailable"), -[THEmptyNoteCardInfo darkMode](self, "darkMode"));
  objc_msgSend(a3, "setBodyLayer:", v4);

}

- (void)populateNoteCardBack:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THEmptyNoteCardInfo populateNoteCardBack:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"), 317, CFSTR("no content to put on back of card"));
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (THStudyOptions)studyOptions
{
  return self->studyOptions;
}

- (void)setStudyOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)isUnfilteredContentAvailable
{
  return self->_isUnfilteredContentAvailable;
}

- (void)setIsUnfilteredContentAvailable:(BOOL)a3
{
  self->_isUnfilteredContentAvailable = a3;
}

@end
