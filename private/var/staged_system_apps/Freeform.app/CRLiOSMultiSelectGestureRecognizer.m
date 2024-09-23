@implementation CRLiOSMultiSelectGestureRecognizer

- (CRLiOSMultiSelectGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLiOSMultiSelectGestureRecognizer *v10;
  CRLiOSMultiSelectGestureRecognizer *v11;
  NSMutableSet *v12;
  NSMutableSet *touchesDown;
  NSMutableSet *v14;
  NSMutableSet *alreadyToggledTouches;
  NSMapTable *v16;
  NSMapTable *originalScaledTouchLocation;
  objc_super v19;

  v4 = a3;
  if (!v4)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FA20);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E04C20(v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FA40);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultiSelectGestureRecognizer initWithInteractiveCanvasController:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSMultiSelectGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 57, 0, "invalid nil value for '%{public}s'", "icc");

  }
  v19.receiver = self;
  v19.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  v10 = -[CRLiOSMultiSelectGestureRecognizer initWithTarget:action:](&v19, "initWithTarget:action:", 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_interactiveCanvasController, v4);
    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    touchesDown = v11->_touchesDown;
    v11->_touchesDown = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    alreadyToggledTouches = v11->_alreadyToggledTouches;
    v11->_alreadyToggledTouches = v14;

    v11->_canMultiSelect = 1;
    v16 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    originalScaledTouchLocation = v11->_originalScaledTouchLocation;
    v11->_originalScaledTouchLocation = v16;

  }
  return v11;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (-[CRLiOSMultiSelectGestureRecognizer state](self, "state") != (id)a3)
  {
    if (qword_10147E5A0 != -1)
      dispatch_once(&qword_10147E5A0, &stru_10123FA60);
    v5 = off_1013DA410;
    if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
      sub_100E04CD8(v5, a3);
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  -[CRLiOSMultiSelectGestureRecognizer setState:](&v6, "setState:", a3);
}

- (void)reset
{
  void *v3;
  UITouch *touch;
  CRLSelectionPath *selectionPath;
  CRLSelectionPath *originalSelectionPath;
  void *v7;
  void *v8;
  objc_super v9;

  if (qword_10147E5A0 != -1)
    dispatch_once(&qword_10147E5A0, &stru_10123FA80);
  v3 = off_1013DA410;
  if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
    sub_100E04D90(v3);
  -[NSMutableSet removeAllObjects](self->_touchesDown, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_alreadyToggledTouches, "removeAllObjects");
  touch = self->_touch;
  self->_touch = 0;

  -[CRLiOSMultiSelectGestureRecognizer setCanMultiSelect:](self, "setCanMultiSelect:", 1);
  selectionPath = self->_selectionPath;
  self->_selectionPath = 0;

  originalSelectionPath = self->_originalSelectionPath;
  self->_originalSelectionPath = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicOperationController"));

  if (objc_msgSend(v8, "isInPossibleDynamicOperation"))
  {
    if (qword_10147E5A0 != -1)
      dispatch_once(&qword_10147E5A0, &stru_10123FAA0);
    if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
      sub_100E04D60();
    objc_msgSend(v8, "endOperation");
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  -[CRLiOSMultiSelectGestureRecognizer reset](&v9, "reset");

}

- (id)p_selectionPathWithInfos:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfos:", v4));
  return v7;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLiOSMultiSelectGestureRecognizer *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  NSMapTable *originalScaledTouchLocation;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  void *j;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CRLCanvasRep *v42;
  void *v43;
  uint64_t v44;
  CRLCanvasRep *rep;
  CRLCanvasRep *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  CRLiOSMultiSelectGestureRecognizer *v51;
  CRLSelectionPath *selectionPath;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  CRLSelectionPath *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  CRLCanvasRep *v73;
  CRLCanvasRep *v74;
  CRLCanvasRep *v75;
  CRLCanvasRep *v76;
  uint64_t v77;
  CRLSelectionPath *v78;
  id v79;
  _BYTE *v80;
  uint64_t v81;
  char v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  unint64_t v89;
  uint64_t v90;
  id obj;
  id obja;
  CRLiOSMultiSelectGestureRecognizer *v93;
  void *v94;
  char v95;
  char v96[15];
  char v97;
  char v98[15];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  char v103;
  char v104[15];
  char v105;
  _BYTE v106[7];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  objc_super v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];

  v6 = a3;
  v119.receiver = self;
  v119.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  -[CRLiOSMultiSelectGestureRecognizer touchesBegan:withEvent:](&v119, "touchesBegan:withEvent:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asUIKitHost"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicOperationController"));
  v94 = v7;
  v11 = v7;
  v12 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tmCoordinator"));
  if (!-[CRLiOSMultiSelectGestureRecognizer state](v12, "state")
    && objc_msgSend(v94, "currentlyScrolling"))
  {
    if (qword_10147E5A0 != -1)
      dispatch_once(&qword_10147E5A0, &stru_10123FAC0);
    if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
      sub_100E04E14();
    -[CRLiOSMultiSelectGestureRecognizer setState:](v12, "setState:", 5);
    goto LABEL_109;
  }
  v86 = v13;
  v87 = v10;
  v85 = v9;
  v93 = v12;
  v89 = (unint64_t)-[CRLiOSMultiSelectGestureRecognizer modifierFlags](v12, "modifierFlags");
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v84 = v6;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
  obj = v14;
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v116 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
        originalScaledTouchLocation = v12->_originalScaledTouchLocation;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "layerHost"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvasView"));
        objc_msgSend(v19, "locationInView:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
        -[NSMapTable setObject:forKey:](originalScaledTouchLocation, "setObject:forKey:", v23, v19);

      }
      v14 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    }
    while (v16);
  }

  if (-[CRLiOSMultiSelectGestureRecognizer state](v12, "state") || (unint64_t)objc_msgSend(v14, "count") < 2)
  {
    v82 = 0;
    v10 = v87;
  }
  else
  {
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v112;
      v10 = v87;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v112 != v28)
            objc_enumerationMutation(v24);
          v30 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitRepWithTouch:", v30));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "repForSelecting"));

          if (v32 && objc_msgSend(v32, "isSelectedIgnoringLocking"))
          {
            -[NSMutableSet addObject:](v93->_alreadyToggledTouches, "addObject:", v30);
            v27 = 1;
          }

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
      v10 = v87;
    }

    v82 = v27 & 1;
    v12 = v93;
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v33 = obj;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
  if (!v34)
    goto LABEL_108;
  v35 = v34;
  v81 = v89 & 0x120000;
  v80 = v106;
  v36 = *(_QWORD *)v108;
  v90 = *(_QWORD *)v108;
LABEL_31:
  v37 = 0;
  v88 = v35;
LABEL_32:
  if (*(_QWORD *)v108 != v36)
    objc_enumerationMutation(v33);
  v38 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)v37);
  if (-[CRLiOSMultiSelectGestureRecognizer state](v12, "state", v80))
  {
    if (-[CRLiOSMultiSelectGestureRecognizer canMultiSelect](v12, "canMultiSelect"))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitRepWithTouch:", v38));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "repForSelecting"));

      if (v40 && (objc_msgSend(v40, "demandsExclusiveSelection") & 1) == 0)
        -[NSMutableSet addObject:](v12->_touchesDown, "addObject:", v38);

    }
    goto LABEL_75;
  }
  obja = v37;
  if (!-[NSMutableSet count](v12->_touchesDown, "count"))
  {
    objc_storeStrong((id *)&v12->_touch, v38);
    if ((id)-[UITouch tapCount](v12->_touch, "tapCount") != (id)1)
    {
      if (qword_10147E5A0 != -1)
        dispatch_once(&qword_10147E5A0, &stru_10123FB40);
      if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
        sub_100E04EC8(&v95, v96);
      goto LABEL_74;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitRepWithTouch:", v12->_touch));
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "repForSelecting"));
    rep = v12->_rep;
    v12->_rep = (CRLCanvasRep *)v44;

    v46 = v12->_rep;
    if (!v46
      || (v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v46, "info")), v47, !v47))
    {
      if (qword_10147E5A0 != -1)
        dispatch_once(&qword_10147E5A0, &stru_10123FB20);
      v35 = v88;
      if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
        sub_100E04E44(&v97, v98);
      goto LABEL_74;
    }
    v83 = v33;
    if (-[CRLCanvasRep demandsExclusiveSelection](v12->_rep, "demandsExclusiveSelection"))
    {
      -[CRLiOSMultiSelectGestureRecognizer setCanMultiSelect:](v12, "setCanMultiSelect:", 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v12->_rep, "info"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v48));
      v50 = objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_selectionPathWithInfos:](v12, "p_selectionPathWithInfos:", v49));
      v51 = v12;
      selectionPath = v12->_selectionPath;
      v12->_selectionPath = (CRLSelectionPath *)v50;
      goto LABEL_69;
    }
    -[CRLiOSMultiSelectGestureRecognizer setCanMultiSelect:](v12, "setCanMultiSelect:", 1);
    v51 = v12;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "selectionModelTranslator"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "editorController"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "selectionPath"));
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "boardItemsForSelectionPath:", v55));

    if (v81)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_infosToSelectWhenTogglingSelectionOfRep:inInfos:](v12, "p_infosToSelectWhenTogglingSelectionOfRep:inInfos:", v12->_rep, v56));
      v57 = objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_selectionPathWithInfos:](v12, "p_selectionPathWithInfos:", v49));
      selectionPath = v12->_selectionPath;
      v12->_selectionPath = (CRLSelectionPath *)v57;
    }
    else
    {
      if ((v82 & 1) != 0 || -[CRLCanvasRep isSelectedIgnoringLocking](v12->_rep, "isSelectedIgnoringLocking"))
      {
        v48 = (void *)v56;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v56));
        if (!-[CRLCanvasRep isSelectedIgnoringLocking](v12->_rep, "isSelectedIgnoringLocking"))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v12->_rep, "info"));
          objc_msgSend(v49, "addObject:", v58);

          v48 = (void *)v56;
        }
        v59 = objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_selectionPathWithInfos:](v12, "p_selectionPathWithInfos:", v49));
        selectionPath = v12->_selectionPath;
        v12->_selectionPath = (CRLSelectionPath *)v59;
        goto LABEL_68;
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v12->_rep, "info"));
      selectionPath = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v49));
      v77 = objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_selectionPathWithInfos:](v12, "p_selectionPathWithInfos:", selectionPath));
      v78 = v12->_selectionPath;
      v12->_selectionPath = (CRLSelectionPath *)v77;

    }
    v48 = (void *)v56;
LABEL_68:
    v10 = v87;
LABEL_69:

    -[NSMutableSet addObject:](v51->_touchesDown, "addObject:", v38);
    if (objc_msgSend(v10, "isInOperation"))
    {
      v36 = v90;
      if (qword_10147E5A0 != -1)
        dispatch_once(&qword_10147E5A0, &stru_10123FAE0);
      v12 = v93;
      v33 = v83;
      v35 = v88;
      if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
        sub_100E04E70(&v105, v80);
LABEL_74:
      -[CRLiOSMultiSelectGestureRecognizer setState:](v12, "setState:", 5);
      goto LABEL_75;
    }
    objc_msgSend(v86, "registerTrackerManipulator:", v51);
    v36 = v90;
    if (qword_10147E5A0 != -1)
      dispatch_once(&qword_10147E5A0, &stru_10123FB00);
    if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
      sub_100E04E9C(&v103, v104);
    objc_msgSend(v10, "beginPossibleDynamicOperation");
    if (-[CRLCanvasRep demandsExclusiveSelection](v93->_rep, "demandsExclusiveSelection"))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "infosForSelectionPath:", v93->_selectionPath));
      v61 = objc_msgSend(v60, "count");

      if ((unint64_t)v61 >= 2)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v93->_rep, "info"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v62));
        v64 = objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_selectionPathWithInfos:](v93, "p_selectionPathWithInfos:", v63));
        v65 = v93->_selectionPath;
        v93->_selectionPath = (CRLSelectionPath *)v64;

        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v93->_rep));
        objc_msgSend(v10, "startTransformingReps:", v66);

        v12 = v93;
        v33 = v83;
        v35 = v88;
        goto LABEL_75;
      }
    }
    v67 = objc_alloc_init((Class)NSMutableSet);
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "infosForSelectionPath:", v93->_selectionPath));
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
    v12 = v93;
    if (!v69)
      goto LABEL_98;
    v70 = v69;
    v71 = *(_QWORD *)v100;
LABEL_86:
    v72 = 0;
    while (1)
    {
      if (*(_QWORD *)v100 != v71)
        objc_enumerationMutation(v68);
      v73 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v72)));
      v74 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v73, "info"));
      v75 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v93->_rep, "info"));
      if (v74 != v75)
        break;
      v76 = v93->_rep;

      if (v73 != v76)
      {
        v74 = v73;
        v73 = v93->_rep;
        goto LABEL_93;
      }
LABEL_94:
      if (v73)
        objc_msgSend(v67, "addObject:", v73);

      if (v70 == (id)++v72)
      {
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
        if (!v70)
        {
LABEL_98:

          v10 = v87;
          objc_msgSend(v87, "startTransformingReps:", v67);

          v9 = v85;
          v33 = v83;
          v35 = v88;
LABEL_46:
          v36 = v90;
          v37 = obja;
LABEL_75:
          v37 = (char *)v37 + 1;
          if (v37 == v35)
          {
            v79 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
            v35 = v79;
            if (!v79)
              goto LABEL_108;
            goto LABEL_31;
          }
          goto LABEL_32;
        }
        goto LABEL_86;
      }
    }

LABEL_93:
    goto LABEL_94;
  }
  if (-[CRLiOSMultiSelectGestureRecognizer canMultiSelect](v12, "canMultiSelect"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitRepWithTouch:", v38));
    v42 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "repForSelecting"));

    if (v42 && !-[CRLCanvasRep demandsExclusiveSelection](v42, "demandsExclusiveSelection"))
    {
      if (v12->_rep != v42)
      {
        -[NSMutableSet addObject:](v12->_touchesDown, "addObject:", v38);

        goto LABEL_46;
      }
      if (qword_10147E5A0 != -1)
        dispatch_once(&qword_10147E5A0, &stru_10123FB60);
      if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
        sub_100E04EF4();
      -[CRLiOSMultiSelectGestureRecognizer setState:](v12, "setState:", 5);
    }

  }
LABEL_108:

  v13 = v86;
  v6 = v84;
LABEL_109:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  -[CRLiOSMultiSelectGestureRecognizer touchesMoved:withEvent:](&v4, "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  UITouch *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  int *v53;
  char *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  UITouch *v65;
  UITouch *v66;
  UITouch *touch;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *k;
  void *v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  void *m;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id obj;
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
  objc_super v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];

  v6 = a3;
  v106.receiver = self;
  v106.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  -[CRLiOSMultiSelectGestureRecognizer touchesEnded:withEvent:](&v106, "touchesEnded:withEvent:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asUIKitHost"));
  objc_opt_class(NSObject, v10);
  v17 = sub_1002220C8(v9, v11, 1, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);
  v88 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicOperationController"));
  if (!-[CRLiOSMultiSelectGestureRecognizer state](self, "state")
    && objc_msgSend(v7, "currentlyScrolling"))
  {
    if (qword_10147E5A0 != -1)
      dispatch_once(&qword_10147E5A0, &stru_10123FB80);
    if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
      sub_100E04E14();
    -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 5);
    goto LABEL_64;
  }
  v86 = v18;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", self->_touchesDown));
  objc_msgSend(v87, "minusSet:", v6);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v85 = v6;
  obj = v6;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v103 != v21)
          objc_enumerationMutation(obj);
        v23 = *(UITouch **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->_touchesDown, "containsObject:", v23))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_originalScaledTouchLocation, "objectForKey:", v23));
          objc_msgSend(v24, "CGPointValue");
          v26 = v25;
          v28 = v27;

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "canvasView"));
          -[UITouch locationInView:](v23, "locationInView:", v30);
          v32 = v31;
          v34 = v33;

          if (sub_10006108C(v26, v28, v32, v34) < 14.0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_originalScaledTouchLocation, "objectForKey:", v23));
            objc_msgSend(v35, "CGPointValue");
            v37 = v36;
            v39 = v38;

            objc_msgSend(v7, "convertBoundsToUnscaledPoint:", v37, v39);
            v41 = v40;
            v43 = v42;
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "repDragGestureRecognizer"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "repDragTracker"));
            v46 = objc_msgSend(v45, "didBeginDrag");

            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hitRep:", v41, v43));
            v48 = v47;
            if ((v46 & 1) != 0)
              v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "repForDragging"));
            else
              v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "repForSelecting"));
            v50 = (void *)v49;
            if (v49)
            {
              if (!-[CRLiOSMultiSelectGestureRecognizer state](self, "state") && objc_msgSend(v87, "count"))
              {
                -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 1);
                -[CRLiOSMultiSelectGestureRecognizer p_beginMultiSelect](self, "p_beginMultiSelect");
              }
              if (v23 != self->_touch
                && (-[NSMutableSet containsObject:](self->_alreadyToggledTouches, "containsObject:", v23) & 1) == 0)
              {
                -[CRLiOSMultiSelectGestureRecognizer p_toggleSelection:](self, "p_toggleSelection:", v50);
              }
            }

          }
        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    }
    while (v20);
  }

  v51 = -[NSMutableSet copy](self->_touchesDown, "copy");
  -[NSMutableSet minusSet:](self->_touchesDown, "minusSet:", obj);
  -[NSMutableSet minusSet:](self->_alreadyToggledTouches, "minusSet:", obj);
  if (-[NSMutableSet count](self->_touchesDown, "count") == (id)1)
  {
    v52 = objc_msgSend(v51, "count");
    if (v52 != -[NSMutableSet count](self->_touchesDown, "count"))
    {
      v65 = (UITouch *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_touchesDown, "anyObject"));
      if (v65 != self->_touch)
      {
        v66 = (UITouch *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_touchesDown, "anyObject"));
        touch = self->_touch;
        self->_touch = v66;

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_originalScaledTouchLocation, "objectForKey:", self->_touch));
        objc_msgSend(v68, "CGPointValue");
        v70 = v69;
        v72 = v71;

        objc_msgSend(v7, "convertBoundsToUnscaledPoint:", v70, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hitRep:"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "repForSelecting"));

        if (v74)
        {
          -[CRLiOSMultiSelectGestureRecognizer p_toggleSelection:](self, "p_toggleSelection:", v74);
          -[NSMutableSet addObject:](self->_alreadyToggledTouches, "addObject:", self->_touch);
        }

      }
      goto LABEL_55;
    }
  }
  v53 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  if (!-[NSMutableSet count](self->_touchesDown, "count"))
  {
    v54 = (char *)-[CRLiOSMultiSelectGestureRecognizer state](self, "state");
    if ((unint64_t)(v54 - 1) < 2)
    {
      -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 3);
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infosForSelectionPath:", self->_selectionPath));
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v95;
        do
        {
          for (j = 0; j != v57; j = (char *)j + 1)
          {
            if (*(_QWORD *)v95 != v58)
              objc_enumerationMutation(v55);
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j)));
            objc_msgSend(v60, "fadeKnobsIn");
            objc_msgSend(v60, "setShowKnobsDuringManipulation:", 0);

          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
        }
        while (v57);
      }

      v53 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
      if (objc_msgSend(v86, "isInPossibleDynamicOperation"))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infosForCurrentSelectionPath"));
        v62 = objc_msgSend(v61, "count");

        if (v62)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "anyObject"));
          v64 = objc_msgSend(v63, "type");

          if (v64 != (id)3)
            objc_msgSend(v88, "performSelector:withObject:afterDelay:", "showDefaultEditUIForCurrentSelection", 0, 0.0);
        }
      }
      goto LABEL_56;
    }
    if (!v54)
    {
      -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 5);
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v65 = (UITouch *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infosForSelectionPath:", self->_selectionPath));
      v75 = -[UITouch countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
      if (v75)
      {
        v76 = v75;
        v77 = *(_QWORD *)v99;
        do
        {
          for (k = 0; k != v76; k = (char *)k + 1)
          {
            if (*(_QWORD *)v99 != v77)
              objc_enumerationMutation(v65);
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)k)));
            objc_msgSend(v79, "fadeKnobsIn");
            objc_msgSend(v79, "setShowKnobsDuringManipulation:", 0);

          }
          v76 = -[UITouch countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
        }
        while (v76);
      }
LABEL_55:

      v53 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
    }
  }
LABEL_56:
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v80 = obj;
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v91;
    do
    {
      for (m = 0; m != v82; m = (char *)m + 1)
      {
        if (*(_QWORD *)v91 != v83)
          objc_enumerationMutation(v80);
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v53[531]), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)m));
      }
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
    }
    while (v82);
  }

  v6 = v85;
  v18 = v86;
LABEL_64:

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  int *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CRLSelectionPath *originalSelectionPath;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  _BYTE *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  _BYTE v34[7];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  -[CRLiOSMultiSelectGestureRecognizer touchesEnded:withEvent:](&v39, "touchesEnded:withEvent:", v6, a4);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = v8;
    v27 = v34;
    v28 = v7;
    v10 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v12);
        v14 = v10[528];
        if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v14), "containsObject:", v13, v27))
        {
          objc_msgSend(*(id *)((char *)&self->super.super.isa + v14), "removeObject:", v13);
          if (!objc_msgSend(*(id *)((char *)&self->super.super.isa + v14), "count"))
          {
            v15 = (unint64_t)-[CRLiOSMultiSelectGestureRecognizer state](self, "state");
            if (v15 <= 5)
              -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", qword_100EED790[v15]);
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "editorController"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dynamicOperationController"));
            originalSelectionPath = self->_originalSelectionPath;
            if (originalSelectionPath)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPath"));
              if (-[CRLSelectionPath isEqual:](originalSelectionPath, "isEqual:", v20))
              {

                goto LABEL_19;
              }
              v21 = objc_msgSend(v18, "isInPossibleDynamicOperation");

              v7 = v28;
              if (v21)
              {
                if (qword_10147E5A0 != -1)
                  dispatch_once(&qword_10147E5A0, &stru_10123FBA0);
                if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
                  sub_100E04F24(&v33, v27);
                objc_msgSend(v17, "setSelectionPath:", self->_originalSelectionPath);
LABEL_19:
                v7 = v28;
              }
            }

            v10 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        -[NSMapTable removeObjectForKey:](self->_originalScaledTouchLocation, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v24);
  }

}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class(UIPanGestureRecognizer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    goto LABEL_3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enclosingScrollView"));

  if (v7 == v10)
  {
    v11 = 0;
  }
  else
  {
LABEL_3:
    v13.receiver = self;
    v13.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
    v11 = -[CRLiOSMultiSelectGestureRecognizer canBePreventedByGestureRecognizer:](&v13, "canBePreventedByGestureRecognizer:", v4);
  }

  return v11;
}

- (void)trackerManipulatorDidTakeControl:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class(UIGestureRecognizer, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!-[CRLiOSMultiSelectGestureRecognizer state](self, "state"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asUIKitHost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repDragGestureRecognizer"));

    if (v8 == v12)
    {
      if (objc_msgSend(v8, "state"))
      {
        -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 1);
        if (qword_10147E5A0 != -1)
          dispatch_once(&qword_10147E5A0, &stru_10123FBC0);
        v13 = off_1013DA410;
        if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
          sub_100E04F50(v13, (uint64_t)v4, self);
      }
      -[CRLiOSMultiSelectGestureRecognizer p_beginMultiSelect](self, "p_beginMultiSelect");
    }
  }

}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return 0;
}

- (BOOL)readyToEndOperation
{
  return -[CRLiOSMultiSelectGestureRecognizer state](self, "state") == (id)3;
}

- (void)operationDidEnd
{
  void *v3;

  if (qword_10147E5A0 != -1)
    dispatch_once(&qword_10147E5A0, &stru_10123FBE0);
  v3 = off_1013DA410;
  if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
    sub_100E05018(v3);
  if (!-[CRLiOSMultiSelectGestureRecognizer state](self, "state")
    || -[CRLiOSMultiSelectGestureRecognizer state](self, "state") == (id)1
    || -[CRLiOSMultiSelectGestureRecognizer state](self, "state") == (id)2)
  {
    -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)i_updateStateForPressureDragOnRep:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  CRLCanvasRep *v8;

  v8 = (CRLCanvasRep *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  -[CRLiOSMultiSelectGestureRecognizer setCurrentSelection:](self, "setCurrentSelection:", v7);

  -[CRLiOSMultiSelectGestureRecognizer setCanMultiSelect:](self, "setCanMultiSelect:", -[CRLCanvasRep demandsExclusiveSelection](v8, "demandsExclusiveSelection"));
  if (self->_rep != v8)
    objc_storeStrong((id *)&self->_rep, a3);
  if (!-[CRLiOSMultiSelectGestureRecognizer state](self, "state"))
    -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 1);

}

- (id)p_ICC
{
  return objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (id)p_infosToSelectWhenTogglingSelectionOfRep:(id)a3 inInfos:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", a4));
  v7 = objc_msgSend(v5, "isSelectedIgnoringLocking");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));

  if (v7)
    objc_msgSend(v6, "removeObject:", v8);
  else
    objc_msgSend(v6, "addObject:", v8);

  return v6;
}

- (void)p_toggleSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLSelectionPath *v11;
  CRLSelectionPath *selectionPath;
  CRLSelectionPath *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dynamicOperationController"));
  -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItemsForSelectionPath:", self->_selectionPath));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_infosToSelectWhenTogglingSelectionOfRep:inInfos:](self, "p_infosToSelectWhenTogglingSelectionOfRep:inInfos:", v4, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crl_setBySubtractingSet:", v9));
  v11 = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_selectionPathWithInfos:](self, "p_selectionPathWithInfos:", v9));
  selectionPath = self->_selectionPath;
  self->_selectionPath = v11;

  v13 = self->_selectionPath;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  objc_msgSend(v14, "setSelectionPath:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
  LODWORD(v14) = objc_msgSend(v10, "containsObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  if ((_DWORD)v14)
    objc_msgSend(v6, "stopTransformingReps:", v16);
  else
    objc_msgSend(v6, "startTransformingReps:", v16);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v33 + 1)
                                                                                                  + 8 * (_QWORD)i)));
        objc_msgSend(v22, "setShowKnobsDuringManipulation:", 1);
        objc_msgSend(v22, "turnKnobsOn");

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v19);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = v10;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), (_QWORD)v29));
        objc_msgSend(v28, "setShowKnobsDuringManipulation:", 0);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v25);
  }

  objc_msgSend(v6, "invalidateGuides");
}

- (void)p_beginMultiSelect
{
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;
  int *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int *v16;
  id v17;
  id v18;
  void *v19;
  CRLSelectionPath *v20;
  CRLSelectionPath *originalSelectionPath;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  Class v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  Class v40;
  NSString *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  Class v45;
  NSString *v46;
  void *v47;
  CRLSelectionPath *selectionPath;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  Class v53;
  NSString *v54;
  uint64_t v55;
  Class v56;
  NSString *v57;
  uint64_t v58;
  Class v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  os_log_t loga;
  NSObject *log;
  void *v66;
  id obj;
  id obja;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  unsigned int v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];

  if (qword_10147E5A0 != -1)
    dispatch_once(&qword_10147E5A0, &stru_10123FC00);
  if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
    sub_100E050FC();
  v3 = -[CRLiOSMultiSelectGestureRecognizer modifierFlags](self, "modifierFlags");
  if (!-[CRLiOSMultiSelectGestureRecognizer state](self, "state") && (*(_QWORD *)&v3 & 0x120000) != 0)
  {
    if (qword_10147E5A0 != -1)
      dispatch_once(&qword_10147E5A0, &stru_10123FC20);
    if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
      sub_100E050CC();
    -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 1);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultiSelectGestureRecognizer p_ICC](self, "p_ICC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicOperationController"));
  if ((objc_msgSend(v5, "isInOperation") & 1) == 0
    && (objc_msgSend(v5, "isInPossibleDynamicOperation") & 1) == 0)
  {
    objc_msgSend(v5, "beginPossibleDynamicOperation");
  }
  v66 = v5;
  v69 = objc_alloc_init((Class)NSMutableSet);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosForSelectionPath:", self->_selectionPath));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
  v7 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v71;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v71 != v9)
          objc_enumerationMutation(obj);
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v70 + 1)
                                                                                              + 8 * (_QWORD)v10)));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "info"));
        v13 = v7[535];
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v13), "info"));
        if (v12 != v14)
        {

          goto LABEL_24;
        }
        v15 = v4;
        v16 = v7;
        v17 = *(Class *)((char *)&self->super.super.isa + v13);

        if (v11 != v17)
        {
          v12 = v11;
          v11 = *(id *)((char *)&self->super.super.isa + v13);
          v7 = v16;
          v4 = v15;
LABEL_24:

          if (!v11)
            goto LABEL_26;
LABEL_25:
          objc_msgSend(v69, "addObject:", v11);
          objc_msgSend(v11, "turnKnobsOn");
          objc_msgSend(v11, "setShowKnobsDuringManipulation:", 1);
          goto LABEL_26;
        }
        v7 = v16;
        v4 = v15;
        if (v11)
          goto LABEL_25;
LABEL_26:

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
      v8 = v18;
    }
    while (v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
  v20 = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionPath"));
  originalSelectionPath = self->_originalSelectionPath;
  self->_originalSelectionPath = v20;

  objc_msgSend(v4, "endEditing");
  if (-[CRLiOSMultiSelectGestureRecognizer state](self, "state"))
    goto LABEL_42;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_originalScaledTouchLocation, "objectForKeyedSubscript:", self->_touch));
  objc_msgSend(v22, "CGPointValue");
  objc_msgSend(v4, "convertBoundsToUnscaledPoint:");
  v24 = v23;
  v26 = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hitRep:", v24, v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForSelecting"));
  v29 = v7[535];
  v30 = *(Class *)((char *)&self->super.super.isa + v29);

  if (v28 != v30)
  {
    v31 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FC40);
    v32 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      log = v32;
      objc_opt_class(v27, v52);
      v54 = NSStringFromClass(v53);
      obja = (id)objc_claimAutoreleasedReturnValue(v54);
      objc_opt_class(*(Class *)((char *)&self->super.super.isa + v29), v55);
      v57 = NSStringFromClass(v56);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v57);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForSelecting"));
      objc_opt_class(v63, v58);
      v60 = NSStringFromClass(v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      *(_DWORD *)buf = 67110658;
      v75 = v31;
      v76 = 2082;
      v77 = "-[CRLiOSMultiSelectGestureRecognizer p_beginMultiSelect]";
      v78 = 2082;
      v79 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSMultiSelectGestureRecognizer.m";
      v80 = 1024;
      v81 = 588;
      v82 = 2114;
      v83 = obja;
      v84 = 2114;
      v85 = v62;
      v86 = 2114;
      v87 = v61;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The hit rep %{public}@ is providing a different repForSelecting %{public}@ before we update the selection vs after %{public}@.", buf, 0x40u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FC60);
    v33 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v33);
    loga = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultiSelectGestureRecognizer p_beginMultiSelect]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSMultiSelectGestureRecognizer.m"));
    objc_opt_class(v27, v35);
    v37 = NSStringFromClass(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    objc_opt_class(*(Class *)((char *)&self->super.super.isa + v29), v39);
    v41 = NSStringFromClass(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForSelecting"));
    objc_opt_class(v43, v44);
    v46 = NSStringFromClass(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", loga, v34, 588, 0, "The hit rep %{public}@ is providing a different repForSelecting %{public}@ before we update the selection vs after %{public}@.", v38, v42, v47);

LABEL_42:
    v27 = 0;
  }
  selectionPath = self->_selectionPath;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
  objc_msgSend(v49, "setSelectionPath:", selectionPath);

  if (v27)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForSelecting"));
    v51 = *(Class *)((char *)&self->super.super.isa + v7[535]);

    if (v50 != v51)
    {
      if (qword_10147E5A0 != -1)
        dispatch_once(&qword_10147E5A0, &stru_10123FC80);
      if (os_log_type_enabled((os_log_t)off_1013DA410, OS_LOG_TYPE_DEBUG))
        sub_100E0509C();
      -[CRLiOSMultiSelectGestureRecognizer setState:](self, "setState:", 1);
    }
  }
  objc_msgSend(v66, "startTransformingReps:", v69);

}

- (CRLSelectionPath)currentSelection
{
  return self->_selectionPath;
}

- (void)setCurrentSelection:(id)a3
{
  objc_storeStrong((id *)&self->_selectionPath, a3);
}

- (BOOL)canMultiSelect
{
  return self->_canMultiSelect;
}

- (void)setCanMultiSelect:(BOOL)a3
{
  self->_canMultiSelect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionPath, 0);
  objc_storeStrong((id *)&self->_originalSelectionPath, 0);
  objc_storeStrong((id *)&self->_originalScaledTouchLocation, 0);
  objc_storeStrong((id *)&self->_alreadyToggledTouches, 0);
  objc_storeStrong((id *)&self->_touchesDown, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_rep, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
