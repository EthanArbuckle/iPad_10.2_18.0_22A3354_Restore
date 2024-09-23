@implementation CRLFreehandDrawingLayout

- (CRLFreehandDrawingLayout)initWithInfo:(id)a3
{
  CRLFreehandDrawingLayout *result;
  CGPoint origin;
  CGSize size;
  CGSize v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingLayout;
  result = -[CRLCanvasLayout initWithInfo:](&v7, "initWithInfo:", a3);
  if (result)
  {
    origin = CGRectNull.origin;
    size = CGRectNull.size;
    *(CGPoint *)((char *)&result->_transformInfo + 2) = CGRectNull.origin;
    *(CGSize *)((char *)&result->_frameForMiniFormatterPositioning.origin.y + 2) = size;
    *(CGPoint *)((char *)&result->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2) = origin;
    *(CGSize *)((char *)&result->_boundsForMathResultViews.origin.y + 2) = size;
    v6 = CGRectZero.size;
    *(CGPoint *)((char *)&result->_frameForMiniFormatterPositioning.size.height + 2) = CGRectZero.origin;
    *(CGSize *)((char *)&result->_boundsForStandardKnobsWithoutMathResultsViews.origin.y + 2) = v6;
  }
  return result;
}

- (_TtC8Freeform22CRLFreehandDrawingItem)freehandInfo
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (_TtC8Freeform22CRLFreehandDrawingItem *)v6;
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingLayout;
  -[CRLGroupLayout minimumSize](&v4, "minimumSize");
  if (v2 < 0.00000000999999994)
    v2 = 0.00000000999999994;
  if (v3 < 0.00000000999999994)
    v3 = 0.00000000999999994;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)childInfosForChildLayouts
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (*(_QWORD *)(&self->_isTransformLayoutInDynamicOperation + 2))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__NSArray0__struct, "arrayByAddingObject:"));
  else
    v3 = &__NSArray0__struct;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingLayout;
  v4 = -[CRLGroupLayout childInfosForChildLayouts](&v8, "childInfosForChildLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5));

  return v6;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingLayout;
  v5 = -[CRLGroupLayout additionalDependenciesForChildLayout:](&v15, "additionalDependenciesForChildLayout:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutForInfo:", *(_QWORD *)(&self->_isTransformLayoutInDynamicOperation
                                                                                          + 2)));

  if (v8)
    v9 = v8 == v4;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingLayout freehandInfo](self, "freehandInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    v12 = objc_msgSend(v10, "isNonGroupedChild:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObject:", v8));

      v6 = (void *)v13;
    }
  }

  return v6;
}

- (BOOL)shouldSnapWhileResizing
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingLayout freehandInfo](self, "freehandInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childInfos"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 > 0xC8)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingLayout;
  return -[CRLGroupLayout shouldSnapWhileResizing](&v7, "shouldSnapWhileResizing");
}

- (id)descendentWrappables
{
  id *v2;
  void *v3;
  id v6;
  void *v7;
  objc_super v8;

  v2 = (id *)(&self->super._hasInvalidated + 2);
  v3 = *(void **)(&self->super._hasInvalidated + 2);
  if (v3)
    return v3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingLayout;
  v6 = -[CRLGroupLayout descendentWrappables](&v8, "descendentWrappables");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[CRLCanvasLayout isBeingManipulated](self, "isBeingManipulated") || BYTE2(self->_dynamicDescendentWrappables))
    objc_storeStrong(v2, v7);
  return v7;
}

- (CGRect)computeBoundsForStandardKnobs
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  v19.receiver = self;
  v19.super_class = (Class)CRLFreehandDrawingLayout;
  -[CRLGroupLayout computeBoundsForStandardKnobs](&v19, "computeBoundsForStandardKnobs");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  *(double *)((char *)&self->_frameForMiniFormatterPositioning.size.height + 2) = v3;
  *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.x + 2) = v5;
  *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.y + 2) = v7;
  *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.width + 2) = v9;
  -[CRLFreehandDrawingLayout boundsForMathResultViews](self, "boundsForMathResultViews");
  if (!CGRectIsNull(v20))
  {
    -[CRLFreehandDrawingLayout boundsForMathResultViews](self, "boundsForMathResultViews");
    v24.origin.x = v11;
    v24.origin.y = v12;
    v24.size.width = v13;
    v24.size.height = v14;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectUnion(v21, v24);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
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

- (id)computeLayoutGeometry
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGAffineTransform v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)CRLFreehandDrawingLayout;
  v3 = -[CRLGroupLayout computeLayoutGeometry](&v22, "computeLayoutGeometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CRLCanvasLayout isSelectable](self, "isSelectable"))
  {
    -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (v4)
      objc_msgSend(v4, "transform");
    else
      memset(&v21, 0, sizeof(v21));
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.width = v10;
    v23.size.height = v12;
    *(CGRect *)((char *)&self->_transformInfo + 2) = CGRectApplyAffineTransform(v23, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvas"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasController"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
      if (objc_msgSend(v15, "currentSelectionPathContainsInfo:", v16))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerHost"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "miniFormatterPresenter"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asiOSPresenter"));
        objc_msgSend(v19, "forceMiniFormatterVCToReposition");

      }
    }

  }
  return v4;
}

- (CRLCanvasLayoutGeometry)pureGeometryWithoutMathResults
{
  CGFloat v2;
  CGFloat v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  CRLCanvasLayoutGeometry *v8;
  CGAffineTransform v10;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v2 = *(double *)((char *)&self->_frameForMiniFormatterPositioning.size.height + 2);
  v3 = *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.x + 2);
  v4 = *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.y + 2);
  v5 = *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.width + 2);
  memset(&v13, 0, sizeof(v13));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "transform");
  else
    memset(&v13, 0, sizeof(v13));

  CGAffineTransformMakeTranslation(&t1, v2, v3);
  v10 = v13;
  CGAffineTransformConcat(&v12, &t1, &v10);
  v13 = v12;
  v8 = [CRLCanvasLayoutGeometry alloc];
  v12 = v13;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](v8, "initWithSize:transform:", &v12, v4, v5);
}

- (CGAffineTransform)pureTransformInRootWithoutMathResults
{
  void *v5;
  void *v6;
  CGAffineTransform *result;
  CGAffineTransform *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingLayout pureGeometryWithoutMathResults](self, "pureGeometryWithoutMathResults"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  result = (CGAffineTransform *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (result)
  {
    v8 = result;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CGAffineTransform geometry](v8, "geometry"));
      v10 = v9;
      if (v9)
      {
        v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v9, "transformByConcatenatingTransformTo:", v14);
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
        v15 = 0u;
      }
      v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tx = v17;

      v13 = objc_claimAutoreleasedReturnValue(-[CGAffineTransform parent](v8, "parent"));
      v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (id)computeWrapPath
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CRLFreehandDrawingLayout *v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingLayout freehandInfo](self, "freehandInfo"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(CRLShapeLayout, v7);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "info"));
          v16 = objc_msgSend(v4, "isNonGroupedChild:", v15);

          if ((v16 & 1) == 0)
            objc_msgSend(v3, "addObject:", v14);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v3, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](v27, "layoutController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvas"));

    if (!v18)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233138);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF2AA0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233158);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout computeWrapPath]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 190, 0, "invalid nil value for '%{public}s'", "canvas");

    }
    objc_msgSend(v18, "viewScale");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:](CRLFreehandDrawingShapeTracingHelper, "unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:", v3, 0.0, v22));
    v24 = v23;
    if (v23 && (objc_msgSend(v23, "isEmpty") & 1) == 0)
    {
      -[CRLCanvasAbstractLayout transformInRoot](v27, "transformInRoot");
      CGAffineTransformInvert(&v29, &v28);
      objc_msgSend(v24, "transformUsingAffineTransform:", &v29);
    }
    else
    {
      -[CRLGroupLayout boundsForStandardKnobs](v27, "boundsForStandardKnobs");
      v25 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));

      v24 = (void *)v25;
    }

  }
  else
  {
    -[CRLGroupLayout boundsForStandardKnobs](v27, "boundsForStandardKnobs");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));
  }

  return v24;
}

- (id)pathForClippingConnectionLines
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingLayout freehandInfo](self, "freehandInfo"));
  v4 = objc_msgSend(v3, "shouldBeTreatedAsBoxForConnectionLinesForPerf");

  if (v4)
  {
    -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLFreehandDrawingLayout;
    v6 = -[CRLGroupLayout pathForClippingConnectionLines](&v8, "pathForClippingConnectionLines");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (CGRect)frameForMiniFormatterPositioning
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  CGRect *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect v17;
  CGRect result;
  CGRect v19;

  v16.receiver = self;
  v16.super_class = (Class)CRLFreehandDrawingLayout;
  -[CRLGroupLayout frameForMiniFormatterPositioning](&v16, "frameForMiniFormatterPositioning");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = (CGRect *)((char *)&self->_transformInfo + 2);
  v17.origin.x = v11->origin.x;
  v17.origin.y = v11->origin.y;
  v17.size.width = v11->size.width;
  v17.size.height = v11->size.height;
  if (!CGRectIsNull(v17))
  {
    v19.origin.x = CGRectZero.origin.x;
    v19.origin.y = CGRectZero.origin.y;
    v19.size.width = CGRectZero.size.width;
    v19.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(*v11, v19))
    {
      x = v11->origin.x;
      y = v11->origin.y;
      width = v11->size.width;
      height = v11->size.height;
    }
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)maxFilledShapeIndex
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingLayout freehandInfo](self, "freehandInfo", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childInfos"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      v10 = (unint64_t)v6 + v7;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
        v12 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = v14;
        if (!v14
          || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fill")), v16, !v16))
        {

          v10 = (unint64_t)v9 + v7;
          goto LABEL_13;
        }

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (void)endDynamicOperation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingLayout;
  -[CRLGroupLayout endDynamicOperation](&v4, "endDynamicOperation");
  v3 = *(void **)(&self->super._hasInvalidated + 2);
  *(_QWORD *)(&self->super._hasInvalidated + 2) = 0;

}

- (void)transformLayoutDidBeginDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (BYTE2(self->_dynamicDescendentWrappables))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233178);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2BB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233198);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout transformLayoutDidBeginDynamicOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 261, 0, "Should only begin a transform dynamic operation when not in one already.");

  }
  BYTE2(self->_dynamicDescendentWrappables) = 1;
  if (*(_QWORD *)(&self->super._hasInvalidated + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012331B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2B2C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012331D8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout transformLayoutDidBeginDynamicOperation]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 263, 0, "expected nil value for '%{public}s'", "_dynamicDescendentWrappables");

  }
}

- (void)transformLayoutDidEndDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!BYTE2(self->_dynamicDescendentWrappables))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012331F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2C3C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233218);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout transformLayoutDidEndDynamicOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 267, 0, "Should only end a transform dynamic operation when in one already.");

  }
  BYTE2(self->_dynamicDescendentWrappables) = 0;
  v6 = *(void **)(&self->super._hasInvalidated + 2);
  *(_QWORD *)(&self->super._hasInvalidated + 2) = 0;

}

- (BOOL)exclusivelyProvidesGuidesForChildLayouts
{
  return 1;
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  return &__NSArray0__struct;
}

- (CRLFreehandDrawingTransformInfo)transformInfo
{
  return (CRLFreehandDrawingTransformInfo *)objc_retainAutoreleaseReturnValue(*(id *)(&self->_isTransformLayoutInDynamicOperation
                                                                                    + 2));
}

- (BOOL)isInteractable
{
  CRLFreehandDrawingLayout *v2;
  uint64_t v3;
  CRLFreehandDrawingLayout *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;

  v2 = self;
  v4 = v2;
  if (v2)
  {
    v5 = v2;
    while (1)
    {
      v6 = (objc_class *)objc_opt_class(_TtC8Freeform12CRLGroupItem, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
      v8 = sub_1002223BC(v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      if (objc_msgSend(v9, "locked"))
        break;
      v11 = objc_opt_class(CRLGroupLayout, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parent"));
      v13 = sub_100221D0C(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);

      v5 = (void *)v14;
      if (!v14)
        goto LABEL_5;
    }

    v21 = 0;
  }
  else
  {
LABEL_5:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](v4, "layoutController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvas"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasController"));

    if (!v5)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233238);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF2CC0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233258);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout isInteractable]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 300, 0, "invalid nil value for '%{public}s'", "icc");

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
    v21 = objc_msgSend(v20, "isLayoutSelectable:", v4);

  }
  return v21;
}

- (BOOL)showingSubselectionAffordance
{
  return *(_QWORD *)(&self->_isTransformLayoutInDynamicOperation + 2) != 0;
}

- (void)showSubselectionAffordanceForSelectedInfos:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  CRLFreehandDrawingTransformInfo *v7;
  void *v8;
  CRLFreehandDrawingTransformInfo *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v26 = a3;
  v4 = objc_msgSend(v26, "count");
  v6 = *(void **)(&self->_isTransformLayoutInDynamicOperation + 2);
  if (v4)
  {
    if (!v6)
    {
      v7 = [CRLFreehandDrawingTransformInfo alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingLayout freehandInfo](self, "freehandInfo"));
      v9 = -[CRLFreehandDrawingTransformInfo initWithParentInfo:](v7, "initWithParentInfo:", v8);
      v10 = *(void **)(&self->_isTransformLayoutInDynamicOperation + 2);
      *(_QWORD *)(&self->_isTransformLayoutInDynamicOperation + 2) = v9;

      -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
    }
    v11 = (objc_class *)objc_opt_class(CRLFreehandDrawingTransformLayout, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutForInfo:", *(_QWORD *)(&self->_isTransformLayoutInDynamicOperation
                                                                                                  + 2)));
    v14 = sub_1002223BC(v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = *(void **)(&self->_isTransformLayoutInDynamicOperation + 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    objc_msgSend(v16, "setRepresentedShapeInfos:currentlyLaidOutOnLayoutController:", v26, v17);

    objc_msgSend(v15, "invalidateFrame");
    v19 = (objc_class *)objc_opt_class(CRLFreehandDrawingTransformRep, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvas"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvasController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "repForInfo:", *(_QWORD *)(&self->_isTransformLayoutInDynamicOperation
                                                                                               + 2)));
    v24 = sub_1002223BC(v19, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    if (v25)
    {
      objc_msgSend(v25, "invalidateSubselectionAffordance");
      objc_msgSend(v25, "invalidateKnobs");
    }

  }
  else if (v6)
  {
    *(_QWORD *)(&self->_isTransformLayoutInDynamicOperation + 2) = 0;

    -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
  }

}

+ (id)freehandDrawingLayoutsToInteractWithFromLayouts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  id v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v3 = a3;
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_anyObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasController"));

    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233278);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF2D4C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233298);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 343, 0, "invalid nil value for '%{public}s'", "icc");

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v3;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v18 = objc_opt_class(CRLGroupLayout, v13);
          v19 = sub_100221D0C(v18, v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v22 = (objc_class *)objc_opt_class(_TtC8Freeform12CRLGroupItem, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "info"));
          v24 = sub_1002223BC(v22, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

          if (!v20 || (objc_msgSend(v25, "locked") & 1) == 0)
          {
            v27 = objc_opt_class(CRLFreehandDrawingLayout, v26);
            if ((objc_opt_isKindOfClass(v17, v27) & 1) != 0)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
              v29 = objc_msgSend(v28, "isLayoutSelectable:", v17);

              if (v29)
                objc_msgSend(v35, "addObject:", v17);
            }
            else if (v20)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "children"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "freehandDrawingLayoutsToInteractWithFromLayouts:", v30));
              objc_msgSend(v35, "addObjectsFromArray:", v31);

            }
          }

        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v14);
    }

    v3 = v33;
  }

  return v35;
}

+ (BOOL)anyFreehandDrawingsVisibleInInteractiveCanvasController:(id)a3
{
  return _objc_msgSend(a1, "p_anyFreehandDrawingsVisibleInInteractiveCanvasController:findSelected:", a3, 0);
}

+ (BOOL)anyFreehandDrawingsVisibleAndSelectedInInteractiveCanvasController:(id)a3
{
  return _objc_msgSend(a1, "p_anyFreehandDrawingsVisibleInInteractiveCanvasController:findSelected:", a3, 1);
}

+ (BOOL)p_anyFreehandDrawingsVisibleInInteractiveCanvasController:(id)a3 findSelected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutController"));
  objc_msgSend(v6, "visibleUnscaledRect");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutsInRect:deep:", 1));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(a1, "p_layoutIsFreehandDrawing:andSelected:icc:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), v4, v6, (_QWORD)v15) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)p_layoutIsFreehandDrawing:(id)a3 andSelected:(BOOL)a4 icc:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 isKindOfClass;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v10 = objc_opt_class(CRLFreehandDrawingLayout, v9);
  isKindOfClass = objc_opt_isKindOfClass(v7, v10);
  if ((isKindOfClass & 1) != 0 && v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
    isKindOfClass = objc_msgSend(v8, "currentSelectionPathContainsInfo:", v12);

  }
  return isKindOfClass & 1;
}

- (id)childSearchTargets
{
  return &__NSArray0__struct;
}

- (CGRect)boundsForMathResultViews
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2);
  v3 = *(double *)((char *)&self->_boundsForMathResultViews.origin.x + 2);
  v4 = *(double *)((char *)&self->_boundsForMathResultViews.origin.y + 2);
  v5 = *(double *)((char *)&self->_boundsForMathResultViews.size.width + 2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBoundsForMathResultViews:(CGRect)a3
{
  *(CGFloat *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2) = a3.origin.x;
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.origin.x + 2) = a3.origin.y;
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.origin.y + 2) = a3.size.width;
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.size.width + 2) = a3.size.height;
}

- (CGRect)cachedFrameForMiniFormatterPositioning
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->_boundsForMathResultViews.size.height + 2);
  v3 = *(double *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.x + 2);
  v4 = *(double *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.y + 2);
  v5 = *(double *)((char *)&self->_cachedFrameForMiniFormatterPositioning.size.width + 2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCachedFrameForMiniFormatterPositioning:(CGRect)a3
{
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.size.height + 2) = a3.origin.x;
  *(CGFloat *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.x + 2) = a3.origin.y;
  *(CGFloat *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.y + 2) = a3.size.width;
  *(CGFloat *)((char *)&self->_cachedFrameForMiniFormatterPositioning.size.width + 2) = a3.size.height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_isTransformLayoutInDynamicOperation + 2), 0);
  objc_storeStrong((id *)(&self->super._hasInvalidated + 2), 0);
}

@end
