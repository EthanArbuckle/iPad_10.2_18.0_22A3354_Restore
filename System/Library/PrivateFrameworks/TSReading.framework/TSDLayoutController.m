@implementation TSDLayoutController

- (TSDLayoutController)initWithCanvas:(id)a3
{
  id v5;
  TSDLayoutController *v6;
  TSDLayoutController *v7;
  TSDRootLayout *v8;
  TSDRootLayout *mRootLayout;
  NSMutableSet *v10;
  NSMutableSet *mInvalidLayouts;
  NSMutableSet *v12;
  NSMutableSet *mInvalidChildrenLayouts;
  NSMutableSet *v14;
  NSMutableSet *mLayoutsNeedingRecreating;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TSDLayoutController;
  v6 = -[TSDLayoutController init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mCanvas, a3);
    v8 = -[TSDRootLayout initWithLayoutController:]([TSDRootLayout alloc], "initWithLayoutController:", v7);
    mRootLayout = v7->mRootLayout;
    v7->mRootLayout = v8;

    v7->mLayoutsByInfo = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mInvalidLayouts = v7->mInvalidLayouts;
    v7->mInvalidLayouts = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mInvalidChildrenLayouts = v7->mInvalidChildrenLayouts;
    v7->mInvalidChildrenLayouts = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mLayoutsNeedingRecreating = v7->mLayoutsNeedingRecreating;
    v7->mLayoutsNeedingRecreating = v14;

    if (objc_msgSend(v5, "isCanvasInteractive"))
    {
      v16 = (void *)TSDLayoutControllerAllInteractiveControllers;
      if (!TSDLayoutControllerAllInteractiveControllers)
      {
        v17 = objc_alloc_init(MEMORY[0x24BEB3CA8]);
        v18 = (void *)TSDLayoutControllerAllInteractiveControllers;
        TSDLayoutControllerAllInteractiveControllers = (uint64_t)v17;

        v16 = (void *)TSDLayoutControllerAllInteractiveControllers;
      }
      objc_msgSend(v16, "addObject:", v7);
    }
  }

  return v7;
}

- (void)dealloc
{
  TSDCanvas *mCanvas;
  TSDRootLayout *mRootLayout;
  NSMutableSet *mInvalidLayouts;
  NSMutableSet *mInvalidChildrenLayouts;
  NSMutableSet *mLayoutsNeedingRecreating;
  __CFDictionary *mLayoutsByInfo;
  objc_super v9;

  mCanvas = self->mCanvas;
  self->mCanvas = 0;

  objc_msgSend((id)TSDLayoutControllerAllInteractiveControllers, "removeObject:", self);
  -[TSDAbstractLayout setChildren:](self->mRootLayout, "setChildren:", 0);
  mRootLayout = self->mRootLayout;
  self->mRootLayout = 0;

  mInvalidLayouts = self->mInvalidLayouts;
  self->mInvalidLayouts = 0;

  mInvalidChildrenLayouts = self->mInvalidChildrenLayouts;
  self->mInvalidChildrenLayouts = 0;

  mLayoutsNeedingRecreating = self->mLayoutsNeedingRecreating;
  self->mLayoutsNeedingRecreating = 0;

  mLayoutsByInfo = self->mLayoutsByInfo;
  if (mLayoutsByInfo)
  {
    CFRelease(mLayoutsByInfo);
    self->mLayoutsByInfo = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDLayoutController;
  -[TSDLayoutController dealloc](&v9, sel_dealloc);
}

+ (id)allInteractiveLayoutControllers
{
  return (id)TSDLayoutControllerAllInteractiveControllers;
}

- (id)canvas
{
  return self->mCanvas;
}

- (id)rootLayout
{
  return self->mRootLayout;
}

+ (void)temporaryLayoutControllerForInfos:(id)a3 useInBlock:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  v10 = -[TSDCanvas initForTemporaryLayout]([TSDCanvas alloc], "initForTemporaryLayout");
  objc_msgSend(v10, "layoutController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInfos:", v6);

  objc_msgSend(v10, "layoutController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validateLayouts");

  objc_msgSend(v10, "layoutController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9);

  objc_msgSend(v10, "teardown");
}

- (void)setInfos:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x219A15874](v7);
        -[TSDLayoutController layoutsForInfo:](self, "layoutsForInfo:", v11, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "allObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v15);
        }
        else
        {
          v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "layoutClass")), "initWithInfo:", v11);
          objc_msgSend(v5, "addObject:", v15);
        }

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v7;
    }
    while (v7);
  }

  -[TSDAbstractLayout children](self->mRootLayout, "children");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v5);

  if ((v17 & 1) == 0)
  {
    -[TSDAbstractLayout setChildren:](self->mRootLayout, "setChildren:", v5);
    -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  }
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_updateChildrenFromInfo, (_QWORD)v18);

}

- (void)invalidateLayout:(id)a3
{
  if (self->mValidatingLayout != a3)
  {
    -[NSMutableSet addObject:](self->mInvalidLayouts, "addObject:");
    -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  }
}

- (void)invalidateChildrenOfLayout:(id)a3
{
  -[NSMutableSet addObject:](self->mInvalidChildrenLayouts, "addObject:", a3);
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
}

- (void)invalidateLayoutForRecreation:(id)a3
{
  -[NSMutableSet addObject:](self->mLayoutsNeedingRecreating, "addObject:", a3);
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
}

- (id)layoutForInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TSDLayoutController layoutsForInfo:](self, "layoutsForInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "orderedBefore:", v8))
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)layoutsForInfo:(id)a3
{
  const __CFDictionary *mLayoutsByInfo;

  mLayoutsByInfo = self->mLayoutsByInfo;
  if (mLayoutsByInfo)
    mLayoutsByInfo = (const __CFDictionary *)CFDictionaryGetValue(mLayoutsByInfo, a3);
  return mLayoutsByInfo;
}

- (id)layoutsForInfos:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        -[TSDLayoutController layoutForInfo:](self, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        TSUDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "partitioner");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "i_layout");
          v14 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v14;
        }
        if (v10)
          objc_msgSend(v16, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v16;
}

- (id)layoutForInfo:(id)a3 childOfLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[TSDLayoutController layoutsForInfo:](self, "layoutsForInfo:", a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "parent", (_QWORD)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)layoutsInRect:(CGRect)a3
{
  return -[TSDRootLayout childLayoutsInRect:](self->mRootLayout, "childLayoutsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)rectOfTopLevelLayouts
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect result;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDBF090];
  v2 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TSDAbstractLayout children](self->mRootLayout, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "frameForCulling");
        v3 = TSDUnionRect(v3, v2, v5, v4, v11, v12, v13, v14);
        v2 = v15;
        v5 = v16;
        v4 = v17;
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  v18 = v3;
  v19 = v2;
  v20 = v5;
  v21 = v4;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)validateLayouts
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableSet *v24;
  NSMutableSet *v25;
  NSMutableSet *mInvalidLayouts;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = self->mLayoutsNeedingRecreating;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x219A15874]();
        objc_msgSend(v8, "info");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc((Class)objc_msgSend(v10, "layoutClass"));
        objc_msgSend(v8, "info");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithInfo:", v12);

        -[NSMutableSet removeObject:](self->mInvalidLayouts, "removeObject:", v8);
        -[NSMutableSet addObject:](self->mInvalidLayouts, "addObject:", v13);
        objc_msgSend(v8, "parent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "replaceChild:with:", v8, v13);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->mLayoutsNeedingRecreating, "removeAllObjects");
  if (-[NSMutableSet count](self->mInvalidChildrenLayouts, "count"))
  {
    v15 = (void *)-[NSMutableSet copy](self->mInvalidChildrenLayouts, "copy");
    -[NSMutableSet removeAllObjects](self->mInvalidChildrenLayouts, "removeAllObjects");
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v20++), "updateChildrenFromInfo");
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v18);
    }

    if (-[NSMutableSet intersectsSet:](self->mInvalidChildrenLayouts, "intersectsSet:", v16))
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayoutController validateLayouts]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutController.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 259, CFSTR("one of these layouts had invalidateChildren while updating: %@"), self->mInvalidChildrenLayouts);

    }
  }
  while (-[NSMutableSet count](self->mInvalidLayouts, "count"))
  {
    v24 = self->mInvalidLayouts;
    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mInvalidLayouts = self->mInvalidLayouts;
    self->mInvalidLayouts = v25;

    -[TSDLayoutController validateLayouts:](self, "validateLayouts:", v24);
    if (-[NSMutableSet intersectsSet:](self->mInvalidLayouts, "intersectsSet:", v24))
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayoutController validateLayouts]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutController.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 271, CFSTR("one of these layouts was invalidated while validating: %@"), self->mInvalidLayouts);

    }
  }
}

- (id)sortLayoutsForDependencies:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ii;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v56;
  id obj;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v56 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3CE0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v59 = v3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3CE0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v85 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forUncopiedKey:", v13, v12);

        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forUncopiedKey:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    }
    while (v9);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v7;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (v60)
  {
    v58 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v81 != v58)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
        v17 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v16, "dependentLayouts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWithArray:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v16, "reliedOnLayouts");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setWithSet:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "intersectSet:", v59);
        objc_msgSend(v19, "intersectSet:", v59);
        objc_msgSend(v6, "objectForKey:", v16);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "unionSet:", v19);
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v77 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v16);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
          }
          while (v25);
        }

        objc_msgSend(v5, "objectForKey:", v16);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "unionSet:", v23);
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v29 = v19;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v73;
          do
          {
            for (m = 0; m != v31; ++m)
            {
              if (*(_QWORD *)v73 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * m));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v16);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
          }
          while (v31);
        }

      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v60);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v36 = obj;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v69;
    do
    {
      for (n = 0; n != v38; ++n)
      {
        if (*(_QWORD *)v69 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * n);
        objc_msgSend(v5, "objectForKey:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v42, "count"))
          objc_msgSend(v35, "addObject:", v41);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
    }
    while (v38);
  }

  if (objc_msgSend(v36, "count"))
  {
    v63 = v36;
    while (objc_msgSend(v35, "count"))
    {
      objc_msgSend(v35, "anyObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeObject:", v43);
      objc_msgSend(v36, "removeObject:", v43);
      objc_msgSend(v56, "addObject:", v43);
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v6, "objectForKey:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v65;
        do
        {
          for (ii = 0; ii != v46; ++ii)
          {
            if (*(_QWORD *)v65 != v47)
              objc_enumerationMutation(v44);
            v49 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * ii);
            objc_msgSend(v5, "objectForKey:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v50, "count") == 1)
              objc_msgSend(v35, "addObject:", v49);
            else
              objc_msgSend(v50, "removeObject:", v43);

          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
        }
        while (v46);
      }

      v36 = v63;
      if (!objc_msgSend(v63, "count"))
        goto LABEL_54;
    }
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayoutController sortLayoutsForDependencies:]");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutController.m");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, v53, 334, CFSTR("Layout dependency loop"));

    objc_msgSend(v36, "allObjects");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addObjectsFromArray:", v54);

  }
LABEL_54:

  return v56;
}

- (void)validateOrderedLayouts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  TSDLayout *mValidatingLayout;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "shouldValidate"))
        {
          objc_storeStrong((id *)&self->mValidatingLayout, v9);
          objc_msgSend(v9, "validate");
          mValidatingLayout = self->mValidatingLayout;
          self->mValidatingLayout = 0;

          -[NSMutableSet removeObject:](self->mInvalidLayouts, "removeObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)validateLayouts:(id)a3
{
  id v4;

  -[TSDLayoutController sortLayoutsForDependencies:](self, "sortLayoutsForDependencies:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TSDLayoutController validateOrderedLayouts:](self, "validateOrderedLayouts:", v4);

}

- (void)validateLayoutsWithDependencies:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *context;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        context = (void *)MEMORY[0x219A15874]();
        v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        do
        {
          objc_msgSend(v7, "removeAllObjects");
          objc_msgSend(v6, "i_accumulateLayoutsIntoSet:", v7);
          if (!-[NSMutableSet count](self->mInvalidChildrenLayouts, "count"))
            break;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (!v9)
          {

            break;
          }
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              if (-[NSMutableSet containsObject:](self->mInvalidChildrenLayouts, "containsObject:", v14))
              {
                objc_msgSend(v14, "updateChildrenFromInfo");
                -[NSMutableSet removeObject:](self->mInvalidChildrenLayouts, "removeObject:", v14);
                v11 = 1;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v10);

        }
        while ((v11 & 1) != 0);
        objc_msgSend(v22, "unionSet:", v7);

        objc_autoreleasePoolPop(context);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  -[TSDLayoutController validateLayouts:](self, "validateLayouts:", v22);
  -[TSDCanvas delegate](self->mCanvas, "delegate");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[TSDCanvas delegate](self->mCanvas, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[TSDCanvas delegate](self->mCanvas, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "canvasDidValidateLayoutsWithDependencies:", self->mCanvas);

    }
  }

}

- (void)validateLayoutWithDependencies:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TSDLayoutController validateLayoutsWithDependencies:](self, "validateLayoutsWithDependencies:", v4);

}

- (id)validatedLayoutForInfo:(id)a3
{
  void *v3;
  void *v4;

  -[TSDLayoutController validatedLayoutsForInfo:](self, "validatedLayoutsForInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)validatedLayoutsForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TSDLayoutController layoutsForInfo:](self, "layoutsForInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSDAbstractLayout addChild:](self->mRootLayout, "addChild:", v6);
      -[NSMutableSet addObject:](self->mInvalidChildrenLayouts, "addObject:", v6);
      -[NSMutableSet addObject:](self->mInvalidLayouts, "addObject:", v6);
    }
    else
    {
      v5 = 0;
    }

  }
  if (-[NSMutableSet intersectsSet:](self->mInvalidChildrenLayouts, "intersectsSet:", v5))
  {
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_updateChildrenFromInfo);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          -[NSMutableSet removeObject:](self->mInvalidChildrenLayouts, "removeObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

  }
  if (-[NSMutableSet intersectsSet:](self->mInvalidLayouts, "intersectsSet:", v5))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          -[TSDLayoutController validateLayoutWithDependencies:](self, "validateLayoutWithDependencies:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

  }
  return v5;
}

- (id)validatedLayoutForInfo:(id)a3 childOfLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[TSDLayoutController validatedLayoutsForInfo:](self, "validatedLayoutsForInfo:", a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "parent", (_QWORD)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)i_registerLayout:(id)a3
{
  void *v4;
  __CFSet *v5;
  CFMutableSetRef Mutable;
  void *v7;
  id value;

  value = a3;
  objc_msgSend(value, "willBeAddedToLayoutController:", self);
  if (value && self->mLayoutsByInfo)
  {
    objc_msgSend(value, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__CFSet *)CFDictionaryGetValue(self->mLayoutsByInfo, v4);
      if (v5)
      {
        Mutable = v5;
        CFRetain(v5);
      }
      else
      {
        Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
        CFDictionarySetValue(self->mLayoutsByInfo, v4, Mutable);
      }
      CFSetAddValue(Mutable, value);
      CFRelease(Mutable);
    }
    -[TSDCanvas canvasController](self->mCanvas, "canvasController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "i_layoutRegistered:", value);

  }
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  objc_msgSend(value, "wasAddedToLayoutController:", self);

}

- (void)i_unregisterLayout:(id)a3
{
  void *v4;
  __CFSet *v5;
  const __CFSet *v6;
  void *v7;
  id value;

  value = a3;
  objc_msgSend(value, "willBeRemovedFromLayoutController:", self);
  if (value && self->mLayoutsByInfo)
  {
    objc_msgSend(value, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__CFSet *)CFDictionaryGetValue(self->mLayoutsByInfo, v4);
      if (v5)
      {
        v6 = v5;
        CFSetRemoveValue(v5, value);
        if (!CFSetGetCount(v6))
          CFDictionaryRemoveValue(self->mLayoutsByInfo, v4);
      }
    }
    -[TSDCanvas canvasController](self->mCanvas, "canvasController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "i_layoutUnregistered:", value);

  }
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  -[NSMutableSet removeObject:](self->mInvalidLayouts, "removeObject:", value);
  -[NSMutableSet removeObject:](self->mInvalidChildrenLayouts, "removeObject:", value);
  objc_msgSend(value, "wasRemovedFromLayoutController:", self);

}

- (void)i_removeAllLayouts
{
  TSDRootLayout *mRootLayout;
  void *v4;

  mRootLayout = self->mRootLayout;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDAbstractLayout setChildren:](mRootLayout, "setChildren:", v4);

  CFDictionaryRemoveAllValues(self->mLayoutsByInfo);
  -[NSMutableSet removeAllObjects](self->mInvalidLayouts, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->mInvalidChildrenLayouts, "removeAllObjects");
}

- (id)layoutGeometryProviderForLayout:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "parent");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      TSUProtocolCast();
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
        break;
      objc_msgSend(v6, "parent");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
      if (!v8)
        goto LABEL_5;
    }
    v10 = (void *)v7;
  }
  else
  {
LABEL_5:
    -[TSDLayoutController canvas](self, "canvas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutGeometryProviderForLayout:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
  }

  return v10;
}

- (id)ancestorLayoutOfLayout:(id)a3 orDelegateConformingToProtocol:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "parent");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      while (1)
      {
        objc_msgSend(v9, "delegateConformingToProtocol:forLayout:", v7, v6);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v12 = (void *)v10;
          v11 = v9;
          goto LABEL_16;
        }
        if (objc_msgSend(v9, "conformsToProtocol:", v7))
          break;
        objc_msgSend(v9, "parent");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v9 = v11;
        if (!v11)
          goto LABEL_10;
      }
      v11 = v9;
      v12 = v11;
    }
    else
    {
      v11 = 0;
LABEL_10:
      -[TSDLayoutController canvas](self, "canvas");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "canvasController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v15, "interactiveCanvasController:delegateConformingToProtocol:forLayout:", v14, v7, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
LABEL_16:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)preregisterLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TSDLayoutController i_registerLayout:](self, "i_registerLayout:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TSDLayoutController preregisterLayout:](self, "preregisterLayout:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)unregisterLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TSDLayoutController i_unregisterLayout:](self, "i_unregisterLayout:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TSDLayoutController unregisterLayout:](self, "unregisterLayout:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mValidatingLayout, 0);
  objc_storeStrong((id *)&self->mInvalidChildrenLayouts, 0);
  objc_storeStrong((id *)&self->mLayoutsNeedingRecreating, 0);
  objc_storeStrong((id *)&self->mInvalidLayouts, 0);
  objc_storeStrong((id *)&self->mRootLayout, 0);
  objc_storeStrong((id *)&self->mCanvas, 0);
}

- (BOOL)isLayoutOffscreen
{
  return 0;
}

@end
