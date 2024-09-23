@implementation THGuidedPanController

- (THGuidedPanController)initWithInteractiveCanvasController:(id)a3
{
  THGuidedPanController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THGuidedPanController;
  v4 = -[THGuidedPanController init](&v6, "init");
  if (v4)
    v4->_interactiveCanvasController = (THInteractiveCanvasController *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanController;
  -[THGuidedPanController dealloc](&v3, "dealloc");
}

- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 withCenterPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  CGPoint v9;
  id v10;
  THGuidedPanPageWell *v11;
  THGuidedPanDelegate *delegate;
  double v13;
  THGuidedPanTarget *target;
  NSArray *currentWells;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[THGuidedPanDelegate guidedPanWillBegin](self->_delegate, "guidedPanWillBegin");
  self->_unscaledStartPoint.x = v7;
  self->_unscaledStartPoint.y = v6;
  self->_unscaledCenterPoint.x = x;
  self->_unscaledCenterPoint.y = y;
  v9 = CGPointZero;
  self->_consumedMovement = CGPointZero;
  self->_previousMovement = v9;
  v10 = objc_alloc_init((Class)NSMutableArray);
  -[THGuidedPanTarget guidedPanTargetAddWellsToArray:withController:](self->_target, "guidedPanTargetAddWellsToArray:withController:", v10, self);
  v11 = objc_alloc_init(THGuidedPanPageWell);
  objc_msgSend(v10, "addObject:", v11);

  -[THGuidedPanController setCurrentWells:](self, "setCurrentWells:", v10);
  delegate = self->_delegate;
  if (delegate)
  {
    -[THGuidedPanDelegate guidedPanZoomedOutViewScale](delegate, "guidedPanZoomedOutViewScale");
  }
  else
  {
    target = self->_target;
    if (target)
    {
      -[THGuidedPanTarget guidedPanTargetUnscaledPageRect](target, "guidedPanTargetUnscaledPageRect");
      -[THGuidedPanController viewScaleForUnscaledRect:forPage:](self, "viewScaleForUnscaledRect:forPage:", 1);
    }
    else
    {
      v13 = 1.0;
    }
  }
  self->_pageViewScale = v13;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  currentWells = self->_currentWells;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](currentWells, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(currentWells);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "guidedPanWillBeginAtPoint:controller:", self, v7, v6);
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](currentWells, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }
}

- (void)guidedPanDidEnd
{
  -[THGuidedPanDelegate guidedPanDidEnd](self->_delegate, "guidedPanDidEnd");
}

- (id)p_contentLocationUsingWellsForMovement:(CGPoint)a3 velocity:(CGPoint)a4 currentLocation:(id)a5
{
  double y;
  double x;
  TSDContentLocation *v8;
  THInteractiveCanvasController *interactiveCanvasController;
  id v10;
  double v11;
  TSDContentLocation *v12;
  NSArray *currentWells;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  void *i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  y = a3.y;
  x = a3.x;
  v8 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", a5, self->_unscaledCenterPoint.x, self->_unscaledCenterPoint.y, self->_pageViewScale, a4.y);
  interactiveCanvasController = self->_interactiveCanvasController;
  -[THInteractiveCanvasController centerPlusMovementContentPlacement](-[THGuidedPanController interactiveCanvasController](self, "interactiveCanvasController"), "centerPlusMovementContentPlacement");
  v10 = -[THInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](interactiveCanvasController, "convertContentLocation:fromPlacement:toPlacement:", v8);
  v11 = 0.0;
  v45 = CGPointZero.y;
  v12 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  currentWells = self->_currentWells;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](currentWells, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v47;
    v17 = 1.0;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(currentWells);
        v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v19, "weightWithMovement:proposedLocation:controller:", v10, self, x, y);
        v21 = v20;
        objc_msgSend(v19, "smoothWeight");
        if (v22 > 0.0)
        {
          objc_msgSend(v19, "currentWeight");
          v24 = v23;
          v25 = objc_msgSend(v19, "smoothWeight");
          v21 = TSDInterpolateFloats(v25, v24, v21, v26);
        }
        objc_msgSend(v19, "setCurrentWeight:", v21);
        v27 = v17 - v11;
        v28 = (v17 - v11) * v21;
        objc_msgSend(v19, "currentBlendedWeight");
        objc_msgSend(v19, "setPreviousBlendedWeight:");
        objc_msgSend(v19, "setCurrentBlendedWeight:", v28);
        if (v28 > 0.0)
        {
          v29 = objc_msgSend(v19, "contentLocationWithMovement:controller:", self, x, y);
          if (v29)
            v30 = v29;
          else
            v30 = v10;
          -[TSDContentLocation unscaledPoint](v12, "unscaledPoint");
          v31 = objc_msgSend(v30, "unscaledPoint");
          v34 = TSDInterpolatePoints(v31, CGPointZero.x, v45, v32, v33, v28);
          v35 = TSDAddPoints(v34);
          v37 = v36;
          -[TSDContentLocation viewScale](v12, "viewScale");
          v39 = v38;
          v40 = objc_msgSend(v30, "viewScale");
          v42 = v39 + TSDInterpolateFloats(v40, 0.0, v41, v28);
          v43 = v35;
          v17 = 1.0;
          v12 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v43, v37, v42);
          v11 = 1.0 - v27 * (1.0 - v21);
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](currentWells, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v15);
  }
  return v12;
}

- (id)p_completionAnimationUsingWellsForMovement:(CGPoint)a3 velocity:(CGPoint)a4 currentLocation:(id)a5
{
  double y;
  double x;
  double v8;
  double v9;
  NSArray *currentWells;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *i;
  void *v18;
  unsigned int v19;
  THGuidedPanTarget *v20;
  id v21;
  id v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  currentWells = self->_currentWells;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](currentWells, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v12)
    goto LABEL_11;
  v13 = v12;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v27 != v16)
        objc_enumerationMutation(currentWells);
      v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
      v19 = objc_msgSend(v18, "guidedPanWellRatingWithMovement:velocity:controller:", self, v9, v8, x, y);
      if (v19 > v15)
      {
        v14 = v18;
        v15 = v19;
      }
    }
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](currentWells, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v13);
  if (v15 <= 1)
  {
LABEL_11:
    v20 = -[THGuidedPanController target](self, "target");
LABEL_12:
    v21 = 0;
    v22 = 0;
    goto LABEL_13;
  }
  v20 = -[THGuidedPanController target](self, "target");
  if (!v14)
    goto LABEL_12;
  v22 = objc_msgSend(v14, "contentAnimationToFocalPointFromLocation:withMovement:velocity:controller:", a5, self, v9, v8, x, y);
  v21 = objc_msgSend(v14, "guidedPanTargetWithController:location:", self, a5);
LABEL_13:
  -[THGuidedPanController setTarget:](self, "setTarget:", v21);
  if ((objc_opt_respondsToSelector(v22, "duration") & 1) != 0)
  {
    objc_msgSend(v22, "duration");
    v24 = v23;
  }
  else
  {
    v24 = 0.2;
  }
  -[THGuidedPanDelegate guidedPanWillAnimateFrom:to:duration:](self->_delegate, "guidedPanWillAnimateFrom:to:duration:", v20, -[THGuidedPanController target](self, "target"), v24);
  return v22;
}

- (id)contentLocationForMovement:(CGPoint)a3 velocity:(CGPoint)a4 placement:(id *)a5 currentLocation:(id)a6
{
  double x;
  double y;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MinY;
  THInteractiveCanvasController *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  THInteractiveCanvasController *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  self->_previousMovement = a3;
  x = self->_consumedMovement.x;
  y = self->_consumedMovement.y;
  if (a5)
    *a5 = kTSDContentPlacementCenter;
  v9 = -[THGuidedPanController p_contentLocationUsingWellsForMovement:velocity:currentLocation:](self, "p_contentLocationUsingWellsForMovement:velocity:currentLocation:", a6, TSDSubtractPoints((__n128)a3, *(__n128 *)&a3.y, x, y));
  v40.origin.x = TSDRectWithSize(-[THGuidedPanDelegate guidedPanUnscaledPageSize](self->_delegate, "guidedPanUnscaledPageSize"));
  v10 = v40.origin.x;
  v11 = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  MidX = CGRectGetMidX(v40);
  v41.origin.x = v10;
  v41.origin.y = v11;
  v41.size.width = width;
  v41.size.height = height;
  MinY = CGRectGetMinY(v41);
  v16 = -[THGuidedPanController interactiveCanvasController](self, "interactiveCanvasController");
  -[THInteractiveCanvasController screenTopContentPlacement](-[THGuidedPanController interactiveCanvasController](self, "interactiveCanvasController"), "screenTopContentPlacement");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v9, "viewScale");
  -[THInteractiveCanvasController clampedCenterPointForPoint:withPlacement:viewScale:](v16, "clampedCenterPointForPoint:withPlacement:viewScale:", MidX, MinY, v18, v20, v21);
  v23 = v22;
  v42.origin.x = v10;
  v42.origin.y = v11;
  v42.size.width = width;
  v42.size.height = height;
  v24 = CGRectGetMidX(v42);
  v43.origin.x = v10;
  v43.origin.y = v11;
  v43.size.width = width;
  v43.size.height = height;
  MaxY = CGRectGetMaxY(v43);
  v26 = -[THGuidedPanController interactiveCanvasController](self, "interactiveCanvasController");
  -[THInteractiveCanvasController screenBottomContentPlacement](-[THGuidedPanController interactiveCanvasController](self, "interactiveCanvasController"), "screenBottomContentPlacement");
  v28 = v27;
  v30 = v29;
  objc_msgSend(v9, "viewScale");
  -[THInteractiveCanvasController clampedCenterPointForPoint:withPlacement:viewScale:](v26, "clampedCenterPointForPoint:withPlacement:viewScale:", v24, MaxY, v28, v30, v31);
  if (v32 >= v23)
    v33 = v32;
  else
    v33 = v23;
  objc_msgSend(v9, "unscaledPoint");
  v35 = v34;
  objc_msgSend(v9, "unscaledPoint");
  v37 = TSUClamp(v36, v23, v33);
  objc_msgSend(v9, "viewScale");
  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v35, v37, v38);
}

- (id)completionAnimationFromContentLocation:(id)a3 movement:(CGPoint)a4 velocity:(CGPoint)a5
{
  TSDSubtractPoints((__n128)a4, *(__n128 *)&a4.y, self->_consumedMovement.x, self->_consumedMovement.y);
  return -[THGuidedPanController p_completionAnimationUsingWellsForMovement:velocity:currentLocation:](self, "p_completionAnimationUsingWellsForMovement:velocity:currentLocation:", a3);
}

- (BOOL)guidedPanShouldPreserveCompletionAnimationEndLocation
{
  return 1;
}

- (BOOL)isFocusedOnColumn
{
  THGuidedPanTarget *target;
  double v4;
  double v5;
  double v6;

  target = self->_target;
  if (target)
  {
    if (-[THGuidedPanTarget guidedPanTargetKind](target, "guidedPanTargetKind") == 1)
    {
      -[THGuidedPanTarget viewScaleWithController:](self->_target, "viewScaleWithController:", self);
      v5 = v4;
      -[THInteractiveCanvasController viewScale](self->_interactiveCanvasController, "viewScale");
      LOBYTE(target) = vabdd_f64(v6, v5) < 0.00999999978;
    }
    else
    {
      LOBYTE(target) = 0;
    }
  }
  return (char)target;
}

- (BOOL)isFocusedOnPage
{
  THGuidedPanTarget *target;
  double v4;
  double v5;
  double v6;

  target = self->_target;
  if (target)
  {
    if (-[THGuidedPanTarget guidedPanTargetKind](target, "guidedPanTargetKind"))
    {
      LOBYTE(target) = 0;
    }
    else
    {
      -[THGuidedPanTarget viewScaleWithController:](self->_target, "viewScaleWithController:", self);
      v5 = v4;
      -[THInteractiveCanvasController viewScale](self->_interactiveCanvasController, "viewScale");
      LOBYTE(target) = vabdd_f64(v6, v5) < 0.00999999978;
    }
  }
  return (char)target;
}

- (BOOL)isFocusedOnTarget
{
  unsigned int v3;

  v3 = -[THGuidedPanTarget guidedPanTargetIsTargeted](self->_target, "guidedPanTargetIsTargeted");
  if (v3)
  {
    if (-[THGuidedPanController isFocusedOnColumn](self, "isFocusedOnColumn"))
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = -[THGuidedPanController isFocusedOnPage](self, "isFocusedOnPage");
  }
  return v3;
}

- (double)viewScaleForUnscaledRect:(CGRect)a3 forPage:(BOOL)a4
{
  double height;
  double width;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double result;

  height = a3.size.height;
  width = a3.size.width;
  if (a4)
  {
    v6 = -[THInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost", a3.origin.x, a3.origin.y);
    v7 = objc_msgSend(v6, "canvasLayer");
    objc_msgSend(objc_msgSend(v6, "clippingLayer"), "bounds");
    v10 = fmin(v8 / width, v9 / height);
    objc_msgSend(v7, "minimumPinchViewScale");
    v12 = v11;
    objc_msgSend(v7, "maximumPinchViewScale");
    return TSUClamp(v10, v12, v13);
  }
  else
  {
    -[THInteractiveCanvasController viewScaleForZoomToFitRect:outset:fitWidthOnly:](self->_interactiveCanvasController, "viewScaleForZoomToFitRect:outset:fitWidthOnly:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  return result;
}

- (int64_t)relativePageIndexForLayout:(id)a3
{
  return (int64_t)-[THGuidedPanDelegate guidedPanPageIndexForLayout:](self->_delegate, "guidedPanPageIndexForLayout:", a3);
}

- (void)clearTarget
{
  -[THGuidedPanController setTarget:](self, "setTarget:", 0);
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (NSArray)currentWells
{
  return self->_currentWells;
}

- (void)setCurrentWells:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THGuidedPanTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (THGuidedPanDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THGuidedPanDelegate *)a3;
}

- (CGPoint)unscaledStartPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unscaledStartPoint.x;
  y = self->_unscaledStartPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnscaledStartPoint:(CGPoint)a3
{
  self->_unscaledStartPoint = a3;
}

- (CGPoint)unscaledCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unscaledCenterPoint.x;
  y = self->_unscaledCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnscaledCenterPoint:(CGPoint)a3
{
  self->_unscaledCenterPoint = a3;
}

- (double)pageViewScale
{
  return self->_pageViewScale;
}

- (CGPoint)consumedMovement
{
  double x;
  double y;
  CGPoint result;

  x = self->_consumedMovement.x;
  y = self->_consumedMovement.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setConsumedMovement:(CGPoint)a3
{
  self->_consumedMovement = a3;
}

- (CGPoint)previousMovement
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousMovement.x;
  y = self->_previousMovement.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousMovement:(CGPoint)a3
{
  self->_previousMovement = a3;
}

@end
