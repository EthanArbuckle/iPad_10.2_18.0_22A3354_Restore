@implementation CRLFreehandDrawingTransformLayout

- (NSSet)representedShapeLayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformLayout p_transformInfo](self, "p_transformInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "representedShapeInfos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutsForInfos:", v6));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13);
        v15 = (objc_class *)objc_opt_class(CRLShapeLayout, v10);
        v16 = sub_1002223BC(v15, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        objc_msgSend(v3, "addObject:", v17, (_QWORD)v19);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return (NSSet *)v3;
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  return 0;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  CRLFreehandDrawingTransformLayout *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = v4;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  if (v4)
    objc_msgSend(v4, "transformForLayout:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryByTransformingBy:", v18));

  -[CRLCanvasLayout setDynamicGeometry:](self, "setDynamicGeometry:", v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformLayout representedShapeLayouts](self, "representedShapeLayouts", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(CRLFreehandDrawingTransformLayout **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v13 != self)
          -[CRLFreehandDrawingTransformLayout takeSizeFromTracker:](v13, "takeSizeFromTracker:", v5);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  CRLFreehandDrawingTransformLayout *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLFreehandDrawingTransformLayout;
  -[CRLCanvasLayout takeFreeTransformFromTracker:](&v21, "takeFreeTransformFromTracker:", v4);
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  if (v4)
    objc_msgSend(v4, "freeTransformForLayout:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometryByTransformingBy:", v17));

  -[CRLCanvasLayout setDynamicGeometry:](self, "setDynamicGeometry:", v6);
  if (objc_msgSend(v4, "isResizing"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformLayout representedShapeLayouts](self, "representedShapeLayouts", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(CRLFreehandDrawingTransformLayout **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (v12 != self)
            -[CRLFreehandDrawingTransformLayout takeFreeTransformFromTracker:](v12, "takeFreeTransformFromTracker:", v4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
      }
      while (v9);
    }

    -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  }

}

- (id)computeLayoutGeometry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  CRLCanvasLayoutGeometry *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _BYTE v35[128];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "children"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10007FB28;
  v34[3] = &unk_101230EA8;
  v34[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_arrayOfObjectsPassingTest:", v34));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "pureGeometry"));
        objc_msgSend(v16, "frame");
        v39.origin.x = v17;
        v39.origin.y = v18;
        v39.size.width = v19;
        v39.size.height = v20;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v37 = CGRectUnion(v36, v39);
        x = v37.origin.x;
        y = v37.origin.y;
        width = v37.size.width;
        height = v37.size.height;

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v13);
  }

  if (!sub_10006178C(x, y, width, height))
  {
    v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231D38);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0A0C(v22, v21, x, y, width, height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231D58);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout computeLayoutGeometry]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"));
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v26 = NSStringFromCGRect(v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 96, 0, "Unable to determine proper layout geometry! Got %{public}@", v27);

    y = 0.0;
    height = 1.0;
    width = 1.0;
    x = 0.0;
  }
  v28 = -[CRLCanvasLayoutGeometry initWithFrame:]([CRLCanvasLayoutGeometry alloc], "initWithFrame:", x, y, width, height);

  return v28;
}

- (id)reliedOnLayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231D78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0B18();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231D98);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout reliedOnLayouts]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 104, 0, "invalid nil value for '%{public}s'", "self.layoutController");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformLayout p_transformInfo](self, "p_transformInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representedShapeInfos"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutsForInfos:", v9));

  return v10;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingTransformLayout;
  -[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:](&v12, "beginDynamicOperationWithRealTimeCommands:", a3);
  v5 = (objc_class *)objc_opt_class(CRLFreehandDrawingLayout, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v7 = sub_1002223BC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231DB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0BAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231DD8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout beginDynamicOperationWithRealTimeCommands:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 115, 0, "invalid nil value for '%{public}s'", "parentDrawing");

  }
  objc_msgSend(v8, "transformLayoutDidBeginDynamicOperation");

}

- (void)endDynamicOperation
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingTransformLayout;
  -[CRLCanvasLayout endDynamicOperation](&v11, "endDynamicOperation");
  v4 = (objc_class *)objc_opt_class(CRLFreehandDrawingLayout, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v6 = sub_1002223BC(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231DF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0C40();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231E18);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout endDynamicOperation]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 123, 0, "invalid nil value for '%{public}s'", "parentDrawing");

  }
  objc_msgSend(v7, "transformLayoutDidEndDynamicOperation");

}

- (id)p_transformInfo
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(CRLFreehandDrawingTransformInfo, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

@end
