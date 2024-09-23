@implementation PXNewMagazineLayoutCoordinator

- (PXNewMagazineLayoutCoordinator)initWithPaddingInputs:(id)a3 tileGrid:(id)a4 tileAspectRatio:(double)a5 stopIfAnyGoodLayout:(BOOL)a6
{
  id v11;
  id v12;
  PXNewMagazineLayoutCoordinator *v13;
  PXNewMagazineLayoutCoordinator *v14;
  uint64_t v15;
  NSMutableArray *qualifiedLayouts;
  PXNewMagazineRectArray *v17;
  PXNewMagazineRectArray *currentLayout;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXNewMagazineLayoutCoordinator;
  v13 = -[PXNewMagazineLayoutCoordinator init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_paddingInputs, a3);
    v14->_tileAspectRatio = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    qualifiedLayouts = v14->_qualifiedLayouts;
    v14->_qualifiedLayouts = (NSMutableArray *)v15;

    v17 = -[PXNewMagazineRectArray initWithSize:tileGrid:]([PXNewMagazineRectArray alloc], "initWithSize:tileGrid:", objc_msgSend(v11, "count"), v12);
    currentLayout = v14->_currentLayout;
    v14->_currentLayout = v17;

    v14->_stopIfAnyGoodLayout = a6;
    v14->_currentBestScore = 10000.0;
  }

  return v14;
}

- (BOOL)validateCurrentLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  PXNewMagazineRectArray *fallbackLayout;
  void *v9;
  PXNewMagazineRectArray *v10;
  PXNewMagazineRectArray *v11;

  -[PXNewMagazineLayoutCoordinator qualifiedLayouts](self, "qualifiedLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNewMagazineLayoutCoordinator currentLayout](self, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNewMagazineLayoutCoordinator scoreOfLayout:](self, "scoreOfLayout:", v4);
  v6 = v5;
  v7 = v5 < 0.12;
  if (v5 < 0.12)
  {
    fallbackLayout = self->_fallbackLayout;
    self->_fallbackLayout = 0;

    objc_msgSend(v4, "immutableCopyForCurrentRectsCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScore:", v6);
    objc_msgSend(v3, "addObject:", v9);
    if (objc_msgSend(v3, "count"))
      -[PXNewMagazineLayoutCoordinator setStop:](self, "setStop:", 1);
  }
  else
  {
    v9 = 0;
  }
  if (!objc_msgSend(v3, "count") && v6 < self->_currentBestScore)
  {
    self->_currentBestScore = v6;
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v4, "immutableCopyForCurrentRectsCount");
      v10 = (PXNewMagazineRectArray *)objc_claimAutoreleasedReturnValue();
    }
    v11 = self->_fallbackLayout;
    self->_fallbackLayout = v10;

    v7 = 1;
  }
  if (-[PXNewMagazineLayoutCoordinator stopIfAnyGoodLayout](self, "stopIfAnyGoodLayout"))
    -[PXNewMagazineLayoutCoordinator setStop:](self, "setStop:", 1);

  return v7;
}

- (void)validateCurrentLayoutAsFallback
{
  PXNewMagazineRectArray *v3;
  PXNewMagazineRectArray *fallbackLayout;
  id v5;

  -[PXNewMagazineLayoutCoordinator currentLayout](self, "currentLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "immutableCopyForCurrentRectsCount");
  v3 = (PXNewMagazineRectArray *)objc_claimAutoreleasedReturnValue();
  fallbackLayout = self->_fallbackLayout;
  self->_fallbackLayout = v3;

}

- (double)scoreOfLayout:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  void *v22;
  __int128 v23;
  __int128 v24;

  v5 = a3;
  -[PXNewMagazineLayoutCoordinator paddingInputs](self, "paddingInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewMagazineLayoutCoordinator.m"), 80, CFSTR("Output frames and inputs should be the same"));

  }
  -[PXNewMagazineLayoutCoordinator tileAspectRatio](self, "tileAspectRatio");
  v9 = v8;
  if (objc_msgSend(v5, "count"))
  {
    v10 = 0;
    v11 = 0.0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");

      v24 = 0u;
      if (v5)
        objc_msgSend(v5, "rectAtIndex:", v10, (unsigned __int128)0);
      v13 = v9 * ((double)0 / (double)0);
      PXSizeGetAspectRatio();
      if (v14 >= v13)
      {
        v15 = v14 - v13;
      }
      else
      {
        v14 = 1.0 / v14;
        v15 = v14 - 1.0 / v13;
      }
      v16 = v15 / v14;
      v17 = v11 + v16;
      if (0 == __PAIR128__(1, 1))
      {
        v11 = v17 + 0.5;
      }
      else
      {
        v18 = v16 <= 0.25;
        v19 = v16 + v17;
        if (v18)
          v11 = v17;
        else
          v11 = v19;
      }
      ++v10;
    }
    while (v10 < objc_msgSend(v5, "count", v24));
  }
  else
  {
    v11 = 0.0;
  }
  v20 = v11 / (double)(unint64_t)objc_msgSend(v5, "count");

  return v20;
}

- (unint64_t)currentLayoutsCount
{
  void *v3;
  unint64_t v4;

  -[PXNewMagazineLayoutCoordinator qualifiedLayouts](self, "qualifiedLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return self->_fallbackLayout != 0;
  return v4;
}

- (PXNewMagazineRectArray)currentBestLayout
{
  void *v3;
  PXNewMagazineRectArray *v4;
  PXNewMagazineRectArray *v5;

  -[PXNewMagazineLayoutCoordinator qualifiedLayouts](self, "qualifiedLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_33131);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (PXNewMagazineRectArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_fallbackLayout;
  }
  v5 = v4;

  return v5;
}

- (NSArray)paddingInputs
{
  return self->_paddingInputs;
}

- (double)tileAspectRatio
{
  return self->_tileAspectRatio;
}

- (BOOL)stopIfAnyGoodLayout
{
  return self->_stopIfAnyGoodLayout;
}

- (NSMutableArray)qualifiedLayouts
{
  return self->_qualifiedLayouts;
}

- (void)setQualifiedLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedLayouts, a3);
}

- (PXNewMagazineRectArray)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout, a3);
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (BOOL)stop
{
  return self->_stop;
}

- (void)setStop:(BOOL)a3
{
  self->_stop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_qualifiedLayouts, 0);
  objc_storeStrong((id *)&self->_paddingInputs, 0);
  objc_storeStrong((id *)&self->_fallbackLayout, 0);
}

uint64_t __51__PXNewMagazineLayoutCoordinator_currentBestLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "score");
  v6 = v5;
  objc_msgSend(v4, "score");
  v8 = v7;

  if (v6 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 > v8)
    return 1;
  else
    return v9;
}

@end
