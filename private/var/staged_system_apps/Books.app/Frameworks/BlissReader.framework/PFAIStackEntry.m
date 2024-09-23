@implementation PFAIStackEntry

+ (id)makeLayoutModeStateWithStackEntry:(id)a3 parentEntryOrientationState:(id)a4 documentOrientationState:(id)a5
{
  PFAIEntryOrientationState *v7;
  id v8;
  id v9;

  v7 = -[PFAIEntryOrientationState initWithStackEntry:parentEntryOrientationState:]([PFAIEntryOrientationState alloc], "initWithStackEntry:parentEntryOrientationState:", a3, a4);
  if (v7)
  {
    if (a4)
    {
      -[PFXHtmlEntryMediaState setStartCharIndex:](v7, "setStartCharIndex:", objc_msgSend(objc_msgSend(a4, "storage"), "length"));
      objc_msgSend(a4, "blockWidth");
      -[PFXHtmlEntryMediaState setBlockWidth:](v7, "setBlockWidth:");
      v8 = objc_msgSend(a4, "processOrientation");
    }
    else
    {
      v9 = objc_msgSend(a5, "bodyStorage");
      -[PFXHtmlEntryMediaState setOverriddenStorage:](v7, "setOverriddenStorage:", v9);
      -[PFXHtmlEntryMediaState setStartCharIndex:](v7, "setStartCharIndex:", objc_msgSend(v9, "length"));
      objc_msgSend(objc_msgSend(a5, "readerState"), "pageContentWidth");
      -[PFXHtmlEntryMediaState setBlockWidth:](v7, "setBlockWidth:");
      v8 = &dword_0 + 1;
    }
    -[PFXHtmlEntryMediaState setProcessOrientation:](v7, "setProcessOrientation:", v8);
    -[PFXHtmlEntryMediaState setStylesheet:](v7, "setStylesheet:", objc_msgSend(a5, "stylesheet"));
  }
  return v7;
}

- (PFAIStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8
{
  PFAIStackEntry *v10;
  PFAIStackEntry *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PFAIStackEntry;
  v10 = -[PFXHtmlStackEntry initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:](&v13, "initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:", a3, a4, a5, a6, a7);
  v11 = v10;
  if (v10)
  {
    v10->mFlowState = (PFAIEntryOrientationState *)objc_msgSend((id)objc_opt_class(v10), "makeLayoutModeStateWithStackEntry:parentEntryOrientationState:documentOrientationState:", v10, objc_msgSend(a3, "flowState"), objc_msgSend(a8, "flowState"));
    v11->mPaginatedState = (PFAIEntryOrientationState *)objc_msgSend((id)objc_opt_class(v11), "makeLayoutModeStateWithStackEntry:parentEntryOrientationState:documentOrientationState:", v11, objc_msgSend(a3, "paginatedState"), objc_msgSend(a8, "paginatedState"));
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIStackEntry;
  -[PFXHtmlStackEntry dealloc](&v3, "dealloc");
}

- (void)addAttributeName:(const char *)a3 withValue:(id)a4
{
  objc_super v7;

  if (-[PFXXmlStackEntry xmlElementId](self, "xmlElementId")
    || !xmlStrEqual((const xmlChar *)"data-original-id", (const xmlChar *)a3))
  {
    v7.receiver = self;
    v7.super_class = (Class)PFAIStackEntry;
    -[PFXHtmlStackEntry addAttributeName:withValue:](&v7, "addAttributeName:withValue:", a3, a4);
  }
  else
  {
    -[PFXXmlStackEntry setElementId:](self, "setElementId:", objc_msgSend(a4, "xmlString"));
  }
}

- (void)addResultFromChildEntry:(id)a3
{
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFAIStackEntry;
  -[PFXXmlStackEntry addResultFromChildEntry:](&v8, "addResultFromChildEntry:");
  objc_opt_class(PFAIStackEntry);
  v5 = objc_msgSend(a3, "xmlElementName");
  v6 = objc_msgSend(a3, "flowState");
  v7 = objc_msgSend(a3, "paginatedState");
  -[PFXHtmlEntryMediaState addElementName:result:](self->mFlowState, "addElementName:result:", v5, objc_msgSend(v6, "result"));
  -[PFXHtmlEntryMediaState addElementName:result:](self->mPaginatedState, "addElementName:result:", v5, objc_msgSend(v7, "result"));
}

- (PFAIEntryOrientationState)currentEntryOrientationState
{
  PFXXmlStreamReaderState *mReaderState;
  int *v4;

  mReaderState = self->super.super.mReaderState;
  if ((-[PFXXmlStreamReaderState paginatedIsCurrent](mReaderState, "paginatedIsCurrent") & 1) != 0)
  {
    v4 = &OBJC_IVAR___PFAIStackEntry_mPaginatedState;
    return *(PFAIEntryOrientationState **)((char *)&self->super.super.super.isa + *v4);
  }
  if (-[PFXXmlStreamReaderState flowIsCurrent](mReaderState, "flowIsCurrent"))
  {
    v4 = &OBJC_IVAR___PFAIStackEntry_mFlowState;
    return *(PFAIEntryOrientationState **)((char *)&self->super.super.super.isa + *v4);
  }
  return 0;
}

- (id)applePubReaderState
{
  return self->super.super.mReaderState;
}

- (id)currentPresentationType
{
  return objc_msgSend(-[PFXXmlStreamReaderState currentDocOrientationState](self->super.super.mReaderState, "currentDocOrientationState"), "presentationType");
}

- (void)addChildAttributesToParentForResult:(id)a3
{
  unsigned int v5;
  PFXXmlStackEntry *mParentEntry;
  id v7;

  v5 = -[PFXXmlStreamReaderState paginatedIsCurrent](self->super.super.mReaderState, "paginatedIsCurrent");
  mParentEntry = self->super.super.mParentEntry;
  if (v5)
    v7 = -[PFXXmlStackEntry paginatedState](mParentEntry, "paginatedState");
  else
    v7 = -[PFXXmlStackEntry flowState](mParentEntry, "flowState");
  objc_msgSend(v7, "addAttributes:forResult:", -[PFXXmlStackEntry xmlAttributes](self, "xmlAttributes"), a3);
}

- (PFAIEntryOrientationState)flowState
{
  return self->mFlowState;
}

- (PFAIEntryOrientationState)paginatedState
{
  return self->mPaginatedState;
}

@end
