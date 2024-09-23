@implementation CRLInteractiveCanvasRepLayerPile

- (CRLInteractiveCanvasRepLayerPile)init
{
  CRLInteractiveCanvasRepLayerPile *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *topLevelLayers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLInteractiveCanvasRepLayerPile;
  v2 = -[CRLInteractiveCanvasRepLayerPile init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    topLevelLayers = v2->_topLevelLayers;
    v2->_topLevelLayers = v3;

  }
  return v2;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *obj;
  uint64_t v22;
  id v23;
  void *v24;
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

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendString:", CFSTR("(\n"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_parentLayerAndChildLayersStack;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v4);
        v6 = objc_alloc_init((Class)NSMutableArray);
        v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "first"));
        v24 = v5;
        if (v7)
        {
          do
          {
            objc_msgSend(v6, "insertObject:atIndex:", v7, 0);
            if ((-[NSMutableOrderedSet containsObject:](self->_topLevelLayers, "containsObject:", v7) & 1) != 0)
              break;
            v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superlayer"));

            v7 = (id)v8;
          }
          while (v8);
        }
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v26;
          do
          {
            v13 = 0;
            v14 = v7;
            do
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v9);
              v7 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13);

              objc_msgSend(v3, "appendFormat:", CFSTR("%@/"), v7);
              v13 = (char *)v13 + 1;
              v14 = v7;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v11);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "second"));
        objc_msgSend(v3, "appendFormat:", CFSTR(" -> %@\n"), v15);

        v4 = (char *)v4 + 1;
      }
      while (v4 != v23);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  objc_msgSend(v3, "appendString:", CFSTR(")"));
  *(_QWORD *)&v17 = objc_opt_class(self, v16).n128_u64[0];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p\n_topLevelLayers=%@\n_parentLayerAndChildLayersStack=%@>"), v17, v18, self, self->_topLevelLayers, v3));

  return (NSString *)v19;
}

- (void)addLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_parentLayerAndChildLayersStack, "lastObject"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "second"));
    objc_msgSend(v6, "addObject:", v7);

  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_topLevelLayers, "addObject:", v7);
  }

}

- (void)mutateLayersUsingBlock:(id)a3
{
  NSMutableArray *parentLayerAndChildLayersStack;
  void (**v5)(id, id);
  void *v6;
  id v7;
  void *v8;
  id v9;

  parentLayerAndChildLayersStack = self->_parentLayerAndChildLayersStack;
  v5 = (void (**)(id, id))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](parentLayerAndChildLayersStack, "lastObject"));
  v9 = v6;
  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "second"));
    v5[2](v5, v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_topLevelLayers, "array"));
    v7 = objc_msgSend(v8, "mutableCopy");

    v5[2](v5, v7);
    -[NSMutableOrderedSet removeAllObjects](self->_topLevelLayers, "removeAllObjects");
    -[NSMutableOrderedSet addObjectsFromArray:](self->_topLevelLayers, "addObjectsFromArray:", v7);
  }

}

- (void)pushParentLayer:(id)a3
{
  NSMutableArray *parentLayerAndChildLayersStack;
  NSMutableArray *v5;
  NSMutableArray *v6;
  CRLPair *v7;
  id v8;
  CRLPair *v9;
  id v10;

  v10 = a3;
  parentLayerAndChildLayersStack = self->_parentLayerAndChildLayersStack;
  if (!parentLayerAndChildLayersStack)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6 = self->_parentLayerAndChildLayersStack;
    self->_parentLayerAndChildLayersStack = v5;

    parentLayerAndChildLayersStack = self->_parentLayerAndChildLayersStack;
  }
  v7 = [CRLPair alloc];
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = -[CRLPair initWithFirst:second:](v7, "initWithFirst:second:", v10, v8);
  -[NSMutableArray addObject:](parentLayerAndChildLayersStack, "addObject:", v9);

}

- (void)popParentLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_parentLayerAndChildLayersStack, "lastObject"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258ED8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2D138();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258EF8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile popParentLayer]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 96, 0, "popParentLayer called without matching pushParentLayer:");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "first"));
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258F18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2D098();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258F38);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile popParentLayer]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 99, 0, "invalid nil value for '%{public}s'", "parentLayer");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "second"));
  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258F58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2CFF8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258F78);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile popParentLayer]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 101, 0, "invalid nil value for '%{public}s'", "childLayers");

  }
  objc_msgSend(v7, "crl_tilingSafeSetSublayers:", v11);
  -[NSMutableArray removeLastObject](self->_parentLayerAndChildLayersStack, "removeLastObject");

}

- (id)newRepLayerPileByTransferringAndCloningParentLayers:(id *)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unsigned int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  char *v43;
  unsigned int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  char *v52;
  NSObject *v53;
  char *v54;
  NSObject *v55;
  char *v56;
  NSObject *v57;
  char *v58;
  void *v59;
  void *v60;
  void *v61;
  CRLInteractiveCanvasRepLayerPile *v63;
  id v64;
  id v65;
  id *v66;
  NSMutableArray *obj;
  uint64_t v68;
  id v69;
  CRLInteractiveCanvasRepLayerPile *v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[6];
  void *v78;
  uint8_t buf[4];
  unsigned int v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  const char *v88;
  _BYTE v89[128];

  v70 = objc_alloc_init(CRLInteractiveCanvasRepLayerPile);
  v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  if (-[NSMutableArray count](self->_parentLayerAndChildLayersStack, "count"))
  {
    v66 = a3;
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1003C4B20;
    v77[3] = &unk_101258FA0;
    v64 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    v65 = v5;
    v77[4] = v64;
    v77[5] = v5;
    v6 = objc_retainBlock(v77);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet lastObject](self->_topLevelLayers, "lastObject"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v63 = self;
    obj = self->_parentLayerAndChildLayersStack;
    v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
    if (v69)
    {
      v68 = *(_QWORD *)v74;
      do
      {
        v8 = 0;
        v9 = v7;
        do
        {
          if (*(_QWORD *)v74 != v68)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v8);
          v72 = v8;
          if (v9)
          {
            v11 = ((uint64_t (*)(_QWORD *, id))v6[2])(v6, v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            -[CRLInteractiveCanvasRepLayerPile addLayer:](v70, "addLayer:", v12);
          }
          else
          {
            v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101258FC0);
            v14 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v80 = v13;
              v81 = 2082;
              v82 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              v83 = 2082;
              v84 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              v85 = 1024;
              v86 = 154;
              v87 = 2082;
              v88 = "pushedParentLayer";
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101258FE0);
            v15 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v51 = v15;
              v52 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v80 = v13;
              v81 = 2114;
              v82 = v52;
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v16, 154, 0, "invalid nil value for '%{public}s'", "pushedParentLayer");

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "first"));
          if (!v17)
          {
            v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101259000);
            v19 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v80 = v18;
              v81 = 2082;
              v82 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              v83 = 2082;
              v84 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              v85 = 1024;
              v86 = 160;
              v87 = 2082;
              v88 = "parentLayer";
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101259020);
            v20 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v53 = v20;
              v54 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v80 = v18;
              v81 = 2114;
              v82 = v54;
              _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 160, 0, "invalid nil value for '%{public}s'", "parentLayer");

          }
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "second"));
          if (!v71)
          {
            v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101259040);
            v24 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v80 = v23;
              v81 = 2082;
              v82 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              v83 = 2082;
              v84 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              v85 = 1024;
              v86 = 162;
              v87 = 2082;
              v88 = "childLayers";
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101259060);
            v25 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v55 = v25;
              v56 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v80 = v23;
              v81 = 2114;
              v82 = v56;
              _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 162, 0, "invalid nil value for '%{public}s'", "childLayers");

          }
          v28 = v17;
          v29 = v28;
          if (v28 != v9)
          {
            v30 = v28;
            do
            {
              v31 = ((uint64_t (*)(_QWORD *, void *))v6[2])(v6, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
              v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "superlayer"));
              if (!v33)
              {
                v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101259080);
                v35 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  v80 = v34;
                  v81 = 2082;
                  v82 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
                  v83 = 2082;
                  v84 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
                  v85 = 1024;
                  v86 = 173;
                  _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Each pushed parent layer should be a descendant of the last pushed parent layer (or top level layer if no other parent layers are pushed).", buf, 0x22u);
                }
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012590A0);
                v36 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  v42 = v36;
                  v43 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  v80 = v34;
                  v81 = 2114;
                  v82 = v43;
                  _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 173, 0, "Each pushed parent layer should be a descendant of the last pushed parent layer (or top level layer if no other parent layers are pushed).");

              }
              v39 = ((uint64_t (*)(_QWORD *, uint64_t))v6[2])(v6, v33);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              v78 = v32;
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
              objc_msgSend(v40, "setSublayers:", v41);

              v30 = (void *)v33;
            }
            while ((id)v33 != v9);
          }
          if (!v9)
          {
            v44 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012590C0);
            v45 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v80 = v44;
              v81 = 2082;
              v82 = "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]";
              v83 = 2082;
              v84 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m";
              v85 = 1024;
              v86 = 180;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cloned rep layer pile contained a pushed parent layer that was not descendent of a top level layer.", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012590E0);
            v46 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v57 = v46;
              v58 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v80 = v44;
              v81 = 2114;
              v82 = v58;
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 180, 0, "Cloned rep layer pile contained a pushed parent layer that was not descendent of a top level layer.");

          }
          v49 = ((uint64_t (*)(_QWORD *, void *))v6[2])(v6, v29);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          -[CRLInteractiveCanvasRepLayerPile pushParentLayer:](v70, "pushParentLayer:", v50);

          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "lastObject"));
          v8 = v72 + 1;
          v9 = v7;
        }
        while ((id)(v72 + 1) != v69);
        v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
      }
      while (v69);
    }

    while (-[NSMutableArray count](v63->_parentLayerAndChildLayersStack, "count"))
      -[CRLInteractiveCanvasRepLayerPile popParentLayer](v63, "popParentLayer");
    if (-[NSMutableOrderedSet count](v70->_topLevelLayers, "count") != (id)1)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101259100);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2D1B8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101259120);
      v59 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile newRepLayerPileByTransferringAndCloningParentLayers:]"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v60, v61, 191, 0, "A cloned parent layer hierarchy should contain only one top level layer.");

    }
    v5 = v65;
    a3 = v66;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return v70;
}

- (BOOL)isContentEqualToContentOfRepContentPile:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  unsigned __int8 v9;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class(CRLInteractiveCanvasRepLayerPile, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = -[NSMutableOrderedSet isEqualToOrderedSet:](self->_topLevelLayers, "isEqualToOrderedSet:", v8[1]);
  else
    v9 = 0;

  return v9;
}

- (NSArray)contentLayers
{
  void *v3;
  void *v4;
  void *v5;

  if (-[NSMutableArray count](self->_parentLayerAndChildLayersStack, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259140);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2D238();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259160);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepLayerPile contentLayers]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 215, 0, "Should not attempt to access content layers when some parent layers are still pushed, since the returned layers may not represent a complete layer hierarchy.");

  }
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_topLevelLayers, "array"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentLayerAndChildLayersStack, 0);
  objc_storeStrong((id *)&self->_topLevelLayers, 0);
}

@end
