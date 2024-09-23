@implementation THModelGlossaryEntryFlushable

- (THModelGlossaryEntryFlushable)initWithParent:(id)a3
{
  THModelGlossaryEntryFlushable *v4;
  THModelGlossaryEntryFlushable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THModelGlossaryEntryFlushable;
  v4 = -[THModelGlossaryEntryFlushable init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THModelGlossaryEntryFlushable setParent:](v4, "setParent:", a3);
  return v5;
}

- (void)p_clearFlushableMembers
{
  objc_sync_enter(self);

  self->mBody = 0;
  objc_sync_exit(self);
}

- (void)dealloc
{
  objc_super v3;

  self->mParent = 0;
  -[THModelGlossaryEntryFlushable p_clearFlushableMembers](self, "p_clearFlushableMembers");
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossaryEntryFlushable;
  -[THModelGlossaryEntryFlushable dealloc](&v3, "dealloc");
}

- (BOOL)hasFlushableContent
{
  return self->mBody != 0;
}

- (THModelGlossaryEntryBody)body
{
  objc_sync_enter(self);
  if (!self->mBody)
  {
    -[THModelGlossaryEntryFlushable setBody:](self, "setBody:", -[THModelGlossaryEntryBody initWithContext:]([THModelGlossaryEntryBody alloc], "initWithContext:", -[THModelGlossaryEntry context](-[THModelGlossaryEntryFlushable parent](self, "parent"), "context")));
    -[THModelGlossaryEntryFlushable readFromApplePubWithDelegate:error:](self, "readFromApplePubWithDelegate:error:", 0, 0);
  }
  objc_sync_exit(self);
  return self->mBody;
}

- (THModelGlossaryEntry)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  self->mParent = (THModelGlossaryEntry *)a3;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)p_populateParagraphStyle:(id)a3
{
  NSString *v5;
  const __CFString *v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C3658;
  v7[3] = &unk_427480;
  v7[4] = a3;
  objc_msgSend(+[TSWPParagraphStyle paragraphProperties](TSWPParagraphStyle, "paragraphProperties"), "enumeratePropertiesUsingBlock:", v7);
  v5 = -[THBookDescription language](-[THDocumentRoot bookDescription](-[THModelGlossary documentRoot](-[THModelGlossaryEntry glossary](self->mParent, "glossary"), "documentRoot"), "bookDescription"), "language");
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("en");
  objc_msgSend(a3, "setBoxedValue:forProperty:", v6, 39);
}

- (void)p_populate
{
  THModelGlossaryEntryBody *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  THWPStorage *v8;
  THWPStorage *v9;
  THWPStorage *v10;
  THWPStorage *v11;
  id v12;

  v3 = -[THModelGlossaryEntryFlushable body](self, "body");
  v4 = -[THModelGlossaryEntryBody context](v3, "context");
  v12 = objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:canCullStyles:", v4, 0);
  objc_msgSend(v12, "setParent:", -[THDocumentRoot stylesheet](-[THModelGlossary documentRoot](-[THModelGlossaryEntry glossary](self->mParent, "glossary"), "documentRoot"), "stylesheet"));
  -[THModelGlossaryEntryBody setStylesheet:](v3, "setStylesheet:", v12);
  v5 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", v4);
  -[THModelGlossaryEntryFlushable p_populateParagraphStyle:](self, "p_populateParagraphStyle:", v5);
  objc_msgSend(v12, "addStyle:withIdentifier:", v5, kTSWPDefaultGlossaryParagraphStyleIdentifier);
  v6 = +[TSWPListStyle defaultStyleWithContext:](TSWPListStyle, "defaultStyleWithContext:", v4);
  objc_msgSend(v12, "addStyle:withIdentifier:", v6, TSWPDefaultListStyleIdentifier);
  v7 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", v4);
  objc_msgSend(v12, "addStyle:withIdentifier:", v7, kTSWPDefaultGlossaryColumnStyleIdentifier);
  v8 = -[THWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([THWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v4, 0, 0, v12, v5, v6, 0, v7);
  v9 = -[THWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([THWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v4, 0, 0, v12, v5, v6, 0, v7);
  v10 = -[THWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([THWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v4, 0, 0, v12, v5, v6, 0, v7);
  v11 = -[THWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([THWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v4, 0, 0, v12, v5, v6, 0, v7);
  -[THModelGlossaryEntryBody setHeaderInfo:](v3, "setHeaderInfo:", v8);
  -[THModelGlossaryEntryBody setBodyStorage:](v3, "setBodyStorage:", v9);
  -[THModelGlossaryEntryBody setRelatedTermsInfo:](v3, "setRelatedTermsInfo:", v10);
  -[THModelGlossaryEntryBody setLinksInfo:](v3, "setLinksInfo:", v11);

}

- (id)applePubURL
{
  return -[NSURL path](-[THModelGlossary applePubURL](-[THModelGlossaryEntry glossary](-[THModelGlossaryEntryFlushable parent](self, "parent"), "glossary"), "applePubURL"), "path");
}

- (id)applePubEntry
{
  return -[THModelGlossaryEntry applePubRelativePath](-[THModelGlossaryEntryFlushable parent](self, "parent"), "applePubRelativePath");
}

- (BOOL)readFromApplePubWithDelegate:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  PFXArchive *v8;
  PFAIGlossaryState *v9;
  BOOL v10;

  v5 = -[THModelGlossaryEntryFlushable applePubURL](self, "applePubURL", a3, a4);
  v6 = -[THModelGlossaryEntryFlushable applePubEntry](self, "applePubEntry");
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", v5);
  if (!-[PFXArchive isValid](v8, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelGlossaryEntryFlushable(ApplePubReading) readFromApplePubWithDelegate:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelGlossaryEntryFlushableAdditions.mm"), 164, CFSTR("Failed to load valid archive"));
  if (!-[PFXArchive isValid](v8, "isValid"))
  {
    v9 = 0;
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  -[THModelGlossaryEntryFlushable p_populate](self, "p_populate");
  v9 = -[PFAIGlossaryState initWithEntryBody:documentRoot:archive:documentEntryUri:]([PFAIGlossaryState alloc], "initWithEntryBody:documentRoot:archive:documentEntryUri:", -[THModelGlossaryEntryFlushable body](self, "body"), -[THModelGlossary documentRoot](-[THModelGlossaryEntry glossary](self->mParent, "glossary"), "documentRoot"), v8, v6);
  -[PFXHtmlReaderState setPageContentWidth:](v9, "setPageContentWidth:", 600.0);
  if (!-[PFXXmlStreamReaderState streamAPI](v9, "streamAPI"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelGlossaryEntryFlushable(ApplePubReading) readFromApplePubWithDelegate:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelGlossaryEntryFlushableAdditions.mm"), 179, CFSTR("invalid nil value for '%s'"), "glossaryState.streamAPI");
  if (!-[PFXXmlStreamReaderState streamAPI](v9, "streamAPI"))
    goto LABEL_9;
  v10 = +[PFAIGlossaryDocument readWithState:](PFAIGlossaryDocument, "readWithState:", v9);
LABEL_10:

  return v10;
}

- (BOOL)hasCachedVersion
{
  id v3;
  id v4;
  BOOL v5;
  id v6;
  PFXArchive *v7;

  v3 = -[THModelGlossaryEntryFlushable applePubURL](self, "applePubURL");
  v4 = -[THModelGlossaryEntryFlushable applePubEntry](self, "applePubEntry");
  v5 = 0;
  if (v3)
  {
    v6 = v4;
    if (v4)
    {
      v7 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", v3);
      v5 = -[PFXArchive decryptEntryWithName:error:](v7, "decryptEntryWithName:error:", v6, 0) != 0;

    }
  }
  return v5;
}

@end
