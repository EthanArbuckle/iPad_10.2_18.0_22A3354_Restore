@implementation PFXDiv

- (void)dealloc
{
  PFXDiv *mDelegate;
  objc_super v4;

  mDelegate = (PFXDiv *)self->mDelegate;
  if (mDelegate != self)

  v4.receiver = self;
  v4.super_class = (Class)PFXDiv;
  -[PFXDiv dealloc](&v4, "dealloc");
}

- (id)delegate
{
  return self->mDelegate;
}

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_543778;
  if (!qword_543778)
  {
    objc_sync_enter(a1);
    if (!qword_543778)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_543778;
  }
  return result;
}

+ (Class)blockClass
{
  return (Class)objc_opt_class(PFXBlock, a2);
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  PFXElementReader *mDelegate;
  id v9;
  uint64_t v10;
  const xmlChar *v12;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v12 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  if (v12)
  {
    v6 = (char *)objc_msgSend((id)objc_opt_class(self), "delegateMap");
    v7 = sub_1C95FC((uint64_t)v6, &v12);
    if (v6 + 8 != (char *)v7)
      self->mDelegate = (PFXElementReader *)objc_alloc_init(*(Class *)(v7 + 40));
  }
  mDelegate = self->mDelegate;
  if (!mDelegate)
  {
    self->mDelegate = (PFXElementReader *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(self), "blockClass"));
    v9 = objc_msgSend(a3, "drawableReaderForCurrentMediaStateWithStackEntry:", objc_msgSend(v5, "parentHtmlStackEntry"));
    v10 = objc_opt_class(PFXShapeWithText);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      return 1;
    mDelegate = self->mDelegate;
  }
  return -[PFXElementReader mapStartElementWithState:](mDelegate, "mapStartElementWithState:", a3);
}

@end
