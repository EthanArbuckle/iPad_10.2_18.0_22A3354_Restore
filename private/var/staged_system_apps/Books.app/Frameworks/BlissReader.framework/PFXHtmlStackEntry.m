@implementation PFXHtmlStackEntry

- (void)setStyleSelector:(id)a3
{
  PFSStyleSelector *mSelector;

  mSelector = self->mSelector;
  if (mSelector != a3)
  {

    self->mSelector = (PFSStyleSelector *)a3;
  }
}

- (PFXHtmlStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFXHtmlStackEntry;
  return -[PFXXmlStackEntry initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:](&v9, "initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:", a3, a4, a5, a6, a7, a8);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXHtmlStackEntry;
  -[PFXXmlStackEntry dealloc](&v3, "dealloc");
}

- (PFXHtmlStackEntry)parentHtmlStackEntry
{
  return (PFXHtmlStackEntry *)self->super.mParentEntry;
}

- (PFXHtmlReaderState)htmlReaderState
{
  return (PFXHtmlReaderState *)self->super.mReaderState;
}

- (void)addChildAttributesToParentForResult:(id)a3
{
  -[PFXHtmlEntryMediaState addAttributes:forResult:](-[PFXHtmlStackEntry currentEntryMediaState](-[PFXHtmlStackEntry parentHtmlStackEntry](self, "parentHtmlStackEntry"), "currentEntryMediaState"), "addAttributes:forResult:", -[PFXXmlStackEntry xmlAttributes](self, "xmlAttributes"), a3);
}

- (id)titleAttributeValue
{
  return -[PFXXmlStackEntry valueForAttribute:](self, "valueForAttribute:", "title");
}

- (PFXHtmlEntryMediaState)currentEntryMediaState
{
  return self->mCurrentEntryMediaState;
}

- (PFXString)classAttribute
{
  return self->mClassAttribute;
}

- (PFXString)styleAttribute
{
  return self->mStyleAttribute;
}

- (NSURL)href
{
  return self->mHref;
}

- (void)setHref:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (PFSStyleSelector)styleSelector
{
  return self->mSelector;
}

- (void)addAttributeName:(const char *)a3 withValue:(id)a4
{
  objc_class *v7;
  uint64_t v8;
  objc_super v9;

  if (xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"style"))
  {
    v7 = (objc_class *)a4;
    v8 = 136;
  }
  else
  {
    if (!xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"class"))
    {
      v9.receiver = self;
      v9.super_class = (Class)PFXHtmlStackEntry;
      -[PFXXmlStackEntry addAttributeName:withValue:](&v9, "addAttributeName:withValue:", a3, a4);
      return;
    }
    v7 = (objc_class *)a4;
    v8 = 128;
  }
  *(Class *)((char *)&self->super.super.isa + v8) = v7;
}

@end
