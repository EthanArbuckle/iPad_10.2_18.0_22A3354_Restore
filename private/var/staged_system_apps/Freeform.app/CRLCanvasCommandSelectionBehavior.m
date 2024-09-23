@implementation CRLCanvasCommandSelectionBehavior

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5 selectionFlags:(unint64_t)a6 commitSelectionFlags:(unint64_t)a7 forwardSelectionFlags:(unint64_t)a8 reverseSelectionFlags:(unint64_t)a9
{
  unint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CRLCanvasCommandSelectionBehavior *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  unint64_t v38;
  CRLCanvasCommandSelectionBehavior *v39;
  uint64_t v41;
  void *v42;
  unint64_t v43;

  v14 = a9;
  v15 = a3;
  v17 = a5;
  if (!v15)
  {
    LODWORD(v41) = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E650);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA498();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E670);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLCanvasCommandSelectionBehavior.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 26, 0, "invalid nil value for '%{public}s'", "editor", v41);

  }
  if ((unint64_t)(a4 - 2) < 2)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "interactiveCanvasController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "editorController"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPath"));

    goto LABEL_22;
  }
  if (a4 != 1)
  {
    if (!a4)
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathWithInfos:", 0));
      v22 = self;
LABEL_24:
      a7 |= 0x46uLL;
      a8 |= a7;
LABEL_25:
      v37 = v17;
      v17 = (id)v21;
      goto LABEL_26;
    }
    v21 = 0;
LABEL_22:
    v22 = self;
    if (a4 != 3 && a4)
      goto LABEL_25;
    goto LABEL_24;
  }
  v43 = a6;
  v25 = objc_msgSend(v17, "mostSpecificSelectionOfClass:", objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v16));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v42 = v27;
  if (!v27)
  {
    v35 = 0;
LABEL_32:
    v36 = 1;
    goto LABEL_33;
  }
  v28 = objc_msgSend(v27, "infosOfClass:", objc_opt_class(_TtC8Freeform12CRLBoardItem, v26));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "anyObject"));

  v32 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "parentInfo"));
  v34 = sub_100221D0C(v32, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  if ((objc_msgSend(v35, "isSelectable") & 1) == 0)
  {

    v35 = 0;
  }

  if (!v35)
  {
    v27 = 0;
    goto LABEL_32;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v35));
  v36 = 0;
LABEL_33:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathWithInfos:", v27));
  if ((v36 & 1) == 0)

  v14 = a9 | 4;
  a6 = v43;
  v22 = self;
LABEL_26:
  if (a4 == 3)
    v38 = a8;
  else
    v38 = 0;
  v39 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](v22, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", v37, v17, a6, a7, a8, v38 | v14);

  return v39;
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5 selectionFlags:(unint64_t)a6
{
  return -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](self, "initWithCanvasEditor:type:selectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", a3, a4, a5, a6, 0, 0, 0);
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5
{
  return -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:](self, "initWithCanvasEditor:type:selectionPath:selectionFlags:", a3, a4, a5, 0);
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 constructedInfos:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CRLCanvasCommandSelectionBehavior *v21;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    if (a4 && a4 != 3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E690);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEA544();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E6B0);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLCanvasCommandSelectionBehavior.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 95, 0, "Constructed infos should not be provided for this selection type");

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPath"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditorHelper"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPathForInsertingBoardItems:byReplacingInfosInSelectionPath:preservingMultipleContainers:", v10, v16, a4 == 3));

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "editorController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPath"));

  }
  v21 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:](self, "initWithCanvasEditor:type:selectionPath:", v8, a4, v18);

  return v21;
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4
{
  return -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](self, "initWithCanvasEditor:type:constructedInfos:", a3, a4, 0);
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3
{
  return -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](self, "initWithCanvasEditor:type:constructedInfos:", a3, 2, 0);
}

@end
