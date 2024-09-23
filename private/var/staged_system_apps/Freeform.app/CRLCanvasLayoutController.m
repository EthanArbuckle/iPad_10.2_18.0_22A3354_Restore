@implementation CRLCanvasLayoutController

- (CRLCanvasLayoutController)initWithCanvas:(id)a3
{
  id v4;
  CRLCanvasLayoutController *v5;
  CRLCanvasLayoutController *v6;
  objc_class *v7;
  uint64_t v8;
  CRLCanvasRootLayout *v9;
  CRLCanvasRootLayout *rootLayout;
  NSMapTable *v11;
  NSMapTable *layoutsByInfo;
  NSMutableSet *v13;
  NSMutableSet *invalidLayouts;
  NSMutableSet *v15;
  NSMutableSet *invalidChildrenLayouts;
  NSMutableSet *v17;
  NSMutableSet *layoutsNeedingRecreating;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLCanvasLayoutController;
  v5 = -[CRLCanvasLayoutController init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_canvas, v4);
    v7 = (objc_class *)objc_msgSend(v4, "rootLayoutClass");
    if (!v7)
      objc_opt_class(CRLCanvasRootLayout, v8);
    v9 = (CRLCanvasRootLayout *)objc_msgSend([v7 alloc], "initWithLayoutController:", v6);
    rootLayout = v6->_rootLayout;
    v6->_rootLayout = v9;

    v11 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    layoutsByInfo = v6->_layoutsByInfo;
    v6->_layoutsByInfo = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidLayouts = v6->_invalidLayouts;
    v6->_invalidLayouts = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidChildrenLayouts = v6->_invalidChildrenLayouts;
    v6->_invalidChildrenLayouts = v15;

    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    layoutsNeedingRecreating = v6->_layoutsNeedingRecreating;
    v6->_layoutsNeedingRecreating = v17;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLCanvasAbstractLayout setChildren:](self->_rootLayout, "setChildren:", &__NSArray0__struct);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasLayoutController;
  -[CRLCanvasLayoutController dealloc](&v3, "dealloc");
}

- (CRLBoardItemOwning)boardItemOwner
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "boardItemOwner"));

  return (CRLBoardItemOwning *)v3;
}

+ (void)temporaryLayoutControllerForInfos:(id)a3 useInBlock:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  CRLCanvasLayoutControllerTemporaryCanvasDelegate *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  v11 = -[CRLCanvas initForTemporaryLayout]([CRLCanvas alloc], "initForTemporaryLayout");
  v7 = -[CRLCanvasLayoutControllerTemporaryCanvasDelegate initWithInfos:]([CRLCanvasLayoutControllerTemporaryCanvasDelegate alloc], "initWithInfos:", v6);
  objc_msgSend(v11, "setDelegate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layoutController"));
  objc_msgSend(v8, "setInfos:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layoutController"));
  objc_msgSend(v9, "validateLayouts");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layoutController"));
  v5[2](v5, v10);

  objc_msgSend(v11, "teardown");
}

- (void)setInfos:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id WeakRetained;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController layoutsForInfo:](self, "layoutsForInfo:", v11, (_QWORD)v21));
        v14 = v12;
        if (v12)
        {
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
          objc_msgSend(v5, "addObjectsFromArray:", v15);
        }
        else
        {
          *(_QWORD *)&v16 = objc_opt_class(self, v13).n128_u64[0];
          v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(v17, "effectiveLayoutClassForInfo:", v11, v16)), "initWithInfo:", v11);
          objc_msgSend(v5, "addObject:", v15);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self->_rootLayout, "children"));
  v19 = objc_msgSend(v18, "isEqual:", v5);

  if ((v19 & 1) == 0)
  {
    -[CRLCanvasAbstractLayout setChildren:](self->_rootLayout, "setChildren:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    objc_msgSend(WeakRetained, "layoutInvalidated");

  }
  objc_msgSend(v5, "makeObjectsPerformSelector:", "updateChildrenFromInfo", (_QWORD)v21);

}

- (void)invalidateLayout:(id)a3
{
  NSMutableSet *invalidLayouts;
  id v5;
  id WeakRetained;

  if (self->_validatingLayout != a3)
  {
    invalidLayouts = self->_invalidLayouts;
    v5 = a3;
    -[NSMutableSet addObject:](invalidLayouts, "addObject:", v5);
    sub_100194D48((uint64_t)v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    objc_msgSend(WeakRetained, "canvasInvalidatedForLayout:", v5);

  }
}

- (void)invalidateChildrenOfLayout:(id)a3
{
  id WeakRetained;

  -[NSMutableSet addObject:](self->_invalidChildrenLayouts, "addObject:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  objc_msgSend(WeakRetained, "layoutInvalidated");

}

- (void)invalidateLayoutForRecreation:(id)a3
{
  id WeakRetained;

  -[NSMutableSet addObject:](self->_layoutsNeedingRecreating, "addObject:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  objc_msgSend(WeakRetained, "layoutInvalidated");

}

+ (Class)effectiveLayoutClassForInfo:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v10;
  id v11;

  v3 = a3;
  if (objc_msgSend(v3, "isSupported"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutClass"));
  }
  else
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_10124A468);
    v5 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Element is not supported: %@", (uint8_t *)&v10, 0xCu);
    }
    objc_opt_class(_TtC8Freeform16CRLUnknownLayout, v6);
    v4 = objc_claimAutoreleasedReturnValue(v7);
  }
  v8 = (void *)v4;

  return (Class)v8;
}

- (id)layoutForInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController layoutsForInfo:](self, "layoutsForInfo:", v4));
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
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "orderedBefore:", v8))
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
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutsByInfo, "objectForKey:", a3));
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (id)layoutsForInfos:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController layoutForInfo:](self, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        objc_msgSend(v5, "crl_addNonNilObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
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

  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController layoutsForInfo:](self, "layoutsForInfo:", a3));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parent", (_QWORD)v14));

        if (v12 == v6)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
  return -[CRLCanvasLayoutController layoutsInRect:deep:](self, "layoutsInRect:deep:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)layoutsInRect:(CGRect)a3 deep:(BOOL)a4
{
  return -[CRLCanvasRootLayout childLayoutsInRect:deep:](self->_rootLayout, "childLayoutsInRect:deep:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)rectOfTopLevelLayouts
{
  double y;
  double x;
  double height;
  double width;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self->_rootLayout, "children", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "shouldBeIncludedInParentFrameForCulling"))
        {
          objc_msgSend(v11, "frameForCulling");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
          if ((sub_1000637C8() & 1) == 0)
          {
            x = sub_100060C2C(x, y, width, height, v13, v15, v17, v19);
            y = v20;
            width = v21;
            height = v22;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)validateLayouts
{
  CRLCanvasLayoutController *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  Class v18;
  NSString *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void **p_cache;
  dispatch_once_t *v27;
  dispatch_once_t *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  id v35;
  void *v36;
  void *v37;
  __CFString *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  __CFString *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  char *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  char *v64;
  CRLCanvasLayoutController *v65;
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
  uint8_t buf[4];
  unsigned int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  __CFString *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];

  v2 = self;
  -[CRLCanvasLayoutController p_recreateLayoutsIfNeededToValidateLayouts:](self, "p_recreateLayoutsIfNeededToValidateLayouts:", 0);
  v65 = v2;
  if (-[NSMutableSet count](v2->_invalidChildrenLayouts, "count"))
  {
    v3 = -[NSMutableSet copy](v2->_invalidChildrenLayouts, "copy");
    -[NSMutableSet removeAllObjects](v2->_invalidChildrenLayouts, "removeAllObjects");
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i), "updateChildrenFromInfo");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
      }
      while (v6);
    }

    if (-[NSMutableSet intersectsSet:](v2->_invalidChildrenLayouts, "intersectsSet:", v4))
    {
      v9 = -[NSMutableSet mutableCopy](v2->_invalidChildrenLayouts, "mutableCopy");
      objc_msgSend(v9, "intersectSet:", v4);
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v71;
        v15 = &stru_1012A72B0;
        do
        {
          v16 = 0;
          v17 = v15;
          do
          {
            if (*(_QWORD *)v71 != v14)
              objc_enumerationMutation(v10);
            objc_opt_class(*(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v16), v12);
            v19 = NSStringFromClass(v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,%@"), v17, v20));

            v16 = (char *)v16 + 1;
            v17 = v15;
          }
          while (v13 != v16);
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
        }
        while (v13);
      }
      else
      {
        v15 = &stru_1012A72B0;
      }

      v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124A488);
      v22 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        v79 = v21;
        v80 = 2082;
        v81 = "-[CRLCanvasLayoutController validateLayouts]";
        v82 = 2082;
        v83 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
        v84 = 1024;
        v85 = 290;
        v86 = 2114;
        v87 = v15;
        v88 = 2112;
        v89 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d one of these layouts had invalidateChildren while updating: %{public}@ %@", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124A4A8);
      v2 = v65;
      v23 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController validateLayouts]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 290, 0, "one of these layouts had invalidateChildren while updating: %{public}@ %@", v15, v10);

    }
  }
  if (-[NSMutableSet count](v2->_invalidLayouts, "count"))
  {
    p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
    v27 = &qword_10147E370;
    do
    {
      v28 = v27;
      v29 = -[NSMutableSet copy](v2->_invalidLayouts, "copy");
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v92, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(_QWORD *)v67 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j), "i_willValidateLayout");
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v92, 16);
        }
        while (v32);
      }

      v27 = v28;
      if ((-[NSMutableSet isSubsetOfSet:](v2->_invalidLayouts, "isSubsetOfSet:", v30) & 1) == 0)
      {
        v35 = -[NSMutableSet copy](v2->_invalidLayouts, "copy");
        objc_msgSend(v35, "minusSet:", v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "crl_setByMappingObjectsUsingBlock:", &stru_10124A4C8));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allObjects"));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "componentsJoinedByString:", CFSTR(",")));

        v39 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
        if (*v28 != -1)
          dispatch_once(v28, &stru_10124A4E8);
        v40 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v57 = v40;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "count")));
          *(_DWORD *)buf = 67110658;
          v79 = v39;
          v80 = 2082;
          v81 = "-[CRLCanvasLayoutController validateLayouts]";
          v82 = 2082;
          v83 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
          v84 = 1024;
          v85 = 310;
          v86 = 2114;
          v87 = v38;
          v88 = 2114;
          v89 = v58;
          v90 = 2112;
          v91 = v35;
          _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d a layout that was not about to be validated was invalidated as part of preparation for validation %{public}@ %{public}@, %@", buf, 0x40u);

        }
        if (*v27 != -1)
          dispatch_once(v27, &stru_10124A508);
        v41 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v59 = v41;
          v60 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 373, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          v79 = v39;
          v80 = 2114;
          v81 = v60;
          _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v42 = p_cache + 373;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController validateLayouts]"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "count")));
        objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 310, 0, "a layout that was not about to be validated was invalidated as part of preparation for validation %{public}@ %{public}@, %@", v38, v45, v35);

        p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
        v2 = v65;
      }
      -[CRLCanvasLayoutController p_validateLayouts:shouldMarkValidLayoutsThatDoNotWantValidation:](v2, "p_validateLayouts:shouldMarkValidLayoutsThatDoNotWantValidation:", v30, 1);
      if (-[NSMutableSet intersectsSet:](v2->_invalidLayouts, "intersectsSet:", v30))
      {
        v46 = -[NSMutableSet mutableCopy](v2->_invalidLayouts, "mutableCopy");
        objc_msgSend(v46, "intersectSet:", v30);
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "crl_setByMappingObjectsUsingBlock:", &stru_10124A528));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "allObjects"));
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "componentsJoinedByString:", CFSTR(",")));

        v50 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
        if (*v27 != -1)
          dispatch_once(v27, &stru_10124A548);
        v51 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v61 = v51;
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v46, "count")));
          *(_DWORD *)buf = 67110658;
          v79 = v50;
          v80 = 2082;
          v81 = "-[CRLCanvasLayoutController validateLayouts]";
          v82 = 2082;
          v83 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
          v84 = 1024;
          v85 = 326;
          v86 = 2114;
          v87 = v49;
          v88 = 2114;
          v89 = v62;
          v90 = 2112;
          v91 = v46;
          _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d one of these layouts was invalidated while validating: %{public}@ %{public}@ %@", buf, 0x40u);

        }
        if (*v27 != -1)
          dispatch_once(v27, &stru_10124A568);
        v52 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v63 = v52;
          v64 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 373, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          v79 = v50;
          v80 = 2114;
          v81 = v64;
          _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v53 = p_cache + 373;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController validateLayouts]"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v46, "count")));
        objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:isFatal:description:", v54, v55, 326, 0, "one of these layouts was invalidated while validating: %{public}@ %{public}@ %@", v49, v56, v46);

        p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
        v2 = v65;
      }

    }
    while (-[NSMutableSet count](v2->_invalidLayouts, "count"));
  }
}

- (id)sortLayoutsForDependencies:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *k;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *m;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *n;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *ii;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  Class v58;
  NSString *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v68;
  id v69;
  id v70;
  id obj;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  char *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t v107[128];
  uint8_t buf[4];
  unsigned int v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  const char *v113;
  __int16 v114;
  int v115;
  __int16 v116;
  id v117;
  __int16 v118;
  void *v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  id v126;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));
      v126 = v4;
      v70 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v126, 1));
    }
    else
    {
      v5 = objc_msgSend(v3, "mutableCopy");
      v70 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
      v6 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, objc_msgSend(v3, "count"));
      v73 = v3;
      v7 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, objc_msgSend(v3, "count"));
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v104;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v104 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            objc_msgSend(v6, "setObject:forKey:", v14, v13);

            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            objc_msgSend(v7, "setObject:forKey:", v15, v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
        }
        while (v10);
      }

      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      obj = v8;
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
      if (v74)
      {
        v72 = *(_QWORD *)v100;
        do
        {
          for (j = 0; j != v74; j = (char *)j + 1)
          {
            if (*(_QWORD *)v100 != v72)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)j);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dependentLayouts"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v18));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reliedOnLayouts"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v20));

            objc_msgSend(v21, "intersectSet:", v73);
            objc_msgSend(v19, "intersectSet:", v73);
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v17));
            objc_msgSend(v77, "unionSet:", v19);
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            v22 = v21;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v96;
              do
              {
                for (k = 0; k != v24; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v96 != v25)
                    objc_enumerationMutation(v22);
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)k)));
                  objc_msgSend(v27, "addObject:", v17);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
              }
              while (v24);
            }

            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v17));
            objc_msgSend(v75, "unionSet:", v22);
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            v28 = v19;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v91, v122, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v92;
              do
              {
                for (m = 0; m != v30; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v92 != v31)
                    objc_enumerationMutation(v28);
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)m)));
                  objc_msgSend(v33, "addObject:", v17);

                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v91, v122, 16);
              }
              while (v30);
            }

          }
          v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
        }
        while (v74);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v4 = obj;
      v35 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v87, v121, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v88;
        do
        {
          for (n = 0; n != v36; n = (char *)n + 1)
          {
            if (*(_QWORD *)v88 != v37)
              objc_enumerationMutation(v4);
            v39 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)n);
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v39));
            if (!objc_msgSend(v40, "count"))
              objc_msgSend(v34, "addObject:", v39);

          }
          v36 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v87, v121, 16);
        }
        while (v36);
      }

      if (objc_msgSend(v4, "count"))
      {
        v76 = v4;
        while (objc_msgSend(v34, "count"))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "anyObject"));
          objc_msgSend(v34, "removeObject:", v41);
          objc_msgSend(v4, "removeObject:", v41);
          objc_msgSend(v70, "addObject:", v41);
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v41));
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v80;
            do
            {
              for (ii = 0; ii != v44; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v80 != v45)
                  objc_enumerationMutation(v42);
                v47 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)ii);
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v47));
                if (objc_msgSend(v48, "count") == (id)1)
                  objc_msgSend(v34, "addObject:", v47);
                else
                  objc_msgSend(v48, "removeObject:", v41);

              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
            }
            while (v44);
          }

          v4 = v76;
          if (!objc_msgSend(v76, "count"))
            goto LABEL_75;
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v50 = v4;
        v51 = (char *)objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v83, v120, 16);
        if (v51)
        {
          v53 = v51;
          v54 = 0;
          v55 = *(_QWORD *)v84;
          do
          {
            v56 = 0;
            v78 = v54;
            v57 = v54 + 1;
            do
            {
              if (*(_QWORD *)v84 != v55)
                objc_enumerationMutation(v50);
              objc_opt_class(*(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v56), v52);
              v59 = NSStringFromClass(v58);
              v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
              objc_msgSend(v49, "appendString:", v60);

              if (&v56[(_QWORD)v57] < objc_msgSend(v50, "count"))
                objc_msgSend(v49, "appendString:", CFSTR(", "));
              ++v56;
            }
            while (v53 != v56);
            v54 = &v53[(_QWORD)v78];
            v53 = (char *)objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v83, v120, 16);
          }
          while (v53);
        }

        v61 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124A588);
        v62 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v68 = v62;
          v69 = objc_msgSend(v50, "count");
          *(_DWORD *)buf = 67110402;
          v109 = v61;
          v110 = 2082;
          v111 = "-[CRLCanvasLayoutController sortLayoutsForDependencies:]";
          v112 = 2082;
          v113 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
          v114 = 1024;
          v115 = 400;
          v116 = 2048;
          v117 = v69;
          v118 = 2114;
          v119 = v49;
          _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Layout dependency loop. %lu total. %{public}@", buf, 0x36u);

        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124A5A8);
        v63 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController sortLayoutsForDependencies:]"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v64, v65, 400, 0, "Layout dependency loop. %lu total. %{public}@", objc_msgSend(v50, "count"), v49);

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allObjects"));
        objc_msgSend(v70, "addObjectsFromArray:", v66);

        v4 = v76;
      }
LABEL_75:

      v3 = v73;
    }

  }
  else
  {
    v70 = &__NSArray0__struct;
  }

  return v70;
}

- (void)p_validateLayouts:(id)a3 shouldMarkValidLayoutsThatDoNotWantValidation:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  CRLCanvasLayout **p_validatingLayout;
  void *i;
  void *v12;
  CRLCanvasLayout *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController sortLayoutsForDependencies:](self, "sortLayoutsForDependencies:", a3));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    p_validatingLayout = &self->_validatingLayout;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "shouldValidate") & 1) != 0)
        {
          objc_storeStrong((id *)&self->_validatingLayout, v12);
          objc_msgSend(v12, "validate");
          v13 = *p_validatingLayout;
          *p_validatingLayout = 0;

          objc_msgSend(v12, "i_didValidateLayout");
        }
        else if (!a4)
        {
          continue;
        }
        -[NSMutableSet removeObject:](self->_invalidLayouts, "removeObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)validateLayoutsWithDependencies:(id)a3
{
  id v4;
  void *i;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  void *v16;
  CRLCanvas **p_canvas;
  id WeakRetained;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  id v28;
  id v29;
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

  v4 = a3;
  -[CRLCanvasLayoutController p_recreateLayoutsIfNeededToValidateLayouts:](self, "p_recreateLayoutsIfNeededToValidateLayouts:", v4);
  v28 = objc_alloc_init((Class)NSMutableSet);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v7 = objc_alloc_init((Class)NSMutableSet);
        do
        {
          objc_msgSend(v7, "removeAllObjects");
          objc_msgSend(v6, "recursivelyAddLayoutAndDependentLayoutsToValidateSet:", v7);
          if (!-[NSMutableSet count](self->_invalidChildrenLayouts, "count"))
            break;
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (!v9)
          {

            break;
          }
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
              if (-[NSMutableSet containsObject:](self->_invalidChildrenLayouts, "containsObject:", v14))
              {
                objc_msgSend(v14, "updateChildrenFromInfo");
                -[NSMutableSet removeObject:](self->_invalidChildrenLayouts, "removeObject:", v14);
                -[NSMutableSet addObject:](self->_invalidLayouts, "addObject:", v14);
                v11 = 1;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v10);

        }
        while ((v11 & 1) != 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootLayout"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController rootLayout](self, "rootLayout"));

        if (v15 == v16)
          objc_msgSend(v7, "intersectSet:", self->_invalidLayouts);
        objc_msgSend(v28, "unionSet:", v7);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v29);
  }

  -[CRLCanvasLayoutController p_validateLayouts:shouldMarkValidLayoutsThatDoNotWantValidation:](self, "p_validateLayouts:shouldMarkValidLayoutsThatDoNotWantValidation:", v28, 0);
  p_canvas = &self->_canvas;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  if (!v19)
    goto LABEL_27;
  v20 = (void *)v19;
  v21 = objc_loadWeakRetained((id *)p_canvas);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
  v23 = objc_opt_respondsToSelector(v22, "canvasDidValidateLayoutsWithDependencies:");

  if ((v23 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_canvas);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    v25 = objc_loadWeakRetained((id *)p_canvas);
    objc_msgSend(v24, "canvasDidValidateLayoutsWithDependencies:", v25);

LABEL_27:
  }

}

- (void)validateLayoutWithDependencies:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  -[CRLCanvasLayoutController validateLayoutsWithDependencies:](self, "validateLayoutsWithDependencies:", v4);

}

- (id)validatedLayoutForInfo:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController validatedLayoutsForInfo:](self, "validatedLayoutsForInfo:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  return v4;
}

- (id)validatedLayoutsForInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController layoutsForInfo:](self, "layoutsForInfo:", v4));
  if (!v6)
  {
    *(_QWORD *)&v7 = objc_opt_class(self, v5).n128_u64[0];
    v9 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "effectiveLayoutClassForInfo:", v4, v7)), "initWithInfo:", v4);
    if (v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
      -[CRLCanvasAbstractLayout addChild:](self->_rootLayout, "addChild:", v9);
      -[NSMutableSet addObject:](self->_invalidChildrenLayouts, "addObject:", v9);
      -[NSMutableSet addObject:](self->_invalidLayouts, "addObject:", v9);
    }
    else
    {
      v6 = 0;
    }

  }
  if (objc_msgSend(v6, "count")
    && -[NSMutableSet intersectsSet:](self->_invalidChildrenLayouts, "intersectsSet:", v6))
  {
    objc_msgSend(v6, "makeObjectsPerformSelector:", "updateChildrenFromInfo");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          -[NSMutableSet removeObject:](self->_invalidChildrenLayouts, "removeObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v12);
    }

  }
  if (objc_msgSend(v6, "count")
    && -[NSMutableSet intersectsSet:](self->_invalidLayouts, "intersectsSet:", v6))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[CRLCanvasLayoutController validateLayoutWithDependencies:](self, "validateLayoutWithDependencies:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), (_QWORD)v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }

  }
  return v6;
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

  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController validatedLayoutsForInfo:](self, "validatedLayoutsForInfo:", a3));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parent", (_QWORD)v14));

        if (v12 == v6)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)notifyThatLayoutsChangedOutsideOfLayout
{
  __CFRunLoop *Main;
  id v4;
  _QWORD block[5];

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CRLCanvasLayoutsChangedForCanvasNotification"), self);

  }
  else
  {
    Main = CFRunLoopGetMain();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10028207C;
    block[3] = &unk_10122D110;
    block[4] = self;
    CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
    CFRunLoopWakeUp(Main);
  }
}

- (void)i_registerLayout:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "willBeAddedToLayoutController:", self);
  if (v7 && self->_layoutsByInfo)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutsByInfo, "objectForKey:", v4));
      if (!v5)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        -[NSMapTable setObject:forKey:](self->_layoutsByInfo, "setObject:forKey:", v5, v4);
      }
      objc_msgSend(v5, "addObject:", v7);
      -[CRLCanvasLayoutChangeObserver i_layoutRegistered:](self->_layoutRegistrationObserver, "i_layoutRegistered:", v7);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  objc_msgSend(WeakRetained, "layoutInvalidated");

}

- (void)i_unregisterLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "willBeRemovedFromLayoutController:", self);
  if (v8 && self->_layoutsByInfo)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutsByInfo, "objectForKey:", v4));
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "removeObject:", v8);
        if (!objc_msgSend(v6, "count"))
          -[NSMapTable removeObjectForKey:](self->_layoutsByInfo, "removeObjectForKey:", v4);
      }
      -[CRLCanvasLayoutChangeObserver i_layoutUnregistered:](self->_layoutRegistrationObserver, "i_layoutUnregistered:", v8);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  objc_msgSend(WeakRetained, "layoutInvalidated");

  -[NSMutableSet removeObject:](self->_invalidLayouts, "removeObject:", v8);
  -[NSMutableSet removeObject:](self->_invalidChildrenLayouts, "removeObject:", v8);

}

- (void)i_removeAllLayouts
{
  -[CRLCanvasAbstractLayout setChildren:](self->_rootLayout, "setChildren:", &__NSArray0__struct);
  -[NSMapTable removeAllObjects](self->_layoutsByInfo, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_invalidLayouts, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_invalidChildrenLayouts, "removeAllObjects");
}

- (void)i_enumerateLayoutsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_layoutsByInfo, "objectEnumerator"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100282414;
        v11[3] = &unk_10124A5D0;
        v12 = v4;
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)p_recreateLayoutsIfNeededToValidateLayouts:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  if (-[NSMutableSet count](self->_layoutsNeedingRecreating, "count"))
  {
    if (objc_msgSend(v4, "intersectsSet:", self->_layoutsNeedingRecreating))
    {
      v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124A5F0);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E15600(v5, v6);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124A610);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController p_recreateLayoutsIfNeededToValidateLayouts:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 637, 0, "Shouldn't be validating layouts that need recreating");

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_layoutsNeedingRecreating;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)&v17 = objc_opt_class(self, v12).n128_u64[0];
          v19 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info", v17, (_QWORD)v25));
          v21 = objc_alloc((Class)objc_msgSend(v19, "effectiveLayoutClassForInfo:", v20));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));
          v23 = objc_msgSend(v21, "initWithInfo:", v22);

          -[NSMutableSet removeObject:](self->_invalidLayouts, "removeObject:", v16);
          -[NSMutableSet addObject:](self->_invalidLayouts, "addObject:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parent"));
          objc_msgSend(v24, "replaceChild:with:", v16, v23);

          -[CRLCanvasLayoutController invalidateChildrenOfLayout:](self, "invalidateChildrenOfLayout:", v23);
        }
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    -[NSMutableSet removeAllObjects](self->_layoutsNeedingRecreating, "removeAllObjects");
  }

}

- (CRLCanvas)canvas
{
  return (CRLCanvas *)objc_loadWeakRetained((id *)&self->_canvas);
}

- (CRLCanvasRootLayout)rootLayout
{
  return self->_rootLayout;
}

- (CRLCanvasLayoutChangeObserver)i_layoutRegistrationObserver
{
  return self->_layoutRegistrationObserver;
}

- (void)setI_layoutRegistrationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRegistrationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRegistrationObserver, 0);
  objc_storeStrong((id *)&self->_validatingLayout, 0);
  objc_storeStrong((id *)&self->_invalidChildrenLayouts, 0);
  objc_storeStrong((id *)&self->_layoutsNeedingRecreating, 0);
  objc_storeStrong((id *)&self->_invalidLayouts, 0);
  objc_storeStrong((id *)&self->_layoutsByInfo, 0);
  objc_storeStrong((id *)&self->_rootLayout, 0);
  objc_destroyWeak((id *)&self->_canvas);
}

@end
