@implementation WDAnnotation

- (WDAnnotation)initWithParagraph:(id)a3 type:(int)a4
{
  id v6;
  WDAnnotation *v7;
  void *v8;
  WDCharacterRun *v9;
  WDCharacterRun *mReference;
  WDText *v11;
  void *v12;
  void *v13;
  WDText *v14;
  WDAnnotationData *v15;
  WDAnnotationData *mData;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WDAnnotation;
  v7 = -[WDRun initWithParagraph:](&v18, sel_initWithParagraph_, v6);
  if (v7)
  {
    objc_msgSend(v6, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WDCharacterRun initWithParagraph:]([WDCharacterRun alloc], "initWithParagraph:", v6);
    mReference = v7->mReference;
    v7->mReference = v9;

    -[WDCharacterRun setString:](v7->mReference, "setString:", CFSTR("\x05"));
    v11 = [WDText alloc];
    objc_msgSend(v6, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableCell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WDText initWithDocument:textType:tableCell:](v11, "initWithDocument:textType:tableCell:", v8, 4, v13);

    v15 = -[WDAnnotationData initWithText:]([WDAnnotationData alloc], "initWithText:", v14);
    mData = v7->mData;
    v7->mData = v15;

    v7->mType = a4;
  }

  return v7;
}

- (id)text
{
  return -[WDAnnotationData text](self->mData, "text");
}

- (id)reference
{
  return self->mReference;
}

- (void)setDate:(id)a3
{
  -[WDAnnotationData setDate:](self->mData, "setDate:", a3);
}

- (void)setOwner:(id)a3
{
  -[WDAnnotationData setOwner:](self->mData, "setOwner:", a3);
}

- (int)runType
{
  return 9;
}

- (BOOL)referencePropertiesFixed
{
  return self->mReferencePopertiesFixed;
}

- (void)setReferencePropertiesFixed
{
  self->mReferencePopertiesFixed = 1;
}

- (int)annotationType
{
  return self->mType;
}

- (id)date
{
  return -[WDAnnotationData date](self->mData, "date");
}

- (id)owner
{
  return -[WDAnnotationData owner](self->mData, "owner");
}

- (id)data
{
  return self->mData;
}

- (void)useDataFromOtherEnd
{
  WDAnnotation **p_mOtherEndOfRangedAnnotation;
  id WeakRetained;
  WDAnnotationData *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  WDAnnotationData *mData;

  p_mOtherEndOfRangedAnnotation = &self->mOtherEndOfRangedAnnotation;
  WeakRetained = objc_loadWeakRetained((id *)&self->mOtherEndOfRangedAnnotation);
  objc_msgSend(WeakRetained, "data");
  v5 = (WDAnnotationData *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_mOtherEndOfRangedAnnotation);
  objc_msgSend(v6, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "annotationType");

  v9 = objc_loadWeakRetained((id *)p_mOtherEndOfRangedAnnotation);
  objc_msgSend(v9, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 2)
  {
    -[WDAnnotation setParent:](self, "setParent:", v10);
  }
  else
  {
    objc_msgSend(v10, "otherEndOfRangedAnnotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAnnotation setParent:](self, "setParent:", v11);

  }
  mData = self->mData;
  self->mData = v5;

}

- (id)otherEndOfRangedAnnotation
{
  return objc_loadWeakRetained((id *)&self->mOtherEndOfRangedAnnotation);
}

- (void)setOtherEndOfRangedAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->mOtherEndOfRangedAnnotation, a3);
}

- (id)paragraphIds
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAnnotation text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paragraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__WDAnnotation_paragraphIds__block_invoke;
  v8[3] = &unk_24F3B1CB8;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __28__WDAnnotation_paragraphIds__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_opt_class();
  TSUDynamicCast(v3, (uint64_t)v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (unint64_t)lastParagraphId
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[WDAnnotation text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paragraphs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "identifier");

  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDAnnotation;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isResolved
{
  return self->isResolved;
}

- (void)setIsResolved:(BOOL)a3
{
  self->isResolved = a3;
}

- (WDAnnotation)parent
{
  return self->parent;
}

- (void)setParent:(id)a3
{
  self->parent = (WDAnnotation *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mOtherEndOfRangedAnnotation);
  objc_storeStrong((id *)&self->mData, 0);
  objc_storeStrong((id *)&self->mReference, 0);
}

@end
