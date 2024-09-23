@implementation CRLImageEditor

+ (id)keyPathsForValuesAffectingSelectedImageObjects
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("infos"));
}

- (_TtC8Freeform12CRLImageItem)firstImageItem
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLImageItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (_TtC8Freeform12CRLImageItem *)v9;
}

- (BOOL)p_canHandleInsertNewline
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  NSObject *v27;
  char *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  unsigned int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  _BYTE v44[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v3, "hasSelectedInfosInMultipleContainers");

  if ((v4 & 1) != 0)
    return 0;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor selectedImageObjects](self, "selectedImageObjects"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v31;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v11);
        *(_QWORD *)&v13 = objc_opt_class(CRLImageRep, v8).n128_u64[0];
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v13));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "repForInfo:", v12));
        v18 = sub_100221D0C(v15, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (!v19)
        {
          v20 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124A898);
          v21 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v35 = v20;
            v36 = 2082;
            v37 = "-[CRLImageEditor p_canHandleInsertNewline]";
            v38 = 2082;
            v39 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m";
            v40 = 1024;
            v41 = 56;
            v42 = 2082;
            v43 = "imageRep";
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124A8B8);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v27 = v22;
            v28 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v35 = v20;
            v36 = 2114;
            v37 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_canHandleInsertNewline]"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 56, 0, "invalid nil value for '%{public}s'", "imageRep");

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageLayout"));
        v26 = objc_msgSend(v25, "isInMaskEditMode");

        if ((v26 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_23;
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      if (v9)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_23:

  return v5;
}

- (void)insertNewline:(id)a3
{
  void *v4;
  unsigned int v5;
  dispatch_once_t *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  __objc2_class *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  dispatch_once_t *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  NSObject *v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  unsigned int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  _BYTE v49[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  v6 = &qword_10147E370;
  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A8D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15B94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A8F8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor insertNewline:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 67, 0, "Cannot insert newline with cross-container selection!");

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor selectedImageObjects](self, "selectedImageObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v11)
  {
    v13 = v11;
    v14 = &OBJC_METACLASS___CRLCanvasKnobAccessibilityElement;
    v15 = *(_QWORD *)v36;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v16);
        *(_QWORD *)&v18 = objc_opt_class(&v14[99], v12).n128_u64[0];
        v20 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v18));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "repForInfo:", v17));
        v23 = sub_100221D0C(v20, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

        if (!v24)
        {
          v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (*v6 != -1)
            dispatch_once(v6, &stru_10124A918);
          v26 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v40 = v25;
            v41 = 2082;
            v42 = "-[CRLImageEditor insertNewline:]";
            v43 = 2082;
            v44 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m";
            v45 = 1024;
            v46 = 71;
            v47 = 2082;
            v48 = "imageRep";
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (*v6 != -1)
            dispatch_once(v6, &stru_10124A938);
          v27 = v6;
          v28 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v33 = v28;
            v34 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v40 = v25;
            v41 = 2114;
            v42 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor insertNewline:]"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 71, 0, "invalid nil value for '%{public}s'", "imageRep");

          v6 = v27;
          v14 = &OBJC_METACLASS___CRLCanvasKnobAccessibilityElement;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageLayout"));
        v32 = objc_msgSend(v31, "isInMaskEditMode");

        if (v32)
          objc_msgSend(v24, "endEditingMask");

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v13);
  }

}

- (BOOL)p_allImagesAreSupportedTypes
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  char v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v3, "hasSelectedInfosInMultipleContainers");

  if (v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A958);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15C14();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A978);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_allImagesAreSupportedTypes]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 79, 0, "Cannot check that all images are supported types with cross-container selection!");

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v11 = v9;
    v12 = 0;
    v13 = *(_QWORD *)v30;
LABEL_13:
    v14 = 0;
    v15 = v12;
    while (1)
    {
      if (*(_QWORD *)v30 != v13)
        objc_enumerationMutation(v8);
      v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v14);
      *(_QWORD *)&v17 = objc_opt_class(CRLImageRep, v10).n128_u64[0];
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repForInfo:createIfNeeded:", v16, 1));
      v22 = sub_100221D0C(v19, v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageDataForRendering"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "providerForAsset:shouldValidate:", v24, 1));

      v26 = objc_msgSend(v25, "isError");
      if ((v26 & 1) != 0)
        break;
      v14 = (char *)v14 + 1;
      v15 = v12;
      if (v11 == v14)
      {
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v11)
          goto LABEL_13;
        break;
      }
    }
    v27 = v26 ^ 1;

  }
  else
  {
    v27 = 1;
  }

  return v27;
}

- (BOOL)p_canResetMask
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor selectedImageObjects](self, "selectedImageObjects", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (-[CRLImageEditor p_canResetMaskForImageInfo:](self, "p_canResetMaskForImageInfo:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)p_canResetMaskForImageInfo:(id)a3
{
  return objc_msgSend(a3, "maskCanBeReset");
}

- (void)resetMask:(id)a3
{
  void *v4;
  void *v5;
  CRLCanvasCommandSelectionBehavior *v6;
  void *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));

  v6 = [CRLCanvasCommandSelectionBehavior alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v6, "initWithCanvasEditor:", v8);

  objc_msgSend(v5, "openGroupWithSelectionBehavior:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Reset Mask"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v5, "setCurrentGroupActionString:", v11);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v17);
        objc_opt_class(_TtC8Freeform12CRLImageItem, v14);
        v20 = sub_1002223BC(v19, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (-[CRLImageEditor p_canResetMaskForImageInfo:](self, "p_canResetMaskForImageInfo:", v21))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "commandToResetMask"));
          objc_msgSend(v5, "enqueueCommand:", v22);

        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  objc_msgSend(v5, "closeGroup");
}

- (BOOL)shouldSuppressMiniFormatter
{
  return -[CRLImageEditor p_isEditingMask](self, "p_isEditingMask");
}

- (BOOL)canToggleMaskEditMode
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    if ((objc_msgSend(v4, "hasSelectedInfosInMultipleContainers") & 1) != 0)
      v5 = 0;
    else
      v5 = -[CRLImageEditor p_allImagesAreSupportedTypes](self, "p_allImagesAreSupportedTypes");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)toggleMaskEditMode:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A998);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15D20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A9B8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor toggleMaskEditMode:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 139, 0, "Cannot toggle mask edit mode with cross-container selection!");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor selectedImageObjects](self, "selectedImageObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));

  *(_QWORD *)&v12 = objc_opt_class(CRLImageRep, v11).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repForInfo:", v10));
  v17 = sub_100221D0C(v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (!v18)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A9D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15C94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A9F8);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor toggleMaskEditMode:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 142, 0, "invalid nil value for '%{public}s'", "imageRep");

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageLayout"));
  if (objc_msgSend(v22, "isInMaskEditMode"))
  {
    objc_msgSend(v18, "endEditingMask");
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "maskInfo"));

    if (v24)
      objc_msgSend(v18, "editMaskWithHUD:", 1);
    else
      objc_msgSend(v18, "maskWithHUD:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layerHost"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "miniFormatterPresenter"));
    objc_msgSend(v27, "dismissMiniFormatter");

  }
}

- (BOOL)p_canBeginEditingMask
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;

  if (-[CRLImageEditor canToggleMaskEditMode](self, "canToggleMaskEditMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor selectedImageObjects](self, "selectedImageObjects"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

    *(_QWORD *)&v6 = objc_opt_class(CRLImageRep, v5).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForInfo:", v4));
    v11 = sub_100221D0C(v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageLayout"));
    v14 = objc_msgSend(v13, "isInMaskEditMode") ^ 1;

  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (void)beginEditingMask:(id)a3
{
  -[CRLImageEditor toggleMaskEditMode:](self, "toggleMaskEditMode:", a3);
}

- (void)removeImageBackground:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor selectedImageObjects](self, "selectedImageObjects", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));

  *(_QWORD *)&v7 = objc_opt_class(CRLImageRep, v6).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForInfo:", v5));
  v12 = sub_100221D0C(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (!v13)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AA18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15DA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AA38);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor removeImageBackground:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 186, 0, "invalid nil value for '%{public}s'", "imageRep");

  }
  objc_msgSend(v13, "removeBackgroundFromImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layerHost"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asiOSCVC"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "miniFormatterPresenter"));
  objc_msgSend(v20, "dismissMiniFormatter");

}

- (BOOL)p_canRemoveImageBackground
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  unsigned int v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor selectedImageObjects](self, "selectedImageObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AA58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15EB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AA78);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_canRemoveImageBackground]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 202, 0, "invalid nil value for '%{public}s'", "imageInfo");

  }
  *(_QWORD *)&v9 = objc_opt_class(CRLImageRep, v5).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repForInfo:", v4));
  v14 = sub_100221D0C(v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (!v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AA98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15E2C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AAB8);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_canRemoveImageBackground]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 204, 0, "invalid nil value for '%{public}s'", "imageRep");

  }
  v19 = objc_msgSend(v15, "canRemoveBackgroundFromImage");
  if (!+[VKCRemoveBackgroundRequestHandler isSupported](VKCRemoveBackgroundRequestHandler, "isSupported")|| (v19 & (((unint64_t)+[VKCImageAnalyzer supportedAnalysisTypes](VKCImageAnalyzer, "supportedAnalysisTypes") & 0x20) != 0)) != 1)
  {
    goto LABEL_27;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  if (objc_msgSend(v20, "count") != (id)1)
  {
LABEL_26:

LABEL_27:
    LOBYTE(v22) = 0;
    goto LABEL_28;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  if (objc_msgSend(v21, "hasSelectedInfosInMultipleContainers"))
  {

    goto LABEL_26;
  }
  v22 = -[CRLImageEditor p_allImagesAreSupportedTypes](self, "p_allImagesAreSupportedTypes");

  if (v22)
    v22 = objc_msgSend(v4, "isBackgroundRemoved") ^ 1;
LABEL_28:

  return v22;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;
  objc_super v20;

  v6 = a4;
  if ("insertNewline:" == a3)
  {
    v7 = -[CRLImageEditor p_canHandleInsertNewline](self, "p_canHandleInsertNewline");
    goto LABEL_18;
  }
  if ("toggleMaskEditMode:" == a3)
  {
    v7 = -[CRLImageEditor canToggleMaskEditMode](self, "canToggleMaskEditMode");
    goto LABEL_18;
  }
  if ("beginEditingMask:" == a3)
  {
    v7 = -[CRLImageEditor p_canBeginEditingMask](self, "p_canBeginEditingMask");
    goto LABEL_18;
  }
  if (sel_isEqual(a3, "resetMask:"))
  {
    v7 = -[CRLImageEditor p_canResetMask](self, "p_canResetMask");
    goto LABEL_18;
  }
  if (sel_isEqual(a3, "saveDefaultInsertionPreset:"))
  {
    v7 = -[CRLImageEditor p_canSaveDefaultImagePreset](self, "p_canSaveDefaultImagePreset");
    goto LABEL_18;
  }
  if ("removeImageBackground:" == a3)
  {
    v7 = -[CRLImageEditor p_canRemoveImageBackground](self, "p_canRemoveImageBackground");
LABEL_18:
    if (v7)
      v18 = 1;
    else
      v18 = -1;
    goto LABEL_21;
  }
  if (sel_isEqual(a3, "hideMaskControl:"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor firstImageItem](self, "firstImageItem"));
    *(_QWORD *)&v10 = objc_opt_class(CRLImageRep, v9).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "repForInfo:", v8));
    v15 = sub_100221D0C(v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageLayout"));
    if (objc_msgSend(v17, "isInMaskEditMode"))
      v18 = 1;
    else
      v18 = -1;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLImageEditor;
    v18 = -[CRLMediaEditor canPerformEditorAction:withSender:](&v20, "canPerformEditorAction:withSender:", a3, v6);
  }
LABEL_21:

  return v18;
}

- (BOOL)p_isEditingMask
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor firstImageItem](self, "firstImageItem"));
  *(_QWORD *)&v5 = objc_opt_class(CRLImageRep, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForInfo:", v3));
  v10 = sub_100221D0C(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageLayout"));
  LOBYTE(v9) = objc_msgSend(v12, "isInMaskEditMode");

  return (char)v9;
}

- (BOOL)p_canSaveDefaultImagePreset
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = objc_msgSend(v2, "count") == (id)1;

  return v3;
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _TtC8Freeform40CRLCommandSetDefaultImageInsertionPreset *v17;
  void *v18;
  void *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", a3));
  v5 = objc_msgSend(v4, "count");

  if (v5 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AAD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15F44();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AAF8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor saveDefaultInsertionPreset:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 266, 0, "Only should save default style with a single object selected!");

  }
  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform12CRLImageItem, v6).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));
  v15 = sub_1002223BC(v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    v17 = -[CRLCommandSetDefaultImageInsertionPreset initWithImageItem:]([_TtC8Freeform40CRLCommandSetDefaultImageInsertionPreset alloc], "initWithImageItem:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "commandController"));
    objc_msgSend(v19, "enqueueCommand:", v17);

  }
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  void *v25;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLImageEditor;
  -[CRLMediaEditor addContextualMenuElementsToArray:atPoint:](&v24, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    while (1)
    {
      *(_QWORD *)&v10 = objc_opt_class(UIMenu, v8).n128_u64[0];
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v10));
      v14 = sub_100221D0C(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("CRLShadowAndRoundCornersMenuIdentifier"));

      if ((v17 & 1) != 0)
        break;
      if (++v9 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Reset Mask"), 0, 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("crop")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v19, v20, "resetMask:", 0));

  v25 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v22));

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "addObject:", v23);
  else
    objc_msgSend(v7, "insertObject:atIndex:", v23, v9);

}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CRLImageEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v34, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  v8 = (char *)objc_msgSend(v7, "count");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v10 = objc_msgSend(v9, "count");

  if ((unint64_t)v10 <= 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Modify Image"), 0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("photo")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v12, v13, 2, 128));

    objc_msgSend(v14, "setTag:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Replace this photo, reset to original size, or remove background"), 0, 0));
    objc_msgSend(v14, "setToolTip:", v16);

    objc_msgSend(v7, "insertObject:atIndex:", v14, v8);
    v17 = v8 + 1;
    if (-[CRLImageEditor p_canBeginEditingMask](self, "p_canBeginEditingMask"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Crop Mask"), 0, 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("crop")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:parent:children:](CRLQuickInspectorElement, "elementWithName:image:type:action:parent:children:", v19, v20, 2, "beginEditingMask:", 0, 0));

      objc_msgSend(v21, "setTag:", 17);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Crop and scale"), 0, 0));
      objc_msgSend(v21, "setToolTip:", v23);

      objc_msgSend(v7, "insertObject:atIndex:", v21, v8 + 1);
      v17 = v8 + 2;

    }
    if (-[CRLImageEditor p_canResetMask](self, "p_canResetMask"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Reset Mask"), 0, 0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("crop.rotate")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:parent:children:](CRLQuickInspectorElement, "elementWithName:image:type:action:parent:children:", v25, v26, 1, "resetMask:", 0, 0));

      objc_msgSend(v27, "setTag:", 18);
      objc_msgSend(v7, "insertObject:atIndex:", v27, v17);

    }
    if (-[CRLBoardItemEditor canShowPreview](self, "canShowPreview"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Preview"), 0, 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("eye")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:](CRLQuickInspectorElement, "elementWithName:image:type:action:", v29, v30, 2, "showPreview:"));

      objc_msgSend(v31, "setTag:", 19);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageEditor firstImageItem](self, "firstImageItem"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "previewTooltip"));
      objc_msgSend(v31, "setToolTip:", v33);

      objc_msgSend(v7, "addObject:", v31);
    }

  }
}

- (void)hideMaskControl:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageEditor firstImageItem](self, "firstImageItem", a3));
  *(_QWORD *)&v5 = objc_opt_class(CRLImageRep, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForInfo:createIfNeeded:", v12, 0));
  v10 = sub_100221D0C(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v11, "endEditingMask");
}

@end
