@implementation CRLWPLayoutManager

- (CRLWPLayoutManager)initWithStorage:(id)a3 owner:(id)a4
{
  id v7;
  id v8;
  CRLWPLayoutManager *v9;
  CRLWPLayoutManager *v10;
  CRLWPLayoutManager *v11;
  uint64_t v12;
  _TtC8Freeform17CRLWPTopicNumbers *topicNumbers;
  _TtC8Freeform17CRLWPTopicNumbers *v14;
  _TtC8Freeform17CRLWPTopicNumbers *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLWPMutableDirtyRangeArray *v19;
  CRLWPMutableDirtyRangeArray *dirtyRanges;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  CKRecordID v32;
  Swift::String v33;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CRLWPLayoutManager;
  v9 = -[CRLWPLayoutManager init](&v34, "init");
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C720);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7E9C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C740);
      v22 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Cannot initialize with a nil storage.", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLWPLayoutManager initWithStorage:owner:]");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager initWithStorage:owner:]"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 95, 1, "Cannot initialize with a nil storage.");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v32, v33);
      abort();
    }
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeWeak((id *)&v10->_owner, v8);
    if ((objc_opt_respondsToSelector(v8, "topicNumbersForStorage:") & 1) != 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topicNumbersForStorage:", v7));
      topicNumbers = v11->_topicNumbers;
      v11->_topicNumbers = (_TtC8Freeform17CRLWPTopicNumbers *)v12;

    }
    if (!v11->_topicNumbers)
    {
      v14 = -[CRLWPTopicNumbers initWithStorage:]([_TtC8Freeform17CRLWPTopicNumbers alloc], "initWithStorage:", v10->_storage);
      v15 = v11->_topicNumbers;
      v11->_topicNumbers = v14;

      if (!v11->_topicNumbers)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122C760);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7F1C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122C780);
        v16 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager initWithStorage:owner:]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 110, 0, "invalid nil value for '%{public}s'", "_topicNumbers");

      }
    }
    v19 = objc_opt_new(CRLWPMutableDirtyRangeArray);
    dirtyRanges = v11->_dirtyRanges;
    v11->_dirtyRanges = v19;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLWPLayoutManager clearOwner](self, "clearOwner");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPLayoutManager;
  -[CRLWPLayoutManager dealloc](&v3, "dealloc");
}

- (id)styleProvider
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v10 = sub_100221DDC(WeakRetained, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLWPStyleProviding);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
    goto LABEL_5;
  if ((objc_msgSend(v11, "wantsToProvideStylesForTextLayout:", 0) & 1) == 0)
  {

LABEL_5:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPStorageStyleProvider styleProviderForStorage:](CRLWPStorageStyleProvider, "styleProviderForStorage:", self->_storage));
    return v12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "styleProvider"));

  return v12;
}

- (id)styleProviderForTextLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsToProvideStylesForTextLayout:(id)a3
{
  return 1;
}

- (void)clearOwner
{
  objc_storeWeak((id *)&self->_owner, 0);
}

- (void)clearTypesetterCache
{
  -[CRLWPCTTypesetterCache clearCache](self->_typesetterCache, "clearCache");
}

- (void)resetDirtyRange
{
  -[CRLWPMutableDirtyRangeArray clear](self->_dirtyRanges, "clear");
}

- (void)removeDirtyRange:(_NSRange)a3
{
  -[CRLWPMutableDirtyRangeArray removeRange:](self->_dirtyRanges, "removeRange:", a3.location, a3.length);
}

- (id)layoutMetricsCache
{
  return 0;
}

- (void)layOutIntoTarget:(id)a3 withLayoutState:(void *)a4 outSync:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  CRLWPMutableDirtyRangeArray *dirtyRanges;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  id v26;
  CRLWPMutableDirtyRangeArray *v27;
  char *v28;
  uint64_t v29;
  id WeakRetained;
  CRLWPMutableDirtyRangeArray *v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  char v42;
  id v43;
  CRLWPLayoutManager *v45;
  void *v46;
  _QWORD v47[3];

  v7 = a3;
  if (!a4)
  {
    -[CRLWPLayoutManager p_layoutConfigFlagsForTarget:](self, "p_layoutConfigFlagsForTarget:", v7);
    operator new();
  }
  self->_layoutFinished = 0;
  self->_isLayingOut = 1;
  v45 = (CRLWPLayoutManager *)*((id *)a4 + 3);
  if (v45 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", v45);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C7A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8048();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C7C0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager layOutIntoTarget:withLayoutState:outSync:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 404, 0, "Layout manager mismatch");

  }
  v11 = sub_100127BB8((uint64_t)a4, v7, 3670017);
  dirtyRanges = self->_dirtyRanges;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columns"));
  v14 = +[CRLWPColumn rangeOfColumns:](CRLWPColumn, "rangeOfColumns:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDirtyRangeArray dirtyRangesIntersecting:](dirtyRanges, "dirtyRangesIntersecting:", v14, v15));

  if ((objc_msgSend(v16, "isEmpty") & 1) == 0)
  {
    v17 = (char *)objc_msgSend(v16, "superRange");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columns"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));

    if (v21)
    {
      v22 = (char *)objc_msgSend(v21, "range");
      v24 = &v22[v23];
      if (&v22[v23] > v17)
      {
        v25 = &v17[v19];
        if (v24 >= v25)
        {
          -[CRLWPMutableDirtyRangeArray subtract:](self->_dirtyRanges, "subtract:", v16);
          WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
          objc_msgSend(WeakRetained, "layoutManager:didClearDirtyRangeWithDelta:afterCharIndex:", self, objc_msgSend(v16, "delta"), v25);
        }
        else
        {
          v26 = objc_msgSend(v16, "delta");
          -[CRLWPMutableDirtyRangeArray subtract:](self->_dirtyRanges, "subtract:", v16);
          v27 = self->_dirtyRanges;
          if (v24 <= v25)
            v28 = v25;
          else
            v28 = v24;
          if (v24 >= v25)
            v29 = (uint64_t)v25;
          else
            v29 = (uint64_t)v24;
          sub_10007C4CC(v29, (uint64_t)&v28[-v29], (uint64_t)v26, v47);
          -[CRLWPMutableDirtyRangeArray addRange:](v27, "addRange:", v47);
          WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
          objc_msgSend(WeakRetained, "didLayoutChangingDirtyRanges");
        }

        v31 = self->_dirtyRanges;
        v32 = -[CRLWPMutableDirtyRangeArray copy](v31, "copy");
        v33 = (void *)*((_QWORD *)a4 + 104);
        *((_QWORD *)a4 + 104) = v32;

        if (*((_BYTE *)a4 + 840))
          v34 = 1;
        else
          v34 = !-[CRLWPDirtyRangeArray isEmpty](v31, "isEmpty");
        *((_BYTE *)a4 + 840) = v34;

      }
    }

  }
  if ((v11 & 1) == 0)
  {
    (*(void (**)(void *))(*(_QWORD *)a4 + 8))(a4);
    -[CRLWPLayoutManager resetDirtyRange](self, "resetDirtyRange");
    a4 = 0;
  }
  if (objc_msgSend(v7, "textIsVertical", v45)
    && ((unint64_t)objc_msgSend(v7, "autosizeFlags") & 3) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columns"));
    if (objc_msgSend(v35, "count") != (id)1)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C7E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7FC8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C800);
      v36 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager layOutIntoTarget:withLayoutState:outSync:]"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 496, 0, "Autogrow with multiple columns is not supported");

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnMetricsForCharIndex:outRange:", objc_msgSend(v39, "range"), 0));
    +[CRLWPLayoutManager setTransformForColumn:inTarget:metrics:](CRLWPLayoutManager, "setTransformForColumn:inTarget:metrics:", v39, v7, v40);

  }
  v41 = objc_loadWeakRetained((id *)&self->_owner);
  v42 = objc_opt_respondsToSelector(v41, "didLayoutWithLayoutManager:");

  if ((v42 & 1) != 0)
  {
    v43 = objc_loadWeakRetained((id *)&self->_owner);
    objc_msgSend(v43, "didLayoutWithLayoutManager:", self);

  }
  self->_layoutFinished = v11 ^ 1;
  self->_isLayingOut = 0;

  return a4;
}

+ (void)fixColumnBoundsForTarget:(id)a3 storage:(id)a4 charIndex:(unint64_t)a5 firstColumnIndex:(unint64_t)a6 precedingHeight:(double)a7 height:(double)a8 alreadyHasMargins:(BOOL)a9 styleProvider:(id)a10
{
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double top;
  double v40;
  double left;
  double v42;
  double bottom;
  double v44;
  double right;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double MaxY;
  double v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  id v68;
  void *v69;
  double v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  BOOL v83;
  double *v84;
  double *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CRLWPColumn *v95;
  CRLWPColumn *v96;
  unsigned int v97;
  char *v98;
  unint64_t v99;
  void *v100;
  void *v101;
  id v102;
  double v103;
  double v104;
  double v105;
  double v106;
  id v107;
  id v109;
  CGFloat rect;
  BOOL v111;
  void *v112;
  unsigned int v113;
  double v115;
  double v116;
  double v117;
  uint64_t v118;
  double v119;
  __int128 v120;
  char v121[48];
  CGRect v122;
  CGRect v123;

  v16 = a3;
  v17 = a4;
  v102 = a10;
  v120 = xmmword_100EEE418;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "columnMetricsForCharIndex:outRange:", a5, &v120));
  v113 = objc_msgSend(v18, "columnsAreLeftToRight");
  if (v18)
    v19 = (unint64_t)objc_msgSend(v18, "columnCount");
  else
    v19 = 1;
  v99 = v19 + a6;
  if (!(v19 + a6))
  {
    v20 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C820);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_opt_class(v18, v22);
      sub_100DE8148(v23, (uint64_t)v121, v20, v21);
    }

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C840);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 562, 0, "newColumnCount shouldn't be 0. %{public}@", objc_opt_class(v18, v27));

  }
  v28 = objc_msgSend(v16, "textIsVertical");
  v29 = (unint64_t)v120 < a5 || a9;
  v111 = v29;
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPPadding padding](CRLWPPadding, "padding"));
  v30 = a6;
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "columns"));
  if (!v112)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C860);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE80C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C880);
    v31 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:]"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 573, 0, "invalid nil value for 'columnsArray'");

    v30 = a6;
  }
  objc_msgSend(v16, "currentSize");
  v36 = v34;
  v104 = v35;
  if (v28)
    v37 = v35;
  else
    v37 = v34;
  if (v18)
  {
    objc_msgSend(v18, "adjustedInsetsForTarget:", v16);
    top = v38;
    left = v40;
    bottom = v42;
    right = v44;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  v109 = objc_msgSend(v112, "count");
  v106 = v37;
  v103 = v36;
  v107 = objc_msgSend(v16, "pageNumber");
  v47 = top + a7;
  v48 = v37 - (right + left);
  v49 = a8 - (bottom + top);
  if (v48 >= 0.0)
    v50 = v37 - (right + left);
  else
    v50 = 0.0;
  rect = v50;
  if (((v48 < 0.0) & v28) != 0)
    v51 = v37 - (right + left);
  else
    v51 = -0.0;
  if (v49 >= 0.0)
    v52 = v49;
  else
    v52 = 0.0;
  if (!v30)
  {
    v105 = 0.0;
    goto LABEL_59;
  }
  if (!v111)
  {
    v57 = v30 - 1;
    while (1)
    {
      v58 = objc_opt_class(CRLWPColumn, v46);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "columns"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectAtIndexedSubscript:", v57));
      v61 = sub_100221D0C(v58, v60);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v61);

      v62 = objc_msgSend(v53, "range");
      if (v63)
        break;

      if (--v57 == -1)
      {
        v105 = 0.0;
        goto LABEL_58;
      }
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "columnMetricsForCharIndex:outRange:", v62, 0));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "layoutMargins"));
    v65 = v64;
    if (v64)
    {
      objc_msgSend(v64, "bottomInset");
      v105 = v66;
    }
    else
    {
      v105 = 0.0;
    }

    goto LABEL_56;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "columns"));
  v105 = 0.0;
  if ((unint64_t)objc_msgSend(v53, "count") > a6)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectAtIndexedSubscript:"));
    if (v54)
    {
      v122.origin.x = left + 0.0 + v51;
      v122.origin.y = top + a7;
      v122.size.width = rect;
      v122.size.height = v52;
      MaxY = CGRectGetMaxY(v122);
      objc_msgSend(v54, "frameBounds");
      v47 = v56;
      v52 = MaxY - v56;
      v105 = 0.0;
LABEL_56:

    }
  }

LABEL_58:
  v30 = a6;
LABEL_59:
  if ((objc_opt_respondsToSelector(v18, "layoutMarginsForTarget:") & 1) != 0)
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsForTarget:", v16));
  else
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMargins"));
  v67 = v100;
  if (v101)
    v67 = v101;
  v68 = v67;
  v69 = v68;
  if (v28)
  {
    objc_msgSend(v68, "topInset");
  }
  else if (v113)
  {
    objc_msgSend(v68, "leftInset");
  }
  else
  {
    objc_msgSend(v68, "rightInset");
  }
  v71 = v70;
  if (v99 > v30)
  {
    v72 = 0;
    do
    {
      v119 = rect;
      v118 = 0;
      if (v28)
      {
        objc_msgSend(v69, "topInset");
        v74 = v73;
        objc_msgSend(v69, "bottomInset");
        v76 = v104;
      }
      else
      {
        objc_msgSend(v69, "leftInset");
        v74 = v77;
        objc_msgSend(v69, "rightInset");
        v76 = v103;
      }
      v78 = v76 - v74 - v75;
      if (!objc_msgSend(v17, "wpKind") || objc_msgSend(v17, "wpKind") == 7)
        v78 = fmax(v78, 36.0);
      if (v18)
        objc_msgSend(v18, "positionForColumnIndex:bodyWidth:target:outWidth:outGap:", v72, v16, &v119, &v118, v78);
      else
        v79 = 0.0;
      if (v113)
        v80 = v71 + v79;
      else
        v80 = v78 - v71 - v79 - v119;
      v117 = v80;
      if (objc_msgSend(v17, "wpKind") && objc_msgSend(v17, "wpKind") != 7)
      {
        v81 = v119;
      }
      else
      {
        v81 = fmax(v119, 18.0);
        v119 = v81;
        v82 = v106 + (float)((float)v19 * -18.0);
        v116 = v82;
        if (v113)
        {
          v83 = v82 < v80;
          v84 = &v117;
          v85 = &v116;
        }
        else
        {
          v115 = v106 - v82 + -18.0;
          v83 = v80 < v115;
          v84 = &v117;
          v85 = &v115;
        }
        if (v83)
          v84 = v85;
        v80 = *v84;
        v117 = *v84;
      }
      v86 = v52;
      v87 = v47;
      if (!v111)
      {
        if (v28)
        {
          objc_msgSend(v69, "rightInset");
          v89 = v88;
          objc_msgSend(v16, "maxSize");
          v91 = v90;
        }
        else
        {
          objc_msgSend(v69, "topInset");
          v89 = v92;
          objc_msgSend(v16, "maxSize");
          v91 = v93;
        }
        v87 = v47 + v105 + v89;
        v123.origin.x = v80;
        v123.origin.y = v87;
        v123.size.width = v81;
        v123.size.height = v52;
        v94 = CGRectGetMaxY(v123);
        if (a6 || v94 <= v91)
        {
          v86 = v52;
        }
        else
        {
          v86 = v91 - v87;
          if (objc_msgSend(v17, "wpKind") && objc_msgSend(v17, "wpKind") != 7
            || v86 >= 36.0)
          {
            if (v86 < 1.0)
            {
              v87 = v91 + -1.0;
              v86 = 1.0;
            }
          }
          else
          {
            v87 = v91 + -36.0;
            v86 = 36.0;
          }
        }
      }
      if (a6 + v72 >= (unint64_t)v109)
      {
        if (v112)
        {
          v96 = -[CRLWPColumn initWithStorage:frameBounds:]([CRLWPColumn alloc], "initWithStorage:frameBounds:", v17, v80, v87, v81, v86);
          -[CRLWPColumn setStyleProvider:](v96, "setStyleProvider:", v102);
          -[CRLWPColumn setColumnIndex:](v96, "setColumnIndex:", a6 + v72);
          v95 = v96;
          objc_msgSend(v112, "addObject:", v96);
        }
        else
        {
          v95 = 0;
        }
      }
      else
      {
        v95 = (CRLWPColumn *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "objectAtIndexedSubscript:", a6 + v72));
        -[CRLWPColumn setFrameBounds:](v95, "setFrameBounds:", v80, v87, v81, v86);
      }
      -[CRLWPColumn setTextIsVertical:](v95, "setTextIsVertical:", objc_msgSend(v16, "textIsVertical"));
      -[CRLWPColumn setPageNumber:](v95, "setPageNumber:", v107);
      objc_msgSend(a1, "setTransformForColumn:inTarget:metrics:", v95, v16, v18);

      ++v72;
      --v19;
    }
    while (v19);
  }
  v97 = objc_msgSend(v17, "wpKind");
  if (!a6)
  {
    if (v97)
    {
      v98 = (char *)objc_msgSend(v112, "count");
      if ((unint64_t)v98 > v99)
        objc_msgSend(v112, "removeObjectsInRange:", v99, &v98[-v99]);
    }
  }

}

+ (void)setTransformForColumn:(id)a3 inTarget:(id)a4 metrics:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "textIsVertical"))
  {
    if (((unint64_t)objc_msgSend(v8, "autosizeFlags") & 3) != 0)
    {
      objc_msgSend(v9, "adjustedInsetsForTarget:", v8);
      v11 = v10;
      objc_msgSend(v7, "frameBounds");
      v12 = v11 + CGRectGetMaxY(v19);
    }
    else
    {
      objc_msgSend(v8, "currentSize");
    }
    CGAffineTransformMakeTranslation(&v18, v12, 0.0);
    v16 = v18;
    CGAffineTransformRotate(&v17, &v16, 1.57079633);
    *(_OWORD *)&v18.a = *(_OWORD *)&v17.a;
    *(_OWORD *)&v18.c = *(_OWORD *)&v17.c;
    v14 = *(_OWORD *)&v17.tx;
  }
  else
  {
    v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v18.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v18.c = v13;
    v14 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  *(_OWORD *)&v18.tx = v14;
  v15[0] = *(_OWORD *)&v18.a;
  v15[1] = *(_OWORD *)&v18.c;
  v15[2] = v14;
  objc_msgSend(v7, "setTransformFromWP:", v15);

}

+ (void)setTransformForColumn:(id)a3 andInvalidateWPRect:(CGRect)a4 inTarget:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "columnMetricsForCharIndex:outRange:", objc_msgSend(v10, "range"), 0));
  +[CRLWPLayoutManager setTransformForColumn:inTarget:metrics:](CRLWPLayoutManager, "setTransformForColumn:inTarget:metrics:", v10, v11, v12);
  if (v10)
    objc_msgSend(v10, "transformFromWP");
  else
    memset(&v13, 0, sizeof(v13));
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v15 = CGRectApplyAffineTransform(v14, &v13);
  objc_msgSend(v11, "setNeedsDisplayInTargetRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);

}

- (CRLWPCTTypesetterCache)typesetterCache
{
  CRLWPLayoutManager *v2;
  CRLWPCTTypesetterCache *typesetterCache;
  CRLWPCTTypesetterCache *v4;
  CRLWPCTTypesetterCache *v5;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_useLigatures || v2->_shouldClearTypesetterCache)
  {
    -[CRLWPLayoutManager clearTypesetterCache](v2, "clearTypesetterCache");
    v2->_useLigatures = 1;
    v2->_shouldClearTypesetterCache = 0;
  }
  objc_sync_exit(v2);

  typesetterCache = v2->_typesetterCache;
  if (!typesetterCache)
  {
    v4 = objc_alloc_init(CRLWPCTTypesetterCache);
    v5 = v2->_typesetterCache;
    v2->_typesetterCache = v4;

    typesetterCache = v2->_typesetterCache;
  }
  return typesetterCache;
}

- (unint64_t)p_layoutConfigFlagsForTarget:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "descendersCannotClip"))
      v6 = 4;
    else
      v6 = 0;
  }
  else if (-[CRLWPStorage wpKind](self->_storage, "wpKind") && -[CRLWPStorage wpKind](self->_storage, "wpKind") != 7)
  {
    v6 = 0;
  }
  else
  {
    v6 = 4;
  }
  if (objc_msgSend(v5, "textIsVertical"))
    v6 = 20;

  return v6;
}

- (void)p_clearTypesetterCacheForNotification:(id)a3
{
  CRLWPLayoutManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_shouldClearTypesetterCache = 1;
  objc_sync_exit(obj);

}

- (void)initialLayoutStateForLayout:(id)a3
{
  id v3;
  __int128 v5;
  uint64_t v6;

  v3 = a3;
  v5 = 0uLL;
  v6 = 0;
  sub_10007C4CC(0x7FFFFFFFFFFFFFFFLL, 0, 0, &v5);
  operator new();
}

- (void)destroyLayoutState:(void *)a3
{
  if (a3)
    (*(void (**)(void *))(*(_QWORD *)a3 + 8))(a3);
}

- (CRLWPLayoutOwner)owner
{
  return (CRLWPLayoutOwner *)objc_loadWeakRetained((id *)&self->_owner);
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return self->_storage;
}

- (CRLWPDirtyRangeArray)dirtyRanges
{
  return &self->_dirtyRanges->super;
}

- (BOOL)layoutFinished
{
  return self->_layoutFinished;
}

- (BOOL)isLayingOut
{
  return self->_isLayingOut;
}

- (_TtC8Freeform17CRLWPTopicNumbers)topicNumbers
{
  return self->_topicNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicNumbers, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_typesetterCache, 0);
  objc_storeStrong((id *)&self->_dirtyRanges, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
