@implementation CRLCounterRotateLayout

- (id)childInfosForChildLayouts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLCounterRotateLayout;
  v3 = -[CRLCanvasLayout childInfosForChildLayouts](&v9, "childInfosForChildLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateLayout containerInfo](self, "containerInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childInfos"));

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4));

    v4 = (void *)v7;
  }

  return v4;
}

- (id)reliedOnLayouts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  _OWORD v12[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A630);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E156A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A650);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout commandToClampModelToLayoutSizeWithAdditionalTransform:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 45, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  v9 = *(_OWORD *)&a3->c;
  v12[0] = *(_OWORD *)&a3->a;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a3->tx;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandToClampModelToLayoutSizeWithAdditionalTransform:", v12));

  return v10;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", a3));
  *(_QWORD *)&v6 = objc_opt_class(CRLCanvasLayout, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v6));
  v10 = sub_1002223BC(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
    objc_msgSend(v4, "addObject:", v11);

  return v4;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A670);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15734();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A690);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout baseFrameForFrameForCullingWithAdditionalTransform:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 64, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  -[CRLCanvasAbstractLayout transform](self, "transform");
  v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v25, &t1, &t2);
  objc_msgSend(v6, "baseFrameForFrameForCullingWithAdditionalTransform:", &v25);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)boundsForStandardKnobs
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v23;
  double v24;
  double v25;
  double v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
  {
    objc_msgSend(v3, "boundsForStandardKnobs");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "transform");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A6B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E157C0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A6D0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout boundsForStandardKnobs]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 70, 0, "invalid nil value for '%{public}s'", "childLayout");

    objc_msgSend(0, "boundsForStandardKnobs");
    v5 = v15;
    v7 = v16;
    v9 = v17;
    v11 = v18;
    memset(&v27, 0, sizeof(v27));
  }
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  v29 = CGRectApplyAffineTransform(v28, &v27);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGSize)minimumSize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A6F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1584C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A710);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout minimumSize]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 77, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  objc_msgSend(v3, "minimumSize");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)supportsFlipping
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A730);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E158D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A750);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout supportsFlipping]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 83, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  v7 = objc_msgSend(v3, "supportsFlipping");

  return v7;
}

- (id)visibleGeometries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A770);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15964();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A790);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout visibleGeometries]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 92, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleGeometries"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v19[0] = v24;
        v19[1] = v25;
        v19[2] = v26;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geometryByTransformingBy:", v19));
        objc_msgSend(v3, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v13);
  }

  return v3;
}

- (id)descendentWrappables
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A7B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E159F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A7D0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout descendentWrappables]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 111, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___CRLCanvasWrappable))
  {
    objc_msgSend(v3, "addObject:", v5);
  }
  else if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___CRLCanvasWrappableParent))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "descendentWrappables"));
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  return v3;
}

- (BOOL)descendentWrappablesContainsWrappable:(id)a3
{
  id v4;
  CRLCounterRotateLayout *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
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
  unsigned __int8 v19;

  v4 = a3;
  v5 = (CRLCounterRotateLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));

  if (v5 == self)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class(CRLCanvasLayout, v6);
    v8 = sub_100221D0C(v7, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout childLayoutContainingPossibleDescendentLayout:](self, "childLayoutContainingPossibleDescendentLayout:", v9));
    v17 = sub_100221DDC(v10, 1, v11, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasWrappableParent);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v18)
      v19 = objc_msgSend(v18, "descendentWrappablesContainsWrappable:", v4);
    else
      v19 = 0;

  }
  return v19;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A7F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15A7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A810);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout takeSizeFromTracker:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 143, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  objc_msgSend(v6, "takeSizeFromTracker:", v4);

}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A830);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15B08();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A850);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout takeFreeTransformFromTracker:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 150, 0, "invalid nil value for '%{public}s'", "childLayout");

  }
  objc_msgSend(v6, "takeFreeTransformFromTracker:", v4);

}

@end
