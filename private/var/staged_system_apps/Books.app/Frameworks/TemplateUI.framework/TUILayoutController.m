@implementation TUILayoutController

- (TUIPackage)package
{
  return self->_package;
}

- (TUILayoutController)initWithPackage:(id)a3 feedId:(id)a4 manager:(id)a5 transactionCoordinator:(id)a6 state:(id)a7 identifierMap:(id)a8 entry:(id)a9 environment:(id)a10 instantiateDelegate:(id)a11 actionDelegate:(id)a12 queue:(id)a13 renderMode:(unint64_t)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TUILayoutController *v23;
  id *p_isa;
  TUILayoutController *v25;
  TUIInstantiateContext *v26;
  TUIInstantiateContext *instantiateContext;
  id *p_instantiateContext;
  uint64_t v29;
  NSMapTable *layouts;
  uint64_t v31;
  NSHashTable *orphanLayouts;
  uint64_t v33;
  NSHashTable *invalidChildren;
  uint64_t v35;
  NSHashTable *invalidRenderModels;
  uint64_t v37;
  NSHashTable *invalidLayouts;
  uint64_t v39;
  NSHashTable *invalidInstantiators;
  void *v41;
  NSMutableArray *v42;
  NSMutableArray *errors;
  uint64_t v44;
  NSHashTable *invalidEnvironmentContainers;
  uint64_t v46;
  NSMapTable *hostingLayouts;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;

  v18 = a3;
  v51 = a5;
  v19 = a5;
  v20 = a8;
  v60 = v19;
  v52 = a6;
  v21 = a6;
  v59 = a7;
  v58 = a8;
  v55 = a9;
  v56 = a10;
  v57 = a11;
  v22 = a12;
  v54 = a13;
  v61.receiver = self;
  v61.super_class = (Class)TUILayoutController;
  v23 = -[TUILayoutController init](&v61, "init");
  p_isa = (id *)&v23->super.isa;
  v25 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_package, a3);
    v25->_feedId.uniqueIdentifier = a4.var0;
    objc_storeStrong(p_isa + 15, v20);
    objc_storeStrong(p_isa + 21, a9);
    objc_storeStrong(p_isa + 19, v51);
    objc_storeStrong(p_isa + 20, v52);
    if (v18)
    {
      v26 = -[TUIInstantiateContext initWithDelegate:package:manager:identifierMap:environment:state:feedId:]([TUIInstantiateContext alloc], "initWithDelegate:package:manager:identifierMap:environment:state:feedId:", v57, v18, v60, v58, v56, v59, v25->_feedId.uniqueIdentifier);
      p_instantiateContext = (id *)&v25->_instantiateContext;
      instantiateContext = v25->_instantiateContext;
      v25->_instantiateContext = v26;
    }
    else
    {
      p_instantiateContext = (id *)&v25->_instantiateContext;
      instantiateContext = v25->_instantiateContext;
      v25->_instantiateContext = 0;
    }

    objc_msgSend(*p_instantiateContext, "setActionDelegate:", v22);
    objc_msgSend(*p_instantiateContext, "setTransactionCoordinator:", v21);
    -[TUIInstantiateContext setDynamicController:](v25->_instantiateContext, "setDynamicController:", v25);
    v29 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
    layouts = v25->_layouts;
    v25->_layouts = (NSMapTable *)v29;

    v31 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    orphanLayouts = v25->_orphanLayouts;
    v25->_orphanLayouts = (NSHashTable *)v31;

    v33 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    invalidChildren = v25->_invalidChildren;
    v25->_invalidChildren = (NSHashTable *)v33;

    v35 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    invalidRenderModels = v25->_invalidRenderModels;
    v25->_invalidRenderModels = (NSHashTable *)v35;

    v37 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    invalidLayouts = v25->_invalidLayouts;
    v25->_invalidLayouts = (NSHashTable *)v37;

    v39 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    invalidInstantiators = v25->_invalidInstantiators;
    v25->_invalidInstantiators = (NSHashTable *)v39;

    objc_storeStrong(p_isa + 8, a13);
    v25->_renderMode = a14;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v25->_reportErrors = objc_msgSend(v41, "BOOLForKey:", CFSTR("TUIReportErrors"));

    if (v25->_reportErrors)
    {
      v42 = objc_opt_new(NSMutableArray);
      errors = v25->_errors;
      v25->_errors = v42;
    }
    else
    {
      errors = v25->_errors;
      v25->_errors = 0;
    }

    v44 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    invalidEnvironmentContainers = v25->_invalidEnvironmentContainers;
    v25->_invalidEnvironmentContainers = (NSHashTable *)v44;

    v46 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 517));
    hostingLayouts = v25->_hostingLayouts;
    v25->_hostingLayouts = (NSMapTable *)v46;

  }
  return v25;
}

- (void)dealloc
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_layouts, "objectEnumerator"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "teardown");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)TUILayoutController;
  -[TUILayoutController dealloc](&v7, "dealloc");
}

- (double)contentsScale
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environment](self->_instantiateContext, "environment"));
  objc_msgSend(v2, "contentsScale");
  v4 = v3;

  return v4;
}

- (void)updateEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  TUIRootBox *rootBox;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environment](self->_instantiateContext, "environment"));
  v6 = v5;
  if (v5)
  {
    v7 = (uint64_t)objc_msgSend(v5, "differenceMaskWithEnvironment:", v4);
    if ((v7 & 0x10) == 0)
      goto LABEL_13;
  }
  else
  {
    v7 = 61;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_layouts, "objectEnumerator"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "layout"));
        objc_msgSend(v12, "invalidateColors");

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

LABEL_13:
  -[TUIInstantiateContext setEnvironment:](self->_instantiateContext, "setEnvironment:", v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environmentContainersUsingGlobals](self->_instantiateContext, "environmentContainersUsingGlobals", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
        if (v17
          && ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), "globalsEnvironmentUseMask") & v7) != 0&& objc_msgSend(v17, "validateGlobalsWithContext:", self->_instantiateContext))
        {
          -[NSHashTable addObject:](self->_invalidEnvironmentContainers, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  rootBox = self->_rootBox;
  if (rootBox)
    sub_D6D90(self->_invalidEnvironmentContainers, rootBox, v7, self->_instantiateContext);

}

- (BOOL)invalidateInstantiation:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if (!sub_D6FE4(v4, self->_rootBox))
  {
    v6 = TUIInstantiationLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_17E960((uint64_t)self, (uint64_t)v4, v7);

    goto LABEL_7;
  }
  -[NSHashTable addObject:](self->_invalidInstantiators, "addObject:", v4);
  v5 = 1;
LABEL_8:

  return v5;
}

- (void)_invalidateChildrenForModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    while (1)
    {
      v7 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layouts, "objectForKey:", v5));
      if (v6)
        break;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentModel"));

      v5 = v6;
      if (!v6)
      {
        v7 = 0;
        goto LABEL_8;
      }
    }
    -[TUILayoutController invalidateChildren:](self, "invalidateChildren:", v6);
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
LABEL_8:

}

- (void)validateInstantiationWithTransactionGroup:(id)a3
{
  id v4;
  TUIInstantiateContext *instantiateContext;
  uint64_t v6;
  char v7;
  void *v8;
  NSHashTable *v9;
  id v10;
  uint64_t v11;
  void *i;
  NSHashTable *v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *k;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  void *m;
  char *v28;
  _QWORD *v29;
  id v30;
  id v31;
  char *v32;
  char *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *n;
  void *v39;
  unsigned int v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  char v51;
  id v52;
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
  char *v65;
  char *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71[8];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _OWORD v76[2];
  int v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _QWORD *v81[16];
  _BYTE v82[128];

  v4 = a3;
  instantiateContext = self->_instantiateContext;
  if (instantiateContext)
  {
    v6 = *((_QWORD *)-[TUIInstantiateContext _context](instantiateContext, "_context") + 96);
    if (v6)
    {
      v7 = 0;
      *(_QWORD *)(v6 + 27848) = mach_absolute_time();
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 1;
LABEL_6:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v51 = v7;
  v50 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v9 = self->_invalidEnvironmentContainers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i));
      }
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
    }
    while (v10);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v13 = self->_invalidInstantiators;
  v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v58 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j));
      }
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
    }
    while (v14);
  }

  v52 = v8;
  v17 = objc_msgSend(v52, "count");
  if (v17)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "allObjects"));
    memset(v76, 0, sizeof(v76));
    v77 = 1065353216;
    sub_6A20((uint64_t)v76, (unint64_t)(float)(unint64_t)v17);
    v48 = (unint64_t)v17;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v18 = v49;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
    if (v19)
    {
      v20 = 0;
      v21 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(_QWORD *)v73 != v21)
            objc_enumerationMutation(v18);
          v71[0] = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)k);
          v81[0] = v71;
          sub_DACFC((uint64_t)v76, v71, (uint64_t)&std::piecewise_construct, v81)[3] = (char *)k + v20;
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        v20 += (uint64_t)k;
      }
      while (v19);
    }

    TUI::Graph::Ordering::Ordering((TUI::Graph::Ordering *)v71, v48);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v23 = v18;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    if (v24)
    {
      v25 = 0;
      v26 = *(_QWORD *)v68;
      do
      {
        for (m = 0; m != v24; m = (char *)m + 1)
        {
          if (*(_QWORD *)v68 != v26)
            objc_enumerationMutation(v23);
          v28 = (char *)objc_unsafeClaimAutoreleasedReturnValue(sub_DAC74(*(void **)(*((_QWORD *)&v67 + 1)
                                                                                   + 8 * (_QWORD)m)));
          if (v28)
          {
            while (1)
            {
              v65 = v28;
              v29 = sub_DAF50(v76, &v65);
              if (v29)
                break;
              v30 = sub_DAC74(v28);
              v28 = (char *)objc_claimAutoreleasedReturnValue(v30);

              if (!v28)
                goto LABEL_38;
            }
            TUI::Graph::Ordering::addEdge(v71, v29[3], v25);
          }
LABEL_38:
          ++v25;
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v24);
    }

    TUI::Graph::Ordering::solve((TUI::Graph::Ordering *)v71, &v65);
    v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v48);
    v33 = v65;
    v32 = v66;
    if (v65 != v66)
    {
      do
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", *(_QWORD *)v33));
        objc_msgSend(v31, "addObject:", v34);

        v33 += 8;
      }
      while (v33 != v32);
      v33 = v65;
    }
    if (v33)
    {
      v66 = v33;
      operator delete(v33);
    }
    TUI::Graph::Ordering::~Ordering((TUI::Graph::Ordering *)v71);
    sub_14B0C((uint64_t)v76);

  }
  else
  {
    v31 = &__NSArray0__struct;
  }

  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v35 = v31;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v78, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v36; n = (char *)n + 1)
      {
        if (*(_QWORD *)v54 != v37)
          objc_enumerationMutation(v35);
        v39 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)n);
        if (sub_D6FE4(v39, self->_rootBox))
        {
          v40 = -[NSHashTable containsObject:](self->_invalidEnvironmentContainers, "containsObject:", v39);
          v41 = v39;
          v42 = v41;
          if (v40 || objc_msgSend(v41, "needsValidationForTransactionGroup:", v4))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layouts, "objectForKey:", v42));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "validateInstantiationWithContext:transactionGroup:layout:", self->_instantiateContext, v4, v43));
            -[TUILayoutController _invalidateChildrenForModel:](self, "_invalidateChildrenForModel:", v44);

          }
        }
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v78, 16);
    }
    while (v36);
  }

  -[NSHashTable removeAllObjects](self->_invalidEnvironmentContainers, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_invalidInstantiators, "removeAllObjects");
  sub_D78A8(self->_rootBox, self->_instantiateContext);
  -[NSHashTable removeAllObjects](self->_invalidEnvironmentContainers, "removeAllObjects");
  if ((v51 & 1) == 0)
  {
    v45 = *(_QWORD *)(v50 + 27848);
    v46 = mach_absolute_time();
    v47 = v46 - v45;
    if (v45 >= v46)
      v47 = v45 - v46;
    *(_QWORD *)(v50 + 27816) += v47;
  }

}

- (id)debugDumpEnvironmentContainerStructure
{
  void *v2;

  if (self->_rootBox)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext debugDumpEnvironmentContainerStructure:](self->_instantiateContext, "debugDumpEnvironmentContainerStructure:"));
  else
    v2 = 0;
  return v2;
}

- (id)layoutForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layouts, "objectForKey:", v4));
    if (objc_msgSend(v5, "isLayout"))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setRootBox:(id)a3
{
  TUIRootBox *v5;
  TUIRootBox **p_rootBox;
  TUILayout *rootLayout;
  TUIRenderModelSection *cachedRenderModel;
  TUIRenderModelAuxiliary *cachedAuxRenderModel;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  TUILayout *v15;
  TUILayout *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = (TUIRootBox *)a3;
  p_rootBox = &self->_rootBox;
  if (self->_rootBox != v5)
  {
    rootLayout = self->_rootLayout;
    self->_rootLayout = 0;

    cachedRenderModel = self->_cachedRenderModel;
    self->_cachedRenderModel = 0;

    cachedAuxRenderModel = self->_cachedAuxRenderModel;
    self->_cachedAuxRenderModel = 0;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_layouts, "objectEnumerator", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "teardown");
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[NSMapTable removeAllObjects](self->_layouts, "removeAllObjects");
    -[NSHashTable removeAllObjects](self->_invalidLayouts, "removeAllObjects");
    -[NSHashTable removeAllObjects](self->_orphanLayouts, "removeAllObjects");
    -[NSHashTable removeAllObjects](self->_invalidRenderModels, "removeAllObjects");
    -[NSHashTable removeAllObjects](self->_invalidInstantiators, "removeAllObjects");
    objc_storeStrong((id *)&self->_rootBox, a3);
    if (*p_rootBox)
    {
      v14 = -[TUILayoutController _createLayoutForModel:withParent:](self, "_createLayoutForModel:withParent:", *p_rootBox, 0);
      v15 = (TUILayout *)objc_claimAutoreleasedReturnValue(-[TUILayoutController layoutForModel:](self, "layoutForModel:", self->_rootBox));
      v16 = self->_rootLayout;
      self->_rootLayout = v15;

      sub_D78A8(self->_rootBox, self->_instantiateContext);
    }
  }

}

- (void)invalidateLayout:(id)a3
{
  -[TUILayoutController _invalidateLayout:callOnInvalidate:](self, "_invalidateLayout:callOnInvalidate:", a3, 1);
}

- (void)_invalidateLayout:(id)a3 callOnInvalidate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "layoutIsInvalid") & 1) == 0)
  {
    objc_msgSend(v7, "setLayoutIsInvalid:", 1);
    if (v4)
      objc_msgSend(v7, "onInvalidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutAncestor"));
    v9 = v8;
    if (!v8 || (objc_msgSend(v8, "layoutIsInvalid") & 1) == 0)
      -[NSHashTable addObject:](self->_invalidLayouts, "addObject:", v7);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "children", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          -[NSHashTable removeObject:](self->_invalidLayouts, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13));
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)invalidateAuxiliaryRenderModel
{
  TUIRenderModelAuxiliary *cachedAuxRenderModel;

  cachedAuxRenderModel = self->_cachedAuxRenderModel;
  self->_cachedAuxRenderModel = 0;

}

- (void)invalidateChildren:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "invalidChildren") & 1) == 0)
  {
    objc_msgSend(v5, "setInvalidChildren:", 1);
    -[NSHashTable addObject:](self->_invalidChildren, "addObject:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
    -[TUILayoutController invalidateLayout:](self, "invalidateLayout:", v4);

  }
}

- (void)validateLayout:(id)a3
{
  TUIInstantiateContext *instantiateContext;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!objc_msgSend(v9, "layoutIsInvalid"))
    goto LABEL_9;
  instantiateContext = self->_instantiateContext;
  if (instantiateContext)
  {
    v5 = *((_QWORD *)-[TUIInstantiateContext _context](instantiateContext, "_context") + 96);
    if (v5)
    {
      v6 = (void *)objc_opt_class(v9);
      sub_D8064(v5, v6);
      v7 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = 1;
LABEL_7:
  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 11);
  v8 = objc_autoreleasePoolPush();
  objc_msgSend(v9, "_validateLayout");
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "setLayoutIsInvalid:", 0);
  -[NSHashTable removeObject:](self->_invalidLayouts, "removeObject:", v9);
  if ((v7 & 1) == 0)
    sub_D8128(v5);
LABEL_9:

}

- (void)validateGroupedContainingLayout:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  double v15;
  double v16;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  objc_msgSend(v12, "computedNaturalSize");
  if (v8 != width || v7 != height)
    objc_msgSend(v12, "invalidateLayout");
  if (objc_msgSend(v12, "layoutIsInvalid"))
  {
    -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 11);
    v10 = objc_autoreleasePoolPush();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_D8364;
    v13[3] = &unk_241348;
    v11 = v12;
    v14 = v11;
    v15 = width;
    v16 = height;
    objc_msgSend(v11, "_validateLayoutWithBlock:", v13);

    objc_autoreleasePoolPop(v10);
    objc_msgSend(v11, "setLayoutIsInvalid:", 0);
    -[NSHashTable removeObject:](self->_invalidLayouts, "removeObject:", v11);
  }

}

- (void)validateLayouts
{
  TUIInstantiateContext *instantiateContext;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  TUIRootBox *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  instantiateContext = self->_instantiateContext;
  if (!instantiateContext)
  {
    v4 = 0;
    goto LABEL_5;
  }
  v4 = *((_QWORD *)-[TUIInstantiateContext _context](instantiateContext, "_context") + 96);
  if (!v4)
  {
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  v5 = 0;
  *(_QWORD *)(v4 + 27856) = mach_absolute_time();
LABEL_6:
  v6 = objc_autoreleasePoolPush();
  -[TUILayoutController _validateChildren](self, "_validateChildren");
  objc_autoreleasePoolPop(v6);
  -[TUILayoutController _updateRootLayout](self, "_updateRootLayout");
  while (-[NSHashTable count](self->_invalidLayouts, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable anyObject](self->_invalidLayouts, "anyObject"));
    v8 = (TUIRootBox *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
    if (v8)
    {
      while (v8 != self->_rootBox)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[TUIBox parentModel](v8, "parentModel"));

        v8 = (TUIRootBox *)v9;
        if (!v9)
          goto LABEL_11;
      }
      -[TUILayoutController validateLayout:](self, "validateLayout:", v7);
    }
    else
    {
LABEL_11:
      v8 = 0;
      -[NSHashTable removeObject:](self->_invalidLayouts, "removeObject:", v7);
    }

  }
  if ((v5 & 1) == 0)
  {
    v10 = *(_QWORD *)(v4 + 27856);
    v11 = mach_absolute_time();
    v12 = v11 - v10;
    if (v10 >= v11)
      v12 = v10 - v11;
    *(_QWORD *)(v4 + 27824) += v12;
  }
}

- (void)_updateRootLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self, "instantiateContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self, "instantiateContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));
    objc_msgSend(v6, "viewSize");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v10 = NAN;
    v8 = NAN;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self->_rootLayout, "box"));
  v12 = objc_msgSend(v11, "layoutDirection");

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self, "instantiateContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "environment"));
    -[TUILayout setSpecifiedLayoutDirection:](self->_rootLayout, "setSpecifiedLayoutDirection:", objc_msgSend(v14, "layoutDirection"));

  }
  -[TUILayout setContainingWidth:](self->_rootLayout, "setContainingWidth:", v8);
  -[TUILayout setContainingHeight:](self->_rootLayout, "setContainingHeight:", v10);
}

- (id)_createLayoutForModel:(id)a3 withParent:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_msgSend(v6, "layoutClass");
  if (v8)
  {
    v9 = objc_msgSend([v8 alloc], "initWithModel:parent:controller:", v6, v7, self);
    -[NSMapTable setObject:forKey:](self->_layouts, "setObject:forKey:", v9, v6);
    if (objc_msgSend(v9, "isLayout"))
      -[TUILayoutController _invalidateLayout:callOnInvalidate:](self, "_invalidateLayout:callOnInvalidate:", v9, 0);
    -[TUILayoutController invalidateChildren:](self, "invalidateChildren:", v9);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_validateChildren
{
  void *v3;
  id v4;
  char v5;
  uint64_t v6;
  void *i;
  void *v8;
  TUIRootBox *v9;
  uint64_t v10;
  NSMapTable *layouts;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  NSMapTable *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *k;
  TUIRootBox *v25;
  TUIRootBox *v26;
  TUIRootBox *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[24];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];

  if (-[NSHashTable count](self->_invalidChildren, "count"))
  {
    while (-[NSHashTable count](self->_invalidChildren, "count"))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable setRepresentation](self->_invalidChildren, "setRepresentation"));
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      if (!v4)
      {

        break;
      }
      v5 = 0;
      v6 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v9 = (TUIRootBox *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
          if (v9)
          {
            while (v9 != self->_rootBox)
            {
              v10 = objc_claimAutoreleasedReturnValue(-[TUIBox parentModel](v9, "parentModel"));

              v9 = (TUIRootBox *)v10;
              if (!v10)
                goto LABEL_11;
            }
            -[TUILayoutController _validateChildrenForLayout:](self, "_validateChildrenForLayout:", v8);
            -[NSHashTable removeObject:](self->_invalidChildren, "removeObject:", v8);
            v5 = 1;
          }
          else
          {
LABEL_11:
            -[NSHashTable removeObject:](self->_invalidChildren, "removeObject:", v8);
            layouts = self->_layouts;
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
            -[NSMapTable removeObjectForKey:](layouts, "removeObjectForKey:", v12);

            v9 = 0;
          }

        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v4);

      if ((v5 & 1) == 0)
        break;
    }
    if (self->_rootBox)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable objectEnumerator](self->_orphanLayouts, "objectEnumerator"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v17, "teardown");
            v18 = self->_layouts;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "model"));
            -[NSMapTable removeObjectForKey:](v18, "removeObjectForKey:", v19);

            -[NSHashTable removeObject:](self->_invalidRenderModels, "removeObject:", v17);
            -[NSHashTable removeObject:](self->_invalidLayouts, "removeObject:", v17);
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        }
        while (v14);
      }

    }
    else
    {
      -[NSMapTable removeAllObjects](self->_layouts, "removeAllObjects");
      -[NSHashTable removeAllObjects](self->_invalidRenderModels, "removeAllObjects");
      -[NSHashTable removeAllObjects](self->_invalidLayouts, "removeAllObjects");
    }
    -[NSHashTable removeAllObjects](self->_orphanLayouts, "removeAllObjects");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_layouts, "keyEnumerator", 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v21);
          v25 = (TUIRootBox *)*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)k);
          v26 = v25;
          if (v25)
          {
            v27 = v25;
            while (v27 != self->_rootBox)
            {
              v28 = objc_claimAutoreleasedReturnValue(-[TUIBox parentModel](v27, "parentModel"));

              v27 = (TUIRootBox *)v28;
              if (!v28)
                goto LABEL_37;
            }
          }
          else
          {
LABEL_37:
            v27 = (TUIRootBox *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layouts, "objectForKey:", v26));
            -[NSMapTable removeObjectForKey:](self->_layouts, "removeObjectForKey:", v26);
            -[NSHashTable removeObject:](self->_invalidRenderModels, "removeObject:", v27);
            -[NSHashTable removeObject:](self->_invalidLayouts, "removeObject:", v27);
            -[NSHashTable removeObject:](self->_invalidChildren, "removeObject:", v27);
          }

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v22);
    }

    if (-[NSHashTable count](self->_invalidChildren, "count"))
    {
      v29 = TUILayoutLog();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_17E9E0((uint64_t)v43, self->_feedId.uniqueIdentifier, -[NSHashTable count](self->_invalidChildren, "count"), v30);

      TUIDebugHaltInDebugger();
      -[NSHashTable removeAllObjects](self->_invalidChildren, "removeAllObjects");
    }
  }
}

- (void)_validateChildrenForLayout:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  NSMutableArray *v18;
  void *v19;
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

  v4 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  v18 = objc_opt_new(NSMutableArray);
  objc_msgSend(v20, "appendLayoutChildrenToArray:", v18);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v18;
  v6 = 0;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layouts, "objectForKey:", v10));
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "updateParent:", v4);
          if (-[NSHashTable containsObject:](self->_orphanLayouts, "containsObject:", v12))
            -[TUILayoutController _unorphanLayout:](self, "_unorphanLayout:", v12);
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController _createLayoutForModel:withParent:](self, "_createLayoutForModel:withParent:", v10, v4));
          if (!v12)
            goto LABEL_13;
        }
        if (!v6)
          v6 = objc_opt_new(NSMutableArray);
        -[NSMutableArray addObject:](v6, "addObject:", v12);
LABEL_13:

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containers"));
  objc_msgSend(v4, "setContainers:", v6);
  objc_msgSend(v4, "setInvalidChildren:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v19;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
        if (-[NSMutableArray indexOfObjectIdenticalTo:](v6, "indexOfObjectIdenticalTo:", v17) == (id)0x7FFFFFFFFFFFFFFFLL)
          -[TUILayoutController _orphanLayout:](self, "_orphanLayout:", v17);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(v4, "onContainersUpdated");
}

- (void)_unorphanLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  -[NSHashTable removeObject:](self->_orphanLayouts, "removeObject:", v4);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        -[TUILayoutController _unorphanLayout:](self, "_unorphanLayout:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_orphanLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  -[NSHashTable addObject:](self->_orphanLayouts, "addObject:", v4);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        -[TUILayoutController _orphanLayout:](self, "_orphanLayout:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)renderModelSection:(unint64_t)a3 offset:(CGPoint)a4 uuid:(id)a5 transactionGroup:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  TUIInstantiateContext *instantiateContext;
  uint64_t v14;
  char v15;
  TUIRenderModelSection *cachedRenderModel;
  TUIRenderContext *v17;
  void *v18;
  NSDictionary *embeddedIdentifierMaps;
  NSDictionary *embeddedUpdateControllers;
  NSDictionary *embeddedUUIDs;
  void *v22;
  TUIRenderContext *v23;
  TUIRenderModelSection *v24;
  TUIRenderModelSection *v25;
  TUIRenderModelSection *v26;
  TUIRenderModelSection *v27;
  TUIRenderModelSection *v28;
  TUIRenderModelSection *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  TUIRenderModelSection *v36;
  id v38;
  id v39;

  y = a4.y;
  x = a4.x;
  v11 = a5;
  v12 = a6;
  instantiateContext = self->_instantiateContext;
  if (instantiateContext)
  {
    v14 = *((_QWORD *)-[TUIInstantiateContext _context](instantiateContext, "_context") + 96);
    if (v14)
    {
      v15 = 0;
      *(_QWORD *)(v14 + 27864) = mach_absolute_time();
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
  }
  v15 = 1;
LABEL_6:
  cachedRenderModel = self->_cachedRenderModel;
  if (!cachedRenderModel)
  {
    v38 = v12;
    v39 = v11;
    v17 = [TUIRenderContext alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifierMap renderModelIdentifierMap](self->_identifierMap, "renderModelIdentifierMap"));
    embeddedIdentifierMaps = self->_embeddedIdentifierMaps;
    embeddedUpdateControllers = self->_embeddedUpdateControllers;
    embeddedUUIDs = self->_embeddedUUIDs;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environment](self->_instantiateContext, "environment"));
    v23 = -[TUIRenderContext initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:](v17, "initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:", v18, embeddedIdentifierMaps, embeddedUpdateControllers, embeddedUUIDs, v22, self->_uid, self->_UUID, self->_entry, self->_queue, self->_renderMode);

    v12 = v38;
    v11 = v39;
    -[TUIRenderContext setManager:](v23, "setManager:", self->_manager);
    -[TUIRenderContext setTransactionGroup:](v23, "setTransactionGroup:", v38);
    v24 = (TUIRenderModelSection *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelOfKind:context:](self, "renderModelOfKind:context:", 7, v23));
    v25 = self->_cachedRenderModel;
    self->_cachedRenderModel = v24;

    if (-[NSMutableArray count](self->_errors, "count"))
    {
      v26 = -[TUIRenderModelSection copyWithErrors:](self->_cachedRenderModel, "copyWithErrors:", self->_errors);
      v27 = self->_cachedRenderModel;
      self->_cachedRenderModel = v26;

    }
    -[TUILayoutController _updateEmbedded](self, "_updateEmbedded");

    cachedRenderModel = self->_cachedRenderModel;
  }
  v28 = -[TUIRenderModelSection copyWithSection:offset:uuid:](cachedRenderModel, "copyWithSection:offset:uuid:", a3, v11, x, y);
  v29 = self->_cachedRenderModel;
  self->_cachedRenderModel = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBox animationGroups](self->_rootBox, "animationGroups"));
  v31 = v30;
  if (v30)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "generateAllGroupRenderModelsFromSource:", self->_cachedRenderModel));
    -[TUIRenderModelSection setAnimationRenderModels:](self->_cachedRenderModel, "setAnimationRenderModels:", v32);

  }
  if ((v15 & 1) == 0)
  {
    v33 = *(_QWORD *)(v14 + 27864);
    v34 = mach_absolute_time();
    v35 = v34 - v33;
    if (v33 >= v34)
      v35 = v33 - v34;
    *(_QWORD *)(v14 + 27832) += v35;
  }
  v36 = self->_cachedRenderModel;

  return v36;
}

- (void)_updateEmbedded
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *embeddedIdentifierMaps;
  NSDictionary *v10;
  NSDictionary *embeddedUpdateControllers;
  NSDictionary *v12;
  NSDictionary *embeddedUUIDs;
  NSMutableDictionary *v14;

  v14 = objc_opt_new(NSMutableDictionary);
  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController rootBox](self, "rootBox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController layoutForModel:](self, "layoutForModel:", v6));

  objc_msgSend(v7, "appendEmbeddedIdentifierMaps:updateControllers:UUIDs:", v14, v3, v4);
  v8 = (NSDictionary *)-[NSMutableDictionary copy](v14, "copy");
  embeddedIdentifierMaps = self->_embeddedIdentifierMaps;
  self->_embeddedIdentifierMaps = v8;

  v10 = (NSDictionary *)-[NSMutableDictionary copy](v3, "copy");
  embeddedUpdateControllers = self->_embeddedUpdateControllers;
  self->_embeddedUpdateControllers = v10;

  v12 = (NSDictionary *)-[NSMutableDictionary copy](v4, "copy");
  embeddedUUIDs = self->_embeddedUUIDs;
  self->_embeddedUUIDs = v12;

}

- (id)renderModelAuxiliary:(id)a3
{
  id v4;
  TUIRenderModelAuxiliary *cachedAuxRenderModel;
  TUIRenderContext *v6;
  void *v7;
  void *v8;
  TUIRenderContext *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  TUIRenderModelAuxiliary *v18;
  TUIRenderModelAuxiliary **p_cachedAuxRenderModel;
  TUIRenderModelAuxiliary *v20;
  TUIRenderModelAuxiliary *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  cachedAuxRenderModel = self->_cachedAuxRenderModel;
  if (!cachedAuxRenderModel)
  {
    v6 = [TUIRenderContext alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifierMap renderModelIdentifierMap](self->_identifierMap, "renderModelIdentifierMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environment](self->_instantiateContext, "environment"));
    v9 = -[TUIRenderContext initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:](v6, "initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:", v7, 0, 0, 0, v8, self->_uid, self->_UUID, self->_entry, self->_queue, self->_renderMode);

    -[TUIRenderContext setManager:](v9, "setManager:", self->_manager);
    -[TUIRenderContext setTransactionGroup:](v9, "setTransactionGroup:", v4);
    v10 = objc_opt_new(NSMutableArray);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController rootBox](self, "rootBox"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "navBarModels"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController layoutForModel:](self, "layoutForModel:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15)));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderContext renderModelForLayout:kind:](v9, "renderModelForLayout:kind:", v16, 5));
          if (v17)
            -[NSMutableArray addObject:](v10, "addObject:", v17);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    v18 = -[TUIRenderModelAuxiliary initWithNavigationItems:]([TUIRenderModelAuxiliary alloc], "initWithNavigationItems:", v10);
    v20 = self->_cachedAuxRenderModel;
    p_cachedAuxRenderModel = &self->_cachedAuxRenderModel;
    *p_cachedAuxRenderModel = v18;

    cachedAuxRenderModel = *p_cachedAuxRenderModel;
  }
  v21 = cachedAuxRenderModel;

  return v21;
}

- (id)renderModelLayer:(id)a3
{
  id v4;
  TUIRenderModelLayer *cachedLayerRenderModel;
  TUIRenderContext *v6;
  void *v7;
  void *v8;
  TUIRenderContext *v9;
  TUIRenderModelLayer *v10;
  TUIRenderModelLayer *v11;
  TUIRenderModelLayer *v12;

  v4 = a3;
  cachedLayerRenderModel = self->_cachedLayerRenderModel;
  if (!cachedLayerRenderModel)
  {
    v6 = [TUIRenderContext alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifierMap renderModelIdentifierMap](self->_identifierMap, "renderModelIdentifierMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environment](self->_instantiateContext, "environment"));
    v9 = -[TUIRenderContext initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:](v6, "initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:", v7, 0, 0, 0, v8, self->_uid, self->_UUID, self->_entry, self->_queue, self->_renderMode);

    -[TUIRenderContext setManager:](v9, "setManager:", self->_manager);
    -[TUIRenderContext setTransactionGroup:](v9, "setTransactionGroup:", v4);
    v10 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelOfKind:context:](self, "renderModelOfKind:context:", 3, v9));
    v11 = self->_cachedLayerRenderModel;
    self->_cachedLayerRenderModel = v10;

    cachedLayerRenderModel = self->_cachedLayerRenderModel;
  }
  v12 = cachedLayerRenderModel;

  return v12;
}

- (id)renderModelOfKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController rootBox](self, "rootBox"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController layoutForModel:](self, "layoutForModel:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderModelForLayout:kind:", v9, a3));
  return v10;
}

- (id)renderModelOfKind:(unint64_t)a3 transactionGroup:(id)a4
{
  id v6;
  TUIRenderContext *v7;
  void *v8;
  void *v9;
  TUIRenderContext *v10;
  void *v11;

  v6 = a4;
  v7 = [TUIRenderContext alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifierMap renderModelIdentifierMap](self->_identifierMap, "renderModelIdentifierMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environment](self->_instantiateContext, "environment"));
  v10 = -[TUIRenderContext initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:](v7, "initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:", v8, 0, 0, 0, v9, self->_uid, self->_UUID, self->_entry, self->_queue, self->_renderMode);

  -[TUIRenderContext setManager:](v10, "setManager:", self->_manager);
  -[TUIRenderContext setTransactionGroup:](v10, "setTransactionGroup:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelOfKind:context:](self, "renderModelOfKind:context:", a3, v10));

  return v11;
}

- (id)loadResourceWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_D9CD4;
  v29 = sub_D9CE4;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_D9CD4;
  v23 = sub_D9CE4;
  v24 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController manager](self, "manager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resourceLoader"));

  if (v8)
  {
    v9 = dispatch_semaphore_create(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController manager](self, "manager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resourceLoader"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_D9CEC;
    v15[3] = &unk_241370;
    v17 = &v25;
    v18 = &v19;
    v12 = v9;
    v16 = v12;
    objc_msgSend(v11, "loadResourceWithURL:completion:", v6, v15);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v13 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (void)invalidateCachedRenderModelForLayout:(id)a3
{
  id v4;
  TUIRenderModelSection *cachedRenderModel;
  TUIRenderModelAuxiliary *cachedAuxRenderModel;
  TUIRenderModelLayer *cachedLayerRenderModel;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    -[NSHashTable addObject:](self->_invalidRenderModels, "addObject:", v4);
  }
  else
  {
    cachedRenderModel = self->_cachedRenderModel;
    self->_cachedRenderModel = 0;

    cachedAuxRenderModel = self->_cachedAuxRenderModel;
    self->_cachedAuxRenderModel = 0;

    cachedLayerRenderModel = self->_cachedLayerRenderModel;
    self->_cachedLayerRenderModel = 0;

  }
}

- (void)cachedRenderModelValidatedForLayout:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSHashTable removeObject:](self->_invalidRenderModels, "removeObject:", v4);

}

- (void)validateRenderModelsWithTransactionGroup:(id)a3
{
  id v4;
  TUIRenderContext *v5;
  void *v6;
  NSDictionary *embeddedIdentifierMaps;
  NSDictionary *embeddedUpdateControllers;
  NSDictionary *embeddedUUIDs;
  void *v10;
  TUIRenderContext *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = [TUIRenderContext alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifierMap renderModelIdentifierMap](self->_identifierMap, "renderModelIdentifierMap"));
  embeddedIdentifierMaps = self->_embeddedIdentifierMaps;
  embeddedUpdateControllers = self->_embeddedUpdateControllers;
  embeddedUUIDs = self->_embeddedUUIDs;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext environment](self->_instantiateContext, "environment"));
  v11 = -[TUIRenderContext initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:](v5, "initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:", v6, embeddedIdentifierMaps, embeddedUpdateControllers, embeddedUUIDs, v10, self->_uid, self->_UUID, self->_entry, self->_queue, self->_renderMode);

  -[TUIRenderContext setManager:](v11, "setManager:", self->_manager);
  -[TUIRenderContext setTransactionGroup:](v11, "setTransactionGroup:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_invalidRenderModels, "allObjects"));
  -[NSHashTable removeAllObjects](self->_invalidRenderModels, "removeAllObjects");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "validateRenderModelWithContext:transactionGroup:", v11, v4);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)axModelTree
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController rootBox](self, "rootBox"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController layoutForModel:](self, "layoutForModel:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", 0, 0, 0, CGPointZero.x, CGPointZero.y));
  return v6;
}

- (void)addError:(id)a3
{
  -[NSMutableArray addObject:](self->_errors, "addObject:", a3);
}

- (void)addErrors:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_errors, "addObjectsFromArray:", a3);
}

- (id)imageResourceForKind:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 instance:(id)a6 options:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager resourceRegistry](self->_manager, "resourceRegistry"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageProviderForKind:", v13));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageResourceForNaturalSize:contentsScale:instance:options:", v14, v15, width, height, a5));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext capture](self->_instantiateContext, "capture"));

  if (v19 && v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext capture](self->_instantiateContext, "capture"));
    objc_msgSend(v20, "captureImageResource:forKind:naturalSize:contentsScale:instance:options:", v18, v13, v14, v15, width, height, a5);

  }
  return v18;
}

- (id)intrinsicImageResourceForKind:(id)a3 instance:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager resourceRegistry](self->_manager, "resourceRegistry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageProviderForKind:", v8));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "intrinsicImageResourceForInstance:options:", v9, v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext capture](self->_instantiateContext, "capture"));

  if (v14 && v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext capture](self->_instantiateContext, "capture"));
    objc_msgSend(v15, "captureIntrinsicImageResource:forKind:instance:options:", v13, v8, v9, v10);

  }
  return v13;
}

- (void)resetInstantiationStats:(BOOL)a3
{
  -[TUIInstantiateContext resetInstantiationStats:](self->_instantiateContext, "resetInstantiationStats:", a3);
}

- (void)registerHostingLayout:(id)a3 forIdentifier:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_hostingLayouts, "setObject:forKey:", a3, a4);
}

- (BOOL)applyHostingGeometryMapUpdate:(id)a3
{
  TUIHostingGeometryMap *v4;
  TUIHostingGeometryMap *hostingGeometryMap;
  _TUIHostingGeometryReuseMap *v6;
  _TUIHostingGeometryReuseMap *hostingGeometryReuseMap;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _TUIHostingGeometryReuseMap *v17;
  char v18;
  _TUIHostingGeometryReuseMap *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _TUIHostingGeometryReuseMap *v28;
  void *v29;
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v31 = a3;
  v4 = (TUIHostingGeometryMap *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "to"));
  hostingGeometryMap = self->_hostingGeometryMap;
  self->_hostingGeometryMap = v4;

  v6 = (_TUIHostingGeometryReuseMap *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "toReuseMap"));
  hostingGeometryReuseMap = self->_hostingGeometryReuseMap;
  self->_hostingGeometryReuseMap = v6;

  if (-[NSMapTable count](self->_hostingLayouts, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "differences"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v32 = 0;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_hostingLayouts, "objectForKey:", v12));
          v14 = v13;
          if (v13)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hostingGeometry"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingGeometryMap geometryForIdentifier:](self->_hostingGeometryMap, "geometryForIdentifier:", v12));
            if (!v16)
            {
              v17 = self->_hostingGeometryReuseMap;
              objc_msgSend(v14, "hostingRequestedSize");
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIHostingGeometryReuseMap geometryForIdentifier:requestedSize:](v17, "geometryForIdentifier:requestedSize:", v12));
            }
            if (v15 != v16 && (objc_msgSend(v15, "isEqualToGeometry:", v16) & 1) == 0)
            {
              objc_msgSend(v14, "invalidateLayout");
              v32 = 1;
            }

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v9);
    }
    else
    {
      v32 = 0;
    }

    v18 = v32 & 1;
  }
  else
  {
    v18 = 0;
  }
  if (-[NSMapTable count](self->_hostingLayouts, "count"))
  {
    v19 = self->_hostingGeometryReuseMap;
    if (v19)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIHostingGeometryReuseMap reuseIdentifiers](v19, "reuseIdentifiers"));
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v20);
            v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_hostingLayouts, "objectForKey:", v24));
            v26 = v25;
            if (v25)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hostingGeometry"));
              v28 = self->_hostingGeometryReuseMap;
              objc_msgSend(v26, "hostingRequestedSize");
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIHostingGeometryReuseMap geometryForIdentifier:requestedSize:](v28, "geometryForIdentifier:requestedSize:", v24));
              if (v27 != v29 && (objc_msgSend(v27, "isEqualToGeometry:", v29) & 1) == 0)
              {
                objc_msgSend(v26, "invalidateLayout");
                v18 = 1;
              }

            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v21);
      }

    }
  }

  return v18 & 1;
}

- (id)hostingGeometryForIdentifier:(id)a3 requestedSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  TUIHostingGeometryMap *hostingGeometryMap;
  void *v9;
  id v10;
  NSObject *v11;
  unint64_t uniqueIdentifier;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  unint64_t v21;
  NSString *v22;
  void *v23;
  int v24;
  unint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  CGSize v32;
  CGSize v33;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (v7 && (hostingGeometryMap = self->_hostingGeometryMap) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingGeometryMap geometryForIdentifier:](hostingGeometryMap, "geometryForIdentifier:", v7));
    if (v9)
    {
      v10 = TUIHostingLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uniqueIdentifier = self->_feedId.uniqueIdentifier;
        v32.width = width;
        v32.height = height;
        v13 = NSStringFromCGSize(v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v24 = 134218754;
        v25 = uniqueIdentifier;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v14;
        v30 = 2112;
        v31 = v9;
        _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "[fid:%lu] hostingGeometryForIdentifer:%@ requestedSize:%@ => %@", (uint8_t *)&v24, 0x2Au);

      }
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager viewRegistry](self->_manager, "viewRegistry"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostedViewFactoryTypesWithGeometryReuse"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "type"));
      v17 = -[NSObject containsObject:](v11, "containsObject:", v16);

      if (v17)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIHostingGeometryReuseMap geometryForIdentifier:requestedSize:](self->_hostingGeometryReuseMap, "geometryForIdentifier:requestedSize:", v7, width, height));
        if (v9)
        {
          v18 = TUIHostingLog();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v21 = self->_feedId.uniqueIdentifier;
            v33.width = width;
            v33.height = height;
            v22 = NSStringFromCGSize(v33);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v24 = 134218754;
            v25 = v21;
            v26 = 2112;
            v27 = v7;
            v28 = 2112;
            v29 = v23;
            v30 = 2112;
            v31 = v9;
            _os_log_debug_impl(&dword_0, v19, OS_LOG_TYPE_DEBUG, "[fid:%lu] hostingGeometryForIdentifer:%@ requestedSize:%@ => %@ (reused)", (uint8_t *)&v24, 0x2Au);

          }
        }
      }
      else
      {
        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (TUIRootBox)rootBox
{
  return self->_rootBox;
}

- (TUILayout)rootLayout
{
  return self->_rootLayout;
}

- (TUIInstantiateContext)instantiateContext
{
  return self->_instantiateContext;
}

- (TUIManager)manager
{
  return self->_manager;
}

- (TUITransactionCoordinating)transactionCoordinator
{
  return self->_transactionCoordinator;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)shouldRootLayoutInheritWidthWhenAuto
{
  return self->_shouldRootLayoutInheritWidthWhenAuto;
}

- (void)setShouldRootLayoutInheritWidthWhenAuto:(BOOL)a3
{
  self->_shouldRootLayoutInheritWidthWhenAuto = a3;
}

- (BOOL)shouldRootLayoutInheritHeightWhenAuto
{
  return self->_shouldRootLayoutInheritHeightWhenAuto;
}

- (void)setShouldRootLayoutInheritHeightWhenAuto:(BOOL)a3
{
  self->_shouldRootLayoutInheritHeightWhenAuto = a3;
}

- (NSDictionary)embeddedIdentifierMaps
{
  return self->_embeddedIdentifierMaps;
}

- (NSDictionary)embeddedUpdateControllers
{
  return self->_embeddedUpdateControllers;
}

- (NSDictionary)embeddedUUIDs
{
  return self->_embeddedUUIDs;
}

- (NSMapTable)hostingLayouts
{
  return self->_hostingLayouts;
}

- (BOOL)reportErrors
{
  return self->_reportErrors;
}

- (void)setReportErrors:(BOOL)a3
{
  self->_reportErrors = a3;
}

- (_TUIHostingGeometryReuseMap)hostingGeometryReuseMap
{
  return self->_hostingGeometryReuseMap;
}

- (NSMapTable)layouts
{
  return self->_layouts;
}

- (TUIStatsEventCollector)statsCollector
{
  return self->_statsCollector;
}

- (void)setStatsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_statsCollector, a3);
}

- (TUIHostingGeometryMap)hostingGeometryMap
{
  return self->_hostingGeometryMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingGeometryMap, 0);
  objc_storeStrong((id *)&self->_statsCollector, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_hostingGeometryReuseMap, 0);
  objc_storeStrong((id *)&self->_hostingLayouts, 0);
  objc_storeStrong((id *)&self->_embeddedUUIDs, 0);
  objc_storeStrong((id *)&self->_embeddedUpdateControllers, 0);
  objc_storeStrong((id *)&self->_embeddedIdentifierMaps, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_transactionCoordinator, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_instantiateContext, 0);
  objc_storeStrong((id *)&self->_rootLayout, 0);
  objc_storeStrong((id *)&self->_rootBox, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_cachedLayerRenderModel, 0);
  objc_storeStrong((id *)&self->_cachedAuxRenderModel, 0);
  objc_storeStrong((id *)&self->_cachedRenderModel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidEnvironmentContainers, 0);
  objc_storeStrong((id *)&self->_invalidRenderModels, 0);
  objc_storeStrong((id *)&self->_invalidInstantiators, 0);
  objc_storeStrong((id *)&self->_invalidLayouts, 0);
  objc_storeStrong((id *)&self->_invalidChildren, 0);
  objc_storeStrong((id *)&self->_orphanLayouts, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
