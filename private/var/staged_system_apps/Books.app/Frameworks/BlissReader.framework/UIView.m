@implementation UIView

- (void)setFrameOrigin:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:", x, y);
}

- (void)setFrameSize:(CGSize)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (CGSize)frameSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView frame](self, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setFrameX:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:", a3);
}

- (void)setFrameY:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (double)frameY
{
  double v2;

  -[UIView frame](self, "frame");
  return v2;
}

- (void)setFrameWidth:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (double)frameWidth
{
  double v2;

  -[UIView frame](self, "frame");
  return v2;
}

- (void)setFrameHeight:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (double)frameHeight
{
  double v2;

  -[UIView frame](self, "frame");
  return v2;
}

- (void)offset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGRect v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self, "frame");
  v7 = CGRectOffset(v6, x, y);
  -[UIView setFrame:](self, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (void)setOrigin:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:", x, y);
}

- (void)centerHorizontallyInSuperview
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIView bounds](-[UIView superview](self, "superview"), "bounds");
  -[UIView setFrame:](self, "setFrame:", floor((v9 - v6) * 0.5), v4, v6, v8);
}

- (void)centerInSuperview
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[UIView bounds](-[UIView superview](self, "superview"), "bounds");
  v8 = floor((v7 - v4) * 0.5);
  -[UIView bounds](-[UIView superview](self, "superview"), "bounds");
  -[UIView setFrame:](self, "setFrame:", v8, floor((v9 - v6) * 0.5), v4, v6);
}

- (double)scaleNeededToFit:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.size.height;
  width = a3.size.width;
  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y);
  return THScaleNeededToFitSizeInSize(v5, v6, width, height);
}

- (void)scaleToFit:(CGRect)a3
{
  CGFloat v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  -[UIView scaleNeededToFit:](self, "scaleNeededToFit:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGAffineTransformMakeScale(&v6, v4, v4);
  v5 = v6;
  -[UIView setTransform:](self, "setTransform:", &v5);
}

- (double)scaleNeededToFill:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.size.height;
  width = a3.size.width;
  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y);
  return THScaleNeededToFillSizeInSize(v5, v6, width, height);
}

- (void)scaleToFill:(CGRect)a3
{
  CGFloat v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  -[UIView scaleNeededToFill:](self, "scaleNeededToFill:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGAffineTransformMakeScale(&v6, v4, v4);
  v5 = v6;
  -[UIView setTransform:](self, "setTransform:", &v5);
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  -[UIView setHidden:animated:completion:](self, "setHidden:animated:completion:", 1, a3, a4);
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  -[UIView setHidden:animated:completion:](self, "setHidden:animated:completion:", 0, a3, a4);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  double v11;
  _QWORD v12[6];
  unsigned __int8 v13;
  _QWORD v14[5];
  BOOL v15;
  _QWORD v16[6];
  BOOL v17;

  v6 = a3;
  if (a4)
  {
    -[UIView setHidden:](self, "setHidden:", 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_35088;
    v16[3] = &unk_4277E0;
    v17 = v6;
    v16[4] = self;
    v16[5] = a5;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_350D0;
    v14[3] = &unk_427268;
    v14[4] = self;
    v15 = v6;
    v8 = -[CALayer shouldRasterize](-[UIView layer](self, "layer"), "shouldRasterize");
    v9 = -[CALayer setShouldRasterize:](-[UIView layer](self, "layer"), "setShouldRasterize:", 1);
    -[CALayer setRasterizationScale:](-[UIView layer](self, "layer"), "setRasterizationScale:", TSUScreenScale(v9, v10));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_350EC;
    v12[3] = &unk_427808;
    v12[4] = self;
    v12[5] = v16;
    v13 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v14, v12, 0.25, 0.0);
  }
  else
  {
    -[UIView setHidden:](self, "setHidden:", a3);
    v11 = 1.0;
    if (v6)
      v11 = 0.0;
    -[UIView setAlpha:](self, "setAlpha:", v11);
    if (a5)
      (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

+ (void)performBlockWithActionsAndAnimationsDisabled:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3517C;
  v3[3] = &unk_427830;
  v3[4] = a3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

- (void)setFrameAndScaleToFitCurrentSize:(CGRect)a3 layoutAfterSetFrame:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MidX;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView setFrame:](self, "setFrame:", x, y, width, height);
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
  v19.origin.x = v11;
  v19.origin.y = v13;
  v19.size.width = v15;
  v19.size.height = v17;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = v11;
  v20.origin.y = v13;
  v20.size.width = v15;
  v20.size.height = v17;
  -[UIView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v20));
  -[UIView scaleToFit:](self, "scaleToFit:", v11, v13, v15, v17);
}

- (void)animateToFrame:(CGRect)a3 duration:(double)a4 hasInitialScale:(BOOL)a5 fit:(BOOL)a6 setFinalFrame:(BOOL)a7 completion:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v15;
  CGFloat v16;
  _QWORD v17[10];
  BOOL v18;
  _QWORD v19[9];
  CGAffineTransform v20;
  CGAffineTransform v21;
  _QWORD v22[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3052000000;
  v22[3] = sub_35450;
  v22[4] = sub_35460;
  v22[5] = self;
  memset(&v21, 0, sizeof(v21));
  if (a5)
  {
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v21.c = v15;
    *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    if (a6)
      -[UIView scaleNeededToFit:](self, "scaleNeededToFit:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    else
      -[UIView scaleNeededToFill:](self, "scaleNeededToFill:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGAffineTransformMakeScale(&v21, v16, v16);
  }
  v19[0] = _NSConcreteStackBlock;
  v20 = v21;
  v19[1] = 3221225472;
  v19[2] = sub_3546C;
  v19[3] = &unk_427858;
  v19[4] = v22;
  *(CGFloat *)&v19[5] = x;
  *(CGFloat *)&v19[6] = y;
  *(CGFloat *)&v19[7] = width;
  *(CGFloat *)&v19[8] = height;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_354F4;
  v17[3] = &unk_427880;
  v18 = a7;
  *(CGFloat *)&v17[6] = x;
  *(CGFloat *)&v17[7] = y;
  *(CGFloat *)&v17[8] = width;
  *(CGFloat *)&v17[9] = height;
  v17[4] = a8;
  v17[5] = v22;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v19, v17, a4);
  _Block_object_dispose(v22, 8);
}

- (void)scale:(double)a3 aroundBoundsPoint:(CGPoint)a4 afterOffset:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  CALayer *v11;
  CGAffineTransform v12;
  CATransform3D v13;
  CGAffineTransform v14;
  CATransform3D v15;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  memset(&v15, 0, sizeof(v15));
  v11 = -[UIView layer](self, "layer");
  if (v11)
    -[CALayer transformToScale:aroundBoundsPoint:afterOffset:](v11, "transformToScale:aroundBoundsPoint:afterOffset:", a3, v8, v7, x, y);
  else
    memset(&v15, 0, sizeof(v15));
  v13 = v15;
  CATransform3DGetAffineTransform(&v14, &v13);
  v12 = v14;
  -[UIView setTransform:](self, "setTransform:", &v12);
}

- (void)scale:(double)a3 aroundAnchorPoint:(CGPoint)a4 afterOffset:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  CALayer *v11;
  CGAffineTransform v12;
  CATransform3D v13;
  CGAffineTransform v14;
  CATransform3D v15;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  memset(&v15, 0, sizeof(v15));
  v11 = -[UIView layer](self, "layer");
  if (v11)
    -[CALayer transformToScale:aroundAnchorPoint:afterOffset:](v11, "transformToScale:aroundAnchorPoint:afterOffset:", a3, v8, v7, x, y);
  else
    memset(&v15, 0, sizeof(v15));
  v13 = v15;
  CATransform3DGetAffineTransform(&v14, &v13);
  v12 = v14;
  -[UIView setTransform:](self, "setTransform:", &v12);
}

- (BOOL)isAncestorScrollViewDragging
{
  return -[UIView isAncestorScrollViewDragging](-[UIView superview](self, "superview"), "isAncestorScrollViewDragging");
}

- (id)stateRestoreBlock
{
  return objc_getAssociatedObject(self, &off_4299E8);
}

- (void)setStateRestoreBlock:(id)a3
{
  objc_setAssociatedObject(self, &off_4299E8, a3, (char *)&dword_0 + 3);
}

- (void)th_restoreState
{
  if (!-[UIView stateRestoreBlock](self, "stateRestoreBlock"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIView(THStateStateRestoreBlock) th_restoreState]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 257, CFSTR("invalid nil value for '%s'"), "self.stateRestoreBlock");
  if (-[UIView stateRestoreBlock](self, "stateRestoreBlock"))
  {
    (*((void (**)(void))-[UIView stateRestoreBlock](self, "stateRestoreBlock") + 2))();
    -[UIView setStateRestoreBlock:](self, "setStateRestoreBlock:", 0);
  }
}

- (BOOL)tsaxServesAsContainingParentForOrdering
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543893);
}

- (void)tsaxSetServesAsContainingParentForOrdering:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543893, a3);
}

- (id)tsaxParentFindReplaceController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543894);
}

- (void)tsaxSetParentFindReplaceController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543894, a3);
}

- (CGRect)tsaxFrameFromBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIWindow *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UIView window](self, "window");
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);
  -[UIWindow convertRect:toWindow:](v8, "convertRect:toWindow:", 0);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGPoint)tsaxFramePointFromBoundsPoint:(CGPoint)a3
{
  double y;
  double x;
  UIWindow *v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -[UIView window](self, "window");
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  -[UIWindow convertPoint:toWindow:](v6, "convertPoint:toWindow:", v6);
  result.y = v8;
  result.x = v7;
  return result;
}

- (double)tsaxScreenScale
{
  double result;

  -[UIScreen scale](-[UIWindow screen](-[UIView window](self, "window"), "screen"), "scale");
  return result;
}

+ (BOOL)tsaxView:(id)a3 isDescendantOfView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a3 != 0;
  if (a3 != a4)
  {
    v9 = a3;
    if (a3)
    {
      v12 = v5;
      v13 = v4;
      v14 = v6;
      v15 = v7;
      do
      {
        v9 = objc_msgSend(v9, "superview", v12, v13, v14, v15);
        v8 = v9 != 0;
      }
      while (v9 != a4 && v9);
    }
  }
  return v8;
}

@end
