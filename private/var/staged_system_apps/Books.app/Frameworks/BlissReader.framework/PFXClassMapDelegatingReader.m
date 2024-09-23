@implementation PFXClassMapDelegatingReader

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXClassMapDelegatingReader;
  -[PFXClassMapDelegatingReader dealloc](&v3, "dealloc");
}

+ (void)delegateMap
{
  return 0;
}

+ (const)keyXmlAttributeName
{
  return 0;
}

+ (Class)fallThroughClass
{
  return 0;
}

- (id)delegate
{
  return self->mDelegate;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  void *v5;
  char *v6;
  uint64_t v7;
  PFXElementReader *mDelegate;
  objc_class *v9;
  const xmlChar *v11;

  v5 = (void *)objc_opt_class(self);
  v11 = (const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "xmlValueForAttribute:", objc_msgSend(v5, "keyXmlAttributeName"));
  if (v11)
  {
    v6 = (char *)objc_msgSend(v5, "delegateMap");
    v7 = sub_1C95FC((uint64_t)v6, &v11);
    if (v6 + 8 != (char *)v7)
      self->mDelegate = (PFXElementReader *)objc_alloc_init(*(Class *)(v7 + 40));
  }
  mDelegate = self->mDelegate;
  if (!mDelegate)
  {
    v9 = (objc_class *)objc_msgSend(v5, "fallThroughClass");
    if (v9)
    {
      mDelegate = (PFXElementReader *)objc_alloc_init(v9);
      self->mDelegate = mDelegate;
    }
    else
    {
      mDelegate = self->mDelegate;
    }
  }
  return -[PFXElementReader mapStartElementWithState:](mDelegate, "mapStartElementWithState:", a3);
}

@end
