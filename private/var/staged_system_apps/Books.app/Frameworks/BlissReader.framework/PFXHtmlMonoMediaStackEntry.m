@implementation PFXHtmlMonoMediaStackEntry

+ (id)makeLayoutModeStateWithStackEntry:(id)a3 parentEntryMediaState:(id)a4 documentOrientationState:(id)a5
{
  PFXHtmlEntryMediaState *v7;
  id v8;

  v7 = -[PFXHtmlEntryMediaState initWithHtmlStackEntry:parentEntryMediaState:]([PFXHtmlEntryMediaState alloc], "initWithHtmlStackEntry:parentEntryMediaState:", a3, a4);
  if (v7)
  {
    if (a4)
    {
      -[PFXHtmlEntryMediaState setStartCharIndex:](v7, "setStartCharIndex:", objc_msgSend(objc_msgSend(a4, "storage"), "length"));
      objc_msgSend(a4, "blockWidth");
    }
    else
    {
      v8 = objc_msgSend(a5, "bodyStorage");
      -[PFXHtmlEntryMediaState setOverriddenStorage:](v7, "setOverriddenStorage:", v8);
      -[PFXHtmlEntryMediaState setStartCharIndex:](v7, "setStartCharIndex:", objc_msgSend(v8, "length"));
      objc_msgSend(objc_msgSend(a5, "readerState"), "pageContentWidth");
    }
    -[PFXHtmlEntryMediaState setBlockWidth:](v7, "setBlockWidth:");
    -[PFXHtmlEntryMediaState setStylesheet:](v7, "setStylesheet:", objc_msgSend(a5, "stylesheet"));
  }
  return v7;
}

- (PFXHtmlMonoMediaStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8
{
  PFXHtmlMonoMediaStackEntry *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFXHtmlMonoMediaStackEntry;
  v10 = -[PFXHtmlStackEntry initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:](&v12, "initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:", a3, a4, a5, a6, a7);
  if (v10)
    v10->super.mCurrentEntryMediaState = (PFXHtmlEntryMediaState *)+[PFXHtmlMonoMediaStackEntry makeLayoutModeStateWithStackEntry:parentEntryMediaState:documentOrientationState:](PFXHtmlMonoMediaStackEntry, "makeLayoutModeStateWithStackEntry:parentEntryMediaState:documentOrientationState:", v10, objc_msgSend(a3, "currentEntryMediaState"), objc_msgSend(a8, "currentHtmlDocMediaState"));
  return v10;
}

- (void)addResultFromChildEntry:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFXHtmlMonoMediaStackEntry;
  -[PFXXmlStackEntry addResultFromChildEntry:](&v5, "addResultFromChildEntry:");
  -[PFXHtmlEntryMediaState addElementName:result:](-[PFXHtmlStackEntry currentEntryMediaState](self, "currentEntryMediaState"), "addElementName:result:", objc_msgSend(a3, "xmlElementName"), objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "result"));
}

@end
