@implementation CRLBoardItemPositioner

- (CRLBoardItemPositioner)initWithCanvasEditor:(id)a3
{
  CRLBoardItemPositioner *result;

  result = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:](self, "initWithCanvasEditor:targetCenter:validGeometries:", a3, 1, CGPointZero.x, CGPointZero.y);
  if (result)
    result->_useOriginalPositions = 1;
  return result;
}

- (CRLBoardItemPositioner)initWithCanvasEditor:(id)a3 targetCenter:(CGPoint)a4 validGeometries:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  CRLBoardItemPositioner *v10;
  CRLBoardItemPositioner *v11;
  NSMapTable *v12;
  NSMapTable *boardItemsToCanvasBounds;
  objc_super v15;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLBoardItemPositioner;
  v10 = -[CRLBoardItemPositioner init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_canvasEditor, v9);
    v11->_targetCenter.x = x;
    v11->_targetCenter.y = y;
    v11->_validGeometries = a5;
    *(_WORD *)&v11->_useOriginalPositions = 256;
    v12 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    boardItemsToCanvasBounds = v11->_boardItemsToCanvasBounds;
    v11->_boardItemsToCanvasBounds = v12;

  }
  return v11;
}

- (void)positionBoardItems:(id)a3
{
  -[CRLBoardItemPositioner positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", a3, 0);
}

- (void)positionBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (self->_validGeometries)
    -[CRLBoardItemPositioner i_positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "i_positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", v6, v4);
  else
    -[CRLBoardItemPositioner pPositionNewBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "pPositionNewBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", v6, v4);

}

- (CGRect)i_boundsForPositioningBoardItem:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "visibleUnscaledCanvasRectWithoutKeyboard");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
    objc_msgSend(v7, "visibleUnscaledCanvasRectWithoutKeyboard");
    x = v8;
    y = v10;
    width = v12;
    height = v14;

  }
  else
  {
    x = CGRectInfinite.origin.x;
    y = CGRectInfinite.origin.y;
    width = CGRectInfinite.size.width;
    height = CGRectInfinite.size.height;
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGPoint)positionOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 50.0;
  v3 = 50.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)canvasBoundsOfBoardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSMapTable *boardItemsToCanvasBounds;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  __n128 (*v48)(uint64_t, uint64_t);
  uint64_t (*v49)();
  void *v50;
  CGRect result;

  v4 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x5012000000;
  v48 = sub_1001D8C34;
  v49 = nullsub_33;
  v50 = &unk_1010E66AB;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_boardItemsToCanvasBounds, "objectForKey:", v4));
  v6 = v5;
  if (!v5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemPositioner canvasEditor](self, "canvasEditor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "interactiveCanvasController"));

    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvas"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutForInfo:", v4));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pureGeometryInRoot"));
      objc_msgSend(v21, "frame");
      v22 = v46;
      v46[6] = v23;
      v22[7] = v24;
      v22[8] = v25;
      v22[9] = v26;

      *((_BYTE *)v42 + 24) = 1;
    }
    else if (!*((_BYTE *)v42 + 24))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemPositioner canvasEditor](self, "canvasEditor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "selectionPathWithInfo:", v4));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1001D8C44;
      v40[3] = &unk_101242BB0;
      v40[4] = &v45;
      v40[5] = &v41;
      objc_msgSend(v17, "withLayoutForSelectionPath:performBlock:", v28, v40);

      if (!*((_BYTE *)v42 + 24))
      {
        objc_msgSend(v4, "visibleBoundsForPositioning");
        v35 = v46;
        v46[6] = v36;
        v35[7] = v37;
        v35[8] = v38;
        v35[9] = v39;
        goto LABEL_8;
      }
    }
    boardItemsToCanvasBounds = self->_boardItemsToCanvasBounds;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", *((double *)v46 + 6), *((double *)v46 + 7), *((double *)v46 + 8), *((double *)v46 + 9)));
    -[NSMapTable setObject:forKey:](boardItemsToCanvasBounds, "setObject:forKey:", v30, v4);

LABEL_8:
    _Block_object_dispose(&v41, 8);

    v8 = *((double *)v46 + 6);
    v10 = *((double *)v46 + 7);
    v12 = *((double *)v46 + 8);
    v14 = *((double *)v46 + 9);
    goto LABEL_9;
  }
  objc_msgSend(v5, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (double *)v46;
  *((double *)v46 + 6) = v7;
  v15[7] = v9;
  v15[8] = v11;
  v15[9] = v13;
LABEL_9:

  _Block_object_dispose(&v45, 8);
  v31 = v8;
  v32 = v10;
  v33 = v12;
  v34 = v14;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)boundsByFittingBoardItem:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "visibleBoundsForPositioning");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)hasValidGeometries
{
  return self->_validGeometries;
}

- (BOOL)p_infos:(id)a3 collideWithRect:(CGRect)a4 orTargetCenter:(CGPoint)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  double v33;
  BOOL v34;
  double v35;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  BOOL v43;
  CGFloat x;
  CGFloat y;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = a3;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLBoardItem, v9);
        v15 = sub_100221D0C(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (v16)
        {
          -[CRLBoardItemPositioner canvasBoundsOfBoardItem:](self, "canvasBoundsOfBoardItem:", v16);
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v25 = sub_100061400(x, y, width, height);
          v27 = v26;
          v29 = sub_100061400(v18, v20, v22, v24);
          v31 = vabdd_f64(v27, v30);
          v32 = vabdd_f64(v25, v29) < 4.0 && v31 < 4.0;
          if (v32 || ((v33 = vabdd_f64(a5.y, v30), vabdd_f64(a5.x, v29) < 4.0) ? (v34 = v33 < 4.0) : (v34 = 0), v34))
          {
            v35 = vabdd_f64(height, v24);
            if (vabdd_f64(width, v22) < 40.0 || v35 < 40.0)
              goto LABEL_27;
          }
          objc_opt_class(_TtC8Freeform12CRLGroupItem, v28);
          v38 = sub_100221D0C(v37, v13);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v40 = v39;
          if (v39)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "allNestedChildrenItemsIncludingGroups"));
            v42 = -[CRLBoardItemPositioner p_infos:collideWithRect:orTargetCenter:](self, "p_infos:collideWithRect:orTargetCenter:", v41, x, y, width, height, a5.x, a5.y);

            if ((v42 & 1) != 0)
            {

LABEL_27:
              v43 = 1;
              goto LABEL_28;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v10)
        continue;
      break;
    }
  }
  v43 = 0;
LABEL_28:

  return v43;
}

- (BOOL)p_hasCanvasCollisionWithSpecificBoardItemFrame:(CGRect)a3 targetCenter:(CGPoint)a4 previouslyPositionedBoardItems:(id)a5
{
  double y;
  double x;
  double height;
  double width;
  double v9;
  double v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  BOOL v23;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v12 = a5;
  if (self->_avoidCollisions)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemPositioner canvasEditor](self, "canvasEditor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactiveCanvasController"));

    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242BD0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E09974();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242BF0);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemPositioner p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItemPositioner.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 218, 0, "invalid nil value for '%{public}s'", "icc");

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "infosToDisplay"));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "crl_arrayByTransformingWithBlock:", &stru_101242C30));

    if (objc_msgSend(v12, "count"))
    {
      if (v21)
      {
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v21));

        v21 = (id)v22;
      }
      else
      {
        v21 = v12;
      }
    }
    v23 = -[CRLBoardItemPositioner p_infos:collideWithRect:orTargetCenter:](self, "p_infos:collideWithRect:orTargetCenter:", v21, v10, v9, width, height, x, y);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (CGPoint)pPinnedCenter:(CGPoint)a3 andSize:(CGSize)a4 toBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double MaxX;
  double v16;
  BOOL v17;
  double MidX;
  double MaxY;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MidY;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  int v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat rect;
  double MinX;
  double v45;
  double v46;
  double MinY;
  CGFloat v48;
  double v49;
  double v50;
  CGPoint result;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  height = a5.size.height;
  width = a5.size.width;
  rect = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v49 = a4.width * 0.5;
  v50 = a3.x;
  v41 = a3.y;
  v46 = a4.height;
  v52.origin.x = sub_10005FD98(a3.x, a3.y, a4.width);
  v10 = v52.origin.x;
  v11 = v52.origin.y;
  v12 = v52.size.width;
  v13 = v52.size.height;
  MinX = CGRectGetMinX(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  v14 = CGRectGetMinX(v53);
  v48 = v10;
  v54.origin.x = v10;
  v54.origin.y = v11;
  v54.size.width = v12;
  v54.size.height = v13;
  MaxX = CGRectGetMaxX(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = rect;
  v55.size.height = height;
  v16 = CGRectGetMaxX(v55);
  v17 = MinX >= v14 || MaxX <= v16;
  if (!v17)
  {
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = rect;
    v57.size.height = height;
    MidX = CGRectGetMidX(v57);
LABEL_10:
    v50 = MidX;
    goto LABEL_11;
  }
  if (MinX < v14)
  {
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = rect;
    v58.size.height = height;
    MidX = v49 + CGRectGetMinX(v58);
    goto LABEL_10;
  }
  if (MaxX > v16)
  {
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = rect;
    v56.size.height = height;
    MidX = CGRectGetMaxX(v56) - v49;
    goto LABEL_10;
  }
LABEL_11:
  v42 = v46 * 0.5;
  v59.origin.x = v48;
  v59.origin.y = v11;
  v59.size.width = v12;
  v59.size.height = v13;
  MinY = CGRectGetMinY(v59);
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = rect;
  v60.size.height = height;
  v45 = CGRectGetMinY(v60);
  v61.origin.x = v48;
  v61.origin.y = v11;
  v61.size.width = v12;
  v61.size.height = v13;
  MaxY = CGRectGetMaxY(v61);
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = rect;
  v62.size.height = height;
  v20 = CGRectGetMaxY(v62);
  v21 = rect;
  if (MinY >= v45 || MaxY <= v20)
  {
    if (MinY < v45)
    {
      v30 = x;
      v31 = y;
      v32 = height;
      v26 = v42;
      MidY = v42 + CGRectGetMinY(*(CGRect *)(&v21 - 2));
    }
    else
    {
      v17 = MaxY <= v20;
      MidY = v41;
      v26 = v42;
      if (!v17)
      {
        v27 = x;
        v28 = y;
        v29 = height;
        MidY = CGRectGetMaxY(*(CGRect *)(&v21 - 2)) - v42;
      }
    }
  }
  else
  {
    v22 = x;
    v23 = y;
    v24 = height;
    MidY = CGRectGetMidY(*(CGRect *)(&v21 - 2));
    v26 = v42;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemPositioner canvasEditor](self, "canvasEditor", *(_QWORD *)&v41));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "interactiveCanvasController"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "canvas"));
  v36 = objc_msgSend(v35, "isAnchoredAtRight");

  if (v50 - v49 >= 0.0)
    v37 = 1;
  else
    v37 = v36;
  if (v37)
    v38 = v50;
  else
    v38 = v49;
  v39 = -v49;
  if (v49 + v50 <= 0.0)
    v39 = v50;
  if ((v36 & 1) != 0)
    v38 = v39;
  if (MidY - v26 >= 0.0)
    v40 = MidY;
  else
    v40 = v26;
  result.y = v40;
  result.x = v38;
  return result;
}

- (void)p_CenterBoardItem:(id)a3 withInitialFrame:(CGRect)a4 offsettingFromTargetCenter:(CGPoint)a5 previouslyPositionedBoardItems:(id)a6 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a7
{
  double y;
  double x;
  CGFloat height;
  double width;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id WeakRetained;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *i;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v66 = a4.origin.x;
  v67 = a4.origin.y;
  v14 = a3;
  v15 = a6;
  -[CRLBoardItemPositioner i_boundsForPositioningBoardItem:](self, "i_boundsForPositioningBoardItem:", v14);
  v68 = v16;
  v69 = v17;
  v19 = v18;
  v21 = v20;
  v64 = width;
  v65 = height;
  v22 = sub_10005FD98(x, y, width);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if (!a7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
    v31 = objc_msgSend(v30, "isCanvasBackgroundAlignmentSnappingEnabled");

    if (v31)
    {
      v32 = objc_loadWeakRetained((id *)&self->_canvasEditor);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "interactiveCanvasController"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "canvasBackground"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "alignmentProvider"));
      v36 = v35;
      if (v35)
      {
        objc_msgSend(v35, "originPointForAlignedInsertingRect:", v22, v24, v26, v28);
        v22 = v37;
        v24 = v38;
      }

    }
  }
  for (i = 0;
        -[CRLBoardItemPositioner p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:](self, "p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:", i, v22, v24, v26, v28, x, y);
        i = v44)
  {
    -[CRLBoardItemPositioner positionOffset](self, "positionOffset");
    v22 = sub_1000603D0(v22, v24, v40);
    v24 = v41;
    -[CRLBoardItemPositioner positionOffset](self, "positionOffset");
    x = sub_1000603D0(x, y, v42);
    y = v43;
    if (self->_clampToVisibleBounds && !sub_10005FFE0(v19, v21, v68, v69, v22, v24, v26, v28))
    {
      v48 = sub_100061400(v22, v24, v26, v28);
      -[CRLBoardItemPositioner pPinnedCenter:andSize:toBounds:](self, "pPinnedCenter:andSize:toBounds:");
      v47 = v48;
      goto LABEL_15;
    }
    v44 = v15;

  }
  if (self->_clampToVisibleBounds && !sub_10005FFE0(v19, v21, v68, v69, v22, v24, v26, v28))
  {
    v63 = sub_100061400(v22, v24, v26, v28);
    -[CRLBoardItemPositioner pPinnedCenter:andSize:toBounds:](self, "pPinnedCenter:andSize:toBounds:");
    v47 = v63;
LABEL_15:
    v49 = sub_1000603B8(v45, v46, v47);
    v22 = sub_1000603D0(v22, v24, v49);
    v24 = v50;
  }
  v51 = objc_loadWeakRetained((id *)&self->_canvasEditor);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "interactiveCanvasController"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "commandController"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "board"));

  if (!v54)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242C50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09A08();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242C70);
    v55 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemPositioner p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:]"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItemPositioner.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v57, 325, 0, "invalid nil value for '%{public}s'", "board");

  }
  if (!self->_useOriginalPositions
    || (v58 = sub_100061400(v22, v24, v26, v28),
        v60 = v59,
        v61 = sub_100061400(v66, v67, v64, v65),
        !sub_10005FDF0(v58, v60, v61, v62)))
  {
    objc_msgSend(v14, "crl_onBoard:moveItemToPosition:size:", v54, v22, v24, v26, v28);
  }

}

- (BOOL)p_hasAnyCollisionForIndividualInfos:(id)a3 currentTotalFrame:(CGRect)a4 currentTotalDelta:(CGPoint)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v8;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double x;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v8 = a4.origin.x;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = a3;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLBoardItem, v11);
        v17 = sub_100221D0C(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (v18)
        {
          -[CRLBoardItemPositioner boundsByFittingBoardItem:](self, "boundsByFittingBoardItem:", v18);
          v20 = v19;
          v22 = v21;
          v25 = sub_1000603D0(v23, v24, x);
          v27 = v26;
          v28 = sub_100061400(v8, y, width, height);
          if (-[CRLBoardItemPositioner p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:](self, "p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:", 0, v25, v27, v20, v22, v28, v29))
          {

            v30 = 1;
            goto LABEL_12;
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v12)
        continue;
      break;
    }
  }
  v30 = 0;
LABEL_12:

  return v30;
}

- (void)i_positionBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  int v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  id v24;
  id v25;
  char *v26;
  char *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  __int128 v37;
  char *v38;
  double v39;
  double v40;
  int v41;
  id WeakRetained;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  unsigned int v57;
  unsigned int v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  unsigned int v78;
  unsigned int v79;
  char *v80;
  double v81;
  double v82;
  double v83;
  char *v84;
  char *v85;
  id v86;
  char *v87;
  char *v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  double v95;
  id v96;
  _BOOL4 v97;
  int v98;
  id obj;
  CGFloat width;
  CGFloat height;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  char *v106;
  char *v107;
  char *v108;
  char **v109;
  _BYTE v110[128];
  _QWORD v111[6];
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v97 = a4;
  v106 = 0;
  v107 = 0;
  v108 = 0;
  v96 = a3;
  sub_1001DA7F8(&v106, (unint64_t)objc_msgSend(v96, "count"));
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v7 = CGPointZero.x;
  v8 = CGPointZero.y;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v96;
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v103;
    do
    {
      v13 = 0;
      v98 = v11 + (_DWORD)v10;
      do
      {
        if (*(_QWORD *)v103 != v12)
          objc_enumerationMutation(obj);
        v14 = x;
        v15 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)v13);
        -[CRLBoardItemPositioner boundsByFittingBoardItem:](self, "boundsByFittingBoardItem:", v15);
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v24 = v15;
        v25 = v24;
        v26 = v107;
        if (v107 >= v108)
        {
          v28 = v106;
          v29 = 0xCCCCCCCCCCCCCCCDLL * ((v107 - v106) >> 3);
          v30 = v29 + 1;
          if (v29 + 1 > 0x666666666666666)
            sub_100007810();
          if (0x999999999999999ALL * ((v108 - v106) >> 3) > v30)
            v30 = 0x999999999999999ALL * ((v108 - v106) >> 3);
          if (0xCCCCCCCCCCCCCCCDLL * ((v108 - v106) >> 3) >= 0x333333333333333)
            v31 = 0x666666666666666;
          else
            v31 = v30;
          v111[4] = &v108;
          if (v31)
          {
            v32 = (char *)sub_10014A874((uint64_t)&v108, v31);
            v28 = v106;
            v26 = v107;
          }
          else
          {
            v32 = 0;
          }
          v33 = &v32[40 * v29];
          *(_QWORD *)v33 = v25;
          *((double *)v33 + 1) = v17;
          *((double *)v33 + 2) = v19;
          *((CGFloat *)v33 + 3) = v21;
          *((CGFloat *)v33 + 4) = v23;
          v34 = v33;
          if (v26 != v28)
          {
            v35 = v26;
            do
            {
              v36 = *((_QWORD *)v35 - 5);
              v35 -= 40;
              *(_QWORD *)v35 = 0;
              *((_QWORD *)v34 - 5) = v36;
              v34 -= 40;
              v37 = *(_OWORD *)(v35 + 8);
              *(_OWORD *)(v34 + 24) = *(_OWORD *)(v35 + 24);
              *(_OWORD *)(v34 + 8) = v37;
            }
            while (v35 != v28);
          }
          v27 = v33 + 40;
          v106 = v34;
          v107 = v33 + 40;
          v38 = v108;
          v108 = &v32[40 * v31];
          v111[2] = v26;
          v111[3] = v38;
          v111[0] = v28;
          v111[1] = v28;
          sub_1001DADBC((uint64_t)v111);
        }
        else
        {
          *(_QWORD *)v107 = v24;
          *((double *)v26 + 1) = v17;
          *((double *)v26 + 2) = v19;
          v27 = v26 + 40;
          *((CGFloat *)v26 + 3) = v21;
          *((CGFloat *)v26 + 4) = v23;
        }
        v107 = v27;
        if (v19 < v8)
          v39 = v17;
        else
          v39 = v7;
        if (v19 < v8)
          v40 = v19;
        else
          v40 = v8;
        if (v19 < v8)
          v41 = v11;
        else
          v41 = v9;
        if (v17 >= v7)
        {
          v39 = v7;
          v40 = v8;
          v41 = v9;
        }
        if (v11)
          v7 = v39;
        else
          v7 = v17;
        if (v11)
          v8 = v40;
        else
          v8 = v19;
        if (v11)
          v9 = v41;
        else
          v9 = 0;
        v112.origin.x = v17;
        v112.origin.y = v19;
        v112.size.width = v21;
        v112.size.height = v23;
        v114.origin.x = v14;
        v114.origin.y = y;
        v114.size.width = width;
        v114.size.height = height;
        v113 = CGRectUnion(v112, v114);
        width = v113.size.width;
        height = v113.size.height;
        x = v113.origin.x;
        y = v113.origin.y;
        ++v11;
        v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
      v11 = v98;
    }
    while (v10);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "canvasBackground"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "alignmentProvider"));
  if (self->_useOriginalPositions)
  {
    v47 = CGPointZero.x;
    v46 = CGPointZero.y;
  }
  else
  {
    v48 = self->_targetCenter.x;
    v49 = self->_targetCenter.y;
    v50 = sub_100061400(x, y, width, height);
    v47 = sub_1000603B8(v48, v49, v50);
    v46 = v51;
    v52 = sub_1000603D0(x, y, v47);
    v54 = v53;
    if (!v97)
    {
      v55 = objc_loadWeakRetained((id *)&self->_canvasEditor);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "interactiveCanvasController"));
      v57 = objc_msgSend(v56, "isCanvasBackgroundAlignmentSnappingEnabled");
      v58 = v45 ? v57 : 0;

      if (v58)
      {
        objc_msgSend(v45, "originPointForAlignedInsertingRect:", v52, v54, width, height);
        v52 = v59;
        v54 = v60;
      }
    }
    if (-[CRLBoardItemPositioner shouldPreserveRelativePositions](self, "shouldPreserveRelativePositions"))
    {
      while (-[CRLBoardItemPositioner p_hasAnyCollisionForIndividualInfos:currentTotalFrame:currentTotalDelta:](self, "p_hasAnyCollisionForIndividualInfos:currentTotalFrame:currentTotalDelta:", obj, v52, v54, width, height, v47, v46))
      {
        -[CRLBoardItemPositioner positionOffset](self, "positionOffset");
        v62 = v61;
        if (v45)
        {
          v63 = objc_loadWeakRetained((id *)&self->_canvasEditor);
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "interactiveCanvasController"));
          objc_msgSend(v64, "viewScale");
          objc_msgSend(v45, "snapDistanceForViewScale:");
          v66 = v65;

          if (v62 <= v66)
            v62 = v66;
        }
        v47 = sub_1000603D0(v47, v46, v62);
        v46 = v67;
        v52 = sub_1000603D0(v52, v54, v62);
        v54 = v68;
      }
    }
  }
  if (-[CRLBoardItemPositioner shouldPreserveRelativePositions](self, "shouldPreserveRelativePositions"))
  {
    v69 = objc_loadWeakRetained((id *)&self->_canvasEditor);
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "interactiveCanvasController"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "commandController"));
    v72 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "board"));

    if (!v72)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242C90);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E09A9C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242CB0);
      v73 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemPositioner i_positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:]"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItemPositioner.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v74, v75, 409, 0, "invalid nil value for '%{public}s'", "board");

    }
    if (!v97)
    {
      v76 = objc_loadWeakRetained((id *)&self->_canvasEditor);
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "interactiveCanvasController"));
      v78 = objc_msgSend(v77, "isCanvasBackgroundAlignmentSnappingEnabled");
      if (v45)
        v79 = v78;
      else
        v79 = 0;

      if (v79)
      {
        v80 = &v106[40 * v9];
        v81 = *((double *)v80 + 1);
        objc_msgSend(v45, "originPointForAlignedInsertingRect:", sub_1000603D0(v81, *((double *)v80 + 2), v47));
        v47 = sub_1000603B8(v82, v83, v81);
      }
    }
    v84 = v106;
    v85 = v107;
    while (v84 != v85)
    {
      v86 = *(id *)v84;
      objc_msgSend(v86, "crl_onBoard:moveItemToPosition:size:", v72, sub_1000603D0(*((double *)v84 + 1), *((double *)v84 + 2), v47));

      v84 += 40;
    }
  }
  else
  {
    if ((unint64_t)objc_msgSend(obj, "count") < 2)
      v72 = 0;
    else
      v72 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
    v87 = v106;
    v88 = v107;
    if (v106 != v107)
    {
      v89 = v47;
      do
      {
        v90 = *((double *)v87 + 1);
        v91 = *((double *)v87 + 2);
        v92 = *((double *)v87 + 3);
        v93 = *((double *)v87 + 4);
        v94 = sub_100061400(v90, v91, v92, v93);
        -[CRLBoardItemPositioner p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", *(_QWORD *)v87, v72, v97, v90, v91, v92, v93, v89 + v94, v46 + v95);
        objc_msgSend(v72, "addObject:", *(_QWORD *)v87);
        v87 += 40;
      }
      while (v87 != v88);
    }
  }

  v109 = &v106;
  sub_1001DAD50((void ***)&v109);

}

- (void)pPositionNewBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  char *v21;
  char *v22;
  void **v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  __int128 v32;
  void **v33;
  double x;
  double y;
  id v36;
  char *v37;
  char *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void **v49;
  char *v50;
  void **v51;
  void **v52[6];
  _BYTE v53[128];

  v4 = a4;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v44 = a3;
  sub_1001DA7F8((char **)&v49, (unint64_t)objc_msgSend(v44, "count"));
  v43 = v4;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v44;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        -[CRLBoardItemPositioner boundsByFittingBoardItem:](self, "boundsByFittingBoardItem:", v10);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v19 = v10;
        v20 = v19;
        v21 = v50;
        if (v50 >= (char *)v51)
        {
          v23 = v49;
          v24 = 0xCCCCCCCCCCCCCCCDLL * ((v50 - (char *)v49) >> 3);
          v25 = v24 + 1;
          if (v24 + 1 > 0x666666666666666)
            sub_100007810();
          if (0x999999999999999ALL * (v51 - v49) > v25)
            v25 = 0x999999999999999ALL * (v51 - v49);
          if (0xCCCCCCCCCCCCCCCDLL * (v51 - v49) >= 0x333333333333333)
            v26 = 0x666666666666666;
          else
            v26 = v25;
          v52[4] = (void **)&v51;
          if (v26)
          {
            v27 = (char *)sub_10014A874((uint64_t)&v51, v26);
            v23 = v49;
            v21 = v50;
          }
          else
          {
            v27 = 0;
          }
          v28 = &v27[40 * v24];
          *(_QWORD *)v28 = v20;
          *((_QWORD *)v28 + 1) = v12;
          *((_QWORD *)v28 + 2) = v14;
          *((_QWORD *)v28 + 3) = v16;
          *((_QWORD *)v28 + 4) = v18;
          v29 = v28;
          if (v21 != (char *)v23)
          {
            v30 = v21;
            do
            {
              v31 = *((_QWORD *)v30 - 5);
              v30 -= 40;
              *(_QWORD *)v30 = 0;
              *((_QWORD *)v29 - 5) = v31;
              v29 -= 40;
              v32 = *(_OWORD *)(v30 + 8);
              *(_OWORD *)(v29 + 24) = *(_OWORD *)(v30 + 24);
              *(_OWORD *)(v29 + 8) = v32;
            }
            while (v30 != (char *)v23);
          }
          v22 = v28 + 40;
          v49 = (void **)v29;
          v50 = v28 + 40;
          v33 = v51;
          v51 = (void **)&v27[40 * v26];
          v52[0] = v23;
          v52[2] = (void **)v21;
          v52[3] = v33;
          v52[1] = v23;
          sub_1001DADBC((uint64_t)v52);
        }
        else
        {
          *(_QWORD *)v50 = v19;
          *((_QWORD *)v21 + 1) = v12;
          *((_QWORD *)v21 + 2) = v14;
          v22 = v21 + 40;
          *((_QWORD *)v21 + 3) = v16;
          *((_QWORD *)v21 + 4) = v18;
        }
        v50 = v22;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v7);
  }

  x = self->_targetCenter.x;
  y = self->_targetCenter.y;
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
    v36 = 0;
  else
    v36 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v37 = (char *)v49;
  v38 = v50;
  while (v37 != v38)
  {
    -[CRLBoardItemPositioner p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", *(_QWORD *)v37, v36, v43, *((double *)v37 + 1), *((double *)v37 + 2), *((double *)v37 + 3), *((double *)v37 + 4), x, y);
    -[CRLBoardItemPositioner positionOffset](self, "positionOffset");
    v40 = v39;
    v42 = v41;
    objc_msgSend(v36, "addObject:", *(_QWORD *)v37);
    y = y + v42;
    x = x + v40;
    v37 += 40;
  }

  v52[0] = (void **)&v49;
  sub_1001DAD50(v52);

}

- (BOOL)shouldPreserveRelativePositions
{
  return self->_shouldPreserveRelativePositions;
}

- (void)setShouldPreserveRelativePositions:(BOOL)a3
{
  self->_shouldPreserveRelativePositions = a3;
}

- (BOOL)avoidCollisions
{
  return self->_avoidCollisions;
}

- (void)setAvoidCollisions:(BOOL)a3
{
  self->_avoidCollisions = a3;
}

- (CRLCanvasEditor)canvasEditor
{
  return (CRLCanvasEditor *)objc_loadWeakRetained((id *)&self->_canvasEditor);
}

- (CGPoint)targetCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetCenter.x;
  y = self->_targetCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)useOriginalPositions
{
  return self->_useOriginalPositions;
}

- (BOOL)clampToVisibleBounds
{
  return self->_clampToVisibleBounds;
}

- (void)setClampToVisibleBounds:(BOOL)a3
{
  self->_clampToVisibleBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boardItemsToCanvasBounds, 0);
  objc_destroyWeak((id *)&self->_canvasEditor);
}

@end
