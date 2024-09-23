@implementation CRLFreehandDrawingToolAbstractPathInsertion

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CGPoint *p_initialUnscaledPoint;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingToolAbstractPathInsertion;
  -[CRLFreehandDrawingTool performActionWithInputPoint:isInitialPoint:isFinalPoint:](&v12, "performActionWithInputPoint:isInitialPoint:isFinalPoint:", v8, v6, v5);
  if (v6)
  {
    p_initialUnscaledPoint = &self->_initialUnscaledPoint;
    objc_msgSend(v8, "unscaledPoint");
    p_initialUnscaledPoint->x = v10;
    p_initialUnscaledPoint->y = v11;
  }

}

- (id)initialFreehandDrawingItem
{
  return self->_initialFreehandDrawingItem;
}

- (id)shapeItem
{
  return self->_shapeItem;
}

- (void)openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:(id)a3 stroke:(id)a4 fill:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSMapTable *v17;
  NSMapTable *originalBoundsForStandardKnobsInRootForDrawings;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  NSMapTable *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _TtC8Freeform12CRLShapeItem *v43;
  _TtC8Freeform12CRLShapeItem *shapeItem;
  void *v45;
  void *v46;
  void *v47;
  _TtC8Freeform22CRLFreehandDrawingItem *v48;
  _TtC8Freeform22CRLFreehandDrawingItem *initialFreehandDrawingItem;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *j;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGAffineTransform v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _TtC8Freeform22CRLFreehandDrawingItem *v84;
  _BYTE v85[128];
  _TtC8Freeform12CRLShapeItem *v86;
  _BYTE v87[128];
  CGRect v88;
  CGRect v89;

  v73 = a3;
  v72 = a4;
  v71 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editingCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commandController"));

  objc_msgSend(v10, "openGroup");
  if (-[CRLFreehandDrawingTool shouldCommandsEnqueueInRealTime](self, "shouldCommandsEnqueueInRealTime"))
    objc_msgSend(v10, "enableRealTimeSyncProgressiveEnqueuingInCurrentGroup");
  else
    objc_msgSend(v10, "enableProgressiveEnqueuingInCurrentGroup");
  v11 = -[CRLFreehandDrawingTool type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = v12;
  if (v11 == 7)
    v14 = CFSTR("Add Fill");
  else
    v14 = CFSTR("Add Stroke");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, 0, CFSTR("UndoStrings")));
  v70 = v10;
  objc_msgSend(v10, "setCurrentGroupActionString:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y));
  v74 = v8;
  objc_msgSend(v8, "layoutIfNeeded");
  v17 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v16, "count"));
  originalBoundsForStandardKnobsInRootForDrawings = self->_originalBoundsForStandardKnobsInRootForDrawings;
  self->_originalBoundsForStandardKnobsInRootForDrawings = v17;

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v19 = v16;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v81 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v24, "boundsForStandardKnobs");
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        if (v24)
          objc_msgSend(v24, "transformInRoot");
        else
          memset(&v79, 0, sizeof(v79));
        v88.origin.x = v26;
        v88.origin.y = v28;
        v88.size.width = v30;
        v88.size.height = v32;
        v89 = CGRectApplyAffineTransform(v88, &v79);
        v33 = self->_originalBoundsForStandardKnobsInRootForDrawings;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height));
        -[NSMapTable setObject:forKey:](v33, "setObject:forKey:", v34, v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v21);
  }

  objc_msgSend(v73, "bounds");
  v36 = v35;
  v38 = v37;
  v39 = objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v73));
  v40 = v74;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "editingCoordinator"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "boardItemFactory"));

  v68 = v42;
  v69 = (void *)v39;
  v43 = (_TtC8Freeform12CRLShapeItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "makeShapeItemForFreehandDrawingWithPathSource:position:stroke:fill:pencilKitStrokePathCompactData:maskPath:", v39, v72, v71, 0, 0, v36, v38));
  shapeItem = self->_shapeItem;
  self->_shapeItem = v43;

  -[CRLBoardItemBase setAspectRatioLocked:](self->_shapeItem, "setAspectRatioLocked:", 1);
  v86 = self->_shapeItem;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "editingCoordinator"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mainBoard"));
  v48 = (_TtC8Freeform22CRLFreehandDrawingItem *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion p_drawingInfoForNewShapeInfos:board:](self, "p_drawingInfoForNewShapeInfos:board:", v45, v47));
  initialFreehandDrawingItem = self->_initialFreehandDrawingItem;
  self->_initialFreehandDrawingItem = v48;

  -[CRLFreehandDrawingItem setProhibitsClustering:](self->_initialFreehandDrawingItem, "setProhibitsClustering:", 1);
  -[CRLBoardItemBase setAspectRatioLocked:](self->_initialFreehandDrawingItem, "setAspectRatioLocked:", 1);
  objc_msgSend(v70, "openGroup");
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "editorController"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "currentEditors"));

  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v52)
  {
    v54 = v52;
    v55 = *(_QWORD *)v76;
    while (2)
    {
      for (j = 0; j != v54; j = (char *)j + 1)
      {
        if (*(_QWORD *)v76 != v55)
          objc_enumerationMutation(v51);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j), "isMemberOfClass:", objc_opt_class(CRLGroupEditor, v53)))
        {
          v40 = v74;
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "canvasEditor"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "selectionPathWithInfo:", 0));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "editorController"));
          objc_msgSend(v59, "setSelectionPath:", v58);

          goto LABEL_27;
        }
      }
      v54 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      v40 = v74;
      if (v54)
        continue;
      break;
    }
  }
LABEL_27:

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "canvasEditor"));
  v84 = self->_initialFreehandDrawingItem;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v84, 1));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext nonInteractiveFloatingInsertionContext](CRLInsertionContext, "nonInteractiveFloatingInsertionContext"));
  objc_msgSend(v60, "insertBoardItems:withInsertionContext:postProcessBlock:", v61, v62, 0);

  objc_msgSend(v70, "closeGroup");
  objc_msgSend(v40, "layoutIfNeeded");
  v64 = objc_opt_class(CRLShapeRep, v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "repForInfo:", self->_shapeItem));
  v66 = sub_100221D0C(v64, v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);

  objc_msgSend(v67, "dynamicOperationDidBeginWithRealTimeCommands:", 0);
  objc_msgSend(v67, "i_setIsCurrentlyBeingFreehandDrawn:", 1);

}

- (id)p_drawingInfoForNewShapeInfos:(id)a3 board:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  double y;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  CRLCanvasInfoGeometry *v26;
  void *v27;
  double v28;
  double v29;
  CRLCanvasInfoGeometry *v30;
  NSObject *v31;
  char *v32;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  unsigned int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;
  void *v51;
  _BYTE v52[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[CRLGroupItem groupGeometryFromChildrenInfos:](_TtC8Freeform22CRLFreehandDrawingItem, "groupGeometryFromChildrenInfos:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItemFactory"));
  v34 = (void *)v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "makeFreehandDrawingItemWithGeometry:", v8));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    y = CGPointZero.y;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v17);
        v51 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
        v36 = 0;
        objc_msgSend(v12, "beforeInsertionAddNewItems:board:error:", v19, v7, &v36);
        v20 = v36;

        if (v20)
        {
          v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230D60);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v42 = v21;
            v43 = 2082;
            v44 = "-[CRLFreehandDrawingToolAbstractPathInsertion p_drawingInfoForNewShapeInfos:board:]";
            v45 = 2082;
            v46 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m";
            v47 = 1024;
            v48 = 167;
            v49 = 2082;
            v50 = "insertionError";
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230D80);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v31 = v23;
            v32 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v42 = v21;
            v43 = 2114;
            v44 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_drawingInfoForNewShapeInfos:board:]"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 167, 0, "expected nil value for '%{public}s'", "insertionError");

        }
        v26 = [CRLCanvasInfoGeometry alloc];
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geometry"));
        objc_msgSend(v27, "size");
        v30 = -[CRLCanvasInfoGeometry initWithPosition:size:](v26, "initWithPosition:size:", CGPointZero.x, y, v28, v29);
        objc_msgSend(v18, "setGeometry:", v30);

        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    }
    while (v14);
  }

  return v12;
}

- (id)p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  uint64_t v26;
  double v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  _BYTE v61[128];
  CGRect v62;
  CGRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentForFreehandDrawingLayoutsAtPoint:", self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y));

  memset(&v60, 0, sizeof(v60));
  v51 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometryInRoot"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v59, 0, sizeof(v59));
  CGAffineTransformInvert(&v60, &v59);

  v58 = v60;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v63 = CGRectApplyAffineTransform(v62, &v58);
  v12 = v63.origin.x;
  v13 = v63.origin.y;
  v14 = v63.size.width;
  v15 = v63.size.height;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:](self, "p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:", v16, 0, v12, v13, v14, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion p_clusterableFreehandDrawingLayoutsInParentContainerAtPoint:](self, "p_clusterableFreehandDrawingLayoutsInParentContainerAtPoint:", self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v18, "viewScale");
  v20 = v19;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v50 = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reverseObjectEnumerator"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = 1.0 / v20 * 100.0;
    v26 = *(_QWORD *)v55;
    v27 = 1.79769313e308;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v26)
          objc_enumerationMutation(v21);
        v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_originalBoundsForStandardKnobsInRootForDrawings, "objectForKeyedSubscript:", v29));
        v31 = v30;
        if (v30)
        {
          objc_msgSend(v30, "CGRectValue");
          v36 = sub_1000612CC(v32, v33, v34, v35, x, y, width, height);
          v37 = v36;
          if (v36 < v27 && v36 <= v25)
          {
            if (v53)
            {
              v52 = v24;
              v39 = v21;
              v40 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:](self, "p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:", v29, v51, 0));
              if (!v40)
              {
                v44 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101230DA0);
                v45 = off_1013D9070;
                v24 = v52;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DEEC40(v44, v45);
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101230DC0);
                v46 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DE87A4(v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:]"));
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 209, 0, "Should be able to get z-order index path for freehand drawing. Bailing early to avoid accidental overlaps.");

LABEL_32:
                goto LABEL_33;
              }
              v41 = (void *)v40;
              v42 = objc_msgSend(v53, "compare:", v40);

              v21 = v39;
              v24 = v52;
              if (v42 == (id)1)
                goto LABEL_32;
            }
            v43 = v29;

            v27 = v37;
            v24 = v43;
          }
          if (v37 <= 0.0)
            goto LABEL_32;
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v23)
        continue;
      break;
    }
  }
  else
  {
    v24 = 0;
  }
LABEL_33:

  return v24;
}

- (id)p_clusterableFreehandDrawingLayoutsInParentContainerAtPoint:(CGPoint)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", a3.x, a3.y));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_arrayOfObjectsPassingTest:", &stru_101230E00));

  return v4;
}

- (id)p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:(id)a3 intersectingRectInParentSpaceOfLayouts:(CGRect)a4 withStartingIndexPath:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGRect v41;
  CGRect v42;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = objc_msgSend(v11, "count");
  if ((uint64_t)v13 - 1 < 0)
  {
LABEL_15:
    v33 = 0;
  }
  else
  {
    v14 = (uint64_t)v13;
    while (1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", --v14));
      v17 = objc_opt_class(CRLFreehandDrawingLayout, v16);
      v18 = sub_100221D0C(v17, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (!v19 || (objc_msgSend(v19, "isInteractable") & 1) == 0)
      {
        objc_msgSend(v15, "frameForCulling");
        if (sub_100060F38(v21, v22, v23, v24, x, y, width, height))
        {
          memset(&v40, 0, sizeof(v40));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geometry"));
          v26 = v25;
          if (v25)
            objc_msgSend(v25, "transform");
          else
            memset(&v39, 0, sizeof(v39));
          CGAffineTransformInvert(&v40, &v39);

          v38 = v40;
          v41.origin.x = x;
          v41.origin.y = y;
          v41.size.width = width;
          v41.size.height = height;
          v42 = CGRectApplyAffineTransform(v41, &v38);
          v27 = v42.origin.x;
          v28 = v42.origin.y;
          v29 = v42.size.width;
          v30 = v42.size.height;
          if (v12)
            v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathByAddingIndex:", v14));
          else
            v31 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", v14));
          v33 = (void *)v31;
          v34 = objc_opt_class(CRLGroupLayout, v32);
          if ((objc_opt_isKindOfClass(v15, v34) & 1) == 0)
            goto LABEL_17;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "children"));
          v36 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:](self, "p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:", v35, v33, v27, v28, v29, v30));

          if (v36)
            break;
        }
      }

      if (v14 <= 0)
        goto LABEL_15;
    }
    v33 = (void *)v36;
LABEL_17:

  }
  return v33;
}

- (id)p_zOrderIndexPathForLayout:(id)a3 descendingFromLayout:(id)a4 withStartingIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  unsigned int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 == v9)
  {
    v18 = v10;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));
    v14 = objc_opt_class(CRLCanvasLayout, v13);
    v15 = sub_100221D0C(v14, v8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)v16;
    v18 = 0;
    if (v12 && v16)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "children"));
      v20 = objc_msgSend(v19, "indexOfObject:", v17);

      if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101230E20);
        v22 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110402;
          v30 = v21;
          v31 = 2082;
          v32 = "-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:]";
          v33 = 2082;
          v34 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m";
          v35 = 1024;
          v36 = 309;
          v37 = 2112;
          v38 = v8;
          v39 = 2112;
          v40 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to find index of descendant layout (%@) in parent layout's (%@) children.", buf, 0x36u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101230E40);
        v23 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:]"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 309, 0, "Unable to find index of descendant layout (%@) in parent layout's (%@) children.", v8, v12);

        v18 = 0;
      }
      else
      {
        if (v11)
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_indexPathByPrependingIndex:", v20));
        else
          v26 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", v20));
        v27 = (void *)v26;
        v18 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:](self, "p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:", v12, v9, v26));

      }
    }

  }
  return v18;
}

- (void)finalizeAndResetAbstractPathInsertionToolWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLCommandSelectionBehavior *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _TtC8Freeform22CRLFreehandDrawingItem *initialFreehandDrawingItem;
  _TtC8Freeform12CRLShapeItem *shapeItem;
  NSMapTable *originalBoundsForStandardKnobsInRootForDrawings;
  id v27;

  v3 = a3;
  v27 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "commandController"));
  v7 = objc_opt_class(CRLShapeRep, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForInfo:", self->_shapeItem));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "i_setIsCurrentlyBeingFreehandDrawn:", 0);
  objc_msgSend(v10, "dynamicOperationDidEnd");
  if (v3)
    -[CRLFreehandDrawingToolAbstractPathInsertion p_updateOrCreateParentDrawingToBestMatch](self, "p_updateOrCreateParentDrawingToBestMatch");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "editingCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainBoard"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase id](self->_initialFreehandDrawingItem, "id"));
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvasEditor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathWithInfo:", self->_initialFreehandDrawingItem));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvasEditor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPathWithInfo:", 0));

    v19 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v16, v18);
    if (v3)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!v3)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvasEditor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPathWithInfo:", 0));

    v19 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v21, v21);
LABEL_9:
    objc_msgSend(v5, "destroyOutermostCommandGroupOnClose");
    goto LABEL_10;
  }
  v19 = 0;
LABEL_10:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pkDrawingProvider"));
  objc_msgSend(v23, "activeDrawingWillEndAfterInsertingFinalizedDrawingItem");

  objc_msgSend(v5, "closeGroupWithSelectionBehavior:", v19);
  initialFreehandDrawingItem = self->_initialFreehandDrawingItem;
  self->_initialFreehandDrawingItem = 0;

  shapeItem = self->_shapeItem;
  self->_shapeItem = 0;

  originalBoundsForStandardKnobsInRootForDrawings = self->_originalBoundsForStandardKnobsInRootForDrawings;
  self->_originalBoundsForStandardKnobsInRootForDrawings = 0;

  self->_initialUnscaledPoint = (CGPoint)xmmword_100EEC438;
}

- (void)p_updateOrCreateParentDrawingToBestMatch
{
  CRLFreehandDrawingToolAbstractPathInsertion *v2;
  void *v3;
  _TtC8Freeform22CRLFreehandDrawingItem *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  id v28;
  _TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *i;
  void *v36;
  objc_class *v37;
  id v38;
  void *v39;
  CRLCanvasInfoGeometry *v40;
  CRLCanvasInfoGeometry *v41;
  CRLCanvasInfoGeometry *v42;
  CRLCanvasInfoGeometry *v43;
  void *v44;
  void *v45;
  id v46;
  _TtC8Freeform28CRLCommandReparentBoardItems *v47;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  CRLCommandSelectionBehavior *v58;
  void *v59;
  void *v60;
  _TtC8Freeform22CRLFreehandDrawingItem *v61;
  void *v62;
  void *v63;
  id obj;
  CRLFreehandDrawingToolAbstractPathInsertion *v65;
  void *v66;
  uint64_t v67;
  _OWORD v68[3];
  char v69[48];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandController"));
  objc_msgSend(v3, "layoutIfNeeded");
  v4 = v2->_initialFreehandDrawingItem;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase id](v4, "id"));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v10 = (objc_class *)objc_opt_class(CRLFreehandDrawingLayout, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutForInfo:", v4));
    v12 = sub_1002223BC(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pureGeometryInRoot"));
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:](v2, "p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:", v16, v18, v20, v22));
    v25 = (void *)v23;
    if (v23)
    {
      if ((void *)v23 != v13)
      {
        v60 = v13;
        v26 = (objc_class *)objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v24);
        v63 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "info"));
        v28 = sub_1002223BC(v26, v27);
        v29 = (_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering *)objc_claimAutoreleasedReturnValue(v28);

        v62 = v3;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasEditor"));
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "selectionPathWithInfo:", v29));

        v59 = (void *)v31;
        v58 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v31, v31);
        objc_msgSend(v66, "openGroupWithSelectionBehavior:");
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v61 = v4;
        obj = (id)objc_claimAutoreleasedReturnValue(-[CRLContainerItem childItems](v4, "childItems"));
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
        if (v32)
        {
          v34 = v32;
          v67 = *(_QWORD *)v71;
          v65 = v2;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(_QWORD *)v71 != v67)
                objc_enumerationMutation(obj);
              v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
              v37 = (objc_class *)objc_opt_class(_TtC8Freeform12CRLShapeItem, v33);
              v38 = sub_1002223BC(v37, v36);
              v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
              if (v39)
              {
                v40 = [CRLCanvasInfoGeometry alloc];
                objc_msgSend(v39, "fullTransformInRoot");
                v41 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v40, "initWithFullTransform:widthValid:heightValid:", v69, 1, 1);
                v42 = [CRLCanvasInfoGeometry alloc];
                if (v29)
                  -[CRLCommandFreehandDrawingProhibitClustering fullTransformInRoot](v29, "fullTransformInRoot");
                else
                  memset(v68, 0, sizeof(v68));
                v43 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v42, "initWithFullTransform:widthValid:heightValid:", v68, 1, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInfoGeometry geometryRelativeToGeometry:](v41, "geometryRelativeToGeometry:", v43));
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCommandFreehandDrawingProhibitClustering childInfos](v29, "childInfos"));
                v46 = objc_msgSend(v45, "count");

                if ((id)-[CRLFreehandDrawingTool type](v2, "type") == (id)7)
                  v46 = objc_msgSend(v63, "maxFilledShapeIndex");
                v47 = -[CRLCommandReparentBoardItems initWithDestinationContainer:boardItem:index:]([_TtC8Freeform28CRLCommandReparentBoardItems alloc], "initWithDestinationContainer:boardItem:index:", v29, v39, v46);
                objc_msgSend(v66, "enqueueCommand:", v47);
                v48 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v39, v44);
                objc_msgSend(v66, "enqueueCommand:", v48);

                v2 = v65;
              }

            }
            v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
          }
          while (v34);
        }

        v3 = v62;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "canvasEditor"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "canvasEditorHelper"));
        v4 = v61;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v61));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:canDeleteNewlyCreatedInfos:", v51, 1, 1));

        objc_msgSend(v66, "enqueueCommand:", v52);
        objc_msgSend(v66, "closeGroup");

        v13 = v60;
        v25 = v63;
        goto LABEL_29;
      }
      v53 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230E60);
      v54 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEECE8(v53, v54);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230E80);
      v55 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_updateOrCreateParentDrawingToBestMatch]"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v57, 422, 0, "expected inequality between %{public}s and %{public}s", "closestDrawingLayout", "initialDrawingLayout");

    }
    v29 = -[CRLCommandFreehandDrawingProhibitClustering initWithFreehandDrawingItem:prohibitsClustering:]([_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering alloc], "initWithFreehandDrawingItem:prohibitsClustering:", v4, 0);
    objc_msgSend(v66, "enqueueCommand:", v29);
LABEL_29:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalBoundsForStandardKnobsInRootForDrawings, 0);
  objc_storeStrong((id *)&self->_shapeItem, 0);
  objc_storeStrong((id *)&self->_initialFreehandDrawingItem, 0);
}

@end
