@implementation TSDCanvasSubviewsController

- (TSDCanvasSubviewsController)initWithLayerAndSubviewHost:(id)a3
{
  TSDCanvasSubviewsController *v4;
  TSDCanvasSubviewsController *v5;
  objc_super v7;
  pthread_mutexattr_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)TSDCanvasSubviewsController;
  v4 = -[TSDCanvasSubviewsController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_host = (TSDLayerAndSubviewHosting *)a3;
    v4->_subviewLayers = (NSMutableArray *)objc_opt_new();
    v8.__sig = 0;
    *(_QWORD *)v8.__opaque = 0;
    pthread_mutexattr_init(&v8);
    pthread_mutexattr_settype(&v8, 2);
    pthread_mutex_init(&v5->_mutex, &v8);
    pthread_mutexattr_destroy(&v8);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (!self->_hasBeenTornDown)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasSubviewsController dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 80, CFSTR("Canvas Subviews Controller should have been torn down before dealloc"));
  }

  self->_repChildViews = 0;
  self->_repsByChildView = 0;

  self->_alternateLayersForViews = 0;
  self->_repViewControllersByChildView = 0;

  self->_subviewLayers = 0;
  pthread_mutex_destroy(&self->_mutex);
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasSubviewsController;
  -[TSDCanvasSubviewsController dealloc](&v5, sel_dealloc);
}

- (void)teardown
{
  self->_hasBeenTornDown = 1;
  -[TSDCanvasSubviewsController updateViewsFromReps](self, "updateViewsFromReps");
}

- (id)p_topLevelReps
{
  if (self->_hasBeenTornDown)
    return 0;
  else
    return (id)-[TSDLayerAndSubviewHosting topLevelReps](self->_host, "topLevelReps");
}

- (void)setNeedsLayout
{
  self->_needsLayout = 1;
}

- (void)p_recursivelyFindAlternateLayersForRep:(id)a3 accumulatingLayers:(id)a4 repsByChildLayer:(id)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v20 = &unk_254F75040;
  v8 = TSUClassAndProtocolCast();
  if (v8)
  {
    v9 = (void *)v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v9, "addAlternateLayersForChildViewsToArray:", v10, &unk_254F75040);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(a5, "setObject:forUncopiedKey:", v9, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v12);
      }
      objc_msgSend(a4, "addObjectsFromArray:", v10);

    }
    if (!TSUProtocolCast())
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v15 = (void *)objc_msgSend(v9, "childReps");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            -[TSDCanvasSubviewsController p_recursivelyFindAlternateLayersForRep:accumulatingLayers:repsByChildLayer:](self, "p_recursivelyFindAlternateLayersForRep:accumulatingLayers:repsByChildLayer:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), a4, a5, v20);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v17);
      }
    }
  }
}

- (id)updateAlternateLayersForViews
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  double v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = objc_alloc_init(MEMORY[0x24BEB3D00]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = -[TSDCanvasSubviewsController p_topLevelReps](self, "p_topLevelReps");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        -[TSDCanvasSubviewsController p_recursivelyFindAlternateLayersForRep:accumulatingLayers:repsByChildLayer:](self, "p_recursivelyFindAlternateLayersForRep:accumulatingLayers:repsByChildLayer:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v3, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v3);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        v15 = (void *)objc_msgSend(v4, "objectForKey:", v14);
        v16 = objc_opt_respondsToSelector();
        v17 = 1.0;
        if ((v16 & 1) != 0)
        {
          v18 = objc_msgSend(v15, "positionForChildViewAlternateLayer:", v14, 1.0);
          v17 = 2.0;
          switch(v18)
          {
            case 0:
              goto LABEL_18;
            case 1:
              v17 = 0.0;
              goto LABEL_18;
            case 2:
              v17 = 1.0;
              goto LABEL_18;
            case 3:
              v17 = -1.0;
              goto LABEL_18;
            default:
              continue;
          }
        }
        else
        {
LABEL_18:
          objc_msgSend(v14, "setZPosition:", v17);
        }
      }
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16, v17);
    }
    while (v11);
  }
  -[TSDCanvasSubviewsController p_sortLayers:](self, "p_sortLayers:", v3);

  self->_alternateLayersForViews = (NSArray *)v3;
  return v3;
}

- (void)p_recursivelyFindChildViewsForRep:(id)a3 accumulatingViews:(id)a4 accumulatingRepsByChildView:(id)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v23 = &unk_254F75040;
  v8 = TSUClassAndProtocolCast();
  if (v8)
  {
    v9 = (void *)v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v9, "addChildViewsToArray:", v10, &unk_254F75040);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(a5, "setObject:forUncopiedKey:", v9, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v12);
      }
      objc_msgSend(a4, "addObjectsFromArray:", v10);

    }
    v15 = (void *)TSUProtocolCast();
    if (v15)
    {
      v16 = (id)objc_msgSend(v15, "layerAndSubviewHost");
      v17 = (id)objc_msgSend(v16, "subviewsController");
      objc_msgSend((id)objc_msgSend(v16, "subviewsController"), "updateViewsFromReps");

    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v18 = (void *)objc_msgSend(v9, "childReps");
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v18);
            -[TSDCanvasSubviewsController p_recursivelyFindChildViewsForRep:accumulatingViews:accumulatingRepsByChildView:](self, "p_recursivelyFindChildViewsForRep:accumulatingViews:accumulatingRepsByChildView:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), a4, a5, v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v20);
      }
    }
  }
}

- (void)p_recursivelyFindHostingRepsForRep:(id)a3 accumulatingHostingReps:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v7 = TSUClassAndProtocolCast();
  if (v7)
  {
    v8 = (void *)v7;
    if ((objc_msgSend(a3, "hasBeenRemoved", &unk_254F75040) & 1) == 0)
    {
      v9 = TSUProtocolCast();
      if (v9)
      {
        objc_msgSend(a4, "addObject:", v9);
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v10 = (void *)objc_msgSend(v8, "childReps");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              -[TSDCanvasSubviewsController p_recursivelyFindHostingRepsForRep:accumulatingHostingReps:](self, "p_recursivelyFindHostingRepsForRep:accumulatingHostingReps:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), a4);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v12);
        }
      }
    }
  }
}

- (void)p_sortLayers:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_40);
}

uint64_t __44__TSDCanvasSubviewsController_p_sortLayers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a2, "zPosition");
  v6 = v5;
  objc_msgSend(a3, "zPosition");
  if (v6 > v7)
    return 1;
  objc_msgSend(a2, "zPosition");
  v10 = v9;
  objc_msgSend(a3, "zPosition");
  if (v10 >= v11)
    return 0;
  else
    return -1;
}

- (void)p_sortSubviews:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_99);
}

uint64_t __46__TSDCanvasSubviewsController_p_sortSubviews___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  objc_msgSend((id)objc_msgSend(a2, "layer"), "zPosition");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "zPosition");
  if (v6 > v7)
    return 1;
  objc_msgSend((id)objc_msgSend(a2, "layer"), "zPosition");
  v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "zPosition");
  if (v10 >= v11)
    return 0;
  else
    return -1;
}

- (void)updateViewsFromReps
{
  id v3;
  NSDictionary *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSSet *v10;
  _BOOL4 v11;
  _BOOL4 needsLayout;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  char v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v28;
  TSURetainedPointerKeyDictionary *repViewControllersByChildView;
  NSSet *repChildViews;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  uint64_t v42;
  id v43;
  id obj;
  id obja;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  NSSet *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BEB3D00]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v5 = -[TSDCanvasSubviewsController p_topLevelReps](self, "p_topLevelReps");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v68 != v8)
          objc_enumerationMutation(v5);
        -[TSDCanvasSubviewsController p_recursivelyFindChildViewsForRep:accumulatingViews:accumulatingRepsByChildView:](self, "p_recursivelyFindChildViewsForRep:accumulatingViews:accumulatingRepsByChildView:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i), v3, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    }
    while (v7);
  }
  if (!-[NSDictionary count](v4, "count"))
  {

    v4 = 0;
  }
  if (objc_msgSend(v3, "count"))
    v10 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3D08]), "initWithArray:", v3);
  else
    v10 = 0;
  v49 = (void *)-[TSDLayerAndSubviewHosting containerView](self->_host, "containerView");
  v48 = (void *)-[TSDLayerAndSubviewHosting containerViewController](self->_host, "containerViewController");
  v50 = v10;
  v11 = -[NSSet isSubsetOfSet:](v10, "isSubsetOfSet:", self->_repChildViews);
  needsLayout = self->_needsLayout;
  self->_needsLayout = 0;
  obj = v3;
  if (!v11 || needsLayout)
  {
    v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (v13)
    {
      v14 = v13;
      v46 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v64 != v46)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          v17 = -[NSDictionary objectForKey:](v4, "objectForKey:", v16, obj);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "willAddChildView:toView:", v16, v49);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v18 = objc_msgSend(v17, "containerManagesChildView");
          else
            v18 = 0;
          v19 = 1.0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v19 = 2.0;
            switch(objc_msgSend(v17, "positionForChildView:", v16))
            {
              case 0u:
                goto LABEL_30;
              case 1u:
                v19 = 0.0;
                goto LABEL_30;
              case 2u:
                v19 = 1.0;
                goto LABEL_30;
              case 3u:
                v19 = -1.0;
                goto LABEL_30;
              default:
                break;
            }
          }
          else
          {
LABEL_30:
            objc_msgSend((id)objc_msgSend(v16, "layer"), "setZPosition:", v19);
          }
          if ((v18 & 1) == 0)
            objc_msgSend(v47, "addObject:", v16);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      }
      while (v14);
    }
    -[TSDCanvasSubviewsController p_sortSubviews:](self, "p_sortSubviews:", v47, obj);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v20 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v60 != v22)
            objc_enumerationMutation(v47);
          v24 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
          if (v48)
          {
            v25 = -[NSDictionary objectForKey:](v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v26 = objc_msgSend(v25, "viewControllerForView:", v24);
              if (v26 && v26 != (_QWORD)v48)
              {
                v28 = v26;
                objc_msgSend(v48, "addChildViewController:", v26);
                repViewControllersByChildView = self->_repViewControllersByChildView;
                if (!repViewControllersByChildView)
                {
                  repViewControllersByChildView = (TSURetainedPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3D00]);
                  self->_repViewControllersByChildView = repViewControllersByChildView;
                }
                -[TSURetainedPointerKeyDictionary setObject:forUncopiedKey:](repViewControllersByChildView, "setObject:forUncopiedKey:", v28, v24);
              }
            }
          }
          objc_msgSend(v49, "addSubview:", v24);
        }
        v21 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
      }
      while (v21);
    }

  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  repChildViews = self->_repChildViews;
  v31 = -[NSSet countByEnumeratingWithState:objects:count:](repChildViews, "countByEnumeratingWithState:objects:count:", &v55, v72, 16, obj);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v56;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v56 != v33)
          objc_enumerationMutation(repChildViews);
        v35 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * m);
        if (!-[NSSet containsObject:](v50, "containsObject:", v35))
        {
          v36 = -[NSDictionary objectForKey:](self->_repsByChildView, "objectForKey:", v35);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v36, "willRemoveChildView:", v35);
          if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v36, "containerManagesChildView") & 1) == 0)
          {
            v37 = (void *)-[TSURetainedPointerKeyDictionary objectForKey:](self->_repViewControllersByChildView, "objectForKey:", v35);
            if (v37)
            {
              objc_msgSend(v37, "removeFromParentViewController");
              -[TSURetainedPointerKeyDictionary removeObjectForKey:](self->_repViewControllersByChildView, "removeObjectForKey:", v35);
            }
            objc_msgSend(v35, "removeFromSuperview");
          }
        }
      }
      v32 = -[NSSet countByEnumeratingWithState:objects:count:](repChildViews, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
    }
    while (v32);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v38 = -[NSSet countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v52;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(v50);
        v42 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * n);
        if (!-[NSSet containsObject:](self->_repChildViews, "containsObject:", v42))
        {
          v43 = -[NSDictionary objectForKey:](v4, "objectForKey:", v42);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v43, "didAddChildView:", v42);
        }
      }
      v39 = -[NSSet countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
    }
    while (v39);
  }

  self->_repChildViews = v50;
  self->_repsByChildView = v4;
}

- (void)syncPerformBlock:(id)a3
{
  _opaque_pthread_mutex_t *p_mutex;

  if (a3)
  {
    p_mutex = &self->_mutex;
    pthread_mutex_lock(&self->_mutex);
    (*((void (**)(id))a3 + 2))(a3);
    pthread_mutex_unlock(p_mutex);
  }
}

- (void)updateTopLevelLayersForTiling:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *alternateLayersForViews;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = -[TSDCanvasSubviewsController p_topLevelReps](self, "p_topLevelReps");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        -[TSDCanvasSubviewsController p_recursivelyFindHostingRepsForRep:accumulatingHostingReps:](self, "p_recursivelyFindHostingRepsForRep:accumulatingHostingReps:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10++), v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v8);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v5);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "layerAndSubviewHost");
        if (v15)
          objc_msgSend(a3, "addObject:", objc_msgSend(v15, "topLevelTilingLayer"));
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v12);
  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __61__TSDCanvasSubviewsController_updateTopLevelLayersForTiling___block_invoke;
  v25[3] = &unk_24D82A5C8;
  v25[4] = self;
  v25[5] = a3;
  -[TSDCanvasSubviewsController syncPerformBlock:](self, "syncPerformBlock:", v25);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  alternateLayersForViews = self->_alternateLayersForViews;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](alternateLayersForViews, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(alternateLayersForViews);
        objc_msgSend(a3, "removeObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](alternateLayersForViews, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    }
    while (v18);
  }

}

uint64_t __61__TSDCanvasSubviewsController_updateTopLevelLayersForTiling___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)addSubviews:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasSubviewsController addSubviews:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 498, CFSTR("This operation must only be performed on the main thread."));
  }
  v7 = -[TSDLayerAndSubviewHosting containerView](self->_host, "containerView");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__TSDCanvasSubviewsController_addSubviews___block_invoke;
  v8[3] = &unk_24D82AB70;
  v8[4] = v7;
  v8[5] = a3;
  v8[6] = self;
  -[TSDCanvasSubviewsController syncPerformBlock:](self, "syncPerformBlock:", v8);
}

void __43__TSDCanvasSubviewsController_addSubviews___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "subviews"), "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v2, "tsu_containsObjectIdenticalTo:", v8) & 1) == 0)
          objc_msgSend(v2, "addObject:", v8);
        v9 = objc_msgSend(v8, "layer");
        if (v9)
        {
          v10 = v9;
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "tsu_containsObjectIdenticalTo:", v9) & 1) == 0)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "addObject:", v10);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 48), "p_sortSubviews:", v2);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)removeSubviews:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasSubviewsController removeSubviews:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 533, CFSTR("This operation must only be performed on the main thread."));
  }
  v7 = -[TSDLayerAndSubviewHosting containerView](self->_host, "containerView");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__TSDCanvasSubviewsController_removeSubviews___block_invoke;
  v8[3] = &unk_24D82AB70;
  v8[4] = a3;
  v8[5] = v7;
  v8[6] = self;
  -[TSDCanvasSubviewsController syncPerformBlock:](self, "syncPerformBlock:", v8);
}

uint64_t __46__TSDCanvasSubviewsController_removeSubviews___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)a1[4];
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if (objc_msgSend(v7, "superview") && objc_msgSend(v7, "superview") != a1[5])
        {
          v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasSubviewsController removeSubviews:]_block_invoke");
          objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSubviewsController.m"), 538, CFSTR("removing view %@ from %@; but superview is %@"),
            v7,
            a1[5],
            objc_msgSend(v7, "superview"));
        }
        objc_msgSend(v7, "removeFromSuperview");
        v10 = objc_msgSend(v7, "layer");
        if (v10)
          objc_msgSend(*(id *)(a1[6] + 48), "removeObject:", v10);
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (NSSet)repChildViews
{
  return self->_repChildViews;
}

@end
