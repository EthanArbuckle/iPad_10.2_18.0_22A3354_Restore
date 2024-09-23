@implementation CALayer

- (void)p_clearAllLayerDelegates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer delegate](self, "delegate"));
  v5 = objc_opt_class(UIView, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  v8 = objc_opt_class(CRLCanvasLayer, v7);
  v9 = objc_opt_isKindOfClass(self, v8);
  if ((isKindOfClass & 1) != 0)
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer delegate](self, "delegate"));
    v13 = objc_opt_class(CRLCanvasSubview, v12);
    v14 = objc_opt_isKindOfClass(v11, v13);

    if (((v10 | v14) & 1) == 0)
      return;
  }
  else
  {
    -[CALayer setDelegate:](self, "setDelegate:", 0);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self, "sublayers"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "p_clearAllLayerDelegates");
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

- (void)crl_ignoreAccessibilityInvertColorsIfNeeded
{
  -[CALayer crl_ignoreAccessibilityInvertColorsIfNeeded:](self, "crl_ignoreAccessibilityInvertColorsIfNeeded:", 0);
}

- (void)crl_ignoreAccessibilityInvertColorsIfNeeded:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  void *v21;

  if (!UIAccessibilityIsInvertColorsEnabled())
  {
    -[CALayer crl_undoIgnoreAccessibilityInvertColors](self, "crl_undoIgnoreAccessibilityInvertColors");
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer filters](self, "filters"));

  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer filters](self, "filters", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "name"));
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("CRLCALayerAdditionsAXDoubleInvertFilterKey"));

        if ((v11 & 1) != 0)
          goto LABEL_15;
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v7)
            goto LABEL_5;
          break;
        }
      }
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer filters](self, "filters"));
    v12 = sub_1000E03D8();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObject:", v13));
    -[CALayer setFilters:](self, "setFilters:", v14);

  }
  else
  {
    v15 = sub_1000E03D8();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v21 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    -[CALayer setFilters:](self, "setFilters:", v13);
  }

LABEL_15:
}

- (void)crl_undoIgnoreAccessibilityInvertColors
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CALayer filters](self, "filters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_arrayOfObjectsPassingTest:", &stru_101236628));
  -[CALayer setFilters:](self, "setFilters:", v3);

}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLCanvasRenderable, a2);
}

- (id)tsd_newLayerForRepContentPileClone
{
  return objc_alloc_init((Class)CALayer);
}

- (NSArray)crl_sublayersForTilingLayerSupport
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self, "sublayers"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)crl_setNeedsLayoutForTilingLayers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CALayer crl_sublayersForTilingLayerSupport](self, "crl_sublayersForTilingLayerSupport"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", a2);

}

- (void)crl_cancelLayoutForTilingLayers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CALayer crl_sublayersForTilingLayerSupport](self, "crl_sublayersForTilingLayerSupport"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", a2);

}

- (void)crl_tilingSafeSetSublayers:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self, "sublayers"));
  v5 = objc_msgSend(v6, "isEqualToArray:", v4);

  if ((v5 & 1) == 0)
    -[CALayer setSublayers:](self, "setSublayers:", v6);

}

- (BOOL)crl_tilingSafeHasContents
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer contents](self, "contents"));
  v3 = v2 != 0;

  return v3;
}

- (void)crl_applyDefaultCanvasOverlayUIShadowSettings
{
  id v3;
  double v4;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CALayer setShadowColor:](self, "setShadowColor:", objc_msgSend(v3, "CGColor"));

  -[CALayer setShadowRadius:](self, "setShadowRadius:", 15.0);
  LODWORD(v4) = 1045220557;
  -[CALayer setShadowOpacity:](self, "setShadowOpacity:", v4);
  -[CALayer setShadowOffset:](self, "setShadowOffset:", 0.0, 4.0);
}

- (void)crl_setIfDifferentFrame:(CGRect)a3 orTransform:(CGAffineTransform *)a4
{
  double width;
  double y;
  double x;
  __int128 v9;
  int v10;
  NSObject *v11;
  void *v12;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[3];
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v34;
  CGRect v35;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((sub_1000637C8() & 1) != 0
    || (v9 = *(_OWORD *)&a4->c,
        *(_OWORD *)&t2.a = *(_OWORD *)&a4->a,
        *(_OWORD *)&t2.c = v9,
        *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx,
        sub_100063800()))
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E830);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35180(v10, v11);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E850);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CALayer(CRLAdditions) crl_setIfDifferentFrame:orTransform:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CALayer_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 34, 0, "Attempting to set frame or transform on layer with NaN values.");

  }
  else
  {
    -[CALayer anchorPoint](self, "anchorPoint");
    v17 = sub_1000626CC(v15, v16, x, y, width);
    v19 = v18;
    v20 = sub_10005FDDC();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[CALayer position](self, "position");
    if (v28 != v17 || v27 != v19)
      -[CALayer setPosition:](self, "setPosition:", v17, v19);
    -[CALayer bounds](self, "bounds");
    v35.origin.x = v20;
    v35.origin.y = v22;
    v35.size.width = v24;
    v35.size.height = v26;
    if (!CGRectEqualToRect(v34, v35))
      -[CALayer setBounds:](self, "setBounds:", v20, v22, v24, v26);
    -[CALayer affineTransform](self, "affineTransform");
    v29 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v29;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      v30 = *(_OWORD *)&a4->c;
      v31[0] = *(_OWORD *)&a4->a;
      v31[1] = v30;
      v31[2] = *(_OWORD *)&a4->tx;
      -[CALayer setAffineTransform:](self, "setAffineTransform:", v31);
    }
  }
}

- (void)crl_setHideOverlayLayerDuringZoomOperations:(BOOL)a3
{
  _UNKNOWN **v3;

  if (a3)
    v3 = 0;
  else
    v3 = &off_1012CC898;
  -[CALayer setValue:forKey:](self, "setValue:forKey:", v3, CFSTR("kOptOutFromHidingOverlayLayerDuringZoom"));
}

- (BOOL)crl_hideOverlayLayerDuringZoomOperations
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer valueForKey:](self, "valueForKey:", CFSTR("kOptOutFromHidingOverlayLayerDuringZoom")));
  v3 = v2 == 0;

  return v3;
}

- (void)crl_addZoomAnimationFromPoint:(CGPoint)a3
{
  -[CALayer crl_addZoomAnimationFromPoint:startingScale:](self, "crl_addZoomAnimationFromPoint:startingScale:", a3.x, a3.y, 0.5);
}

- (void)crl_addZoomAnimationFromPoint:(CGPoint)a3 startingScale:(double)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  CGRect v39;
  CGRect v40;

  y = a3.y;
  x = a3.x;
  -[CALayer crl_removeZoomAnimation](self, "crl_removeZoomAnimation");
  v38 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CALayer position](self, "position");
  if (x != v9 || y != v8)
  {
    -[CALayer frame](self, "frame");
    v11 = x - CGRectGetMinX(v39);
    -[CALayer frame](self, "frame");
    v13 = v11 / v12;
    -[CALayer frame](self, "frame");
    v14 = y - CGRectGetMinY(v40);
    -[CALayer frame](self, "frame");
    v16 = v14 / v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("anchorPoint")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, v16));
    objc_msgSend(v17, "setToValue:", v18);
    objc_msgSend(v17, "setFromValue:", v18);

    objc_msgSend(v17, "setDuration:", 0.2);
    objc_msgSend(v38, "addObject:", v17);
    -[CALayer anchorPoint](self, "anchorPoint");
    v20 = sub_1000603B8(v13, v16, v19);
    v22 = v21;
    -[CALayer frame](self, "frame");
    v24 = v20 * v23;
    -[CALayer frame](self, "frame");
    v26 = v22 * v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v26));
    objc_msgSend(v27, "setToValue:", v28);
    objc_msgSend(v27, "setFromValue:", v28);

    objc_msgSend(v27, "setDuration:", 0.2);
    objc_msgSend(v27, "setAdditive:", 1);
    objc_msgSend(v38, "addObject:", v27);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v29, "setFromValue:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v29, "setToValue:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  objc_msgSend(v29, "setTimingFunction:", v32);

  objc_msgSend(v29, "setDuration:", 0.2);
  objc_msgSend(v38, "addObject:", v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v33, "setFromValue:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v33, "setToValue:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  objc_msgSend(v33, "setTimingFunction:", v36);

  objc_msgSend(v33, "setDuration:", 0.2);
  objc_msgSend(v38, "addObject:", v33);
  v37 = objc_alloc_init((Class)CAAnimationGroup);
  objc_msgSend(v37, "setAnimations:", v38);
  objc_msgSend(v37, "setDuration:", 0.2);
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v37, CFSTR("CRLZoomAnimationKey"));

}

- (void)crl_removeZoomAnimation
{
  -[CALayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("CRLZoomAnimationKey"));
}

- (void)crl_addSpringScaleInAnimationWithDelay:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  _QWORD v19[2];

  -[CALayer crl_removeSpringScaleInAnimation](self, "crl_removeSpringScaleInAnimation");
  LODWORD(v5) = 1051260355;
  LODWORD(v6) = 1062501089;
  LODWORD(v7) = 0;
  LODWORD(v8) = 1062501089;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v5, v7, v6, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v10, "setFromValue:", v11);

  objc_msgSend(v10, "setBeginTime:", a3);
  objc_msgSend(v10, "setDuration:", 0.2);
  objc_msgSend(v10, "setTimingFunction:", v9);
  objc_msgSend(v10, "setFillMode:", kCAFillModeBoth);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
  objc_msgSend(v12, "setFromValue:", &off_1012CCAA8);
  objc_msgSend(v12, "setToValue:", &off_1012CCAB8);
  objc_msgSend(v12, "setMass:", 1.0);
  objc_msgSend(v12, "setStiffness:", 200.0);
  objc_msgSend(v12, "setDamping:", 35.0);
  objc_msgSend(v12, "setInitialVelocity:", 0.0);
  objc_msgSend(v12, "settlingDuration");
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v12, "setBeginTime:", a3);
  objc_msgSend(v12, "settlingDuration");
  v14 = v13;
  objc_msgSend(v10, "duration");
  if (v14 >= v15)
    v15 = v14;
  v16 = v15 + a3;
  v17 = objc_alloc_init((Class)CAAnimationGroup);
  v19[0] = v10;
  v19[1] = v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  objc_msgSend(v17, "setAnimations:", v18);

  objc_msgSend(v17, "setDuration:", v16);
  objc_msgSend(v17, "setFillMode:", kCAFillModeBoth);
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v17, CFSTR("CRLSpringScaleInAnimationKey"));

}

- (void)crl_removeSpringScaleInAnimation
{
  -[CALayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("CRLSpringScaleInAnimationKey"));
}

- (CGRect)crl_frameIncludingSublayers
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat x;
  double v28;
  CGFloat y;
  double v30;
  CGFloat width;
  double v32;
  CGFloat height;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect result;
  CGRect v57;

  -[CALayer frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[CALayer masksToBounds](self, "masksToBounds"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self, "sublayers"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), "crl_frameIncludingSublayers");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](self, "superlayer"));

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](self, "superlayer"));
            objc_msgSend(v25, "convertRect:fromLayer:", self, v17, v19, v21, v23);
            x = v26;
            y = v28;
            width = v30;
            height = v32;

          }
          else
          {
            -[CALayer frame](self, "frame");
            v46 = v4;
            v34 = v6;
            v35 = v8;
            v36 = v10;
            v38 = v37;
            -[CALayer frame](self, "frame");
            v40 = v39;
            v52.origin.x = v17;
            v52.origin.y = v19;
            v52.size.width = v21;
            v52.size.height = v23;
            v41 = v38;
            v10 = v36;
            v8 = v35;
            v6 = v34;
            v4 = v46;
            v53 = CGRectOffset(v52, v41, v40);
            x = v53.origin.x;
            y = v53.origin.y;
            width = v53.size.width;
            height = v53.size.height;
          }
          v54.origin.x = v4;
          v54.origin.y = v6;
          v54.size.width = v8;
          v54.size.height = v10;
          v57.origin.x = x;
          v57.origin.y = y;
          v57.size.width = width;
          v57.size.height = height;
          v55 = CGRectUnion(v54, v57);
          v4 = v55.origin.x;
          v6 = v55.origin.y;
          v8 = v55.size.width;
          v10 = v55.size.height;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v13);
    }

  }
  v42 = v4;
  v43 = v6;
  v44 = v8;
  v45 = v10;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (CGImage)crl_newRasterizedImageRef
{
  -[CALayer crl_frameIncludingSublayers](self, "crl_frameIncludingSublayers");
  return -[CALayer crl_newRasterizedImageRefForLayerRect:](self, "crl_newRasterizedImageRefForLayerRect:");
}

- (CGImage)crl_newRasterizedImageRefForLayerRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CALayer *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CALayer *v12;
  void *v13;
  id v14;
  CALayer *v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  float v20;
  void *v21;
  id v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  BOOL v37;
  void *v38;
  void *v39;
  id v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSString *v50;
  void *v51;
  NSString *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double MinY;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGContext *v68;
  CGContext *v69;
  CGImageRef Image;
  __int128 v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  NSObject *v81;
  NSString *v82;
  void *v83;
  NSString *v84;
  void *v85;
  void *v86;
  double v87;
  double MinX;
  CGAffineTransform v89;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v92;
  CATransform3D v93;
  CGAffineTransform transform;
  CATransform3D v95;
  _BYTE v96[54];
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  -[CALayer frame](v7, "frame");
  v112.origin.x = v8;
  v112.origin.y = v9;
  v112.size.width = v10;
  v112.size.height = v11;
  v97.origin.x = x;
  v97.origin.y = y;
  v97.size.width = width;
  v97.size.height = height;
  v12 = v7;
  if (CGRectEqualToRect(v97, v112))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](v7, "sublayers"));
    v14 = objc_msgSend(v13, "count");

    v12 = v7;
    if ((unint64_t)v14 <= 1)
    {
      v15 = v7;
      while (1)
      {
        -[CALayer borderWidth](v15, "borderWidth");
        if (v16 != 0.0)
          goto LABEL_20;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mask](v15, "mask"));
        if (v17)
          break;
        -[CALayer opacity](v15, "opacity");
        if (v18 != 1.0)
          break;
        -[CALayer cornerRadius](v15, "cornerRadius");
        if (v19 != 0.0)
          break;
        -[CALayer shadowOpacity](v15, "shadowOpacity");
        if (v20 != 0.0 || -[CALayer backgroundColor](v15, "backgroundColor"))
          break;
        if (v15)
          -[CALayer transform](v15, "transform");
        else
          memset(&v95, 0, sizeof(v95));
        if (!CATransform3DIsIdentity(&v95))
          break;
        -[CALayer contentsRect](v15, "contentsRect");
        v113.origin.x = 0.0;
        v113.origin.y = 0.0;
        v113.size.width = 1.0;
        v113.size.height = 1.0;
        if (!CGRectEqualToRect(v98, v113))
          goto LABEL_20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](v15, "sublayers"));
        v22 = objc_msgSend(v21, "count");

        if (v22 != (id)1)
        {
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer contents](v15, "contents"));

          if (v86)
          {
            Image = (CGImageRef)objc_claimAutoreleasedReturnValue(-[CALayer contents](v15, "contents"));

            CGImageRetain(Image);
            v12 = v15;
            goto LABEL_41;
          }
LABEL_20:
          v12 = v15;
          goto LABEL_21;
        }
        -[CALayer bounds](v15, "bounds");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](v15, "sublayers"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastObject"));
        objc_msgSend(v32, "bounds");
        v114.origin.x = v33;
        v114.origin.y = v34;
        v114.size.width = v35;
        v114.size.height = v36;
        v99.origin.x = v24;
        v99.origin.y = v26;
        v99.size.width = v28;
        v99.size.height = v30;
        v37 = CGRectEqualToRect(v99, v114);

        if (!v37)
          goto LABEL_20;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](v15, "sublayers"));
        v12 = (CALayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "lastObject"));

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](v12, "sublayers"));
        v40 = objc_msgSend(v39, "count");

        v15 = v12;
        if ((unint64_t)v40 >= 2)
          goto LABEL_21;
      }

      goto LABEL_20;
    }
  }
LABEL_21:
  -[CALayer crl_frameIncludingSublayers](v7, "crl_frameIncludingSublayers");
  v41 = v100.origin.x;
  v42 = v100.origin.y;
  v43 = v100.size.width;
  v44 = v100.size.height;
  v101 = CGRectInset(v100, -1.0, -1.0);
  v115.origin.x = x;
  v115.origin.y = y;
  v115.size.width = width;
  v115.size.height = height;
  if (!CGRectContainsRect(v101, v115))
  {
    v45 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E870);
    v46 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v81 = v46;
      v110.origin.x = x;
      v110.origin.y = y;
      v110.size.width = width;
      v110.size.height = height;
      v82 = NSStringFromCGRect(v110);
      v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
      v111.origin.x = v41;
      v111.origin.y = v42;
      v111.size.width = v43;
      v111.size.height = v44;
      v84 = NSStringFromCGRect(v111);
      v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
      *(_DWORD *)v96 = 67110402;
      *(_DWORD *)&v96[4] = v45;
      *(_WORD *)&v96[8] = 2082;
      *(_QWORD *)&v96[10] = "-[CALayer(CRLAdditions) crl_newRasterizedImageRefForLayerRect:]";
      *(_WORD *)&v96[18] = 2082;
      *(_QWORD *)&v96[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CALayer_CRLAdditions.m";
      *(_WORD *)&v96[28] = 1024;
      *(_DWORD *)&v96[30] = 243;
      *(_WORD *)&v96[34] = 2114;
      *(_QWORD *)&v96[36] = v83;
      *(_WORD *)&v96[44] = 2114;
      *(_QWORD *)&v96[46] = v85;
      _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Specified rect %{public}@ exceeds layer's frame including sublayers %{public}@", v96, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E890);
    v47 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CALayer(CRLAdditions) crl_newRasterizedImageRefForLayerRect:]"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CALayer_CRLAdditions.m"));
    v102.origin.x = x;
    v102.origin.y = y;
    v102.size.width = width;
    v102.size.height = height;
    v50 = NSStringFromCGRect(v102);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v103.origin.x = v41;
    v103.origin.y = v42;
    v103.size.width = v43;
    v103.size.height = v44;
    v52 = NSStringFromCGRect(v103);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 243, 0, "Specified rect %{public}@ exceeds layer's frame including sublayers %{public}@", v51, v53);

  }
  v104.origin.x = v41;
  v104.origin.y = v42;
  v104.size.width = v43;
  v104.size.height = v44;
  v116.origin.x = x;
  v116.origin.y = y;
  v116.size.width = width;
  v116.size.height = height;
  v105 = CGRectIntersection(v104, v116);
  v54 = v105.origin.x;
  v55 = v105.origin.y;
  v56 = v105.size.width;
  v57 = v105.size.height;
  -[CALayer frame](v7, "frame");
  MinX = CGRectGetMinX(v106);
  v107.origin.x = v54;
  v107.origin.y = v55;
  v107.size.width = v56;
  v107.size.height = v57;
  v87 = CGRectGetMinX(v107);
  -[CALayer frame](v7, "frame");
  MinY = CGRectGetMinY(v108);
  v109.origin.x = v54;
  v109.origin.y = v55;
  v109.size.width = v56;
  v109.size.height = v57;
  v59 = CGRectGetMinY(v109);
  -[CALayer contentsScale](v7, "contentsScale");
  v61 = v60;
  v62 = sub_1000603DC(v56, v57, v60);
  v64 = v63;
  v65 = (double)sub_10040EA9C();
  if (v64 * v62 > v65)
  {
    v66 = sub_100062E58(v62, v64, v65);
    v62 = sub_100061064(v66);
    v64 = v67;
    v61 = v62 / v56;
  }
  v68 = sub_10040FA64(11, v62, v64);
  if (v68)
  {
    v69 = v68;
    CGAffineTransformMakeScale(&transform, v61, v61);
    CGContextConcatCTM(v69, &transform);
    if (v12)
      -[CALayer transform](v12, "transform");
    else
      memset(&v93, 0, sizeof(v93));
    if (!CATransform3DIsIdentity(&v93))
    {
      v71 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)v96 = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v96[16] = v71;
      *(_OWORD *)&v96[32] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      *(_OWORD *)&v92.a = *(_OWORD *)v96;
      *(_OWORD *)&v92.c = v71;
      *(_OWORD *)&v92.tx = *(_OWORD *)&v96[32];
      CGAffineTransformTranslate((CGAffineTransform *)v96, &v92, -v54, -v55);
      -[CALayer anchorPoint](v7, "anchorPoint");
      v73 = v72;
      v75 = v74;
      -[CALayer bounds](v7, "bounds");
      v77 = sub_100060FCC(v73, v75, v76);
      v79 = v78;
      t2 = *(CGAffineTransform *)v96;
      CGAffineTransformTranslate(&v92, &t2, v77, v78);
      *(CGAffineTransform *)v96 = v92;
      -[CALayer affineTransform](v7, "affineTransform");
      t2 = *(CGAffineTransform *)v96;
      CGAffineTransformConcat(&v92, &t1, &t2);
      *(CGAffineTransform *)v96 = v92;
      t2 = v92;
      CGAffineTransformTranslate(&v92, &t2, -v77, -v79);
      *(CGAffineTransform *)v96 = v92;
      CGContextConcatCTM(v69, &v92);
    }
    CGAffineTransformMakeTranslation(&v89, MinX - v87, MinY - v59);
    CGContextConcatCTM(v69, &v89);
    -[CALayer renderInContext:](v7, "renderInContext:", v69);
    Image = CGBitmapContextCreateImage(v69);
    CGContextRelease(v69);
  }
  else
  {
    Image = 0;
  }
LABEL_41:

  return Image;
}

@end
