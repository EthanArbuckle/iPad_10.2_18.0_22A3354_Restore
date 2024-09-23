@implementation EDSheet

- (EDSheet)initWithWorkbook:(id)a3
{
  id v4;
  EDSheet *v5;
  EDSheet *v6;

  v4 = a3;
  v5 = -[EDSheet init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mWorkbook, v4);
    -[EDSheet setup](v6, "setup");
  }

  return v6;
}

- (void)setup
{
  NSMutableArray *v3;
  NSMutableArray *mDrawables;
  EDProcessors *v5;
  id WeakRetained;
  EDProcessors *v7;
  EDProcessors *mProcessors;
  EDWarnings *v9;
  EDWarnings *mWarnings;
  OITSUPointerKeyDictionary *v11;
  OITSUPointerKeyDictionary *mTextBoxMap;
  OITSUPointerKeyDictionary *v13;
  OITSUPointerKeyDictionary *mCommentMap;
  id v15;
  void *v16;
  void *v17;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mDrawables = self->mDrawables;
  self->mDrawables = v3;

  v5 = [EDProcessors alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  v7 = -[EDProcessors initWithWorkbook:](v5, "initWithWorkbook:", WeakRetained);
  mProcessors = self->mProcessors;
  self->mProcessors = v7;

  v9 = objc_alloc_init(EDWarnings);
  mWarnings = self->mWarnings;
  self->mWarnings = v9;

  v11 = -[OITSUPointerKeyDictionary initWithCapacity:]([OITSUPointerKeyDictionary alloc], "initWithCapacity:", 128);
  mTextBoxMap = self->mTextBoxMap;
  self->mTextBoxMap = v11;

  v13 = -[OITSUPointerKeyDictionary initWithCapacity:]([OITSUPointerKeyDictionary alloc], "initWithCapacity:", 128);
  mCommentMap = self->mCommentMap;
  self->mCommentMap = v13;

  v15 = objc_loadWeakRetained((id *)&self->mWorkbook);
  objc_msgSend(v15, "resources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDColorReference colorReferenceWithSystemColorID:resources:](EDColorReference, "colorReferenceWithSystemColorID:resources:", 13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSheet setDefaultGridlineColorReference:](self, "setDefaultGridlineColorReference:", v17);

  self->mHidden = 0;
  self->mDisplayFormulas = 0;
  self->mDisplayGridlines = 1;
}

- (void)setDefaultGridlineColorReference:(id)a3
{
  EDColorReference *v5;
  EDColorReference *v6;

  v5 = (EDColorReference *)a3;
  if (self->mDefaultGridlineColorReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDefaultGridlineColorReference, a3);
    v5 = v6;
  }

}

- (void)setName:(id)a3
{
  EDString *v5;
  EDString *v6;

  v5 = (EDString *)a3;
  if (self->mName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mName, a3);
    v5 = v6;
  }

}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (id)processors
{
  return self->mProcessors;
}

- (void)setIsDialogSheet:(BOOL)a3
{
  self->mIsDialogSheet = a3;
}

- (void)setHeaderFooter:(id)a3
{
  EDHeaderFooter *v5;
  EDHeaderFooter *v6;

  v5 = (EDHeaderFooter *)a3;
  if (self->mHeaderFooter != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mHeaderFooter, a3);
    v5 = v6;
  }

}

- (void)setPageSetup:(id)a3
{
  EDPageSetup *v5;
  EDPageSetup *v6;

  v5 = (EDPageSetup *)a3;
  if (self->mPageSetup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mPageSetup, a3);
    v5 = v6;
  }

}

- (void)setDisplayFormulas:(BOOL)a3
{
  self->mDisplayFormulas = a3;
}

- (void)setDisplayGridlines:(BOOL)a3
{
  self->mDisplayGridlines = a3;
}

- (void)applyProcessors
{
  -[EDProcessors applyProcessorsWithSheet:](self->mProcessors, "applyProcessorsWithSheet:", self);
  -[EDProcessors removeAllObjects](self->mProcessors, "removeAllObjects");
}

- (id)name
{
  return self->mName;
}

- (BOOL)isDisplayFormulas
{
  return self->mDisplayFormulas;
}

- (unint64_t)drawableCount
{
  return -[NSMutableArray count](self->mDrawables, "count");
}

- (BOOL)isDisplayGridlines
{
  return self->mDisplayGridlines;
}

- (void)teardown
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSMutableArray *mDrawables;
  EDProcessors *mProcessors;
  EDWarnings *mWarnings;
  EDHeaderFooter *mHeaderFooter;
  EDPageSetup *mPageSetup;
  EDColorReference *mDefaultGridlineColorReference;
  ESDContainer *mEscherDrawing;
  OITSUPointerKeyDictionary *mTextBoxMap;
  OITSUPointerKeyDictionary *mCommentMap;

  objc_storeWeak((id *)&self->mWorkbook, 0);
  v3 = -[NSMutableArray count](self->mDrawables, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->mDrawables, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setSheet:", 0);

    }
  }
  mDrawables = self->mDrawables;
  self->mDrawables = 0;

  -[EDProcessors removeAllObjects](self->mProcessors, "removeAllObjects");
  mProcessors = self->mProcessors;
  self->mProcessors = 0;

  mWarnings = self->mWarnings;
  self->mWarnings = 0;

  mHeaderFooter = self->mHeaderFooter;
  self->mHeaderFooter = 0;

  mPageSetup = self->mPageSetup;
  self->mPageSetup = 0;

  mDefaultGridlineColorReference = self->mDefaultGridlineColorReference;
  self->mDefaultGridlineColorReference = 0;

  mEscherDrawing = self->mEscherDrawing;
  self->mEscherDrawing = 0;

  mTextBoxMap = self->mTextBoxMap;
  self->mTextBoxMap = 0;

  mCommentMap = self->mCommentMap;
  self->mCommentMap = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[EDSheet teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)EDSheet;
  -[EDSheet dealloc](&v3, sel_dealloc);
}

- (void)addDrawable:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[EDSheet workbook](self, "workbook");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultTextStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setParentTextListStyle:", v5);

    -[NSMutableArray addObject:](self->mDrawables, "addObject:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setSheet:", self);
  }

}

- (EDWorkbook)workbook
{
  return (EDWorkbook *)objc_loadWeakRetained((id *)&self->mWorkbook);
}

- (id)drawableAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mDrawables, "objectAtIndex:", a3);
}

- (id)pageSetup
{
  return self->mPageSetup;
}

- (id)warnings
{
  return self->mWarnings;
}

+ (EDSheet)sheetWithWorkbook:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWorkbook:", v3);

  return (EDSheet *)v4;
}

- (void)doneWithNonRowContent
{
  ESDContainer *mEscherDrawing;
  OITSUPointerKeyDictionary *mTextBoxMap;
  OITSUPointerKeyDictionary *mCommentMap;

  -[NSMutableArray removeAllObjects](self->mDrawables, "removeAllObjects");
  mEscherDrawing = self->mEscherDrawing;
  self->mEscherDrawing = 0;

  mTextBoxMap = self->mTextBoxMap;
  self->mTextBoxMap = 0;

  mCommentMap = self->mCommentMap;
  self->mCommentMap = 0;

}

- (id)defaultGridlineColor
{
  return -[EDColorReference color](self->mDefaultGridlineColorReference, "color");
}

- (void)setDefaultGridlineColor:(id)a3
{
  EDColorReference *v4;
  id WeakRetained;
  void *v6;
  EDColorReference *v7;
  EDColorReference *mDefaultGridlineColorReference;
  id v9;

  v9 = a3;
  v4 = [EDColorReference alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  objc_msgSend(WeakRetained, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EDColorReference initWithColor:resources:](v4, "initWithColor:resources:", v9, v6);
  mDefaultGridlineColorReference = self->mDefaultGridlineColorReference;
  self->mDefaultGridlineColorReference = v7;

}

- (id)headerFooter
{
  return self->mHeaderFooter;
}

- (void)removeDrawableAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->mDrawables, "removeObjectAtIndex:", a3);
}

- (id)drawables
{
  return self->mDrawables;
}

- (id)edTextBoxForShape:(id)a3
{
  -[OITSUNoCopyDictionary objectForKey:](self->mTextBoxMap, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setEDTextBox:(id)a3 forShape:(id)a4
{
  -[OITSUNoCopyDictionary setObject:forUncopiedKey:](self->mTextBoxMap, "setObject:forUncopiedKey:", a3, a4);
}

- (unint64_t)commentCount
{
  return -[OITSUNoCopyDictionary count](self->mCommentMap, "count");
}

- (id)edCommentForShape:(id)a3
{
  -[OITSUNoCopyDictionary objectForKey:](self->mCommentMap, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setEDComment:(id)a3 forShape:(id)a4
{
  -[OITSUNoCopyDictionary setObject:forUncopiedKey:](self->mCommentMap, "setObject:forUncopiedKey:", a3, a4);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDSheet;
  -[EDSheet description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDialogSheet
{
  return self->mIsDialogSheet;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWorkbook);
  objc_storeStrong((id *)&self->mEscherDrawing, 0);
  objc_storeStrong((id *)&self->mWarnings, 0);
  objc_storeStrong((id *)&self->mProcessors, 0);
  objc_storeStrong((id *)&self->mCommentMap, 0);
  objc_storeStrong((id *)&self->mTextBoxMap, 0);
  objc_storeStrong((id *)&self->mDrawables, 0);
  objc_storeStrong((id *)&self->mPageSetup, 0);
  objc_storeStrong((id *)&self->mHeaderFooter, 0);
  objc_storeStrong((id *)&self->mDefaultGridlineColorReference, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

- (id)escherDrawing
{
  return self->mEscherDrawing;
}

- (void)setEscherDrawing:(id)a3
{
  objc_storeStrong((id *)&self->mEscherDrawing, a3);
}

- (id)defaultGridlineColorReference
{
  return self->mDefaultGridlineColorReference;
}

- (id)drawableEnumerator
{
  return (id)-[NSMutableArray objectEnumerator](self->mDrawables, "objectEnumerator");
}

@end
