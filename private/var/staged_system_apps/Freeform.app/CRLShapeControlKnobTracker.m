@implementation CRLShapeControlKnobTracker

- (CRLShapeControlKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  CRLShapeControlKnobTracker *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CRLShapeControlKnobTracker;
  v8 = -[CRLCanvasKnobTracker initWithRep:knob:](&v21, "initWithRep:knob:", v6, v7);
  if (v8)
  {
    if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___CRLShapeControlRep) & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012439E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0B394();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243A08);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker initWithRep:knob:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 42, 0, "CRLShapeControlRep only valid for control knob tracker");

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
    v13 = objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CRLShapeControlLayout);

    if ((v13 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243A28);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0B314();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243A48);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker initWithRep:knob:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 43, 0, "CRLShapeControlLayout only valid for control knob tracker");

    }
    if ((unint64_t)objc_msgSend(v7, "tag") < 0xC || (unint64_t)objc_msgSend(v7, "tag") >= 0x11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243A68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0B294();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243A88);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker initWithRep:knob:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 44, 0, "wrong knob for control knob tracker");

    }
  }

  return v8;
}

- (CRLShapeControlLayout)shapeControlLayout
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));
  objc_opt_class(CRLCanvasLayout, v4);
  v11 = sub_10022209C(v3, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLShapeControlLayout);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return (CRLShapeControlLayout *)v12;
}

- (CRLShapeControlRep)shapeControlRep
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_opt_class(CRLCanvasRep, v3);
  v10 = sub_10022209C(v2, v4, 1, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLShapeControlRep);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return (CRLShapeControlRep *)v11;
}

- (NSArray)decoratorOverlayRenderables
{
  void *v3;
  CRLCanvasShapeRenderable *mGuideRenderable;

  if (self->mNeedsDecoratorUpdate)
  {
    -[CRLShapeControlKnobTracker p_updateGuideRenderable](self, "p_updateGuideRenderable");
    self->mNeedsDecoratorUpdate = 0;
  }
  if (self->mGuideRenderable)
  {
    mGuideRenderable = self->mGuideRenderable;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mGuideRenderable, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (BOOL)wantsAutoscroll
{
  return 1;
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTracker shapeControlRep](self, "shapeControlRep"));
  objc_msgSend(v8, "dynamicallyMovedSmartShapeKnobTo:withTracker:", self, x, y);
  -[CRLShapeControlKnobTracker p_updateHUDAtPoint:](self, "p_updateHUDAtPoint:", x, y);
  self->mNeedsDecoratorUpdate = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
  objc_msgSend(v6, "invalidateLayersForDecorator:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
  objc_msgSend(v7, "adjustCustomMagnetPositions");

}

- (void)beginMovingKnob
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLShapeControlKnobTracker;
  -[CRLCanvasKnobTracker beginMovingKnob](&v9, "beginMovingKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTracker shapeControlRep](self, "shapeControlRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  objc_msgSend(v5, "openGroup");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Resize"), 0, CFSTR("UndoStrings")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  objc_msgSend(v8, "setCurrentGroupActionString:", v7);

  objc_msgSend(v4, "addDecorator:", self);
  objc_msgSend(v3, "dynamicMoveSmartShapeKnobDidBegin");

}

- (void)endMovingKnob
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];

  v24.receiver = self;
  v24.super_class = (Class)CRLShapeControlKnobTracker;
  -[CRLCanvasKnobTracker endMovingKnob](&v24, "endMovingKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandsForAdjustingMagnetsFromClineLayouts"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc", (_QWORD)v20));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "commandController"));
        objc_msgSend(v13, "enqueueCommand:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if (!-[CRLCanvasKnobTracker didBegin](self, "didBegin"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243AA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0B414();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243AC8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeControlKnobTracker endMovingKnob]", (_QWORD)v20));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeControlKnobTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 111, 0, "Ending knob when we didn't begin!");

  }
  if (-[CRLCanvasKnobTracker didBegin](self, "didBegin", (_QWORD)v20))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTracker shapeControlRep](self, "shapeControlRep"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "interactiveCanvasController"));
    objc_msgSend(v17, "dynamicMoveSmartShapeKnobDidEndWithTracker:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "commandController"));
    objc_msgSend(v19, "closeGroup");

  }
  -[CRLShapeControlKnobTracker p_hideHUD](self, "p_hideHUD");
  -[CRLShapeControlKnobTracker p_hideGuideRenderable](self, "p_hideGuideRenderable");

}

- (void)p_updateGuideRenderable
{
  void *v3;
  void *v4;
  void *v5;
  const CGPath *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CRLCanvasShapeRenderable *v15;
  CRLCanvasShapeRenderable *mGuideRenderable;
  __int128 v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  CGFloat v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGPath *v33;
  void *v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTracker shapeControlLayout](self, "shapeControlLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smartPathSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v6 = (const CGPath *)objc_msgSend(v4, "newFeedbackPathForKnob:", objc_msgSend(v5, "tag"));

  if (v6)
  {
    if (!self->mGuideRenderable)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interactiveCanvasController"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTracker shapeControlRep](self, "shapeControlRep"));
      objc_msgSend(v10, "centerForGuideRenderablePlacement");
      objc_msgSend(v9, "convertNaturalPointToUnscaledCanvas:");
      objc_msgSend(v8, "convertUnscaledToBoundsPoint:");
      v12 = v11;
      v14 = v13;

      v15 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
      mGuideRenderable = self->mGuideRenderable;
      self->mGuideRenderable = v15;

      v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v37.c = v17;
      *(_OWORD *)&v37.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      *(_OWORD *)&v36.a = *(_OWORD *)&v37.a;
      *(_OWORD *)&v36.c = v17;
      *(_OWORD *)&v36.tx = *(_OWORD *)&v37.tx;
      CGAffineTransformTranslate(&v37, &v36, v12, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvas"));
      objc_msgSend(v19, "viewScale");
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "canvas"));
      objc_msgSend(v23, "viewScale");
      v35 = v37;
      CGAffineTransformScale(&v36, &v35, v21, v24);
      v37 = v36;

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "info"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "geometry"));
      objc_msgSend(v27, "angle");
      v35 = v37;
      CGAffineTransformRotate(&v36, &v35, v28 * -0.0174532925);
      v37 = v36;

      objc_msgSend(v4, "naturalSize");
      v35 = v37;
      CGAffineTransformTranslate(&v36, &v35, v29 * -0.5, v30 * -0.5);
      v37 = v36;
      objc_msgSend(v3, "pathBoundsWithoutStroke");
      v35 = v37;
      CGAffineTransformTranslate(&v36, &v35, v31, v32);
      v37 = v36;
      v33 = sub_1000C8414(v6, &v36);
      -[CRLCanvasShapeRenderable setPath:](self->mGuideRenderable, "setPath:", v33);
      CGPathRelease(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.5, 0.5));
      -[CRLCanvasShapeRenderable setStrokeColor:](self->mGuideRenderable, "setStrokeColor:", objc_msgSend(v34, "CGColor"));

      -[CRLCanvasShapeRenderable setFillColor:](self->mGuideRenderable, "setFillColor:", 0);
    }
    CGPathRelease(v6);
  }

}

- (void)p_hideGuideRenderable
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
  objc_msgSend(v3, "removeDecorator:", self);

}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MidX;
  double MinY;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  CGRect v34;
  CGRect v35;

  v33 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTracker shapeControlLayout](self, "shapeControlLayout", a3.x, a3.y));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "smartPathSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getFeedbackStringForKnob:", objc_msgSend(v5, "tag")));

  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interactiveCanvasController"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    objc_msgSend(v9, "setLabelText:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v11, "boundsForStandardKnobs");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v34.origin.x = v13;
    v34.origin.y = v15;
    v34.size.width = v17;
    v34.size.height = v19;
    MidX = CGRectGetMidX(v34);
    v35.origin.x = v13;
    v35.origin.y = v15;
    v35.size.width = v17;
    v35.size.height = v19;
    MinY = CGRectGetMinY(v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v22, "convertNaturalPointToUnscaledCanvas:", MidX, MinY);
    v24 = v23;
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "interactiveCanvasController"));
    objc_msgSend(v28, "convertUnscaledToBoundsPoint:", v24, v26);
    v30 = v29;
    v32 = v31;

    objc_msgSend(v9, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:", self, v10, sub_1000630C4(v30, v32));
  }

}

- (void)p_hideHUD
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
  objc_msgSend(v3, "hideHUDForKey:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGuideRenderable, 0);
}

@end
