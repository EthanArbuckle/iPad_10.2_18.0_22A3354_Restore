@implementation CRLInteractiveCanvasRepContentSubviewUpdater

- (CRLInteractiveCanvasRepContentSubviewUpdater)initWithRepContainerView:(id)a3
{
  id v5;
  CRLInteractiveCanvasRepContentSubviewUpdater *v6;
  CRLInteractiveCanvasRepContentSubviewUpdater *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLInteractiveCanvasRepContentSubviewUpdater;
  v6 = -[CRLInteractiveCanvasRepContentSubviewUpdater init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_repContainerView, a3);

  return v7;
}

- (void)updateSubviewsFromRepContentPiles:(id)a3
{
  id v4;

  v4 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    -[CRLInteractiveCanvasRepContentSubviewUpdater p_mainThreadUpdateSubviewsFromRepContentPiles:](self, "p_mainThreadUpdateSubviewsFromRepContentPiles:", v4);
  else
    -[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:](self, "p_backgroundThreadUpdateSubviewsFromRepContentPiles:", v4);

}

- (void)p_mainThreadUpdateSubviewsFromRepContentPiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  NSArray *v18;
  void *v19;
  id v20;
  NSMapTable *v21;
  void *v22;
  NSArray *backgroundUpdateSubviewReusers;
  NSArray *v24;
  NSMapTable *reusableMaskViewsForRepContainerSubviews;
  NSMapTable *v26;
  _QWORD v27[14];

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244BB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0CB38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244BD0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_mainThreadUpdateSubviewsFromRepContentPiles:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 86, 0, "This operation must only be performed on the main thread.");

  }
  ++self->_lastMainThreadUpdateSeed;
  self->_needsUpdateOnMainThread = 0;
  -[CRLCanvasSubview frame](self->_repContainerView, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v4, "count");
  v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v16);
  v18 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview subviews](self->_repContainerView, "subviews"));
  v20 = objc_msgSend(v19, "count");
  v21 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, v16);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10020AA54;
  v27[3] = &unk_101244C78;
  v27[4] = v19;
  v27[5] = self;
  v27[10] = v9;
  v27[11] = v11;
  v27[12] = v13;
  v27[13] = v15;
  v27[6] = v17;
  v27[7] = v21;
  v27[8] = v18;
  v27[9] = v20;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v27);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview subviews](self->_repContainerView, "subviews"));
  LOBYTE(v20) = objc_msgSend(v17, "isEqualToArray:", v22);

  if ((v20 & 1) == 0)
    -[CRLCanvasSubview setSubviews:](self->_repContainerView, "setSubviews:", v17);
  backgroundUpdateSubviewReusers = self->_backgroundUpdateSubviewReusers;
  self->_backgroundUpdateSubviewReusers = v18;
  v24 = v18;

  reusableMaskViewsForRepContainerSubviews = self->_reusableMaskViewsForRepContainerSubviews;
  self->_reusableMaskViewsForRepContainerSubviews = v21;
  v26 = v21;

}

+ (id)p_contentPlatformViewForRepContentPlatformViewPile:(id)a3 layerDelegate:(id)a4 reusableMaskView:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double x;
  double y;
  double width;
  double height;
  CRLCanvasSubview *v22;
  CRLCanvasSubview *v23;
  CRLCanvasSubview *v24;
  void *v25;
  void *v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentPlatformView"));
  if (!v9)
  {
    v22 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "contentPlatformViewFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v7, "contentPlatformViewMaskRect");
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  if (!CGRectIsNull(v28))
  {
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v32.origin.x = v11;
    v32.origin.y = v13;
    v32.size.width = v15;
    v32.size.height = v17;
    if (!CGRectContainsRect(v29, v32))
    {
      v23 = (CRLCanvasSubview *)*a5;
      if (v23)
      {
        v22 = v23;
        -[CRLCanvasSubview setFrame:](v23, "setFrame:", x, y, width, height);
      }
      else
      {
        v24 = objc_alloc_init(CRLCanvasSubview);
        -[CRLCanvasSubview setLayerDelegate:](v24, "setLayerDelegate:", v8);
        -[CRLCanvasSubview setClipsToBounds:](v24, "setClipsToBounds:", 1);
        v22 = objc_retainAutorelease(v24);
        *a5 = v22;
        -[CRLCanvasSubview setFrame:](v22, "setFrame:", x, y, width, height);
        if (!v22)
          goto LABEL_4;
      }
      v30.origin.x = v11;
      v30.origin.y = v13;
      v30.size.width = v15;
      v30.size.height = v17;
      v31 = CGRectOffset(v30, -x, -y);
      objc_msgSend(v9, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
      v27 = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      -[CRLCanvasSubview setSubviews:](v22, "setSubviews:", v25);

      goto LABEL_10;
    }
  }
LABEL_4:
  objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
  v22 = v9;
LABEL_10:

  return v22;
}

- (void)p_backgroundThreadUpdateSubviewsFromRepContentPiles:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  __objc2_prot **v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  os_log_t v36;
  char *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  unsigned __int8 v41;
  unsigned int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  char *v53;
  char *v54;
  id v55;
  os_log_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *i;
  unint64_t lastMainThreadUpdateSeed;
  id v73;
  id v74;
  id v75;
  void *v76;
  unint64_t v77;
  os_log_t log;
  NSObject *loga;
  id v80;
  void *v81;
  id obj;
  uint64_t v83;
  _QWORD block[7];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[128];
  uint8_t buf[4];
  unsigned int v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  void *v103;
  _BYTE v104[128];

  v4 = a3;
  v5 = -[NSArray count](self->_backgroundUpdateSubviewReusers, "count");
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244C98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0CDEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244CB8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 260, 0, "Layout should have run at least once on the main thread.");

  }
  v9 = objc_alloc_init((Class)NSMutableArray);
  v73 = objc_alloc_init((Class)NSMutableArray);
  v74 = objc_alloc_init((Class)NSMutableArray);
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
  if (v10)
  {
    v17 = v10;
    log = 0;
    v18 = v5 - 1;
    v19 = &off_1012C6000;
    v83 = *(_QWORD *)v90;
    v77 = v5;
    do
    {
      v20 = 0;
      v80 = v17;
      do
      {
        if (*(_QWORD *)v90 != v83)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v20);
        v22 = sub_100221DDC(v21, 1, v11, v12, v13, v14, v15, v16, (uint64_t)v19[265]);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v30 = v23;
        if (v23)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentLayers"));
          objc_msgSend(v9, "addObjectsFromArray:", v31);
        }
        else
        {
          v32 = sub_100221DDC(v21, 1, v24, v25, v26, v27, v28, v29, (uint64_t)&OBJC_PROTOCOL___CRLInteractiveCanvasRepContentPlatformViewPile);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (v33)
          {
            v31 = (void *)v33;
            v81 = v9;
            v34 = objc_alloc_init((Class)NSMutableArray);
            v35 = objc_alloc_init((Class)NSMutableArray);
            if ((unint64_t)&log->isa + 1 >= v5)
              goto LABEL_35;
            v36 = log;
            while (1)
            {
              v37 = (char *)&v36->isa + 1;
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_backgroundUpdateSubviewReusers, "objectAtIndexedSubscript:", (char *)&v36->isa + 1));
              v39 = objc_msgSend(v38, "canReuseForRepContentLayersDuringBackgroundUpdate");
              v40 = v34;
              if ((v39 & 1) == 0)
              {
                v41 = objc_msgSend(v38, "canReuseUnmodifiedForRepContentPile:", v31);
                v40 = v35;
                if ((v41 & 1) != 0)
                  break;
              }
              objc_msgSend(v40, "addObject:", v38);

              v36 = (os_log_t)((char *)v36 + 1);
              if ((char *)v18 == v37)
                goto LABEL_35;
            }

            if (v36 == (os_log_t)0x7FFFFFFFFFFFFFFELL)
            {
LABEL_35:
              self->_needsUpdateOnMainThread = 1;
            }
            else
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_backgroundUpdateSubviewReusers, "objectAtIndexedSubscript:", log));
              if ((objc_msgSend(v76, "canReuseForRepContentLayersDuringBackgroundUpdate") & 1) == 0)
              {
                v46 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101244CD8);
                v47 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  v95 = v46;
                  v96 = 2082;
                  v97 = "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]";
                  v98 = 2082;
                  v99 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m";
                  v100 = 1024;
                  v101 = 318;
                  _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Rep content subviews with platform views should always be sandwiched between rep content subviews with layers", buf, 0x22u);
                }
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101244CF8);
                v48 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  loga = v48;
                  v54 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  v95 = v46;
                  v96 = 2114;
                  v97 = v54;
                  _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]"));
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v49, v50, 318, 0, "Rep content subviews with platform views should always be sandwiched between rep content subviews with layers");

              }
              objc_msgSend(v76, "reuseForRepContentLayers:", v81);
              v75 = objc_alloc_init((Class)NSMutableArray);

              log = (os_log_t)((char *)&v36->isa + 2);
              objc_msgSend(v73, "addObjectsFromArray:", v34);
              objc_msgSend(v74, "addObjectsFromArray:", v35);

              v81 = v75;
            }

            v5 = v77;
            v9 = v81;
          }
          else
          {
            v42 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101244D18);
            v43 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v95 = v42;
              v96 = 2082;
              v97 = "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]";
              v98 = 2082;
              v99 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m";
              v100 = 1024;
              v101 = 342;
              v102 = 2112;
              v103 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Rep content pile did not implement either CRLInteractiveCanvasRepLayerPile or CRLInteractiveCanvasRepContentPlatformViewPile: %@", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101244D38);
            v44 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v51 = v9;
              v52 = v44;
              v53 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v95 = v42;
              v96 = 2114;
              v97 = v53;
              _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              v9 = v51;
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v45, 342, 0, "Rep content pile did not implement either CRLInteractiveCanvasRepLayerPile or CRLInteractiveCanvasRepContentPlatformViewPile: %@", v21);

          }
          v19 = &off_1012C6000;
          v17 = v80;
        }

        v20 = (char *)v20 + 1;
      }
      while (v20 != v17);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
      v17 = v55;
    }
    while (v55);
  }
  else
  {
    log = 0;
  }

  v56 = log;
  if ((unint64_t)log >= v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    v58 = v74;
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244D58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0CD6C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244D78);
    v62 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v62);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v57, v63, 348, 0, "There should always be a rep content subview with layers on top.");

  }
  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_backgroundUpdateSubviewReusers, "objectAtIndexedSubscript:", log));
    v58 = v74;
    if ((objc_msgSend(v57, "canReuseForRepContentLayersDuringBackgroundUpdate") & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244D98);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0CCEC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244DB8);
      v59 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v60, v61, 351, 0, "The topmost rep content subview should always contain layers");

      v56 = log;
    }
    objc_msgSend(v57, "reuseForRepContentLayers:", v9);
  }

  v64 = (char *)&v56->isa + 1;
  if ((unint64_t)&v56->isa + 1 < v5)
  {
    do
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_backgroundUpdateSubviewReusers, "objectAtIndexedSubscript:", v64));
      if (objc_msgSend(v65, "canReuseForRepContentLayersDuringBackgroundUpdate"))
        v66 = v73;
      else
        v66 = v58;
      objc_msgSend(v66, "addObject:", v65);

      ++v64;
    }
    while ((char *)v5 != v64);
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v67 = v73;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v69; i = (char *)i + 1)
      {
        if (*(_QWORD *)v86 != v70)
          objc_enumerationMutation(v67);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i), "reuseForRepContentLayers:", &__NSArray0__struct);
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v69);
  }

  if (objc_msgSend(v58, "count"))
  {
    lastMainThreadUpdateSeed = self->_lastMainThreadUpdateSeed;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10020C094;
    block[3] = &unk_10122EC90;
    block[5] = v58;
    block[6] = lastMainThreadUpdateSeed;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)updateSubviewFrames
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244DD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0CE6C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244DF8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater updateSubviewFrames]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 398, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLCanvasSubview frame](self->_repContainerView, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview subviews](self->_repContainerView, "subviews", 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v19, "setFrame:", v7, v9, v11, v13);
        objc_msgSend(v19, "setBounds:", v7, v9, v11, v13);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

}

- (BOOL)needsUpdateOnMainThread
{
  return self->_needsUpdateOnMainThread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableMaskViewsForRepContainerSubviews, 0);
  objc_storeStrong((id *)&self->_backgroundUpdateSubviewReusers, 0);
  objc_storeStrong((id *)&self->_repContainerView, 0);
}

@end
