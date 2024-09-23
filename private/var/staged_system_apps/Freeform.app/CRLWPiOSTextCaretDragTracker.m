@implementation CRLWPiOSTextCaretDragTracker

- (CRLWPiOSTextCaretDragTracker)init
{
  CRLWPiOSTextCaretDragTracker *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  NSMutableArray *recentVelocityQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLWPiOSTextCaretDragTracker;
  v2 = -[CRLWPiOSTextCaretDragTracker initWithFrame:](&v11, "initWithFrame:", 0.0, 0.0, 2.0, 48.0);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.26, 0.42, 0.95, 1.0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UIColor"));
    -[CRLWPiOSTextCaretDragTracker setBackgroundColor:](v2, "setBackgroundColor:", v4);

    -[CRLWPiOSTextCaretDragTracker setClipsToBounds:](v2, "setClipsToBounds:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker layer](v2, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    LODWORD(v7) = 1047233823;
    objc_msgSend(v5, "setShadowOpacity:", v7);
    objc_msgSend(v5, "setShadowOffset:", 0.0, 6.0);
    objc_msgSend(v5, "setShadowRadius:", 2.75);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    recentVelocityQueue = v2->_recentVelocityQueue;
    v2->_recentVelocityQueue = (NSMutableArray *)v8;

    v2->_scrollingDirection = 0;
  }
  return v2;
}

- (void)p_updateNaturalCaretRectFromTarget:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "caretDragSelectionIsValid");

  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(CRLWPRep, v6);
    v8 = sub_1002223BC(v7, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "caretRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[CRLWPiOSTextCaretDragTracker setNaturalCaretRect:](self, "setNaturalCaretRect:", v11, v13, v15, v17);
  }

}

- (void)setNaturalCaretRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  CGRect *p_naturalCaretRect;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  void *v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_naturalCaretRect = &self->_naturalCaretRect;
  if (!CGRectEqualToRect(a3, self->_naturalCaretRect))
  {
    v16.origin.x = CGRectZero.origin.x;
    v16.origin.y = CGRectZero.origin.y;
    v16.size.width = CGRectZero.size.width;
    v16.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(*p_naturalCaretRect, v16)
      && !-[CRLWPiOSTextCaretDragTracker pointDidLeaveOriginalLine](self, "pointDidLeaveOriginalLine"))
    {
      if (!-[CRLWPiOSTextCaretDragTracker p_isVerticalTextLayout](self, "p_isVerticalTextLayout"))
      {
        v9 = p_naturalCaretRect->origin.y;
        v10 = vabdd_f64(y, v9);
        v11 = y == v9;
        v12 = 2.0;
        if (!v11 && v10 >= 2.0)
          goto LABEL_21;
      }
      if (-[CRLWPiOSTextCaretDragTracker p_isVerticalTextLayout](self, "p_isVerticalTextLayout"))
      {
        v10 = vabdd_f64(x, p_naturalCaretRect->origin.x);
        v12 = 2.0;
        if (x != p_naturalCaretRect->origin.x && v10 >= 2.0)
        {
LABEL_21:
          if (-[CRLWPiOSTextCaretDragTracker isAnimatingPickup](self, "isAnimatingPickup", v12, v10))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker layer](self, "layer"));
            objc_msgSend(v15, "removeAllAnimations");

          }
          -[CRLWPiOSTextCaretDragTracker setPointDidLeaveOriginalLine:](self, "setPointDidLeaveOriginalLine:", 1);
        }
      }
    }
    p_naturalCaretRect->origin.x = x;
    p_naturalCaretRect->origin.y = y;
    p_naturalCaretRect->size.width = width;
    p_naturalCaretRect->size.height = height;
  }
}

- (void)setPointVelocity:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker recentVelocityQueue](self, "recentVelocityQueue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", a3));
  objc_msgSend(v5, "insertObject:atIndex:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker recentVelocityQueue](self, "recentVelocityQueue"));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 >= 0x15)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker recentVelocityQueue](self, "recentVelocityQueue"));
    objc_msgSend(v9, "removeObjectAtIndex:", 20);

  }
  self->_pointVelocity = a3;
}

- (CGPoint)magnificationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  CGFloat x;
  CGPoint *p_magnificationPoint;
  double y;
  double v7;
  uint64_t v9;

  x = a3.x;
  p_magnificationPoint = &self->_magnificationPoint;
  y = self->_magnificationPoint.y;
  if (a3.x != self->_magnificationPoint.x || a3.y != y)
  {
    v7 = a3.y;
    if (sub_100061860(a3.x, a3.y))
    {
      if (v7 <= y)
        v9 = 1;
      else
        v9 = 2;
      -[CRLWPiOSTextCaretDragTracker setScrollingDirection:](self, "setScrollingDirection:", v9);
    }
    p_magnificationPoint->x = x;
    p_magnificationPoint->y = v7;
  }
}

- (void)setCursorIsFloating:(BOOL)a3
{
  if (self->_cursorIsFloating != a3)
    self->_cursorIsFloating = a3;
}

- (BOOL)p_isVerticalTextLayout
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;

  v3 = objc_opt_class(CRLWPRep, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = objc_msgSend(v6, "textIsVertical");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker delegate](self, "delegate"));
    v7 = objc_msgSend(v8, "isVerticalTextCaretForMagnifying");

  }
  return v7;
}

- (CGPoint)p_unscaledScrollPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
  -[CRLWPiOSTextCaretDragTracker magnificationPoint](self, "magnificationPoint");
  objc_msgSend(v4, "convertBoundsToUnscaledPoint:");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)p_naturalPointFromUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));
  objc_msgSend(v6, "convertUnscaledToBoundsPoint:", x, y);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)p_smoothedVelocity
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  double v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker recentVelocityQueue](self, "recentVelocityQueue", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "crl_CGFloatValue");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker recentVelocityQueue](self, "recentVelocityQueue"));
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker recentVelocityQueue](self, "recentVelocityQueue"));
    v12 = (double)(unint64_t)objc_msgSend(v11, "count");

  }
  else
  {
    v12 = 1.0;
  }

  return v7 / v12;
}

- (CGPoint)p_selectionPointFromPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLWPiOSTextCaretDragTracker p_trackingOffset](self, "p_trackingOffset");
  v6 = y - v5;
  v7 = round(x);
  v8 = round(v6);
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)p_unscaledSelectionPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[CRLWPiOSTextCaretDragTracker magnificationPoint](self, "magnificationPoint");
  -[CRLWPiOSTextCaretDragTracker p_selectionPointFromPoint:](self, "p_selectionPointFromPoint:");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interactiveCanvasController"));
  objc_msgSend(v8, "convertBoundsToUnscaledPoint:", v4, v6);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)p_shouldSnapToSelection
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL result;

  -[CRLWPiOSTextCaretDragTracker magnificationPoint](self, "magnificationPoint");
  -[CRLWPiOSTextCaretDragTracker p_selectionPointFromPoint:](self, "p_selectionPointFromPoint:");
  v4 = v3;
  v6 = v5;
  result = 0;
  if (!-[CRLWPiOSTextCaretDragTracker autoScrollIsActive](self, "autoScrollIsActive")
    && !-[CRLWPiOSTextCaretDragTracker isAnimatingPickup](self, "isAnimatingPickup"))
  {
    -[CRLWPiOSTextCaretDragTracker p_smoothedVelocity](self, "p_smoothedVelocity");
    if (v7 < 180.0)
    {
      -[CRLWPiOSTextCaretDragTracker p_scaledCaretRectCenter](self, "p_scaledCaretRectCenter");
      if (sub_10006108C(v8, v9, v4, v6) < 20.0)
        return 1;
    }
  }
  return result;
}

- (BOOL)p_shouldSuppressAnimation
{
  if (-[CRLWPiOSTextCaretDragTracker cursorIsFloating](self, "cursorIsFloating")
    || -[CRLWPiOSTextCaretDragTracker autoScrollIsActive](self, "autoScrollIsActive"))
  {
    return 1;
  }
  else
  {
    return -[CRLWPiOSTextCaretDragTracker isAnimatingPickup](self, "isAnimatingPickup");
  }
}

- (double)p_trackingOffset
{
  double v3;
  double v4;
  unsigned __int8 v5;
  double v6;
  double v7;
  double v8;

  -[CRLWPiOSTextCaretDragTracker offset](self, "offset");
  v4 = v3;
  if (-[CRLWPiOSTextCaretDragTracker pointDidLeaveOriginalLine](self, "pointDidLeaveOriginalLine"))
  {
    v5 = -[CRLWPiOSTextCaretDragTracker p_isVerticalTextLayout](self, "p_isVerticalTextLayout");
    -[CRLWPiOSTextCaretDragTracker p_clampedScaledCaretSize](self, "p_clampedScaledCaretSize");
    if ((v5 & 1) != 0)
      v8 = v6 * 0.5;
    else
      v8 = v7 * 0.5;
    return v8 + 16.0;
  }
  return v4;
}

- (CGPoint)p_scaledCaretRectCenter
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  CGPoint result;

  -[CRLWPiOSTextCaretDragTracker p_scaledCaretRect](self, "p_scaledCaretRect");
  v6 = sub_100061400(v2, v3, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)p_unscaledCaretRect
{
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  -[CRLWPiOSTextCaretDragTracker naturalCaretRect](self, "naturalCaretRect");
  objc_msgSend(v3, "convertNaturalRectToUnscaledCanvas:");
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

- (CGRect)p_scaledCaretRect
{
  void *v3;
  void *v4;
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
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
  -[CRLWPiOSTextCaretDragTracker p_unscaledCaretRect](self, "p_unscaledCaretRect");
  objc_msgSend(v4, "convertUnscaledToBoundsRect:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)p_clampedScaledCaretSize
{
  unsigned int v3;
  double v4;
  float v5;
  double v6;
  double v7;
  float v8;
  double v9;
  CGSize result;

  v3 = -[CRLWPiOSTextCaretDragTracker p_isVerticalTextLayout](self, "p_isVerticalTextLayout");
  -[CRLWPiOSTextCaretDragTracker p_scaledCaretRect](self, "p_scaledCaretRect");
  v5 = v4;
  v6 = fmaxf(v5, 48.0);
  v8 = v7;
  v9 = fmaxf(v8, 48.0);
  if (v3)
    v6 = 2.0;
  else
    v9 = 2.0;
  result.height = v6;
  result.width = v9;
  return result;
}

- (void)p_removeFromView
{
  -[CRLWPiOSTextCaretDragTracker setTarget:](self, "setTarget:", 0);
  -[CRLWPiOSTextCaretDragTracker removeFromSuperview](self, "removeFromSuperview");
}

- (void)p_updateFrameAndOffset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[9];
  CGRect v18;
  CGRect v19;

  -[CRLWPiOSTextCaretDragTracker setNeedsLayout](self, "setNeedsLayout");
  -[CRLWPiOSTextCaretDragTracker setNeedsDisplay](self, "setNeedsDisplay");
  -[CRLWPiOSTextCaretDragTracker p_clampedScaledCaretSize](self, "p_clampedScaledCaretSize");
  v4 = v3;
  v6 = v5;
  -[CRLWPiOSTextCaretDragTracker center](self, "center");
  v8 = v7;
  v10 = v9;
  if (-[CRLWPiOSTextCaretDragTracker p_shouldSnapToSelection](self, "p_shouldSnapToSelection"))
  {
    -[CRLWPiOSTextCaretDragTracker setCursorIsFloating:](self, "setCursorIsFloating:", 0);
    -[CRLWPiOSTextCaretDragTracker p_scaledCaretRectCenter](self, "p_scaledCaretRectCenter");
  }
  else
  {
    -[CRLWPiOSTextCaretDragTracker setCursorIsFloating:](self, "setCursorIsFloating:", 1);
    -[CRLWPiOSTextCaretDragTracker magnificationPoint](self, "magnificationPoint");
    v14 = v13;
    v16 = v15;
    if (!sub_100061860(v13, v15))
      goto LABEL_6;
    -[CRLWPiOSTextCaretDragTracker p_selectionPointFromPoint:](self, "p_selectionPointFromPoint:", v14, v16);
  }
  v8 = v11;
  v10 = v12;
LABEL_6:
  if (-[CRLWPiOSTextCaretDragTracker p_shouldSuppressAnimation](self, "p_shouldSuppressAnimation"))
  {
    -[CRLWPiOSTextCaretDragTracker setCenter:](self, "setCenter:", v8, v10);
    v18.origin.x = sub_10005FDDC();
    v19 = CGRectIntegral(v18);
    -[CRLWPiOSTextCaretDragTracker setBounds:](self, "setBounds:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100050200;
    v17[3] = &unk_10122F7A8;
    v17[4] = self;
    *(double *)&v17[5] = v8;
    *(double *)&v17[6] = v10;
    v17[7] = v4;
    v17[8] = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v17, 0, 0.08, 0.0);
  }
}

- (void)p_zoomUpAnimation
{
  _QWORD v3[5];
  _QWORD v4[5];

  -[CRLWPiOSTextCaretDragTracker setIsAnimatingPickup:](self, "setIsAnimatingPickup:", 1);
  -[CRLWPiOSTextCaretDragTracker p_updateFrameAndOffset](self, "p_updateFrameAndOffset");
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000502D4;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100050334;
  v3[3] = &unk_10122F780;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 0.15);
}

- (CGAffineTransform)p_growTransform
{
  return -[CRLWPiOSTextCaretDragTracker p_caretAffineTransformWithScaleFactor:](self, "p_caretAffineTransformWithScaleFactor:", 1.5);
}

- (CGAffineTransform)p_shrinkTransform
{
  return -[CRLWPiOSTextCaretDragTracker p_caretAffineTransformWithScaleFactor:](self, "p_caretAffineTransformWithScaleFactor:", 0.94);
}

- (CGAffineTransform)p_caretAffineTransformWithScaleFactor:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGAffineTransform *v17;
  CGFloat v18;

  -[CRLWPiOSTextCaretDragTracker p_clampedScaledCaretSize](self, "p_clampedScaledCaretSize");
  v8 = v7;
  v10 = v9;
  if (!-[CRLWPiOSTextCaretDragTracker p_isVerticalTextLayout](self, "p_isVerticalTextLayout"))
    v8 = v10;
  v11 = -[CRLWPiOSTextCaretDragTracker p_isVerticalTextLayout](self, "p_isVerticalTextLayout");
  -[CRLWPiOSTextCaretDragTracker bounds](self, "bounds");
  if (v11)
    v14 = v12;
  else
    v14 = v13;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v15 = v8 * a4 / v14;
  if (-[CRLWPiOSTextCaretDragTracker p_isVerticalTextLayout](self, "p_isVerticalTextLayout"))
  {
    v16 = 1.0;
    v17 = retstr;
    v18 = v15;
  }
  else
  {
    v18 = 1.0;
    v17 = retstr;
    v16 = v15;
  }
  return CGAffineTransformMakeScale(v17, v18, v16);
}

- (void)p_setBoundsAndCenterToCaretRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  __int128 v11;
  _OWORD v12[3];

  -[CRLWPiOSTextCaretDragTracker p_scaledCaretRect](self, "p_scaledCaretRect");
  if (v5 == 0.0)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    -[CRLWPiOSTextCaretDragTracker setBounds:](self, "setBounds:", sub_10005FDDC());
    -[CRLWPiOSTextCaretDragTracker setCenter:](self, "setCenter:", sub_100061400(v7, v8, v9, v10));
  }
  else
  {
    v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v12[1] = v11;
    v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[CRLWPiOSTextCaretDragTracker setTransform:](self, "setTransform:", v12);
  }
}

- (void)p_zoomDownAnimation
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100050750;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100050758;
  v3[3] = &unk_10122F780;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 0.22);
  -[CRLWPiOSTextCaretDragTracker setTarget:](self, "setTarget:", 0);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  CRLWPiOSTextCaretDragTrackerController *v28;
  void *v29;
  id v30;
  CGRect v31;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  v30 = a3;
  -[CRLWPiOSTextCaretDragTracker setTarget:](self, "setTarget:", v30);
  -[CRLWPiOSTextCaretDragTracker p_updateNaturalCaretRectFromTarget:](self, "p_updateNaturalCaretRectFromTarget:", v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));

  v13 = objc_opt_class(CRLInteractiveCanvasController, v12);
  v14 = sub_100221D0C(v13, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v16)
  {
    v17 = objc_opt_class(CRLiOSCanvasViewController, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerHost"));
    v19 = sub_100221D0C(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvasView"));
    -[CRLWPiOSTextCaretDragTracker setHostView:](self, "setHostView:", v21);

  }
  -[CRLWPiOSTextCaretDragTracker p_scaledCaretRect](self, "p_scaledCaretRect");
  -[CRLWPiOSTextCaretDragTracker setOffset:](self, "setOffset:", 0.0, y - CGRectGetMidY(v31));
  -[CRLWPiOSTextCaretDragTracker setMagnificationPoint:](self, "setMagnificationPoint:", x, y);
  v23 = objc_opt_class(UIViewController, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "interactiveCanvasController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "delegate"));
  v26 = sub_100221D0C(v23, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v28 = -[CRLWPiOSTextCaretDragTrackerController initWithPreferredStatusBarStyle:]([CRLWPiOSTextCaretDragTrackerController alloc], "initWithPreferredStatusBarStyle:", objc_msgSend(v27, "preferredStatusBarStyle"));
  -[CRLWPiOSTextCaretDragTrackerController setView:](v28, "setView:", self);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker hostView](self, "hostView"));
  objc_msgSend(v29, "addSubview:", self);

  if (v6)
    -[CRLWPiOSTextCaretDragTracker p_zoomUpAnimation](self, "p_zoomUpAnimation");

}

- (void)continueMagnifyingWithMagnificationPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;

  y = a3.y;
  x = a3.x;
  -[CRLWPiOSTextCaretDragTracker setMagnificationPoint:](self, "setMagnificationPoint:");
  if (sub_100061860(x, y))
  {
    -[CRLWPiOSTextCaretDragTracker p_updateFrameAndOffset](self, "p_updateFrameAndOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker delegate](self, "delegate"));
    -[CRLWPiOSTextCaretDragTracker p_unscaledSelectionPoint](self, "p_unscaledSelectionPoint");
    objc_msgSend(v6, "setSelectionFromUnscaledPoint:");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
    -[CRLWPiOSTextCaretDragTracker p_updateNaturalCaretRectFromTarget:](self, "p_updateNaturalCaretRectFromTarget:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enclosingScrollView"));
    v13 = objc_msgSend(v12, "isScrollEnabled");

    if (v13)
    {
      -[CRLWPiOSTextCaretDragTracker p_unscaledScrollPoint](self, "p_unscaledScrollPoint");
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self);
    }
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  void *v4;

  if (a3)
    -[CRLWPiOSTextCaretDragTracker p_zoomDownAnimation](self, "p_zoomDownAnimation");
  else
    -[CRLWPiOSTextCaretDragTracker p_removeFromView](self, "p_removeFromView");
  self->_magnificationPoint = (CGPoint)xmmword_100EEC428;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker autoscroll](self, "autoscroll"));
  objc_msgSend(v4, "invalidate");

  -[CRLWPiOSTextCaretDragTracker setAutoscroll:](self, "setAutoscroll:", 0);
}

- (BOOL)terminalPointPlacedCarefully
{
  return 1;
}

- (CGPoint)animationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)unscaledStartAutoscrollThreshold
{
  int64_t v2;
  double result;

  v2 = -[CRLWPiOSTextCaretDragTracker scrollingDirection](self, "scrollingDirection");
  result = 45.0;
  if (v2 == 1)
    return 100.0;
  return result;
}

- (CRLInteractiveCanvasController)icc
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));

  return (CRLInteractiveCanvasController *)v3;
}

- (void)updateAfterAutoscroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;

  if (!-[CRLWPiOSTextCaretDragTracker autoScrollIsActive](self, "autoScrollIsActive", a3))
    -[CRLWPiOSTextCaretDragTracker setAutoScrollIsActive:](self, "setAutoScrollIsActive:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker autoscroll](self, "autoscroll"));
  objc_msgSend(v4, "unscaledAutoscrollPoint");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSTextCaretDragTracker target](self, "target"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactiveCanvasController"));
  objc_msgSend(v10, "contentOffset");
  v12 = v11;
  v14 = v13;

  -[CRLWPiOSTextCaretDragTracker startingUnscaledAutoscrollPoint](self, "startingUnscaledAutoscrollPoint");
  if (!sub_10005FE60(v6, v8, v15, v16))
  {
    -[CRLWPiOSTextCaretDragTracker setStartingUnscaledAutoscrollPoint:](self, "setStartingUnscaledAutoscrollPoint:", v6, v8);
    -[CRLWPiOSTextCaretDragTracker setStartingiccUnscaledContentOffset:](self, "setStartingiccUnscaledContentOffset:", v12, v14);
  }
  -[CRLWPiOSTextCaretDragTracker startingiccUnscaledContentOffset](self, "startingiccUnscaledContentOffset");
  v18 = sub_1000603B8(v12, v14, v17);
  -[CRLWPiOSTextCaretDragTracker p_naturalPointFromUnscaledPoint:](self, "p_naturalPointFromUnscaledPoint:", sub_1000603D0(v6, v8, v18));
  self->_magnificationPoint.x = v19;
  self->_magnificationPoint.y = v20;
  -[CRLWPiOSTextCaretDragTracker p_updateFrameAndOffset](self, "p_updateFrameAndOffset");
}

- (void)autoscrollWillNotStart
{
  -[CRLWPiOSTextCaretDragTracker setAutoScrollIsActive:](self, "setAutoScrollIsActive:", 0);
}

- (unint64_t)maximumAutoscrollDeltaForCount:(unint64_t)a3
{
  double v3;

  if (a3 > 0x2C)
  {
    if (a3 > 0x31)
    {
      if (a3 > 0x40)
      {
        if (a3 > 0x63)
        {
          if (a3 > 0x77)
            v3 = 0.35;
          else
            v3 = 0.3;
        }
        else
        {
          v3 = 0.22;
        }
      }
      else
      {
        v3 = 0.15;
      }
    }
    else
    {
      v3 = 0.1;
    }
  }
  else
  {
    v3 = 0.07;
  }
  return (unint64_t)((double)0x30uLL * v3);
}

- (CRLCanvasRep)target
{
  return self->_target;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (CGRect)naturalCaretRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_naturalCaretRect.origin.x;
  y = self->_naturalCaretRect.origin.y;
  width = self->_naturalCaretRect.size.width;
  height = self->_naturalCaretRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

- (CRLWPCaretDragMagnifierDelegate)delegate
{
  return (CRLWPCaretDragMagnifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)pointVelocity
{
  return self->_pointVelocity;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_storeStrong((id *)&self->_autoscroll, a3);
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSString)underlayImageName
{
  return self->_underlayImageName;
}

- (UIView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
  objc_storeStrong((id *)&self->_hostView, a3);
}

- (BOOL)pointDidLeaveOriginalLine
{
  return self->_pointDidLeaveOriginalLine;
}

- (void)setPointDidLeaveOriginalLine:(BOOL)a3
{
  self->_pointDidLeaveOriginalLine = a3;
}

- (BOOL)cursorIsFloating
{
  return self->_cursorIsFloating;
}

- (BOOL)autoScrollIsActive
{
  return self->_autoScrollIsActive;
}

- (void)setAutoScrollIsActive:(BOOL)a3
{
  self->_autoScrollIsActive = a3;
}

- (BOOL)isAnimatingPickup
{
  return self->_isAnimatingPickup;
}

- (void)setIsAnimatingPickup:(BOOL)a3
{
  self->_isAnimatingPickup = a3;
}

- (NSMutableArray)recentVelocityQueue
{
  return self->_recentVelocityQueue;
}

- (void)setRecentVelocityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recentVelocityQueue, a3);
}

- (int64_t)scrollingDirection
{
  return self->_scrollingDirection;
}

- (void)setScrollingDirection:(int64_t)a3
{
  self->_scrollingDirection = a3;
}

- (CGPoint)startingUnscaledAutoscrollPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingUnscaledAutoscrollPoint.x;
  y = self->_startingUnscaledAutoscrollPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartingUnscaledAutoscrollPoint:(CGPoint)a3
{
  self->_startingUnscaledAutoscrollPoint = a3;
}

- (CGPoint)startingiccUnscaledContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingiccUnscaledContentOffset.x;
  y = self->_startingiccUnscaledContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartingiccUnscaledContentOffset:(CGPoint)a3
{
  self->_startingiccUnscaledContentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentVelocityQueue, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_underlayImageName, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
