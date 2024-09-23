@implementation PFAIGlossaryDefinitions

+ (void)delegateMap
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&qword_543728);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_543728))
  {
    qword_543720 = 0;
    qword_543718 = 0;
    qword_543710 = (uint64_t)&qword_543718;
    __cxa_guard_release(&qword_543728);
  }
  return &qword_543710;
}

+ (void)initialize
{
  void *v2;
  uint64_t **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;

  v2 = (void *)objc_opt_class(PFAIGlossaryDefinitions);
  if (v2)
  {
    v3 = (uint64_t **)objc_msgSend(v2, "delegateMap");
    v4 = objc_opt_class(PFAIGlossaryWidgetTitle);
    v8 = PFXCommonApubGlossaryTerm;
    sub_1C6CDC(v3, (const xmlChar **)PFXCommonApubGlossaryTerm, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v4;
    v5 = objc_opt_class(PFAIGlossaryWidgetDefinition);
    v8 = PFXCommonApubGlossaryDefinition;
    sub_1C6CDC(v3, (const xmlChar **)PFXCommonApubGlossaryDefinition, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v5;
    v6 = objc_opt_class(PFAIGlossaryWidgetRelated);
    v8 = PFXCommonApubGlossaryRelated;
    sub_1C6CDC(v3, (const xmlChar **)PFXCommonApubGlossaryRelated, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v6;
    v7 = objc_opt_class(PFAIGlossaryWidgetIndexLinks);
    v8 = &PFXCommonApubGlossaryIndex;
    sub_1C6CDC(v3, (const xmlChar **)&PFXCommonApubGlossaryIndex, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v7;
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIGlossaryDefinitions;
  -[PFAIGlossaryDefinitions dealloc](&v3, "dealloc");
}

- (id)delegate
{
  return self->mDelegate;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  PFXStopReadingReader *mDelegate;
  const xmlChar *v10;

  v5 = objc_msgSend(a3, "currentXmlStackEntry");
  v10 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", glossaryAttribute);
  if (v10)
  {
    v6 = (char *)objc_msgSend((id)objc_opt_class(self), "delegateMap");
    v7 = sub_1C95FC((uint64_t)v6, &v10);
    if (v6 + 8 != (char *)v7)
      self->mDelegate = (PFXElementReader *)objc_alloc_init(*(Class *)(v7 + 40));
  }
  mDelegate = (PFXStopReadingReader *)self->mDelegate;
  if (!mDelegate)
  {
    mDelegate = objc_alloc_init(PFXStopReadingReader);
    self->mDelegate = (PFXElementReader *)mDelegate;
  }
  return -[PFXStopReadingReader mapStartElementWithState:](mDelegate, "mapStartElementWithState:", a3);
}

@end
