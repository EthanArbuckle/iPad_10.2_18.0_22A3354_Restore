@implementation CRLEditorController

- (CRLEditorController)initWithEditingCoordinator:(id)a3 rootEditor:(id)a4 debugName:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLEditorController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *mEditorStack;
  NSMutableArray *v23;
  NSMutableArray *mResignedTextInputEditors;
  NSMutableDictionary *v25;
  NSMutableDictionary *mInspectorPropertyValueMap;
  NSString *v27;
  NSString *mDebugName;
  _TtC8Freeform17CRLBoardSelection *v29;
  void *v30;
  uint64_t v31;
  CRLSelectionPath *mSelectionPath;
  objc_super v34;
  _TtC8Freeform17CRLBoardSelection *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)CRLEditorController;
  v11 = -[CRLEditorController init](&v34, "init");
  if (v11)
  {
    if (v8)
    {
      if (v9)
        goto LABEL_4;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DD18);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E01A70();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DD38);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController initWithEditingCoordinator:rootEditor:debugName:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 68, 0, "invalid nil value for '%{public}s'", "editingCoordinator");

      if (v9)
      {
LABEL_4:
        if (v10)
        {
LABEL_33:
          objc_storeWeak((id *)&v11->mEditingCoordinator, v8);
          v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          mEditorStack = v11->mEditorStack;
          v11->mEditorStack = v21;

          v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          mResignedTextInputEditors = v11->mResignedTextInputEditors;
          v11->mResignedTextInputEditors = v23;

          v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          mInspectorPropertyValueMap = v11->mInspectorPropertyValueMap;
          v11->mInspectorPropertyValueMap = v25;

          v27 = (NSString *)objc_msgSend(v10, "copy");
          mDebugName = v11->mDebugName;
          v11->mDebugName = v27;

          v29 = objc_alloc_init(_TtC8Freeform17CRLBoardSelection);
          v35 = v29;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
          v31 = objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v30));
          mSelectionPath = v11->mSelectionPath;
          v11->mSelectionPath = (CRLSelectionPath *)v31;

          objc_msgSend(v9, "setEditorController:", v11);
          -[CRLEditorController p_pushEditor:](v11, "p_pushEditor:", v9);
          goto LABEL_34;
        }
LABEL_24:
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123DD98);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E01958();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123DDB8);
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController initWithEditingCoordinator:rootEditor:debugName:]"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 70, 0, "invalid nil value for '%{public}s'", "debugName");

        goto LABEL_33;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DD58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E019E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DD78);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController initWithEditingCoordinator:rootEditor:debugName:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 69, 0, "invalid nil value for '%{public}s'", "rootEditor");

    if (v10)
      goto LABEL_33;
    goto LABEL_24;
  }
LABEL_34:

  return v11;
}

- (CRLEditorController)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123DDD8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLEditorController init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
    v17 = 1024;
    v18 = 85;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123DDF8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 85, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLEditorController init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  NSString *mDebugName;
  id v7;
  const __CFString *v8;
  void *v9;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  mDebugName = self->mDebugName;
  v7 = -[NSMutableArray count](self->mEditorStack, "count");
  v8 = &stru_1012A72B0;
  if (!v7)
    v8 = CFSTR(" TORN DOWN");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>: %@%@"), v5, self, mDebugName, v8));

  return v9;
}

- (void)teardown
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  -[CRLEditorController p_beginTransaction](self, "p_beginTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->mEditorStack, "firstObject"));
  v4 = -[NSMutableArray copy](self->mEditorStack, "copy");
  -[CRLEditorController p_popEditor:](self, "p_popEditor:", v3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "tearDown") & 1) != 0)
          objc_msgSend(v10, "tearDown", (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[CRLEditorController p_endTransaction](self, "p_endTransaction");
}

- (NSArray)currentEditors
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->mEditorStack);
}

- (CRLTextInputEditor)textInputEditor
{
  return (CRLTextInputEditor *)objc_loadWeakRetained((id *)&self->mTextInputEditor);
}

- (CRLSelectionPath)selectionPath
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[NSMutableArray count](self->mEditorStack, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DE18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E01AFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DE38);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController selectionPath]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 123, 0, "Asking a torn-down editor controller for its current selection.");

  }
  return self->mSelectionPath;
}

- (BOOL)isChangingSelection
{
  void *v3;
  void *v4;
  void *v5;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DE58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E01B7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DE78);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController isChangingSelection]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 129, 0, "This operation must only be performed on the main thread.");

  }
  return self->mReentrancyValue > 0;
}

- (void)setSelectionPath:(id)a3
{
  -[CRLEditorController setSelectionPath:withFlags:](self, "setSelectionPath:withFlags:", a3, 0);
}

- (void)setSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t mReentrancyValue;
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
  void *v34;
  void *v35;
  CRLSelectionPath *v36;
  void *v37;
  unsigned __int8 v38;
  int v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  unsigned int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  int v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  unsigned int v84;
  void *v85;
  void *v86;
  void *v87;
  unsigned int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  void *v102;
  unint64_t v103;
  unint64_t v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  uint64_t v115;
  void *i;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  uint64_t v128;
  void *v129;
  unint64_t v130;
  unint64_t v131;
  id v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  NSMutableArray *mBlocksToPerform;
  id v139;
  id *location;
  id v141;
  CRLSelectionPath *v142;
  int v143;
  int v144;
  CRLEditorController *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  uint64_t v153;
  BOOL v154;
  id v155;
  id v156;
  id v157;
  id obj;
  id obja;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  uint8_t v178[128];
  uint8_t buf[4];
  _BYTE v180[30];
  __int16 v181;
  id v182;
  __int16 v183;
  void *v184;
  __int16 v185;
  id v186;
  _BYTE v187[128];

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DE98);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      sub_100E020C4();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DEB8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      sub_100E01D7C();

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 138, 0, "This operation must only be performed on the main thread.");

  }
  if (-[CRLEditorController selectionChangeDisabled](self, "selectionChangeDisabled"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DED8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E01BFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DEF8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    v13 = "Cannot set the selection while the canvas is doing background layout!";
    v14 = v11;
    v15 = v12;
    v16 = 141;
LABEL_21:
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, v16, 0, v13);

    goto LABEL_197;
  }
  if (v5)
  {
    if (!-[NSMutableArray count](self->mEditorStack, "count"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DF58);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E01CFC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DF78);
      v35 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v35);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
      v13 = "Should never set a selection on an editor controller that has already been torn down! It won't work.";
      v14 = v11;
      v15 = v12;
      v16 = 153;
      goto LABEL_21;
    }
    if (self->mReentrancyValue)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DF98);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
        sub_100E02044();

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DFB8);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        sub_100E01D7C();

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 157, 0, "re-entrant call to CRLEditorController");

      mReentrancyValue = self->mReentrancyValue;
      self->mReentrancyValue = mReentrancyValue + 1;
      if (mReentrancyValue)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123DFD8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E01FC4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123DFF8);
        v22 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v22);
        sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Intentionally crashing for reentrant setSelectionPath: call to avoid mangled state", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLEditorController setSelectionPath:withFlags:]");
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 169, 1, "Intentionally crashing for reentrant setSelectionPath: call to avoid mangled state");

        SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v32, v33);
        abort();
      }
    }
    else
    {
      self->mReentrancyValue = 1;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v36 = self->mSelectionPath;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
    v38 = objc_msgSend(v5, "isEqual:", v37);

    if ((a4 & 0x400) == 0 && (v38 & 1) != 0)
    {
      v39 = 0;
LABEL_194:
      --self->mReentrancyValue;
      -[CRLEditorController notifyResignedTextInputEditors](self, "notifyResignedTextInputEditors");
      if (v39)
      {
        v133 = objc_alloc((Class)NSDictionary);
        v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
        v135 = objc_msgSend(v133, "initWithObjectsAndKeys:", v134, CFSTR("CRLEditorControllerSelectionFlagsKey"), v11, CFSTR("CRLEditorControllerEditorsKey"), v36, CFSTR("CRLEditorControllerOldSelectionPathKey"), 0);

        v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v136, "postNotificationName:object:userInfo:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), self, v135);

      }
      v137 = -[NSMutableArray copy](self->mBlocksToPerform, "copy");
      mBlocksToPerform = self->mBlocksToPerform;
      self->mBlocksToPerform = 0;

      objc_msgSend(v137, "makeObjectsPerformSelector:", "invoke");
      goto LABEL_197;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
    v41 = objc_msgSend(v5, "isEqual:", v40);

    if (qword_10147E590 != -1)
      dispatch_once(&qword_10147E590, &stru_10123E018);
    v42 = off_1013DA0A0;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
      sub_100E01EA8(self, v5, v42);
    v143 = v41 ^ 1;

    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath orderedSelections](v36, "orderedSelections"));
    if (!objc_msgSend(v43, "count"))
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orderedSelections"));
      v73 = objc_msgSend(v72, "count");

      if (!v73)
        goto LABEL_71;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionAtIndex:", 0));
      objc_opt_class(_TtC8Freeform17CRLBoardSelection, v74);
      if ((objc_opt_isKindOfClass(v43, v75) & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123E038);
        v76 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v76, OS_LOG_TYPE_ERROR))
          sub_100E01E18();

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123E058);
        v77 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_ERROR))
          sub_100E01D7C();

        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 218, 0, "Least specific selection MUST be a board selection. Selection path is malformed. %@", v5);

      }
    }

LABEL_71:
    location = (id *)&self->mSelectionPath;
    v146 = v11;
    v44 = v5;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orderedSelections"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectEnumerator"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "nextObject"));
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController currentEditors](self, "currentEditors"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectEnumerator"));

    obj = v49;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v172, v187, 16);
    v145 = self;
    v142 = v36;
    v155 = v46;
    if (v50)
    {
      v51 = v50;
      v52 = 0;
      v53 = *(_QWORD *)v173;
      v54 = (uint64_t)v47;
LABEL_73:
      v55 = 0;
      while (1)
      {
        v56 = v52;
        v47 = (void *)v54;
        if (*(_QWORD *)v173 != v53)
          objc_enumerationMutation(obj);
        v57 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController currentEditors](v145, "currentEditors"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndex:", 0));

        if (v57 == v59)
        {
          if (v47)
          {
            objc_opt_class(_TtC8Freeform17CRLBoardSelection, v60);
            if ((objc_opt_isKindOfClass(v47, v63) & 1) == 0)
            {
              v64 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10123E078);
              v65 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                *(_DWORD *)v180 = v64;
                *(_WORD *)&v180[4] = 2082;
                *(_QWORD *)&v180[6] = "-[CRLEditorController setSelectionPath:withFlags:]";
                *(_WORD *)&v180[14] = 2082;
                *(_QWORD *)&v180[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
                *(_WORD *)&v180[24] = 1024;
                *(_DWORD *)&v180[26] = 234;
                v181 = 2112;
                v182 = v44;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v65, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Least specific selection MUST be a board selection. Selection path is malformed. %@", buf, 0x2Cu);
              }

              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10123E098);
              v66 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_ERROR))
              {
                v69 = (id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v180 = v64;
                *(_WORD *)&v180[4] = 2114;
                *(_QWORD *)&v180[6] = v69;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v66, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
              v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v67, v68, 234, 0, "Least specific selection MUST be a board selection. Selection path is malformed. %@", v44);

            }
          }
        }
        else if (!v47
               || (objc_msgSend(v57, "shouldRemainOnEditorStackForSelection:inSelectionPath:withNewEditors:", v47, v44, v150) & 1) == 0)
        {
          v141 = v57;
          v71 = 1;
          self = v145;
          v36 = v142;
          v52 = v56;
          v46 = v155;
          goto LABEL_108;
        }
        v61 = v57;
        v62 = v56;

        v46 = v155;
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "nextObject"));

        v52 = v61;
        objc_msgSend(v150, "addObject:", v52);
        if (v51 == (id)++v55)
        {
          v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v187, 16);
          v51 = v70;
          if (!v70)
          {
            v141 = 0;
            v47 = (void *)v54;
            self = v145;
            v36 = v142;
            goto LABEL_107;
          }
          goto LABEL_73;
        }
      }
    }
    v141 = 0;
    v52 = 0;
LABEL_107:
    v71 = v143;
LABEL_108:

    v5 = v44;
    obja = v52;
    if (v47)
    {
      if ((objc_opt_respondsToSelector(v52, "shouldDiscardAllSubselectionsStartingWithSelection:withNewEditorStack:selectionPath:") & 1) != 0&& objc_msgSend(v52, "shouldDiscardAllSubselectionsStartingWithSelection:withNewEditorStack:selectionPath:", v47, v150, v44))
      {
        v80 = v44;
        v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "selectionPathPoppingOffSelection:", v47));
        v11 = v146;
      }
      else
      {
        v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "nextEditorForSelection:withNewEditorStack:selectionPath:", v47, v150, v44));
        if (v81)
        {
          v82 = (void *)v81;
          v11 = v146;
          while (1)
          {
            objc_msgSend(v150, "addObject:", v82);
            if (v46)
            {
              v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "nextObject"));

              v47 = (void *)v83;
              if (!v83)
              {
                v80 = v82;
                goto LABEL_141;
              }
            }
            if ((objc_opt_respondsToSelector(v82, "shouldDiscardAllSubselectionsStartingWithSelection:withNewEditorStack:selectionPath:") & 1) != 0&& objc_msgSend(v82, "shouldDiscardAllSubselectionsStartingWithSelection:withNewEditorStack:selectionPath:", v47, v150, v5))
            {
              v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPathPoppingOffSelection:", v47));

              v80 = v82;
              v5 = (id)v93;
              goto LABEL_141;
            }
            v80 = v82;
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "nextEditorForSelection:withNewEditorStack:selectionPath:", v47, v150, v5));

            if (!v82)
              break;

            v46 = v155;
          }
          v88 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10123E0F8);
          v89 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110658;
            *(_DWORD *)v180 = v88;
            *(_WORD *)&v180[4] = 2082;
            *(_QWORD *)&v180[6] = "-[CRLEditorController setSelectionPath:withFlags:]";
            *(_WORD *)&v180[14] = 2082;
            *(_QWORD *)&v180[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
            *(_WORD *)&v180[24] = 1024;
            *(_DWORD *)&v180[26] = 307;
            v181 = 2112;
            v182 = v80;
            v183 = 2112;
            v184 = v47;
            v185 = 2112;
            v186 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v89, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d oldEditor %@ didn't push editor for selection %@ in selection path %@", buf, 0x40u);
          }

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10123E118);
          v90 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v90, OS_LOG_TYPE_ERROR))
          {
            v139 = (id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v180 = v88;
            *(_WORD *)&v180[4] = 2114;
            *(_QWORD *)&v180[6] = v139;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v90, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
          v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v91, v92, 307, 0, "oldEditor %@ didn't push editor for selection %@ in selection path %@", v80, v47, v5);

LABEL_141:
          v52 = obja;
        }
        else
        {
          v84 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          v11 = v146;
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10123E0B8);
          v85 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110658;
            *(_DWORD *)v180 = v84;
            *(_WORD *)&v180[4] = 2082;
            *(_QWORD *)&v180[6] = "-[CRLEditorController setSelectionPath:withFlags:]";
            *(_WORD *)&v180[14] = 2082;
            *(_QWORD *)&v180[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
            *(_WORD *)&v180[24] = 1024;
            *(_DWORD *)&v180[26] = 277;
            v181 = 2112;
            v182 = obja;
            v183 = 2112;
            v184 = v47;
            v185 = 2112;
            v186 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v85, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d oldEditor %@ didn't push editor for selection %@ in selection path %@", buf, 0x40u);
          }

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10123E0D8);
          v86 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v86, OS_LOG_TYPE_ERROR))
            sub_100E01D7C();

          v80 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v80, v87, 277, 0, "oldEditor %@ didn't push editor for selection %@ in selection path %@", obja, v47, v5);

          v52 = obja;
        }
      }

      v46 = v155;
    }
    else
    {
      v11 = v146;
    }

    v144 = v71;
    if (v52)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath orderedSelections](v36, "orderedSelections"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectEnumerator"));

      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "nextObject"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orderedSelections"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectEnumerator"));

      v156 = v98;
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "nextObject"));
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      v171 = 0u;
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "objectEnumerator"));
      v100 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v168, v178, 16);
      if (v100)
      {
        v101 = v100;
        v147 = 0;
        v153 = *(_QWORD *)v169;
        do
        {
          v102 = 0;
          v103 = (unint64_t)v96;
          v104 = (unint64_t)v99;
          do
          {
            if (*(_QWORD *)v169 != v153)
              objc_enumerationMutation(v151);
            v105 = *(id *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)v102);
            if (v103 | v104 && (objc_msgSend((id)v103, "isEqual:", v104) & 1) == 0)
            {
              v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "selectionWillChangeFromSelection:toSelection:withFlags:inSelectionPath:withNewEditors:", v103, v104, a4, v5, v150));
              v107 = v106;
              if (v106 && (objc_msgSend(v106, "isEqual:", v104) & 1) == 0)
              {
                if (qword_10147E598 != -1)
                  dispatch_once(&qword_10147E598, &stru_10123E138);
                v108 = off_1013DA0A8;
                if (os_log_type_enabled((os_log_t)v108, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)v180 = v105;
                  *(_WORD *)&v180[8] = 2112;
                  *(_QWORD *)&v180[10] = v104;
                  *(_WORD *)&v180[18] = 2112;
                  *(_QWORD *)&v180[20] = v107;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v108, OS_LOG_TYPE_DEBUG, "editor %@ modified its selection component from %@ to %@", buf, 0x20u);
                }

                v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orderedSelections"));
                v148 = v5;
                v110 = objc_msgSend(v109, "mutableCopy");

                objc_msgSend(v110, "replaceObjectAtIndex:withObject:", (char *)v102 + v147, v107);
                v111 = (id)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v110));

                v5 = v111;
                v11 = v146;
                v52 = obja;
              }
              objc_msgSend(v11, "addObject:", v105);

            }
            if (v105 == v52)
            {

              v95 = 0;
              v96 = 0;
            }
            else
            {
              v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "nextObject"));
            }

            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "nextObject"));
            v102 = (char *)v102 + 1;
            v103 = (unint64_t)v96;
            v104 = (unint64_t)v99;
          }
          while (v101 != v102);
          v101 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v168, v178, 16);
          v147 += (uint64_t)v102;
        }
        while (v101);
      }

      self = v145;
      v36 = v142;
    }
    v112 = v141;
    v154 = v141 != 0;
    if (v141)
      -[CRLEditorController p_popEditor:](self, "p_popEditor:", v141);
    objc_storeStrong(location, v5);
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v157 = v150;
    v113 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v164, v177, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v165;
      do
      {
        for (i = 0; i != v114; i = (char *)i + 1)
        {
          if (*(_QWORD *)v165 != v115)
            objc_enumerationMutation(v157);
          v117 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)i);
          if ((-[NSMutableArray containsObject:](self->mEditorStack, "containsObject:", v117) & 1) == 0)
          {
            -[CRLEditorController p_pushEditor:](self, "p_pushEditor:", v117);
            v154 = 1;
          }
        }
        v114 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v164, v177, 16);
      }
      while (v114);
    }

    v118 = obja;
    if (obja)
    {
      v149 = v5;
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath orderedSelections](v36, "orderedSelections"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectEnumerator"));

      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "nextObject"));
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*location, "orderedSelections"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectEnumerator"));

      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "nextObject"));
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      v163 = 0u;
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "objectEnumerator"));
      v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
      if (v126)
      {
        v127 = v126;
        v128 = *(_QWORD *)v161;
        do
        {
          v129 = 0;
          v130 = (unint64_t)v121;
          v131 = (unint64_t)v124;
          do
          {
            if (*(_QWORD *)v161 != v128)
              objc_enumerationMutation(v125);
            v132 = *(id *)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)v129);
            if (v130 | v131 && (objc_msgSend((id)v130, "isEqual:", v131) & 1) == 0)
              objc_msgSend(v132, "selectionDidChangeFromSelection:toSelection:withFlags:", v130, v131, a4);
            if (v132 == obja)
            {

              v120 = 0;
              v121 = 0;
            }
            else
            {
              v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "nextObject"));
            }

            v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "nextObject"));
            v129 = (char *)v129 + 1;
            v130 = (unint64_t)v121;
            v131 = (unint64_t)v124;
          }
          while (v127 != v129);
          v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
        }
        while (v127);
      }

      v5 = v149;
      self = v145;
      v11 = v146;
      v112 = v141;
      v36 = v142;
      v118 = obja;
    }
    -[CRLEditorController p_refreshTextInputEditorWithFlags:](self, "p_refreshTextInputEditorWithFlags:", a4);
    if (v154)
      -[CRLEditorController p_didChangeCurrentEditors](self, "p_didChangeCurrentEditors");

    v39 = v144;
    goto LABEL_194;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123DF18);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E01C7C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123DF38);
  v34 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v34);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v11, 146, 0, "Should never set a nil selection path on the editor controller!");
LABEL_197:

}

- (void)performBlockAfterSettingSelection:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *mBlocksToPerform;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  NSMutableArray *v14;

  v4 = (void (**)(_QWORD))a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E158);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E021C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E178);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController performBlockAfterSettingSelection:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 424, 0, "This operation must only be performed on the main thread.");

  }
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E198);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E02144();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E1B8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController performBlockAfterSettingSelection:]"));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 425, 0, "Should send in a non-nil block to this method.");
    goto LABEL_27;
  }
  if (self->mReentrancyValue)
  {
    mBlocksToPerform = self->mBlocksToPerform;
    if (mBlocksToPerform)
      v9 = mBlocksToPerform;
    else
      v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v13 = self->mBlocksToPerform;
    self->mBlocksToPerform = v9;

    v14 = self->mBlocksToPerform;
    v11 = objc_msgSend(v4, "copy");
    v12 = objc_retainBlock(v11);
    -[NSMutableArray addObject:](v14, "addObject:", v12);
LABEL_27:

    goto LABEL_28;
  }
  v4[2](v4);
LABEL_28:

}

- (void)setSelection:(id)a3 forEditor:(id)a4
{
  -[CRLEditorController setSelection:forEditor:withFlags:](self, "setSelection:forEditor:withFlags:", a3, a4, 0);
}

- (void)setSelection:(id)a3 forEditor:(id)a4 withFlags:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionForEditor:](self, "selectionForEditor:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathPoppingOffSelection:", v12));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPathWithAppendedSelection:", v8));
  -[CRLEditorController setSelectionPath:withFlags:](self, "setSelectionPath:withFlags:", v11, a5);

}

- (void)setSelectionPathToPopEditor:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPathToPopEditor:](self, "selectionPathToPopEditor:", a3));
  -[CRLEditorController setSelectionPath:](self, "setSelectionPath:", v4);

}

- (void)setSelectionPathToPopToEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orderedSelections"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionForEditor:](self, "selectionForEditor:", v4));
  v7 = (char *)objc_msgSend(v11, "indexOfObject:", v6);

  if (v7 < (char *)objc_msgSend(v11, "count") - 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v7 + 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathPoppingOffSelection:", v8));

    -[CRLEditorController setSelectionPath:](self, "setSelectionPath:", v10);
  }

}

- (void)pushSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E1D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E02244();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E1F8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController pushSelection:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 466, 0, "invalid nil value for '%{public}s'", "selection");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPathWithAppendedSelection:", v4));
  -[CRLEditorController setSelectionPath:](self, "setSelectionPath:", v9);

}

- (id)selectionForEditor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = -[NSMutableArray indexOfObject:](self->mEditorStack, "indexOfObject:", v4);
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionAtIndex:", v10));

      goto LABEL_14;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E218);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E022D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E238);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController selectionForEditor:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 475, 0, "Editor %@ must be on the stack to retrieve its associated selection", v4);

  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (id)selectionPathToPopEditor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionForEditor:](self, "selectionForEditor:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController selectionPath](self, "selectionPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPathPoppingOffSelection:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)refreshTextInputEditor
{
  void *v3;
  void *v4;
  void *v5;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E258);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E02360();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E278);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController refreshTextInputEditor]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 495, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLEditorController p_refreshTextInputEditorWithFlags:](self, "p_refreshTextInputEditorWithFlags:", 0);
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4
{
  return -[CRLEditorController editorForEditAction:withSender:response:](self, "editorForEditAction:withSender:response:", a3, a4, 0);
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4 response:(int64_t *)a5
{
  unint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  char **v15;
  char **v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  unsigned int v23;
  id v24;
  int64_t v25;
  id v26;
  int64_t *v28;
  char *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v30 = a4;
  v8 = -[CRLEditorController editingDisabledReasons](self, "editingDisabledReasons");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController editingCoordinator](self, "editingCoordinator"));
  v10 = objc_msgSend(v9, "canPerformUserAction");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v28 = a5;
    v13 = v8 | v10 ^ 1;
    v14 = *(_QWORD *)v33;
    v15 = &selRef_callStackDescriptionWithAction_callStackSymbols_index_;
    v16 = &selRef_pencilKitCanvasViewControllerForFreehandDrawingTools;
LABEL_3:
    v17 = 0;
    v18 = v15[75];
    v29 = v16[47];
    while (1)
    {
      if (*(_QWORD *)v33 != v14)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
      if ((objc_opt_respondsToSelector(v19, v18) & 1) != 0)
      {
        if (!v13
          || ((objc_opt_respondsToSelector(v19, v29) & 1) == 0
            ? (v20 = 0)
            : (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "permittedActionsForReasons:", v13))),
              v21 = NSStringFromSelector(a3),
              v22 = (void *)objc_claimAutoreleasedReturnValue(v21),
              v23 = objc_msgSend(v20, "containsObject:", v22),
              v22,
              v20,
              v23))
        {
          v24 = objc_msgSend(v19, "canPerformEditorAction:withSender:", a3, v30, v28);
          if (v24)
            break;
        }
      }
      if (v12 == (id)++v17)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v15 = &selRef_callStackDescriptionWithAction_callStackSymbols_index_;
        v16 = &selRef_pencilKitCanvasViewControllerForFreehandDrawingTools;
        if (v12)
          goto LABEL_3;
        v25 = 0;
        goto LABEL_19;
      }
    }
    v25 = (int64_t)v24;
    if (v24 == (id)1)
    {
      v26 = v19;
      goto LABEL_20;
    }
LABEL_19:
    v26 = 0;
LABEL_20:
    a5 = v28;
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }

  if (a5)
    *a5 = v25;

  return v26;
}

- (BOOL)anyEditorProhibitsAction:(SEL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "shouldProhibitAction:") & 1) != 0
          && (objc_msgSend(v9, "shouldProhibitAction:", a3) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)p_pushEditor:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (qword_10147E598 != -1)
    dispatch_once(&qword_10147E598, &stru_10123E298);
  v5 = off_1013DA0A8;
  if (os_log_type_enabled((os_log_t)off_1013DA0A8, OS_LOG_TYPE_DEBUG))
  {
    sub_100E024EC((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    if (v4)
      goto LABEL_5;
  }
  else if (v4)
  {
LABEL_5:
    if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", v4) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E2F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0246C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E318);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_pushEditor:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 603, 0, "shouldn't push the same editor twice");

    }
    if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", v4) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray addObject:](self->mEditorStack, "addObject:", v4);
      if ((objc_opt_respondsToSelector(v4, "didBecomeCurrentEditorForEditorController:") & 1) != 0)
        objc_msgSend(v4, "didBecomeCurrentEditorForEditorController:", self);
    }
    goto LABEL_28;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E2B8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E023E0();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E2D8);
  v15 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_pushEditor:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 599, 0, "invalid nil value for '%{public}s'", "newEditor");

LABEL_28:
}

- (void)p_popEditor:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  id v19;
  id WeakRetained;
  id v21;
  NSMutableArray *mResignedTextInputEditors;
  id v23;

  v4 = a3;
  if (qword_10147E598 != -1)
    dispatch_once(&qword_10147E598, &stru_10123E338);
  v5 = off_1013DA0A8;
  if (os_log_type_enabled((os_log_t)off_1013DA0A8, OS_LOG_TYPE_DEBUG))
  {
    sub_100E0265C((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    if (v4)
      goto LABEL_14;
  }
  else if (v4)
  {
    goto LABEL_14;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E358);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E025D0();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E378);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_popEditor:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 619, 0, "invalid nil value for '%{public}s'", "poppedEditor");

LABEL_14:
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", v4) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E398);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E02550();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E3B8);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_popEditor:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 620, 0, "shouldn't pop an editor that isn't on the stack");

  }
  if (v4
    && -[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", v4) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = (char *)-[NSMutableArray count](self->mEditorStack, "count") + 1;
    do
    {
      if (!--v18)
        break;
      v19 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->mEditorStack, "lastObject"));
      WeakRetained = objc_loadWeakRetained((id *)&self->mTextInputEditor);

      if (v19 == WeakRetained)
      {
        if ((objc_opt_respondsToSelector(v19, "willResignTextInputEditor") & 1) != 0)
          objc_msgSend(v19, "willResignTextInputEditor");
        v21 = objc_loadWeakRetained((id *)&self->mTextInputEditor);

        if (v21)
        {
          mResignedTextInputEditors = self->mResignedTextInputEditors;
          v23 = objc_loadWeakRetained((id *)&self->mTextInputEditor);
          -[NSMutableArray addObject:](mResignedTextInputEditors, "addObject:", v23);

        }
        objc_storeWeak((id *)&self->mTextInputEditor, 0);
      }
      if ((objc_opt_respondsToSelector(v19, "willResignCurrentEditor") & 1) != 0)
        objc_msgSend(v19, "willResignCurrentEditor");
      -[NSMutableArray removeLastObject](self->mEditorStack, "removeLastObject");

    }
    while (v19 != v4);
  }

}

- (void)p_beginTransaction
{
  ++self->mTransactionLevel;
}

- (void)p_endTransaction
{
  unint64_t mTransactionLevel;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  mTransactionLevel = self->mTransactionLevel;
  if (mTransactionLevel)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E3D8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E026C0();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E3F8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_endTransaction]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 660, 0, "unbalanced endTransaction");

  mTransactionLevel = self->mTransactionLevel;
  if (mTransactionLevel)
  {
LABEL_11:
    v7 = mTransactionLevel - 1;
    self->mTransactionLevel = v7;
    if (!v7)
    {
      if (self->mDidChangeTextInputEditor)
      {
        -[CRLEditorController p_didChangeTextInputEditor](self, "p_didChangeTextInputEditor");
        self->mDidChangeTextInputEditor = 0;
      }
      if (self->mDidChangeCurrentEditors)
      {
        -[CRLEditorController p_didChangeCurrentEditors](self, "p_didChangeCurrentEditors");
        self->mDidChangeCurrentEditors = 0;
      }
    }
  }
}

- (void)notifyResignedTextInputEditors
{
  unint64_t v3;
  void *v4;

  if (!self->mIsReentrantResigningTextInputEditors)
  {
    self->mIsReentrantResigningTextInputEditors = 1;
    if (-[NSMutableArray count](self->mResignedTextInputEditors, "count"))
    {
      v3 = 0;
      do
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->mResignedTextInputEditors, "objectAtIndex:", v3));
        if ((objc_opt_respondsToSelector(v4, "didResignTextInputEditor") & 1) != 0)
          objc_msgSend(v4, "didResignTextInputEditor");

        ++v3;
      }
      while (v3 < (unint64_t)-[NSMutableArray count](self->mResignedTextInputEditors, "count"));
    }
    -[NSMutableArray removeAllObjects](self->mResignedTextInputEditors, "removeAllObjects");
    self->mIsReentrantResigningTextInputEditors = 0;
  }
}

- (void)enumerateEditorsOnStackUsingBlock:(id)a3
{
  NSMutableArray *mEditorStack;
  id v5;
  id v6;

  mEditorStack = self->mEditorStack;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](mEditorStack, "reverseObjectEnumerator"));
  -[CRLEditorController p_enumerateEditorsWithEnumerator:usingBlock:](self, "p_enumerateEditorsWithEnumerator:usingBlock:", v6, v5);

}

- (void)enumerateEditorsOnStackLeastToMostSpecificUsingBlock:(id)a3
{
  NSMutableArray *mEditorStack;
  id v5;
  id v6;

  mEditorStack = self->mEditorStack;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectEnumerator](mEditorStack, "objectEnumerator"));
  -[CRLEditorController p_enumerateEditorsWithEnumerator:usingBlock:](self, "p_enumerateEditorsWithEnumerator:usingBlock:", v6, v5);

}

- (void)p_enumerateEditorsWithEnumerator:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, char *);
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];

  v5 = a3;
  v6 = (void (**)(id, _QWORD, char *))a4;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11), &v16);
      if (v16)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)currentEditorsOfClass:(Class)a3
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = objc_alloc_init((Class)NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->mEditorStack;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v11, a3) & 1) != 0)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->mEditorStack, "lastObject"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v9, a3) & 1) != 0)
        {
          v11 = v9;

          return v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  return 0;
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3 conformingToProtocol:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        if ((!a3 || (objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), a3) & 1) != 0)
          && (objc_msgSend(v12, "conformsToProtocol:", v6) & 1) != 0)
        {
          v13 = v12;
          goto LABEL_13;
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)currentEditorsConformingToProtocol:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->mEditorStack;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "conformsToProtocol:", v4, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mostSpecificEditorConformingToProtocol:(id)a3
{
  return -[CRLEditorController mostSpecificCurrentEditorOfClass:conformingToProtocol:](self, "mostSpecificCurrentEditorOfClass:conformingToProtocol:", 0, a3);
}

- (void)setObject:(id)a3 forInspectorPropertyKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mInspectorPropertyValueMap, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForInspectorPropertyKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->mInspectorPropertyValueMap, "removeObjectForKey:", a3);
}

- (id)objectForInspectorPropertyKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mInspectorPropertyValueMap, "objectForKey:", a3);
}

- (void)editorDidChangeSelectionAndWantsKeyboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E418);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E027A4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E438);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController editorDidChangeSelectionAndWantsKeyboard:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 789, 0, "invalid nil value for '%{public}s'", "editor");

  }
  if (qword_10147E598 != -1)
    dispatch_once(&qword_10147E598, &stru_10123E458);
  v8 = off_1013DA0A8;
  if (os_log_type_enabled((os_log_t)off_1013DA0A8, OS_LOG_TYPE_DEBUG))
    sub_100E02740((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("CRLEditorControllerSelectionDidChangeAndWantsKeyboard"), self, 0);

}

- (void)p_refreshTextInputEditorWithFlags:(unint64_t)a3
{
  CRLTextInputEditor **p_mTextInputEditor;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  NSMutableArray *mResignedTextInputEditors;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  CRLEditorController *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const __CFString *v40;
  void *v41;
  uint8_t buf[4];
  CRLEditorController *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];

  p_mTextInputEditor = &self->mTextInputEditor;
  WeakRetained = objc_loadWeakRetained((id *)&self->mTextInputEditor);
  objc_storeWeak((id *)p_mTextInputEditor, 0);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "shouldBecomeTextInputEditor") & 1) != 0
          && objc_msgSend(v11, "shouldBecomeTextInputEditor")
          && objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_))
        {
          objc_opt_class(NSObject, v12);
          v19 = sub_10022209C(v11, v13, 1, v14, v15, v16, v17, v18, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          objc_storeWeak((id *)p_mTextInputEditor, v20);

          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  v21 = objc_loadWeakRetained((id *)p_mTextInputEditor);
  if (WeakRetained != v21)
  {
    if (qword_10147E598 != -1)
      dispatch_once(&qword_10147E598, &stru_10123E478);
    v22 = off_1013DA0A8;
    if (os_log_type_enabled((os_log_t)off_1013DA0A8, OS_LOG_TYPE_DEBUG))
    {
      v32 = v22;
      v33 = objc_loadWeakRetained((id *)p_mTextInputEditor);
      *(_DWORD *)buf = 134218498;
      v43 = v35;
      v44 = 2112;
      v45 = WeakRetained;
      v46 = 2112;
      v47 = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%p Change text input editor from %@ to %@", buf, 0x20u);

    }
    if ((objc_opt_respondsToSelector(WeakRetained, "willResignTextInputEditor") & 1) != 0)
      objc_msgSend(WeakRetained, "willResignTextInputEditor");
    if (WeakRetained)
      -[NSMutableArray addObject:](v35->mResignedTextInputEditors, "addObject:", WeakRetained);
    v23 = objc_loadWeakRetained((id *)p_mTextInputEditor);
    v24 = objc_opt_respondsToSelector(v23, "didBecomeTextInputEditor");

    if ((v24 & 1) != 0)
    {
      v25 = objc_loadWeakRetained((id *)p_mTextInputEditor);
      objc_msgSend(v25, "didBecomeTextInputEditor");

      v26 = objc_loadWeakRetained((id *)p_mTextInputEditor);
      if (v26)
      {
        mResignedTextInputEditors = v35->mResignedTextInputEditors;
        v28 = objc_loadWeakRetained((id *)p_mTextInputEditor);
        -[NSMutableArray removeObject:](mResignedTextInputEditors, "removeObject:", v28);

      }
    }
    v40 = CFSTR("CRLEditorControllerSelectionFlagsKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v41 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v31, "postNotificationName:object:userInfo:", CFSTR("CRLEditorControllerDidChangeTextInputEditor"), v35, v30);

  }
}

- (void)p_didChangeTextInputEditor
{
  id v3;

  if (self->mTransactionLevel)
  {
    self->mDidChangeTextInputEditor = 1;
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CRLEditorControllerDidChangeTextInputEditor"), self);

  }
}

- (void)p_didChangeCurrentEditors
{
  id v3;

  if (self->mTransactionLevel)
  {
    self->mDidChangeCurrentEditors = 1;
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CRLEditorControllerDidChangeCurrentEditors"), self);

  }
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)objc_loadWeakRetained((id *)&self->mEditingCoordinator);
}

- (BOOL)selectionChangeDisabled
{
  return self->mSelectionChangeDisabled;
}

- (void)setSelectionChangeDisabled:(BOOL)a3
{
  self->mSelectionChangeDisabled = a3;
}

- (unint64_t)editingDisabledReasons
{
  return self->mEditingDisabledReasons;
}

- (void)setEditingDisabledReasons:(unint64_t)a3
{
  self->mEditingDisabledReasons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBlocksToPerform, 0);
  objc_storeStrong((id *)&self->mInspectorPropertyValueMap, 0);
  objc_storeStrong((id *)&self->mResignedTextInputEditors, 0);
  objc_destroyWeak((id *)&self->mTextInputEditor);
  objc_storeStrong((id *)&self->mSelectionPath, 0);
  objc_storeStrong((id *)&self->mEditorStack, 0);
  objc_storeStrong((id *)&self->mDebugName, 0);
  objc_destroyWeak((id *)&self->mEditingCoordinator);
}

@end
