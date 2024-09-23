@implementation PFAIDualReader

+ (Class)subreaderClass
{
  return 0;
}

- (PFAIDualReader)init
{
  PFAIDualReader *v2;
  PFAIDualReader *v3;
  objc_class *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAIDualReader;
  v2 = -[PFAIDualReader init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_msgSend((id)objc_opt_class(v2), "subreaderClass");
    v3->mFlowSubreader = (PFXElementReader *)objc_alloc_init(v4);
    v3->mPaginatedSubreader = (PFXElementReader *)objc_alloc_init(v4);
    *(_WORD *)&v3->mOverridden = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIDualReader;
  -[PFAIDualReader dealloc](&v3, "dealloc");
}

- (id)currentSubreaderWithState:(id)a3
{
  uint64_t v5;

  if ((objc_msgSend(a3, "paginatedIsCurrent") & 1) != 0)
  {
    v5 = 8;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  if (objc_msgSend(a3, "flowIsCurrent"))
  {
    v5 = 16;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  return 0;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  const xmlChar *v16;
  _BOOL8 v17;
  unsigned int v18;
  _BOOL8 v19;

  v5 = objc_msgSend(a3, "currentStackEntry");
  if (!objc_msgSend(a3, "setFlowAsCurrent"))
  {
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  v6 = -[PFXElementReader mapStartElementWithState:](self->mFlowSubreader, "mapStartElementWithState:", a3);
  v7 = objc_msgSend(v5, "parentEntry");
  if (v6 && -[PFAIDualReader shouldImportInCurrentLayoutWithState:](self, "shouldImportInCurrentLayoutWithState:", a3))
  {
    v8 = objc_msgSend(v5, "flowState");
    LOBYTE(v6) = 1;
    v9 = 1;
  }
  else
  {
    v10 = objc_msgSend(v7, "reader");
    v11 = objc_opt_class(PFAINormal);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", 1);
      self->mOverridden = 1;
      goto LABEL_12;
    }
    v12 = objc_msgSend(objc_msgSend(v7, "parentEntry"), "reader");
    v13 = objc_opt_class(PFAINormal);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v14 = objc_msgSend(v5, "reader");
      v15 = objc_opt_class(PFAIDualShapeWithText);
      LOBYTE(v14) = objc_opt_isKindOfClass(v14, v15);
      v16 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
      v17 = (xmlStrEqual(v16, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]) != 0) & v14;
      objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v17);
      self->mOverridden = v17;
      self->mGutterTitleShape = v17;
      goto LABEL_12;
    }
    v8 = objc_msgSend(v5, "flowState");
    v9 = 0;
  }
  objc_msgSend(v8, "setProcessOrientation:", v9);
LABEL_12:
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v18 = -[PFXElementReader mapStartElementWithState:](self->mPaginatedSubreader, "mapStartElementWithState:", a3);
    v19 = v18
       && -[PFAIDualReader shouldImportInCurrentLayoutWithState:](self, "shouldImportInCurrentLayoutWithState:", a3);
    objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v19);
    LOBYTE(v6) = v18 | v6;
  }
  return v6;
}

- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;

  if (!objc_msgSend(a3, "setFlowAsCurrent"))
    goto LABEL_9;
  if (self->mOverridden)
  {
    if (!self->mGutterTitleShape)
      goto LABEL_9;
  }
  else if (!self->mGutterTitleShape)
  {
    -[PFXElementReader mapEndElementWithState:](self->mFlowSubreader, "mapEndElementWithState:", a3);
    goto LABEL_9;
  }
  v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentStackEntry"), "currentEntryOrientationState"), "storage");
  v6 = objc_msgSend(a3, "ancestorEntryWithReaderClass:", objc_opt_class(PFAIAnchoredDrawable));
  v7 = objc_opt_class(PFAIAnchoredDrawable);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, objc_msgSend(v6, "reader")).n128_u64[0];
  if (v8)
    objc_msgSend(v8, "setGutterTitleStorage:", v5, v9);
LABEL_9:
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
    -[PFXElementReader mapEndElementWithState:](self->mPaginatedSubreader, "mapEndElementWithState:", a3);
}

@end
