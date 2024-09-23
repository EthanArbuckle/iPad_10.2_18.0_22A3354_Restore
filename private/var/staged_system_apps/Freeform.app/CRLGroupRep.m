@implementation CRLGroupRep

- (id)p_groupItem
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(_TtC8Freeform12CRLGroupItem, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v5 = sub_1002223BC(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (CRLContainerInfo)containerInfo
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (CRLContainerInfo *)v10;
}

- (BOOL)isInvisible
{
  return 1;
}

- (CGRect)clipRect
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGAffineTransform v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupedChildReps](self, "p_groupedChildReps"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "clipRect", *(_OWORD *)&v34.a, *(_OWORD *)&v34.c, *(_OWORD *)&v34.tx);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geometry"));
        v22 = v21;
        if (v21)
          objc_msgSend(v21, "transform");
        else
          memset(&v34, 0, sizeof(v34));
        v40.origin.x = v13;
        v40.origin.y = v15;
        v40.size.width = v17;
        v40.size.height = v19;
        v41 = CGRectApplyAffineTransform(v40, &v34);
        v23 = v41.origin.x;
        v24 = v41.origin.y;
        v25 = v41.size.width;
        v26 = v41.size.height;

        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        v46.origin.x = v23;
        v46.origin.y = v24;
        v46.size.width = v25;
        v46.size.height = v26;
        v43 = CGRectUnion(v42, v46);
        x = v43.origin.x;
        y = v43.origin.y;
        width = v43.size.width;
        height = v43.size.height;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  if (CGRectIsNull(v44))
  {
    +[CRLGroupItem unscaledSizeForEmptyGroups](_TtC8Freeform12CRLGroupItem, "unscaledSizeForEmptyGroups");
    x = sub_10005FDDC();
    y = v27;
    width = v28;
    height = v29;
  }
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)recursivelyDrawInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  BOOL v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  v6 = a4;
  memset(&v26, 0, sizeof(v26));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "transform");
  else
    memset(&v26, 0, sizeof(v26));

  if (sub_100192C0C(&v26.a))
  {
    v25 = v26;
    CGContextConcatCTM(a3, &v25);
    -[CRLGroupRep clipRect](self, "clipRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = -[CRLCanvasRep masksToBounds](self, "masksToBounds");
    if ((sub_1000637C8() & 1) == 0)
    {
      v19 = sub_100060BF8(v15, v17);
      if (v18 && !v19)
      {
        v27.origin.x = v11;
        v27.origin.y = v13;
        v27.size.width = v15;
        v27.size.height = v17;
        CGContextClipToRect(a3, v27);
LABEL_21:
        CGContextSaveGState(a3);
        if ((v18 & 1) == 0)
        {
          v28.origin.x = v11;
          v28.origin.y = v13;
          v28.size.width = v15;
          v28.size.height = v17;
          CGContextClipToRect(a3, v28);
        }
        -[CRLGroupRep drawInContext:](self, "drawInContext:", a3);
        CGContextRestoreGState(a3);
LABEL_24:
        -[CRLCanvasRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](self, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, v6);
        goto LABEL_25;
      }
      if (!v19)
        goto LABEL_21;
    }
    if ((v18 & 1) != 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  v20 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012332B8);
  v21 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF2DD8(v20, v21);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012332D8);
  v22 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE81F0(v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupRep recursivelyDrawInContext:keepingChildrenPassingTest:]"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupRep.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 93, 0, "Invalid group transform; bailing out on group");

LABEL_25:
}

- (CGRect)frameInUnscaledCanvas
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pureGeometryInRoot"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameInUnscaledCanvasForMarqueeSelecting
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10), "frameInUnscaledCanvasForMarqueeSelecting");
        v27.origin.x = v11;
        v27.origin.y = v12;
        v27.size.width = v13;
        v27.size.height = v14;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectUnion(v24, v27);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)i_baseFrameInUnscaledCanvasForPositioningLayer
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "geometryInRoot"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)updateFromLayout
{
  void *v3;
  unsigned int v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep updateFromLayout](&v9, "updateFromLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isCanvasInteractive");

  if (v4)
  {
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    if (!CGRectEqualToRect(v10, self->_lastBoundsForStandardKnobs))
    {
      -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
      -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
      self->_lastBoundsForStandardKnobs.origin.x = v5;
      self->_lastBoundsForStandardKnobs.origin.y = v6;
      self->_lastBoundsForStandardKnobs.size.width = v7;
      self->_lastBoundsForStandardKnobs.size.height = v8;
    }
  }
}

- (NSArray)allRepsContainedInGroup
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(CRLGroupRep, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allRepsContainedInGroup"));
          objc_msgSend(v3, "addObjectsFromArray:", v12);

        }
        else
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)createAdditionalBoardItemsForCopyImaging
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    v10 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v9);
    v37 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info"));
    v12 = sub_100221D0C(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = objc_alloc((Class)NSSet);
    v36 = (void *)v13;
    v48 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
    v17 = objc_msgSend(v15, "initWithArray:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topLevelZOrderedSiblingsOfInfos:", v17));

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v24, "requiresAdditionalBoardItemsForCopyImaging"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "repForInfo:", v24));

            v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
            v28 = objc_msgSend(v27, "containsObject:", v26);

            if (v28)
              objc_msgSend(v4, "addObject:", v26);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v21);
    }

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v29 = v4;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j), "createAdditionalBoardItemsForCopyImaging"));
        objc_msgSend(v3, "addObjectsFromArray:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v31);
  }

  return v3;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (id)overlayRenderables
{
  NSArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLGroupRep;
  v2 = -[CRLCanvasRep overlayRenderables](&v4, "overlayRenderables");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isSelectedIgnoringLocking
{
  void *v3;
  void *v4;
  unsigned int v5;
  BOOL v6;
  void *v7;
  void *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (objc_msgSend(v3, "isSelectable"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v5 = objc_msgSend(v4, "isCanvasInteractive");

  }
  else
  {
    v5 = 0;
  }

  v6 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A2F54;
    v10[3] = &unk_101233300;
    v10[4] = v8;
    v10[5] = self;
    v10[6] = &v11;
    objc_msgSend(v8, "enumerateEditorsOnStackUsingBlock:", v10);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)shouldShowSelectionHighlight
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  BOOL v28;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));

  v7 = objc_msgSend(v5, "mostSpecificSelectionOfClass:", objc_opt_class(_TtC8Freeform17CRLGroupSelection, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelContainerInfoForEditing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v17 = sub_100221DDC(v10, 1, v11, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (v9 == v18)
  {

  }
  else
  {
    v19 = v18;
    if (!v8)
    {

LABEL_18:
      v30.receiver = self;
      v30.super_class = (Class)CRLGroupRep;
      v28 = -[CRLCanvasRep shouldShowSelectionHighlight](&v30, "shouldShowSelectionHighlight");
      goto LABEL_19;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "boardItems"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupItem](self, "p_groupItem"));
    v22 = objc_msgSend(v20, "containsObject:", v21);

    if (!v22)
      goto LABEL_18;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "isInDynamicOperation") & 1) != 0)
        {
          v28 = 0;
          goto LABEL_16;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v25)
        continue;
      break;
    }
  }
  v28 = 1;
LABEL_16:

LABEL_19:
  return v28;
}

- (id)selectionHighlightColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  CRLColor *v26;
  void *v27;
  objc_super v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v7 = objc_msgSend(v5, "mostSpecificSelectionOfClass:", objc_opt_class(_TtC8Freeform17CRLGroupSelection, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topLevelContainerInfoForEditing"));
  v12 = (objc_class *)objc_opt_class(NSObject, v11);
  v18 = sub_1002220C8(v10, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  if (v19 == v20)
  {

  }
  else
  {
    v21 = v20;
    if (!v8)
    {

LABEL_10:
      v29.receiver = self;
      v29.super_class = (Class)CRLGroupRep;
      v26 = -[CRLCanvasRep selectionHighlightColor](&v29, "selectionHighlightColor");
      v25 = (id)objc_claimAutoreleasedReturnValue(v26);
      goto LABEL_11;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "boardItems"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupItem](self, "p_groupItem"));
    v24 = objc_msgSend(v22, "containsObject:", v23);

    if (!v24)
      goto LABEL_10;
  }
  if (qword_101414CD8 != -1)
    dispatch_once(&qword_101414CD8, &stru_101233320);
  v25 = (id)qword_101414CE0;
LABEL_11:
  v27 = v25;

  return v27;
}

- (BOOL)shouldShowCollaboratorCursorHighlight
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupItem](self, "p_groupItem"));
  if ((objc_msgSend(v3, "isEffectivelyEmpty") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLGroupRep;
    v4 = -[CRLCanvasRep shouldShowCollaboratorCursorHighlight](&v6, "shouldShowCollaboratorCursorHighlight");
  }

  return v4;
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double y;
  double x;
  float64x2_t v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transformInRoot");
  else
    memset(&v10, 0, sizeof(v10));
  CGAffineTransformInvert(&v11, &v10);
  v9 = vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x));

  v6 = v9.f64[1];
  v5 = v9.f64[0];
  result.y = v6;
  result.x = v5;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  BOOL v18;
  float64x2_t v20;
  double y;
  uint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = a4;
  y = a3.y;
  v22 = *(_QWORD *)&a3.x;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v20 = (float64x2_t)vdupq_lane_s64(v22, 0);
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout", *(_OWORD *)&v20));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "inverseTransform");
          v15 = v24;
          v16 = v25;
          v17 = v26;
        }
        else
        {
          v25 = 0u;
          v26 = 0u;
          v17 = 0uLL;
          v15 = 0uLL;
          v16 = 0uLL;
          v24 = 0u;
        }
        v23 = vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, y), v20, v15));

        if ((objc_msgSend(v11, "containsPoint:withPrecision:", v4, *(_OWORD *)&v23) & 1) != 0)
        {
          v18 = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v19;
  double y;
  uint64_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  height = a4.height;
  width = a4.width;
  y = a3.y;
  v21 = *(_QWORD *)&a3.x;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
    v19 = (float64x2_t)vdupq_lane_s64(v21, 0);
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout", *(_OWORD *)&v19));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "inverseTransform");
          v15 = v23;
          v16 = v24;
          v17 = v25;
        }
        else
        {
          v24 = 0u;
          v25 = 0u;
          v17 = 0uLL;
          v15 = 0uLL;
          v16 = 0uLL;
          v23 = 0u;
        }
        v22 = vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, y), v19, v15));

        if ((objc_msgSend(v11, "containsPoint:withSlop:", *(_OWORD *)&v22, width, height) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v8;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "intersectsUnscaledRect:", x, y, width, height) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (BOOL)i_shouldSmallHitRepTestingRecurse
{
  return 1;
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep processChangedProperty:](&v7, "processChangedProperty:");
  if (a3 == 11)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupItem](self, "p_groupItem"));
    if ((objc_msgSend(v5, "isFreehandDrawing") & 1) == 0)
      -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "invalidateKnobs");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v6, "canvasInvalidatedForRep:", self);

}

- (void)setNeedsDisplay
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep setNeedsDisplay](&v15, "setNeedsDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  if (-[CRLCanvasRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childrenToExcludeWhenDrawingDescendantsIntoLayer](self, "childrenToExcludeWhenDrawingDescendantsIntoLayer"));

    v4 = (void *)v5;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setNeedsDisplay", (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)occludesSelectedRep
{
  return 0;
}

- (BOOL)canBeOccluded
{
  return 0;
}

- (BOOL)canOcclude
{
  return 0;
}

- (BOOL)containsUnknownContent
{
  id v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  if (-[CRLCanvasRep containsUnknownContent](&v14, "containsUnknownContent"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "info"));
          v8 = objc_msgSend(v7, "isSupported");

          if (!v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return (char)v3;
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep dynamicOperationDidBeginWithRealTimeCommands:](&v3, "dynamicOperationDidBeginWithRealTimeCommands:", a3);
}

- (id)dynamicResizeDidBegin
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v16.receiver = self;
  v16.super_class = (Class)CRLGroupRep;
  v3 = -[CRLCanvasRep dynamicResizeDidBegin](&v16, "dynamicResizeDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupedChildReps](self, "p_groupedChildReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "dynamicResizeDidBegin");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep dynamicallyResizingWithTracker:](&v14, "dynamicallyResizingWithTracker:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupedChildReps](self, "p_groupedChildReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "dynamicallyResizingWithTracker:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupedChildReps](self, "p_groupedChildReps"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "applyNewBoundsToRep:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "invalidateKnobs");
  v10.receiver = self;
  v10.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](&v10, "dynamicResizeDidEndWithTracker:", v4);

}

- (BOOL)willHandleResizingLayoutForRep:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  if (objc_msgSend(v4, "isInGroup"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentRep"));
    v6 = objc_msgSend(v5, "isBeingResized");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep dynamicFreeTransformDidBeginWithTracker:](&v14, "dynamicFreeTransformDidBeginWithTracker:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupedChildReps](self, "p_groupedChildReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "dynamicFreeTransformDidBeginWithTracker:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep dynamicallyFreeTransformingWithTracker:](&v14, "dynamicallyFreeTransformingWithTracker:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupedChildReps](self, "p_groupedChildReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "dynamicallyFreeTransformingWithTracker:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupedChildReps](self, "p_groupedChildReps"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "applyNewBoundsToRep:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "invalidateKnobs");
  v10.receiver = self;
  v10.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep dynamicFreeTransformDidEndWithTracker:](&v10, "dynamicFreeTransformDidEndWithTracker:", v4);

}

- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  if (objc_msgSend(v4, "isInGroup"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentRep"));
    v6 = objc_msgSend(v5, "isBeingFreeTransformed");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "wantsToHandleTapsWhenLocked") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y;
  double x;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  BOOL v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  y = a3.y;
  x = a3.x;
  -[CRLGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep hitReps:withSlop:](self, "hitReps:withSlop:"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "wantsToHandleTapsOnBehalfOfRepForSelecting")
          && (objc_msgSend(v13, "handleSingleTapAtPoint:inputType:", a4, x, y) & 1) != 0)
        {

          v14 = 1;
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)CRLGroupRep;
  v14 = -[CRLCanvasRep handleSingleTapAtPoint:inputType:](&v16, "handleSingleTapAtPoint:inputType:", a4, x, y);
LABEL_12:

  return v14;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return -[CRLGroupRep p_handleSubselectionTapAtPoint:](self, "p_handleSubselectionTapAtPoint:", a4, a3.x, a3.y);
}

- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep p_handleSubselectionTapAtPoint:](self, "p_handleSubselectionTapAtPoint:", a3.x, a3.y);
}

- (BOOL)p_allowedToEditChildren
{
  return 1;
}

- (BOOL)p_handleSubselectionTapAtPoint:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:](self, "beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:", 0, a3.x, a3.y));
  v4 = v3 != 0;

  return v4;
}

- (id)i_handleDeepSubselectionTapAtPoint:(CGPoint)a3
{
  CRLGroupRep *v4;

  v4 = (CRLGroupRep *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:](self, "beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:", 1, a3.x, a3.y));
  if (!v4)
    v4 = self;
  return v4;
}

- (id)beginEditingChildrenIfAllowedAtUnscaledPoint:(CGPoint)a3 pickingDeepestChild:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (-[CRLGroupRep p_allowedToEditChildren](self, "p_allowedToEditChildren"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsForHitTesting](self, "childRepsForHitTesting"));
    +[CRLInteractiveCanvasController smallRepOutsetForHitTestingWithPrecision:](CRLInteractiveCanvasController, "smallRepOutsetForHitTestingWithPrecision:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:", 0, v9, 0, 0, x, y, v10));

    if (v11)
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasEditor"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorController"));
      if (v4)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "i_repForSelectingIgnoringTopLevelEditing"));
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionModelTranslator"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupItem](self, "p_groupItem"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionPathForNothingSelectedInsideGroup:", v19));
        objc_msgSend(v15, "setSelectionPath:", v20);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repForSelecting"));
        v12 = v18;
      }

      v22 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));
      v24 = sub_100221D0C(v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

      if (v25)
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v25));
      else
        v26 = 0;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectionPathWithInfos:", v26));
      objc_msgSend(v15, "setSelectionPath:", v27);

      if (v25)
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void)updateChildrenFromLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep updateChildrenFromLayout](&v2, "updateChildrenFromLayout");
}

- (id)p_groupedChildReps
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v2));

  return v3;
}

- (id)repForAlternatePressureDragAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep i_handleDeepSubselectionTapAtPoint:](self, "i_handleDeepSubselectionTapAtPoint:", a3.x, a3.y);
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:](self, "i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:", 0, a3.x, a3.y);
}

- (BOOL)i_childRepsWantContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3 onlyNonGrouped:(BOOL)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  y = a3.y;
  x = a3.x;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!a4
          && !objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "wantsContextMenuWhenEditingDisabledAtPoint:", x, y))
        {
          v12 = 0;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
{
  __objc2_class **p_superclass;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  p_superclass = CRLiOSSheetViewController.superclass;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v6 = (objc_class *)objc_opt_class(CRLGroupLayout, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v8 = sub_1002223BC(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children"));
  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep p_groupItem](self, "p_groupItem"));
    v13 = objc_msgSend(v12, "isEffectivelyEmpty");

    if ((v13 & 1) == 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v27;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v18)));
            v20 = v19;
            if (v19)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "unscaledPathToIncludeForSystemPreviewOutline"));
              objc_msgSend(v4, "appendBezierPath:", v21);

            }
            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v16);
      }

      p_superclass = (__objc2_class **)(CRLiOSSheetViewController + 8);
    }
    if (!v4)
      goto LABEL_17;
  }
  else
  {

    if (!v4)
    {
LABEL_17:
      -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 459, "bezierPathWithRect:"));

      v4 = (void *)v22;
      goto LABEL_18;
    }
  }
  if (objc_msgSend(v4, "isEmpty"))
    goto LABEL_17;
LABEL_18:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 459, "uniteBezierPaths:", v23));

  return v24;
}

@end
