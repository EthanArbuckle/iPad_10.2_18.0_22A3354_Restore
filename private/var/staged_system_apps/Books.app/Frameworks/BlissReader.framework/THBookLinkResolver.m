@implementation THBookLinkResolver

- (THBookLinkResolver)initWithDocumentLinkResolver:(id)a3 glossaryLinkResolver:(id)a4
{
  THBookLinkResolver *v6;
  THBookLinkResolver *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THBookLinkResolver;
  v6 = -[THBookLinkResolver init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[THBookLinkResolver setDocumentLinkResolver:](v6, "setDocumentLinkResolver:", a3);
    -[THBookLinkResolver setGlossaryLinkResolver:](v7, "setGlossaryLinkResolver:", a4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[THBookLinkResolver setDocumentLinkResolver:](self, "setDocumentLinkResolver:", 0);
  -[THBookLinkResolver setGlossaryLinkResolver:](self, "setGlossaryLinkResolver:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THBookLinkResolver;
  -[THBookLinkResolver dealloc](&v3, "dealloc");
}

- (id)anchorFromAbsoluteLink:(id)a3 presentationType:(id)a4
{
  id result;

  if (!-[THBookLinkResolver documentLinkResolver](self, "documentLinkResolver"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookLinkResolver anchorFromAbsoluteLink:presentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THBookLinkResolver.m"), 49, CFSTR("Book link resolver lacks document link resolver; initialization sequence error?"));
  if (!-[THBookLinkResolver glossaryLinkResolver](self, "glossaryLinkResolver"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookLinkResolver anchorFromAbsoluteLink:presentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THBookLinkResolver.m"), 50, CFSTR("Book link resolver lacks glossary link resolver; initialization sequence error?"));
  result = -[THDocumentLinkResolver anchorFromCustomLink:presentationType:](-[THBookLinkResolver documentLinkResolver](self, "documentLinkResolver"), "anchorFromCustomLink:presentationType:", a3, a4);
  if (!result)
  {
    if ((objc_msgSend(a3, "isRelative") & 1) != 0)
    {
      return 0;
    }
    else
    {
      result = -[THDocumentLinkResolver anchorFromAbsoluteLink:presentationType:](-[THBookLinkResolver documentLinkResolver](self, "documentLinkResolver"), "anchorFromAbsoluteLink:presentationType:", a3, a4);
      if (!result)
        return -[THGlossaryLinkResolver anchorFromAbsoluteLink:](-[THBookLinkResolver glossaryLinkResolver](self, "glossaryLinkResolver"), "anchorFromAbsoluteLink:", a3);
    }
  }
  return result;
}

- (THDocumentLinkResolver)documentLinkResolver
{
  return self->mDocumentLinkResolver;
}

- (void)setDocumentLinkResolver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (THGlossaryLinkResolver)glossaryLinkResolver
{
  return self->mGlossaryLinkResolver;
}

- (void)setGlossaryLinkResolver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
