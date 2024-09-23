@implementation PXCollageLayoutPerformer

+ (CGSize)performLayoutWithLayoutInput:(id *)a3 layoutOutput:(id)a4 usingBlock:(id)a5
{
  __int128 v5;
  CGSize size;
  double v7;
  double v8;
  _OWORD v9[4];
  int64_t var3;
  objc_super v11;
  CGSize result;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PXCollageLayoutPerformer;
  v5 = *(_OWORD *)&a3->var2.var1;
  v9[2] = *(_OWORD *)&a3->var1;
  v9[3] = v5;
  var3 = a3->var2.var3;
  size = a3->var0.size;
  v9[0] = a3->var0.origin;
  v9[1] = size;
  objc_msgSendSuper2(&v11, sel_performLayoutWithLayoutInput_layoutOutput_usingBlock_, v9, a4, a5);
  result.height = v8;
  result.width = v7;
  return result;
}

- (PXCollageLayoutPerformer)init
{
  PXCollageLayoutPerformer *v2;
  PXLeafLayoutPerformer *v3;
  PXLeafLayoutPerformer *singleItemPerformer;
  PXSplitLayoutPerformer *v5;
  PXSplitLayoutPerformer *twoItemPerformer;
  PXLeafLayoutPerformer *v7;
  PXLeafLayoutPerformer *v8;
  void *v9;
  PXSplitLayoutPerformer *v10;
  PXSplitLayoutPerformer *threeItemNestedPerformer;
  PXLeafLayoutPerformer *v12;
  PXLeafLayoutPerformer *v13;
  void *v14;
  PXSplitLayoutPerformer *v15;
  PXSplitLayoutPerformer *threeItemPerformer;
  PXLeafLayoutPerformer *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *mutableChildren;
  objc_super v24;
  PXLeafLayoutPerformer *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PXCollageLayoutPerformer;
  v2 = -[PXCollageLayoutPerformer init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXLeafLayoutPerformer);
    singleItemPerformer = v2->_singleItemPerformer;
    v2->_singleItemPerformer = v3;

    v5 = objc_alloc_init(PXSplitLayoutPerformer);
    twoItemPerformer = v2->_twoItemPerformer;
    v2->_twoItemPerformer = v5;

    -[PXSplitLayoutPerformer setLayoutRatio:](v2->_twoItemPerformer, "setLayoutRatio:", 0.5);
    v7 = objc_alloc_init(PXLeafLayoutPerformer);
    v28[0] = v7;
    v8 = objc_alloc_init(PXLeafLayoutPerformer);
    v28[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSplitLayoutPerformer setChildren:](v2->_twoItemPerformer, "setChildren:", v9);

    v10 = objc_alloc_init(PXSplitLayoutPerformer);
    threeItemNestedPerformer = v2->_threeItemNestedPerformer;
    v2->_threeItemNestedPerformer = v10;

    -[PXSplitLayoutPerformer setLayoutRatio:](v2->_threeItemNestedPerformer, "setLayoutRatio:", 0.5);
    v12 = objc_alloc_init(PXLeafLayoutPerformer);
    v27[0] = v12;
    v13 = objc_alloc_init(PXLeafLayoutPerformer);
    v27[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSplitLayoutPerformer setChildren:](v2->_threeItemNestedPerformer, "setChildren:", v14);

    v15 = objc_alloc_init(PXSplitLayoutPerformer);
    threeItemPerformer = v2->_threeItemPerformer;
    v2->_threeItemPerformer = v15;

    v17 = objc_alloc_init(PXLeafLayoutPerformer);
    v26[0] = v17;
    v26[1] = v2->_threeItemNestedPerformer;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSplitLayoutPerformer setChildren:](v2->_threeItemPerformer, "setChildren:", v18);

    v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v25 = v2->_singleItemPerformer;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithArray:", v20);
    mutableChildren = v2->_mutableChildren;
    v2->_mutableChildren = (NSMutableArray *)v21;

  }
  return v2;
}

- (NSArray)children
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = -[PXCollageLayoutPerformer numberOfVisibleItems](self, "numberOfVisibleItems");
  -[PXCollageLayoutPerformer mutableChildren](self, "mutableChildren");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 2)
  {
    -[PXCollageLayoutPerformer twoItemPerformer](self, "twoItemPerformer");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 == 3)
      -[PXCollageLayoutPerformer threeItemPerformer](self, "threeItemPerformer");
    else
      -[PXCollageLayoutPerformer singleItemPerformer](self, "singleItemPerformer");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v5, 0);

  return (NSArray *)v4;
}

- (void)setInterItemSpacing:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_interItemSpacing = a3;
    -[PXCollageLayoutPerformer twoItemPerformer](self, "twoItemPerformer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInterItemSpacing:", a3);

    -[PXCollageLayoutPerformer threeItemPerformer](self, "threeItemPerformer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInterItemSpacing:", a3);

    -[PXCollageLayoutPerformer threeItemNestedPerformer](self, "threeItemNestedPerformer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInterItemSpacing:", a3);

  }
}

- (void)setOuterLayoutRatio:(double)a3
{
  id v5;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_outerLayoutRatio = a3;
    -[PXCollageLayoutPerformer threeItemPerformer](self, "threeItemPerformer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutRatio:", a3);

  }
}

- (void)setPortraitBias:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  self->_portraitBias = a3;
  -[PXCollageLayoutPerformer threeItemPerformer](self, "threeItemPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = !v3;
  if (v3)
    v8 = 2;
  else
    v8 = 1;
  if (v7)
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v5, "setLayoutAxis:", v8);

  -[PXCollageLayoutPerformer threeItemNestedPerformer](self, "threeItemNestedPerformer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLayoutAxis:", v9);

  -[PXCollageLayoutPerformer twoItemPerformer](self, "twoItemPerformer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutAxis:", v8);

}

- (CGSize)performLayout
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int128 v6;
  double v7;
  double v8;
  __int128 v9[4];
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  CGSize result;

  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput");
  -[PXBaseLayoutPerformer layoutOutput](self, "layoutOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCollageLayoutPerformer children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v13;
  v9[3] = v14;
  v10 = v15;
  v9[0] = v11;
  v9[1] = v12;
  PXPerformChildLayout(v5, v9, v3, *(double *)&v11, *((double *)&v11 + 1), *(double *)&v12, *((double *)&v12 + 1));

  v6 = v12;
  *(_QWORD *)&v8 = v6 >> 64;
  *(_QWORD *)&v7 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)prepareForReuse
{
  -[PXCollageLayoutPerformer setOuterLayoutRatio:](self, "setOuterLayoutRatio:", 0.0);
  -[PXCollageLayoutPerformer setInterItemSpacing:](self, "setInterItemSpacing:", 0.0);
  -[PXCollageLayoutPerformer setPortraitBias:](self, "setPortraitBias:", 0);
  -[PXCollageLayoutPerformer setNumberOfVisibleItems:](self, "setNumberOfVisibleItems:", 0);
}

- (double)outerLayoutRatio
{
  return self->_outerLayoutRatio;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (BOOL)portraitBias
{
  return self->_portraitBias;
}

- (int64_t)numberOfVisibleItems
{
  return self->_numberOfVisibleItems;
}

- (void)setNumberOfVisibleItems:(int64_t)a3
{
  self->_numberOfVisibleItems = a3;
}

- (PXLeafLayoutPerformer)singleItemPerformer
{
  return self->_singleItemPerformer;
}

- (void)setSingleItemPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_singleItemPerformer, a3);
}

- (PXSplitLayoutPerformer)twoItemPerformer
{
  return self->_twoItemPerformer;
}

- (void)setTwoItemPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_twoItemPerformer, a3);
}

- (PXSplitLayoutPerformer)threeItemPerformer
{
  return self->_threeItemPerformer;
}

- (void)setThreeItemPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_threeItemPerformer, a3);
}

- (PXSplitLayoutPerformer)threeItemNestedPerformer
{
  return self->_threeItemNestedPerformer;
}

- (void)setThreeItemNestedPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_threeItemNestedPerformer, a3);
}

- (NSMutableArray)mutableChildren
{
  return self->_mutableChildren;
}

- (void)setMutableChildren:(id)a3
{
  objc_storeStrong((id *)&self->_mutableChildren, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableChildren, 0);
  objc_storeStrong((id *)&self->_threeItemNestedPerformer, 0);
  objc_storeStrong((id *)&self->_threeItemPerformer, 0);
  objc_storeStrong((id *)&self->_twoItemPerformer, 0);
  objc_storeStrong((id *)&self->_singleItemPerformer, 0);
}

@end
