@implementation CRLDrawableZOrderArranger

- (CRLDrawableZOrderArranger)initWithCanvasEditor:(id)a3
{
  id v4;
  CRLDrawableZOrderArranger *v5;
  CRLDrawableZOrderArranger *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLDrawableZOrderArranger;
  v5 = -[CRLDrawableZOrderArranger init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mCanvasEditor, v4);

  return v6;
}

- (CRLDrawableZOrderArranger)init
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
    dispatch_once(&qword_10147E370, &stru_101262C50);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLDrawableZOrderArranger init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m";
    v17 = 1024;
    v18 = 28;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101262C70);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 28, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLDrawableZOrderArranger init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (id)commandToSetZOrderOfInfos:(id)a3 toIndexes:(id)a4 coalesceable:(BOOL)a5
{
  id v7;
  id v8;
  _TtC8Freeform34CRLCommandReorderContainerChildren *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _TtC8Freeform34CRLCommandReorderContainerChildren *v14;

  v7 = a3;
  v8 = a4;
  v9 = [_TtC8Freeform34CRLCommandReorderContainerChildren alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "board"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootContainer"));
  v14 = -[CRLCommandReorderContainerChildren initWithParentContainer:childrenToMove:targetIndices:](v9, "initWithParentContainer:childrenToMove:targetIndices:", v13, v7, v8);

  return v14;
}

- (void)registerTargetForChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger canvasEditor](self, "canvasEditor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "changeNotifier"));
  *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform16CRLContainerItem, v7).n128_u64[0];
  objc_msgSend(v6, "addObserver:forChangeSourceOfClass:", v4, v9, v8);

}

- (void)unregisterTargetForChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger canvasEditor](self, "canvasEditor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "changeNotifier"));
  *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform16CRLContainerItem, v7).n128_u64[0];
  objc_msgSend(v6, "removeObserver:forChangeSourceOfClass:", v4, v9, v8);

}

- (BOOL)isZOrderChangeRecord:(id)a3
{
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (objc_msgSend(v3, "kind") == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "details"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1004AB068;
    v7[3] = &unk_101262C98;
    v7[4] = &v8;
    objc_msgSend(v4, "enumeratePropertiesUsingBlock:", v7);

  }
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (unint64_t)minZValueForArrangeInspector
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262CB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C2C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262CD8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger minZValueForArrangeInspector]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 64, 0, "Cannot get the current min z-value for a cross-container selection");

  }
  return -[CRLDrawableZOrderArranger p_minIndex](self, "p_minIndex");
}

- (unint64_t)maxZValueForArrangeInspector
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262CF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C348();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262D18);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger maxZValueForArrangeInspector]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 70, 0, "Cannot get the current max z-value for a cross-container selection");

  }
  return -[CRLDrawableZOrderArranger p_maxIndex](self, "p_maxIndex");
}

- (unint64_t)currentZValueForArrangeInspector
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262D38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C3C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262D58);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger currentZValueForArrangeInspector]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 76, 0, "Cannot get the current z-value for a cross-container selection");

  }
  result = -[CRLDrawableZOrderArranger p_zOrderIndex](self, "p_zOrderIndex");
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return -[CRLDrawableZOrderArranger p_minIndex](self, "p_minIndex");
  return result;
}

- (BOOL)canSendDrawablesBackward
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  id v19;
  unint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  if (!objc_msgSend(v4, "hasSelectedInfosInMultipleContainers"))
  {
    v14 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    v16 = objc_msgSend(v15, "count");

    if ((unint64_t)v16 < 2)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
      v19 = objc_msgSend(v18, "count");

      if (v19 == (id)1)
      {
        v20 = -[CRLDrawableZOrderArranger indexOfNextLowerCanvasObject](self, "indexOfNextLowerCanvasObject");
        v17 = v14 != 0x7FFFFFFFFFFFFFFFLL && v14 > v20;
        goto LABEL_21;
      }
    }
    else if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v14 > -[CRLDrawableZOrderArranger minZValueForArrangeInspector](self, "minZValueForArrangeInspector");
LABEL_21:
      v13 = v17;
      goto LABEL_25;
    }
    v13 = 0;
    goto LABEL_25;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containersForSelection", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v5, v11);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL
          && v12 > -[CRLDrawableZOrderArranger p_minZValueOfChildren:inContainer:](self, "p_minZValueOfChildren:inContainer:", v5, v11))
        {
          v13 = 1;
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

LABEL_25:
  return v13;
}

- (BOOL)canBringDrawablesForward
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  id v19;
  unint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  if (!objc_msgSend(v4, "hasSelectedInfosInMultipleContainers"))
  {
    v14 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    v16 = objc_msgSend(v15, "count");

    if ((unint64_t)v16 < 2)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
      v19 = objc_msgSend(v18, "count");

      if (v19 == (id)1)
      {
        v20 = -[CRLDrawableZOrderArranger indexOfNextHigherCanvasObject](self, "indexOfNextHigherCanvasObject");
        v17 = v14 == 0x7FFFFFFFFFFFFFFFLL || v14 >= v20;
        goto LABEL_21;
      }
    }
    else if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v14 >= -[CRLDrawableZOrderArranger maxZValueForArrangeInspector](self, "maxZValueForArrangeInspector");
LABEL_21:
      v13 = !v17;
      goto LABEL_25;
    }
    v13 = 0;
    goto LABEL_25;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containersForSelection", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v5, v11);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL
          && v12 < -[CRLDrawableZOrderArranger p_maxZValueOfChildren:inContainer:](self, "p_maxZValueOfChildren:inContainer:", v5, v11))
        {
          v13 = 1;
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

LABEL_25:
  return v13;
}

- (void)arrangeInspectorWillBeginChangingZValue
{
  CRLCanvasEditor **p_mCanvasEditor;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  self->mCanCoalesceZOrderCommand = 0;
  p_mCanvasEditor = &self->mCanvasEditor;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("canBringDrawablesForward"));

  v4 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  objc_msgSend(v4, "willChangeValueForKey:", CFSTR("canSendDrawablesBackward"));

  v5 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));
  objc_msgSend(v7, "openGroup");

  v10 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));
  objc_msgSend(v9, "enableProgressiveEnqueuingInCurrentGroup");

}

- (void)arrangeInspectorDidSetZValue:(unint64_t)a3 forContainer:(id)a4
{
  id v6;
  CRLCanvasEditor **p_mCanvasEditor;
  id WeakRetained;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _BYTE *v26;
  _BYTE *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  char *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  objc_class *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  CRLCanvasCommandSelectionBehavior *v50;
  id v51;
  CRLCanvasCommandSelectionBehavior *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  objc_class *v56;
  id v57;
  void *v58;
  CRLCanvasCommandSelectionBehavior *v59;
  void *v60;
  _TtC8Freeform34CRLCommandReorderContainerChildren *v61;
  void *v62;

  v6 = a4;
  p_mCanvasEditor = &self->mCanvasEditor;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v10 = objc_msgSend(v9, "hasSelectedInfosInMultipleContainers");

  if (!v6 && v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262D78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C4C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262D98);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 147, 0, "If we have a cross-container selection, the container whose z-order is being changed must be specified!");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    goto LABEL_16;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  if (!v6)
  {
LABEL_16:
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderedSelectedObjects](self, "p_zOrderedSelectedObjects"));
    goto LABEL_17;
  }
  *(_QWORD *)&v16 = objc_opt_class(NSArray, v15).n128_u64[0];
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childInfos", v16));
  v20 = sub_100221D0C(v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)v21;
  v23 = &__NSArray0__struct;
  if (v21)
    v23 = (void *)v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "crl_arrayWithObjectsInSet:", v14));
LABEL_17:
  v26 = objc_msgSend(v25, "count");
  if (v26)
  {
    v27 = v26;
    v28 = -[CRLDrawableZOrderArranger p_minZValueOfChildren:inContainer:](self, "p_minZValueOfChildren:inContainer:", v14, v6);
    v29 = -[CRLDrawableZOrderArranger p_maxZValueOfChildren:inContainer:](self, "p_maxZValueOfChildren:inContainer:", v14, v6);
    if (v29 < v28)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262DB8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3C448();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262DD8);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v30);
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 166, 0, "Max index for z-order is below min index! This is not good. Skipping z-order operation entirely.");
LABEL_44:

      goto LABEL_45;
    }
    v33 = v29;
    if (-[CRLDrawableZOrderArranger p_usingRelativeZOrder](self, "p_usingRelativeZOrder"))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblingsForRelativeOrder](self, "p_zOrderSiblingsForRelativeOrder"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", a3));

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v35));
      a3 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v36, 0);

      p_mCanvasEditor = &self->mCanvasEditor;
    }
    if (a3 >= v33)
      v37 = v33;
    else
      v37 = a3;
    if (a3 >= v28)
      v38 = (char *)v37;
    else
      v38 = (char *)v28;
    if (v38 != (char *)-[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v14, v6))
    {
      v31 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", v38 - v27 + 1, v27);
      v39 = objc_loadWeakRetained((id *)p_mCanvasEditor);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "interactiveCanvasController"));

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "commandController"));
      if (!v6)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topLevelContainerInfoForEditing"));
        objc_opt_class(NSObject, v42);
        v49 = sub_1002220C8(v41, v43, 1, v44, v45, v46, v47, v48, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
        v6 = (id)objc_claimAutoreleasedReturnValue(v49);

      }
      v50 = [CRLCanvasCommandSelectionBehavior alloc];
      v51 = objc_loadWeakRetained((id *)p_mCanvasEditor);
      v52 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v50, "initWithCanvasEditor:type:", v51, 2);

      objc_opt_class(_TtC8Freeform12CRLBoardItem, v53);
      if ((objc_opt_isKindOfClass(v6, v54) & 1) != 0)
      {
        objc_opt_class(_TtC8Freeform16CRLContainerItem, v55);
        v57 = sub_1002223BC(v56, v6);
        v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "crl_arrayOfObjectsPassingTest:", &stru_101262E18));
        v59 = v52;
        v60 = v40;
        v61 = -[CRLCommandReorderContainerChildren initWithParentContainer:childrenToMove:targetIndices:]([_TtC8Freeform34CRLCommandReorderContainerChildren alloc], "initWithParentContainer:childrenToMove:targetIndices:", v58, v62, v31);
        objc_msgSend(v60, "enqueueCommand:withSelectionBehavior:", v61, v59);
        self->mCanCoalesceZOrderCommand = 1;

        v40 = v60;
        v52 = v59;

      }
      else
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger commandToSetZOrderOfInfos:toIndexes:coalesceable:](self, "commandToSetZOrderOfInfos:toIndexes:coalesceable:", v25, v31, self->mCanCoalesceZOrderCommand));
        if (v58)
        {
          objc_msgSend(v40, "enqueueCommand:withSelectionBehavior:", v58, v52);
          self->mCanCoalesceZOrderCommand = 1;
        }
      }

      goto LABEL_44;
    }
  }
LABEL_45:

}

- (void)arrangeInspectorDidEndChangingZValue
{
  CRLCanvasEditor **p_mCanvasEditor;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;

  p_mCanvasEditor = &self->mCanvasEditor;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  objc_msgSend(WeakRetained, "didChangeValueForKey:", CFSTR("canBringDrawablesForward"));

  v4 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  objc_msgSend(v4, "didChangeValueForKey:", CFSTR("canSendDrawablesBackward"));

  v7 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  objc_msgSend(v6, "closeGroup");

}

- (void)moveToBackForArrangeInspector
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  -[CRLDrawableZOrderArranger arrangeInspectorWillBeginChangingZValue](self, "arrangeInspectorWillBeginChangingZValue");
  objc_msgSend(v5, "openGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Send to Back"), 0, CFSTR("UndoStrings")));

  objc_msgSend(v5, "setCurrentGroupActionString:", v7);
  if (objc_msgSend(v4, "hasSelectedInfosInMultipleContainers"))
  {
    v19 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containersForSelection"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v15 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v8, v14);
          v16 = -[CRLDrawableZOrderArranger p_minZValueOfChildren:inContainer:](self, "p_minZValueOfChildren:inContainer:", v8, v14);
          if (v15 != v16)
            -[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", v16, v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v7 = v19;
  }
  else
  {
    v17 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
    v18 = -[CRLDrawableZOrderArranger minZValueForArrangeInspector](self, "minZValueForArrangeInspector");
    if (v17 != v18)
      -[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", v18, 0);
  }
  objc_msgSend(v5, "closeGroup");
  -[CRLDrawableZOrderArranger arrangeInspectorDidEndChangingZValue](self, "arrangeInspectorDidEndChangingZValue");

}

- (void)moveBackForArrangeInspector
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  -[CRLDrawableZOrderArranger arrangeInspectorWillBeginChangingZValue](self, "arrangeInspectorWillBeginChangingZValue");
  objc_msgSend(v5, "openGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Send Backward"), 0, CFSTR("UndoStrings")));

  objc_msgSend(v5, "setCurrentGroupActionString:", v7);
  if (objc_msgSend(v4, "hasSelectedInfosInMultipleContainers"))
  {
    v17 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containersForSelection"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v8, v14);
          if (v15 > -[CRLDrawableZOrderArranger p_minZValueOfChildren:inContainer:](self, "p_minZValueOfChildren:inContainer:", v8, v14))-[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", v15 - 1, v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v7 = v17;
  }
  else
  {
    v16 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
    if (v16 > -[CRLDrawableZOrderArranger minZValueForArrangeInspector](self, "minZValueForArrangeInspector"))
      -[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", -[CRLDrawableZOrderArranger indexOfNextLowerCanvasObject](self, "indexOfNextLowerCanvasObject"), 0);
  }
  objc_msgSend(v5, "closeGroup");
  -[CRLDrawableZOrderArranger arrangeInspectorDidEndChangingZValue](self, "arrangeInspectorDidEndChangingZValue");

}

- (void)moveFrontForArrangeInspector
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  -[CRLDrawableZOrderArranger arrangeInspectorWillBeginChangingZValue](self, "arrangeInspectorWillBeginChangingZValue");
  objc_msgSend(v5, "openGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Bring Forward"), 0, CFSTR("UndoStrings")));

  objc_msgSend(v5, "setCurrentGroupActionString:", v7);
  if (objc_msgSend(v4, "hasSelectedInfosInMultipleContainers"))
  {
    v17 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containersForSelection"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v8, v14);
          if (v15 < -[CRLDrawableZOrderArranger p_maxZValueOfChildren:inContainer:](self, "p_maxZValueOfChildren:inContainer:", v8, v14))-[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", v15 + 1, v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v7 = v17;
  }
  else
  {
    v16 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
    if (v16 < -[CRLDrawableZOrderArranger maxZValueForArrangeInspector](self, "maxZValueForArrangeInspector"))
      -[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", -[CRLDrawableZOrderArranger indexOfNextHigherCanvasObject](self, "indexOfNextHigherCanvasObject"), 0);
  }
  objc_msgSend(v5, "closeGroup");
  -[CRLDrawableZOrderArranger arrangeInspectorDidEndChangingZValue](self, "arrangeInspectorDidEndChangingZValue");

}

- (void)moveToFrontForArrangeInspector
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  -[CRLDrawableZOrderArranger arrangeInspectorWillBeginChangingZValue](self, "arrangeInspectorWillBeginChangingZValue");
  objc_msgSend(v5, "openGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Bring to Front"), 0, CFSTR("UndoStrings")));

  objc_msgSend(v5, "setCurrentGroupActionString:", v7);
  if (objc_msgSend(v4, "hasSelectedInfosInMultipleContainers"))
  {
    v19 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containersForSelection"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v15 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v8, v14);
          v16 = -[CRLDrawableZOrderArranger p_maxZValueOfChildren:inContainer:](self, "p_maxZValueOfChildren:inContainer:", v8, v14);
          if (v15 != v16)
            -[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", v16, v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v7 = v19;
  }
  else
  {
    v17 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
    v18 = -[CRLDrawableZOrderArranger maxZValueForArrangeInspector](self, "maxZValueForArrangeInspector");
    if (v17 != v18)
      -[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:](self, "arrangeInspectorDidSetZValue:forContainer:", v18, 0);
  }
  objc_msgSend(v5, "closeGroup");
  -[CRLDrawableZOrderArranger arrangeInspectorDidEndChangingZValue](self, "arrangeInspectorDidEndChangingZValue");

}

- (BOOL)shouldShowZOrderOptionsForSelectedDrawables
{
  return 1;
}

- (BOOL)shouldShowWrapOptionsForSelectedDrawables
{
  return 0;
}

- (BOOL)shouldShowTextFitOptionsForSelectedDrawables
{
  return 0;
}

- (unint64_t)indexOfNextHigherCanvasObject
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblings](self, "p_zOrderSiblings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v3));
  objc_opt_class(_TtC8Freeform11CRLUSDZItem, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  v9 = -[CRLDrawableZOrderArranger maxZValueForArrangeInspector](self, "maxZValueForArrangeInspector");
  v10 = v3 + 1;
  if (v3 + 1 <= v9)
  {
    v11 = v9;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v10));
      objc_opt_class(_TtC8Freeform11CRLUSDZItem, v13);
      v15 = objc_opt_isKindOfClass(v12, v14);
      if ((isKindOfClass & 1) != 0)
      {
        if ((v15 & 1) != 0)
          goto LABEL_9;
      }
      else if ((v15 & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }

      ++v10;
    }
    while (v10 <= v11);
  }
  v10 = v3;
LABEL_10:

  return v10;
}

- (unint64_t)indexOfNextLowerCanvasObject
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = -[CRLDrawableZOrderArranger currentZValueForArrangeInspector](self, "currentZValueForArrangeInspector");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblings](self, "p_zOrderSiblings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v3));
  objc_opt_class(_TtC8Freeform11CRLUSDZItem, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  v9 = -[CRLDrawableZOrderArranger minZValueForArrangeInspector](self, "minZValueForArrangeInspector");
  if (v3 != v9)
  {
    v10 = v9;
    v11 = v3 - 1;
    while (v11 >= v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v11));
      objc_opt_class(_TtC8Freeform11CRLUSDZItem, v13);
      v15 = objc_opt_isKindOfClass(v12, v14);
      if ((isKindOfClass & 1) != 0)
      {
        if ((v15 & 1) != 0)
          goto LABEL_11;
      }
      else if ((v15 & 1) == 0)
      {
LABEL_11:

        goto LABEL_10;
      }

      if (--v11 == -1)
        break;
    }
  }
  v11 = v3;
LABEL_10:

  return v11;
}

- (id)p_zOrderSiblings
{
  CRLCanvasEditor **p_mCanvasEditor;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  p_mCanvasEditor = &self->mCanvasEditor;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topLevelContainerInfoForEditing"));
  v7 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interactiveCanvasController"));
  v9 = objc_msgSend(v8, "hasSelectedInfosInMultipleContainers");

  if (v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262E38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C548();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262E58);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_zOrderSiblings]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 431, 0, "Should not get the generic z-order siblings for a cross-container selection");

  }
  if (v6)
  {
    *(_QWORD *)&v14 = objc_opt_class(NSArray, v10).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childInfos", v14));
    v18 = sub_100221D0C(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)v19;
    v21 = &__NSArray0__struct;
    if (v19)
      v21 = (void *)v19;
    v22 = v21;

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topLevelZOrderedSiblingsOfInfos:", v17));
  }

  return v22;
}

- (BOOL)p_usingRelativeZOrder
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelContainerInfoForEditing"));
  objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  return isKindOfClass & 1;
}

- (id)p_zOrderSiblingsForRelativeOrder
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v20;
  __int128 v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  unsigned int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  char *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  uint64_t v44;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  BOOL v50;
  void *v51;
  __int128 v53;
  id v54;
  id v55;
  id v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  unsigned int v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  _BYTE v82[128];
  _BYTE v83[128];
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v55 = (id)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblings](self, "p_zOrderSiblings"));
  v4 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v3, "count"));
  v54 = objc_alloc_init((Class)NSMutableArray);
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  objc_msgSend(v6, "layoutIfNeeded");
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutForInfo:", v11));
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));
          objc_msgSend(v14, "frame");
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v11);

        }
        else
        {
          objc_msgSend(v54, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v54, "count"))
  {
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1004AD6D8;
    v66[3] = &unk_101262EC0;
    v67 = v54;
    v68 = v4;
    +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:useInBlock:](CRLCanvasLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v67, v66);

  }
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v56 = v55;
  v20 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v63;
    *(_QWORD *)&v21 = 67109378;
    v53 = v21;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v63 != v23)
          objc_enumerationMutation(v56);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v24), v53));
        v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "CGRectValue");
          v87.origin.x = v27;
          v87.origin.y = v28;
          v87.size.width = v29;
          v87.size.height = v30;
          v84.origin.x = x;
          v84.origin.y = y;
          v84.size.width = width;
          v84.size.height = height;
          v85 = CGRectUnion(v84, v87);
          x = v85.origin.x;
          y = v85.origin.y;
          width = v85.size.width;
          height = v85.size.height;
        }
        else
        {
          v31 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101262EE0);
          v32 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v75 = v31;
            v76 = 2082;
            v77 = "-[CRLDrawableZOrderArranger p_zOrderSiblingsForRelativeOrder]";
            v78 = 2082;
            v79 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m";
            v80 = 1024;
            v81 = 490;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d All of the selectedInfos should have been in the zOrderSiblings array that was used to create the rects.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101262F00);
          v33 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v36 = v33;
            v37 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = v53;
            v75 = v31;
            v76 = 2114;
            v77 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_zOrderSiblingsForRelativeOrder]"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 490, 0, "All of the selectedInfos should have been in the zOrderSiblings array that was used to create the rects.");

        }
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
    }
    while (v22);
  }

  v38 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v39 = obj;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(v39);
        v44 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v44));
        objc_msgSend(v45, "CGRectValue");
        v88.origin.x = v46;
        v88.origin.y = v47;
        v88.size.width = v48;
        v88.size.height = v49;
        v86.origin.x = x;
        v86.origin.y = y;
        v86.size.width = width;
        v86.size.height = height;
        v50 = CGRectIntersectsRect(v86, v88);

        if (!v50)
          objc_msgSend(v38, "addObject:", v44);
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    }
    while (v41);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "crl_arrayByRemovingObjectsIdenticalToObjectsInArray:", v38));
  return v51;
}

- (id)p_zOrderedSelectedObjects
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblings](self, "p_zOrderSiblings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_arrayWithObjectsInSet:", v4));

  return v5;
}

- (unint64_t)p_minIndex
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262F20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C5C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262F40);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_minIndex]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 517, 0, "Cannot get the generic min index for a cross-container selection");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  v10 = -[CRLDrawableZOrderArranger p_minZValueOfChildren:inContainer:](self, "p_minZValueOfChildren:inContainer:", v9, 0);

  return v10;
}

- (unint64_t)p_minZValueOfChildren:(id)a3 inContainer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "childInfos"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_arrayWithObjectsInSet:", v6));

    v9 = objc_msgSend(v8, "count");
    v6 = v7;
  }
  else
  {
    v9 = objc_msgSend(v5, "count");
  }

  if (v9)
    return (unint64_t)v9 - 1;
  else
    return 0;
}

- (unint64_t)p_maxIndex
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262F60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C648();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262F80);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_maxIndex]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 532, 0, "Cannot get the generic max index for a cross-container selection");

  }
  v9 = -[CRLDrawableZOrderArranger p_usingRelativeZOrder](self, "p_usingRelativeZOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  if (v9)
    v11 = -[CRLDrawableZOrderArranger p_maxRelativeZValueOfChildrenInTopLevelContainer:](self, "p_maxRelativeZValueOfChildrenInTopLevelContainer:", v10);
  else
    v11 = -[CRLDrawableZOrderArranger p_maxZValueOfChildren:inContainer:](self, "p_maxZValueOfChildren:inContainer:", v10, 0);
  v12 = v11;

  return v12;
}

- (unint64_t)p_maxZValueOfChildren:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  if (v7)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childInfos"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topLevelZOrderedSiblingsOfInfos:", v6));
  v11 = v10;
  v12 = objc_msgSend(v10, "count");

  if (v12)
    v13 = (unint64_t)v12 - 1;
  else
    v13 = 0;

  return v13;
}

- (unint64_t)p_maxRelativeZValueOfChildrenInTopLevelContainer:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblingsForRelativeOrder](self, "p_zOrderSiblingsForRelativeOrder", a3));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return (unint64_t)v4 - 1;
  else
    return 0;
}

- (unint64_t)p_indexOfChildren:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childInfos"));
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblings](self, "p_zOrderSiblings"));
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crl_arrayWithObjectsInSet:", v6));
  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    v13 = (unint64_t)objc_msgSend(v10, "indexOfObjectIdenticalTo:", v12);

  }
  else
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (unint64_t)p_relativeIndexOfChildrenInTopLevelContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_zOrderSiblingsForRelativeOrder](self, "p_zOrderSiblingsForRelativeOrder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crl_arrayWithObjectsInSet:", v4));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v8 = (unint64_t)objc_msgSend(v5, "indexOfObjectIdenticalTo:", v7);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)p_zOrderIndex
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262FA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C6C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262FC0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_zOrderIndex]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 576, 0, "Cannot get the generic max index for a cross-container selection");

  }
  v9 = -[CRLDrawableZOrderArranger p_usingRelativeZOrder](self, "p_usingRelativeZOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDrawableZOrderArranger p_selectedInfos](self, "p_selectedInfos"));
  if (v9)
    v11 = -[CRLDrawableZOrderArranger p_relativeIndexOfChildrenInTopLevelContainer:](self, "p_relativeIndexOfChildrenInTopLevelContainer:", v10);
  else
    v11 = -[CRLDrawableZOrderArranger p_indexOfChildren:inContainer:](self, "p_indexOfChildren:inContainer:", v10, 0);
  v12 = v11;

  return v12;
}

- (id)p_selectedInfos
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infosForCurrentSelectionPath"));
  return v4;
}

- (CRLCanvasEditor)canvasEditor
{
  return (CRLCanvasEditor *)objc_loadWeakRetained((id *)&self->mCanvasEditor);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mCanvasEditor);
}

@end
