@implementation CRLWPDragAndDropHelper

- (CRLWPDragAndDropHelper)initWithOwningRep:(id)a3
{
  id v4;
  CRLWPDragAndDropHelper *v5;
  CRLWPDragAndDropHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLWPDragAndDropHelper;
  v5 = -[CRLWPDragAndDropHelper init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningRep, v4);
    v6->_dragAndDropNaturalPoint = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }

  return v6;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t v35;
  id v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  unint64_t v67;
  unsigned int v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint8_t buf[4];
  unsigned int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  unint64_t v87;
  __int16 v88;
  unint64_t v89;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (unint64_t)objc_msgSend(v7, "dragOperationMask");
  -[CRLWPDragAndDropHelper adjustedUnscaledPoint:](self, "adjustedUnscaledPoint:", x, y);
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", v10, v12);
  v15 = v14;
  v17 = v16;

  v18 = 0;
  if (!-[CRLWPDragAndDropHelper p_allowedToHandleDragInfo:](self, "p_allowedToHandleDragInfo:", v7) || !v8)
    goto LABEL_64;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper p_itemSourceForDragInfo:](self, "p_itemSourceForDragInfo:", v7));
  v21 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inProcessDraggingSources"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
  v24 = sub_100221D0C(v21, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "storage"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));
  if (v27 == v28)
  {
    v76 = v25;
    v30 = v8;
    v31 = v19;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "storage"));
    v34 = objc_msgSend(v33, "changeCount");
    v35 = -[CRLWPDragAndDropHelper sourceChangeCountForDragInfo:](self, "sourceChangeCountForDragInfo:", v7);

    if (v34 == (id)v35)
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper sourceSelectionForDragInfo:](self, "sourceSelectionForDragInfo:", v7));
    else
      v29 = 0;
    v19 = v31;
    v8 = v30;
    v25 = v76;
  }
  else
  {

    v29 = 0;
  }
  v36 = v29;
  if (-[CRLWPDragAndDropHelper p_insertPanelIsDragSourceFromDragInfo:](self, "p_insertPanelIsDragSourceFromDragInfo:", v7))
  {
    v37 = 0;
    goto LABEL_48;
  }
  v77 = v19;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "storage"));
  if (v38 != v40 || !v36)
  {

    goto LABEL_16;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  v42 = objc_msgSend(v41, "isDragPoint:inSelection:includeEndpoints:", v36, 1, v15, v17);

  if ((v42 & 1) == 0)
  {
LABEL_16:
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "storage"));
    v46 = v45;
    if (v43 == v45 && v36)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v48 = objc_msgSend(v47, "isDragPoint:inSelection:includeEndpoints:", v36, 0, v15, v17);

      if ((v48 & 1) != 0)
      {
LABEL_19:
        v37 = 0;
        goto LABEL_20;
      }
    }
    else
    {

      if (v43 == v46)
        goto LABEL_19;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "storageForDragDropOperation"));

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "storage"));

      if (v52 == v50)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "selectionForDragAndDropNaturalPoint:", v15, v17));

      }
      else
      {
        v53 = objc_msgSend(v50, "range");
        v55 = objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v53, v54));
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v75 = v50;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "textEditorForDropIntoStorage:", v50));

      if (!v58)
      {
        v74 = v55;
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232F78);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF2724();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232F98);
        v59 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper dragOperationForDragInfo:atUnscaledPoint:]"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v60, v61, 146, 0, "invalid nil value for '%{public}s'", "targetTextEditor");

        v55 = v74;
      }
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platformDraggingInfo"));
      v63 = v58;
      v64 = (void *)v55;
      v65 = objc_msgSend(v58, "canPasteWithItemSource:selection:sender:", v77, v55, v62);

      if (v65)
      {
        if ((v8 & 2) != 0 && v25 == 0)
          v67 = v8 & 0xFFFFFFFFFFFFFFFDLL;
        else
          v67 = v8;
        v37 = -[CRLWPDragAndDropHelper p_resolveDragOperationFromMask:](self, "p_resolveDragOperationFromMask:", v67);
      }
      else
      {
        v37 = 0;
      }

      v50 = v75;
      v19 = v77;
    }
    else
    {
      v37 = 0;
      v19 = v77;
    }

    goto LABEL_48;
  }
  v37 = 64;
LABEL_20:
  v19 = v77;
LABEL_48:

  if (v37)
  {
    if (-[CRLWPDragAndDropHelper p_wantsToPreventDragOperationForDragInfo:atPoint:](self, "p_wantsToPreventDragOperationForDragInfo:atPoint:", v7, v15, v17))
    {
      v18 = 64;
    }
    else
    {
      v18 = v37;
    }
    if ((v18 & 0xFFFFFFFFFFFFFFBFLL) != 0 && (v18 & v8) == 0)
    {
      v68 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232FB8);
      v69 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        v79 = v68;
        v80 = 2082;
        v81 = "-[CRLWPDragAndDropHelper dragOperationForDragInfo:atUnscaledPoint:]";
        v82 = 2082;
        v83 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m";
        v84 = 1024;
        v85 = 179;
        v86 = 2048;
        v87 = v18;
        v88 = 2048;
        v89 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Drag operation %zi not supported by the sender with mask %zi.", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232FD8);
      v70 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper dragOperationForDragInfo:atUnscaledPoint:]"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v71, v72, 179, 0, "Drag operation %zi not supported by the sender with mask %zi.", v18, v8);

    }
  }
  else
  {
    v18 = 0;
  }
LABEL_64:

  return v18;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  _BYTE *v65;
  _BYTE *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  CRLCommandSelectionBehavior *v76;
  void *v77;
  void *v78;
  _BOOL8 v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  _QWORD *v85;
  void *v86;
  void *v87;
  char *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned int v98;
  id v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  CRLCommandSelectionBehavior *v107;
  _QWORD *v108;
  void *v109;
  _BYTE *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  _BYTE *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  _QWORD v126[5];
  BOOL v127;
  _QWORD v128[6];
  _QWORD v129[4];
  id v130;
  void *v131;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  -[CRLWPDragAndDropHelper adjustedUnscaledPoint:](self, "adjustedUnscaledPoint:", x, y);
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", v10, v12);
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interactiveCanvasController"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "editorController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPath"));

  v124 = objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper p_itemSourceForDragInfo:](self, "p_itemSourceForDragInfo:", v8));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "textEditor"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "textEditor"));

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper p_sourceTextEditorForDragInfo:](self, "p_sourceTextEditorForDragInfo:", v8));
  }
  v125 = v8;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper sourceSelectionForDragInfo:](self, "sourceSelectionForDragInfo:", v8));
    if (!v26)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232FF8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF2988();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233018);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 234, 0, "invalid nil value for '%{public}s'", "dragSelection");

      v26 = 0;
    }
    if ((objc_msgSend(v26, "isRange") & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      v30 = v26;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233038);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF28EC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233058);
      v31 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 235, 0, "Invalid drag selection");

      v26 = v30;
    }
  }
  else
  {
    v26 = 0;
  }
  if (-[CRLWPDragAndDropHelper dragIsStorageLocal](self, "dragIsStorageLocal")
    && -[CRLWPDragAndDropHelper p_wantsToPreventDragOperationForDragInfo:atPoint:](self, "p_wantsToPreventDragOperationForDragInfo:atPoint:", v8, v15, v17))
  {
    v34 = 0;
    v35 = (void *)v124;
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "storageForDragDropOperation"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "storage"));

    if (v39 == v37)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "selectionForDragAndDropNaturalPoint:", v15, v17));

    }
    else
    {
      v40 = objc_msgSend(v37, "range");
      v123 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v40, v41));
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "textEditorForDropIntoStorage:", v37));

    v122 = v21;
    v119 = (void *)v44;
    if (!v44)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233078);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF2860();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233098);
      v45 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v47, 267, 0, "invalid nil value for '%{public}s'", "targetTextEditor");

      v21 = v122;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "interactiveCanvasController"));

    v120 = v25;
    v121 = v37;
    if (v25
      && v48 == v19
      && (id)-[CRLWPDragAndDropHelper p_resolveDragOperationFromMask:](self, "p_resolveDragOperationFromMask:", objc_msgSend(v8, "dragOperationMask")) == (id)2)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "platformDraggingInfo"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "items"));

      v115 = v50;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstObject"));
      v53 = objc_opt_class(CRLWPiOSTextDraggingContext, v52);
      v114 = v51;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localObject"));
      v55 = sub_100221D0C(v53, v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);

      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "reverseSelectionPath"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "commandController"));
      objc_msgSend(v58, "openGroup");

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "commandController"));
      objc_msgSend(v60, "enableProgressiveEnqueuingInCurrentGroup");

      if ((objc_msgSend(v26, "isRange") & 1) == 0)
      {
        v61 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012330B8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF27B0((uint64_t)v26, v61);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012330D8);
        v62 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v63, v64, 298, 0, "source selection %@ is not a range", v26);

      }
      v65 = objc_msgSend(v26, "range");
      v66 = objc_msgSend(v123, "range");
      v113 = v67;
      v116 = v66;
      if (-[CRLWPDragAndDropHelper dragIsStorageLocal](self, "dragIsStorageLocal")
        && (objc_msgSend(v26, "containsCharacterAtIndex:withOptions:", v66, 3) & 1) != 0)
      {
        v68 = v122;
      }
      else
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));
        v111 = objc_msgSend(v83, "length");

        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472;
        v129[2] = sub_10009E740;
        v129[3] = &unk_10122D3D8;
        v84 = v25;
        v130 = v84;
        v131 = v56;
        v85 = objc_retainBlock(v129);
        ((void (*)(void))v85[2])();
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "storage"));

        if (v37 == v86)
        {
          if (v65 < v116)
          {
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "storage"));
            v88 = (char *)objc_msgSend(v87, "length");

            v89 = objc_msgSend(v123, "copyWithNewRange:", &v88[v116 - v111], v113);
            v123 = v89;
          }
          v68 = v122;
        }
        else
        {
          v68 = v122;
        }

      }
      v90 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "textEditor"));
      v112 = 2 * (v25 == v91);

      if ((objc_msgSend(v68, "isEqual:", v118) & 1) == 0)
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));

        if (v37 != v92)
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "interactiveCanvasController"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "editorController"));
          objc_msgSend(v95, "setSelectionPath:", v122);

        }
      }
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));

      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionModelTranslator"));
      if (v37 == v96)
      {
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "selectionPathForRange:onStorage:headCursorAffinity:tailCursorAffinity:", objc_msgSend(v123, "range"), 0, v37, 1, 2));

        v101 = v65;
      }
      else
      {
        v98 = -[CRLWPDragAndDropHelper dragIsStorageLocal](self, "dragIsStorageLocal");
        if (v98)
          v99 = v116;
        else
          v99 = v65;
        if (v98)
          v100 = v113;
        else
          v100 = 0;
        v101 = v65;
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "selectionPathForRange:onStorage:", v99, v100, v102));

      }
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionModelTranslator"));
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));
      v117 = v19;
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "selectionPathForRange:onStorage:headCursorAffinity:tailCursorAffinity:", v101, 0, v105, 1, 2));

      v107 = -[CRLCommandSelectionBehavior initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:usePersistableCommitSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:usePersistableCommitSelectionPath:", v103, v103, v106, 1);
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_10009E7F4;
      v128[3] = &unk_10122D3D8;
      v128[4] = self;
      v128[5] = v107;
      v108 = objc_retainBlock(v128);
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "platformDraggingInfo"));
      v81 = v119;
      v82 = v123;
      objc_msgSend(v119, "pasteWithItemSource:selection:sender:selectRange:dragBlock:", v124, v123, v109, v112, v108);

      v35 = (void *)v124;
      v8 = v125;

      v19 = v117;
      v21 = v122;
    }
    else
    {
      v69 = v26;
      v70 = v19;
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "textEditor"));
      v73 = v72 != 0;

      if (!v72)
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "editorController"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "selectionPath"));

        v76 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v75, v75);
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "commandController"));
        objc_msgSend(v78, "openGroupWithSelectionBehavior:", v76);

        v21 = v122;
        v8 = v125;
      }
      v79 = v72 != 0;
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "platformDraggingInfo"));
      v126[0] = _NSConcreteStackBlock;
      v126[1] = 3221225472;
      v126[2] = sub_10009E844;
      v126[3] = &unk_10122E8D8;
      v127 = v73;
      v126[4] = self;
      v81 = v119;
      v82 = v123;
      v35 = (void *)v124;
      objc_msgSend(v119, "pasteWithItemSource:selection:sender:selectRange:dragBlock:", v124, v123, v80, v79, v126);

      v19 = v70;
      v26 = v69;
    }

    v34 = 1;
    v25 = v120;
  }

  return v34;
}

- (unint64_t)sourceChangeCountForDragInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "platformDraggingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v7 = objc_opt_class(CRLWPiOSTextDraggingContext, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localObject"));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = objc_msgSend(v10, "changeCount");
  return (unint64_t)v11;
}

- (id)sourceSelectionForDragInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper sourceSelectionPathForDragInfo:](self, "sourceSelectionPathForDragInfo:", a3));
  v5 = objc_msgSend(v3, "mostSpecificSelectionOfClass:", objc_opt_class(CRLWPSelection, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)sourceSelectionPathForDragInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "platformDraggingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v7 = objc_opt_class(CRLWPiOSTextDraggingContext, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localObject"));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceSelectionPath"));
  return v11;
}

- (CGPoint)adjustedUnscaledPoint:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));
  objc_msgSend(v6, "viewScale");
  v8 = y + -27.0 / v7;

  v9 = x;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)p_allowedToHandleDragInfo:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (-[CRLWPDragAndDropHelper p_insertPanelIsDragSourceFromDragInfo:](self, "p_insertPanelIsDragSourceFromDragInfo:", v4))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[CRLWPDragAndDropHelper p_importingDrawablesOrMoviesFromDragInfo:](self, "p_importingDrawablesOrMoviesFromDragInfo:", v4);
  }

  return v5;
}

- (id)p_itemSourceForDragInfo:(id)a3
{
  return objc_msgSend(a3, "itemSource");
}

- (BOOL)p_insertPanelIsDragSourceFromDragInfo:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "inProcessDraggingSources", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "objectForKey:") & 1) != 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("TIAMediaBrowserCollectionViewDragSessionIdentifier")));

          if (v9)
          {
            v10 = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)p_resolveDragOperationFromMask:(unint64_t)a3
{
  if ((a3 & 2) != 0)
    return 2;
  else
    return a3 & 1;
}

- (BOOL)p_wantsToPreventDragOperationForDragInfo:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (!-[CRLWPDragAndDropHelper p_allowedToHandleDragInfo:](self, "p_allowedToHandleDragInfo:", v7))
    goto LABEL_11;
  v8 = objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
  if (!v8)
    goto LABEL_15;
  v9 = (void *)v8;
  v10 = 0;
  do
  {
    v10 |= objc_msgSend(v9, "isLocked");
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentRep"));

    v9 = (void *)v11;
  }
  while (v11);
  if ((v10 & 1) == 0)
  {
LABEL_15:
    if (-[CRLWPDragAndDropHelper dragIsStorageLocal](self, "dragIsStorageLocal"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storage"));
      v15 = objc_msgSend(v14, "changeCount");
      v16 = -[CRLWPDragAndDropHelper sourceChangeCountForDragInfo:](self, "sourceChangeCountForDragInfo:", v7);

      if (v15 == (id)v16)
      {
        v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper sourceSelectionForDragInfo:](self, "sourceSelectionForDragInfo:", v7));
        if (v17)
        {
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
          v12 = objc_msgSend(v19, "isDragPoint:inSelection:includeEndpoints:", v18, 0, x, y);

          goto LABEL_12;
        }
      }
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)p_importingDrawablesOrMoviesFromDragInfo:(id)a3
{
  void *v3;
  unint64_t v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "itemSource"));
  v4 = (unint64_t)objc_msgSend(v3, "preferredImportableDataTypeDetectingImportableURLsInText:", 0);
  LOBYTE(v5) = 0;
  if ((objc_msgSend(v3, "hasNativeBoardItems") & 1) == 0)
    v5 = ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2) & ~objc_msgSend(v3, "hasNativeText");

  return v5;
}

- (id)p_sourceTextEditorForDragInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  objc_class *v35;
  id v36;
  id v37;
  id v38;
  void *v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "platformDraggingInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v8 = objc_opt_class(CRLWPiOSTextDraggingContext, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localObject"));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceSelectionPath"));
    if (!v12)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012330F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF2A14();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233118);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper p_sourceTextEditorForDragInfo:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 706, 0, "invalid nil value for '%{public}s'", "sourceSelectionPath");

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "interactiveCanvasController"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "infosForSelectionPath:", v12));
    if (objc_msgSend(v18, "count") == (id)1)
    {
      v20 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "anyObject"));
      v22 = sub_100221D0C(v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

      v24 = 0;
      if (!v12 || !v23)
        goto LABEL_21;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage"));
      if (v23 != v26)
      {

        v24 = 0;
LABEL_17:

LABEL_21:
        goto LABEL_22;
      }
      v38 = objc_msgSend(v11, "changeCount");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPDragAndDropHelper owningRep](self, "owningRep"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "storage"));
      v37 = objc_msgSend(v29, "changeCount");

      if (v38 == v37)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceSelectionPath"));
        objc_msgSend(v39, "setSelectionPath:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "selectionPath"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceSelectionPath"));
        v33 = objc_msgSend(v31, "isEqual:", v32);

        if (v33)
        {
          v35 = (objc_class *)objc_opt_class(_TtC8Freeform11CRLWPEditor, v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "textInputEditor"));
          v36 = sub_1002223BC(v35, v25);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v36);
          goto LABEL_17;
        }
      }
    }
    else
    {
      v23 = 0;
    }
    v24 = 0;
    goto LABEL_21;
  }
  v24 = 0;
LABEL_22:

  return v24;
}

- (CRLWPDragAndDropHelperOwning)owningRep
{
  return (CRLWPDragAndDropHelperOwning *)objc_loadWeakRetained((id *)&self->_owningRep);
}

- (CGPoint)dragAndDropNaturalPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_dragAndDropNaturalPoint.x;
  y = self->_dragAndDropNaturalPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDragAndDropNaturalPoint:(CGPoint)a3
{
  self->_dragAndDropNaturalPoint = a3;
}

- (BOOL)dragIsStorageLocal
{
  return self->_dragIsStorageLocal;
}

- (void)setDragIsStorageLocal:(BOOL)a3
{
  self->_dragIsStorageLocal = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningRep);
}

@end
