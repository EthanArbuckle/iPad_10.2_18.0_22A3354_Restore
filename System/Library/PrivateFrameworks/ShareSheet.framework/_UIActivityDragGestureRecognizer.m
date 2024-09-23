@implementation _UIActivityDragGestureRecognizer

- (_UIActivityDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIActivityDragGestureRecognizer *v4;
  _UIActivityDragGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIActivityDragGestureRecognizer;
  v4 = -[_UIActivityDragGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[_UIActivityDragGestureRecognizer setDraggingInsets:](v4, "setDraggingInsets:", 0.0, 22.0, 0.0, 22.0);
  return v5;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIActivityDragGestureRecognizer;
  -[_UIActivityDragGestureRecognizer setState:](&v7, sel_setState_);
  if (a3 == 2)
  {
    -[_UIActivityDragGestureRecognizer beginAutoscrollAndUpdateDirectionIfNeeded](self, "beginAutoscrollAndUpdateDirectionIfNeeded");
    -[_UIActivityDragGestureRecognizer autoscroll](self, "autoscroll");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityDragGestureRecognizer updateAutoscroll:](self, "updateAutoscroll:", v5);
  }
  else
  {
    if (a3 != 1)
      return;
    -[_UIActivityDragGestureRecognizer view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_enclosingScrollableScrollerIncludingSelf");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityDragGestureRecognizer setTargetScrollView:](self, "setTargetScrollView:", v6);

  }
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIActivityDragGestureRecognizer;
  -[_UIActivityDragGestureRecognizer reset](&v3, sel_reset);
  -[_UIActivityDragGestureRecognizer cancelAutoscroll](self, "cancelAutoscroll");
  -[_UIActivityDragGestureRecognizer setAutoscroll:](self, "setAutoscroll:", 0);
  -[_UIActivityDragGestureRecognizer setTargetScrollView:](self, "setTargetScrollView:", 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIActivityDragGestureRecognizer;
  -[_UIActivityDragGestureRecognizer touchesMoved:withEvent:](&v5, sel_touchesMoved_withEvent_, a3, a4);
  if (-[_UIActivityDragGestureRecognizer state](self, "state") == 2)
    -[_UIActivityDragGestureRecognizer setState:](self, "setState:", 2);
}

- (void)updateAutoscroll:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unsigned int v19;
  double Width;
  unsigned int v21;
  double v22;
  unsigned int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  CGRect v32;

  v31 = a3;
  -[_UIActivityDragGestureRecognizer targetScrollView](self, "targetScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_18;
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "contentOffset");
  v15 = v14;
  v17 = v16;
  -[_UIActivityDragGestureRecognizer autoscroll](self, "autoscroll");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "directions");

  Width = 0.0;
  v21 = v19 & 0xFFFFFFFE;
  if (v15 > 0.0)
    v21 = v19;
  else
    Width = v15;
  if ((v19 & 1) != 0)
    v22 = Width;
  else
    v22 = v15;
  if ((v19 & 1) != 0)
    v23 = v21;
  else
    v23 = v19;
  if ((v23 & 2) == 0)
    goto LABEL_14;
  objc_msgSend(v5, "contentSize", Width);
  v25 = v24;
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  Width = CGRectGetWidth(v32);
  v26 = v25 - Width;
  if (v22 >= v25 - Width)
  {
    v23 &= ~2u;
LABEL_14:
    v26 = v22;
    if (!v23)
    {
      -[_UIActivityDragGestureRecognizer cancelAutoscroll](self, "cancelAutoscroll", Width);
      goto LABEL_18;
    }
  }
  if ((unint64_t)objc_msgSend(v31, "count", Width) <= 1)
  {
    UIDistanceBetweenPoints();
    v28 = v27 / 333.333333;
    objc_msgSend(v5, "_contentOffsetAnimationDuration");
    v30 = v29;
    objc_msgSend(v5, "_setContentOffsetAnimationDuration:", v28);
    objc_msgSend(v5, "setContentOffset:animated:", 1, v26, v17);
    objc_msgSend(v5, "_setContentOffsetAnimationDuration:", v30);
  }
LABEL_18:

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  -[_UIActivityDragGestureRecognizer setState:](self, "setState:", 2);
}

- (void)beginAutoscrollAndUpdateDirectionIfNeeded
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[_UIActivityDragGestureRecognizer autoscroll](self, "autoscroll");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC34D0]);
    -[_UIActivityDragGestureRecognizer setAutoscroll:](self, "setAutoscroll:");
  }
  -[_UIActivityDragGestureRecognizer targetScrollView](self, "targetScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIActivityDragGestureRecognizer locationInView:](self, "locationInView:", v3);
    objc_msgSend(v3, "_setAutoscrolling:", objc_msgSend(v6, "startAutoscroll:scrollContainer:point:directions:repeatInterval:", self, v3, -[_UIActivityDragGestureRecognizer autoscrollDirectionsForPoint:inView:](self, "autoscrollDirectionsForPoint:inView:", v3), v4, v5, 0.2));
    if (objc_msgSend(v3, "_isAutoscrolling"))
      objc_msgSend(v3, "_addScrollViewScrollObserver:", self);
  }

}

- (void)cancelAutoscroll
{
  void *v3;
  void *v4;
  id v5;

  -[_UIActivityDragGestureRecognizer targetScrollView](self, "targetScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeScrollViewScrollObserver:", self);

  -[_UIActivityDragGestureRecognizer targetScrollView](self, "targetScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAutoscrolling:", 0);

  -[_UIActivityDragGestureRecognizer autoscroll](self, "autoscroll");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (int)autoscrollDirectionsForPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  CGFloat v7;
  CGFloat v8;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v12;
  int v13;
  double MaxX;
  double v15;
  double MinY;
  double v17;
  double MaxY;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (!a4)
    return 0;
  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "bounds");
  v7 = v21.origin.x;
  v8 = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  MinX = CGRectGetMinX(v21);
  -[_UIActivityDragGestureRecognizer draggingInsets](self, "draggingInsets");
  v13 = x <= MinX + v12;
  v22.origin.x = v7;
  v22.origin.y = v8;
  v22.size.width = width;
  v22.size.height = height;
  MaxX = CGRectGetMaxX(v22);
  -[_UIActivityDragGestureRecognizer draggingInsets](self, "draggingInsets");
  if (x >= MaxX - v15)
    v13 |= 2u;
  v23.origin.x = v7;
  v23.origin.y = v8;
  v23.size.width = width;
  v23.size.height = height;
  MinY = CGRectGetMinY(v23);
  -[_UIActivityDragGestureRecognizer draggingInsets](self, "draggingInsets");
  if (y <= MinY + v17)
    v13 |= 4u;
  v24.origin.x = v7;
  v24.origin.y = v8;
  v24.size.width = width;
  v24.size.height = height;
  MaxY = CGRectGetMaxY(v24);
  -[_UIActivityDragGestureRecognizer draggingInsets](self, "draggingInsets");
  if (y >= MaxY - v19)
    return v13 | 8;
  else
    return v13;
}

- (UIEdgeInsets)draggingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_draggingInsets.top;
  left = self->_draggingInsets.left;
  bottom = self->_draggingInsets.bottom;
  right = self->_draggingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDraggingInsets:(UIEdgeInsets)a3
{
  self->_draggingInsets = a3;
}

- (UIScrollView)targetScrollView
{
  return self->_targetScrollView;
}

- (void)setTargetScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_targetScrollView, a3);
}

- (UIAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_storeStrong((id *)&self->_autoscroll, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_targetScrollView, 0);
}

@end
