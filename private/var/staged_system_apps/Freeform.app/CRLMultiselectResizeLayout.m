@implementation CRLMultiselectResizeLayout

- (NSSet)representedSelectedLayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout p_multiselectInfo](self, "p_multiselectInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representedSelectedBoardItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutsForInfos:", v5));

  return (NSSet *)v6;
}

- (BOOL)supportsRotation
{
  return -[CRLMultiselectResizeLayout p_atLeastOneLayoutSupportsRotation](self, "p_atLeastOneLayoutSupportsRotation");
}

- (BOOL)p_atLeastOneLayoutSupportsRotation
{
  id v2;
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
  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout representedSelectedLayouts](self, "representedSelectedLayouts"));
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "supportsRotation", (_QWORD)v7) & 1) != 0)
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
  CRLMultiselectResizeLayout *v13;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout representedSelectedLayouts](self, "representedSelectedLayouts", 0));
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
        v13 = *(CRLMultiselectResizeLayout **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v13 != self)
          -[CRLMultiselectResizeLayout takeSizeFromTracker:](v13, "takeSizeFromTracker:", v5);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLMultiselectResizeLayout;
  -[CRLCanvasLayout invalidate](&v3, "invalidate");
  if (!-[CRLCanvasLayout invalidGeometry](self, "invalidGeometry"))
    -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
}

- (void)recursivelyAddLayoutAndDependentLayoutsToValidateSet:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLMultiselectResizeLayout;
  v5 = a3;
  -[CRLCanvasLayout recursivelyAddLayoutAndDependentLayoutsToValidateSet:](&v7, "recursivelyAddLayoutAndDependentLayoutsToValidateSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout representedSelectedLayouts](self, "representedSelectedLayouts", v7.receiver, v7.super_class));
  objc_msgSend(v6, "makeObjectsPerformSelector:withObject:", a2, v5);

}

- (id)computeLayoutGeometry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  CRLCanvasLayoutGeometry *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _BYTE v39[128];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout p_multiselectInfo](self, "p_multiselectInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "representedSelectedBoardItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutsForInfos:", v6));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "children"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10006C1F8;
    v38[3] = &unk_101230EA8;
    v38[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crl_arrayOfObjectsPassingTest:", v38));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

  }
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "pureGeometry"));
        objc_msgSend(v20, "frame");
        v43.origin.x = v21;
        v43.origin.y = v22;
        v43.size.width = v23;
        v43.size.height = v24;
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        v41 = CGRectUnion(v40, v43);
        x = v41.origin.x;
        y = v41.origin.y;
        width = v41.size.width;
        height = v41.size.height;

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v17);
  }

  if (!sub_10006178C(x, y, width, height))
  {
    v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230EC8);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEEDB0(v26, v25, x, y, width, height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230EE8);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiselectResizeLayout computeLayoutGeometry]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiselectResizeLayout.m"));
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v30 = NSStringFromCGRect(v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 97, 0, "Unable to determine proper layout geometry! Got %{public}@", v31);

    y = 0.0;
    height = 1.0;
    width = 1.0;
    x = 0.0;
  }
  v32 = -[CRLCanvasLayoutGeometry initWithFrame:]([CRLCanvasLayoutGeometry alloc], "initWithFrame:", x, y, width, height);

  return v32;
}

- (id)reliedOnLayouts
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));

  if (!v3)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230F08);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEEEC0(v4, v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230F28);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiselectResizeLayout reliedOnLayouts]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiselectResizeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 105, 0, "invalid nil value for '%{public}s'", "self.layoutController");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout p_multiselectInfo](self, "p_multiselectInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "representedSelectedBoardItems"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutsForInfos:", v12));

  return v13;
}

- (BOOL)resizeMayChangeAspectRatio
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout p_multiselectInfo](self, "p_multiselectInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "representedSelectedBoardItems"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v4);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v8), "allowsParentGroupToBeResizedWithoutAspectRatioLock"))break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout p_multiselectInfo](self, "p_multiselectInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "representedSelectedBoardItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutsForInfos:", v11));

    v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (!v12)
    {
      v16 = 1;
      goto LABEL_19;
    }
    v13 = v12;
    v14 = *(_QWORD *)v19;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v4);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "resizeMayChangeAspectRatio"))
        break;
      if (v13 == (id)++v15)
      {
        v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        v16 = 1;
        if (v13)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (CGSize)minimumSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  void *i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  void *v34;
  double width;
  double height;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGAffineTransform v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  CGSize result;
  CGRect v52;
  CGRect v53;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v3, "size");
  v44 = v4;
  v6 = v5;

  v7 = -[CRLMultiselectResizeLayout resizeMayChangeAspectRatio](self, "resizeMayChangeAspectRatio");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout p_multiselectInfo](self, "p_multiselectInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "representedSelectedBoardItems"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutsForInfos:", v10));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v47;
    v15 = 0.0;
    v16 = 0.0;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "minimumSize");
        v20 = v19;
        v22 = v21;
        if ((v7 & 1) == 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pureGeometry"));
          objc_msgSend(v23, "size");
          sub_100062BCC(v20, v22, v24, v25);

        }
        v26 = sub_10005FDDC();
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pureGeometry"));
        v34 = v33;
        if (v33)
          objc_msgSend(v33, "transform");
        else
          memset(&v45, 0, sizeof(v45));
        v52.origin.x = v26;
        v52.origin.y = v28;
        v52.size.width = v30;
        v52.size.height = v32;
        v53 = CGRectApplyAffineTransform(v52, &v45);
        width = v53.size.width;
        height = v53.size.height;

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pureGeometry"));
        objc_msgSend(v37, "frame");
        v39 = v38;
        v41 = v40;

        if (v39 > 1.0e-11)
          v16 = fmax(v16, width / v39);
        if (v41 > 1.0e-11)
          v15 = fmax(v15, height / v41);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
    v16 = 0.0;
  }

  v42 = v44 * v16;
  v43 = v6 * v15;
  result.height = v43;
  result.width = v42;
  return result;
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  CRLCanvasAbstractLayout *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLMultiselectResizeLayout;
  v3 = -[CRLCanvasAbstractLayout parentLayoutForProvidingGuides](&v10, "parentLayoutForProvidingGuides");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutsForProvidingGuidesForChildLayouts"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeLayout representedSelectedLayouts](self, "representedSelectedLayouts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  objc_msgSend(v6, "removeObjectsInArray:", v8);

  return v6;
}

- (id)p_multiselectInfo
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(_TtC8Freeform24CRLMultiselectResizeInfo, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

@end
