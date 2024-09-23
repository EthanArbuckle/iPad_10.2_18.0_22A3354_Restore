@implementation PXRelaxedScreenEdgePanGestureRecognizer

- (void)setMinAngleToEdge:(double)a3
{
  self->_minAngleToEdge = a3;
}

- (PXRelaxedScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  PXRelaxedScreenEdgePanGestureRecognizer *v4;
  PXRelaxedScreenEdgePanGestureRecognizer *v5;
  UIEdgeInsets *p_edgeAllowances;
  objc_class *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXRelaxedScreenEdgePanGestureRecognizer;
  v4 = -[PXRelaxedScreenEdgePanGestureRecognizer initWithTarget:action:](&v14, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    p_edgeAllowances = &v4->_edgeAllowances;
    PXEdgeInsetsMake();
    *(_QWORD *)&p_edgeAllowances->top = v7;
    v5->_edgeAllowances.left = v8;
    v5->_edgeAllowances.bottom = v9;
    v5->_edgeAllowances.right = v10;
    v5->_edges = 2;
    v5->_minAngleToEdge = 15.0;
    v13.receiver = v5;
    v13.super_class = (Class)PXRelaxedScreenEdgePanGestureRecognizer;
    -[PXRelaxedScreenEdgePanGestureRecognizer setMaximumNumberOfTouches:](&v13, sel_setMaximumNumberOfTouches_, 1);
    v12.receiver = v5;
    v12.super_class = (Class)PXRelaxedScreenEdgePanGestureRecognizer;
    -[PXRelaxedScreenEdgePanGestureRecognizer setMinimumNumberOfTouches:](&v12, sel_setMinimumNumberOfTouches_, 1);
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGPoint v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXRelaxedScreenEdgePanGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXRelaxedScreenEdgePanGestureRecognizer edgeAllowances](self, "edgeAllowances");
  -[PXRelaxedScreenEdgePanGestureRecognizer edges](self, "edges");
  PXEdgeInsetsForEdges();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    v31 = v7;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
        objc_msgSend(v10, "bounds");
        PXEdgeInsetsInsetRect();
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        -[PXRelaxedScreenEdgePanGestureRecognizer view](self, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "locationInView:", v26);
        v28 = v27;
        v30 = v29;

        v40.origin.x = v19;
        v40.origin.y = v21;
        v40.size.width = v23;
        v40.size.height = v25;
        v39.x = v28;
        v39.y = v30;
        if (CGRectContainsPoint(v40, v39))
          goto LABEL_12;
        v41.origin.x = v19;
        v41.origin.y = v21;
        v41.size.width = v23;
        v41.size.height = v25;
        if (v28 == CGRectGetMaxX(v41)
          || (v42.origin.x = v19,
              v42.origin.y = v21,
              v42.size.width = v23,
              v42.size.height = v25,
              v30 == CGRectGetMaxY(v42)))
        {
LABEL_12:

          -[PXRelaxedScreenEdgePanGestureRecognizer setState:](self, "setState:", 5);
          v7 = v31;
          goto LABEL_13;
        }
        objc_msgSend(v11, "addObject:", v17);
        self->_initialTouchLocation.x = v28;
        self->_initialTouchLocation.y = v30;
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v7 = v31;
      if (v14)
        continue;
      break;
    }
  }

  v32.receiver = self;
  v32.super_class = (Class)PXRelaxedScreenEdgePanGestureRecognizer;
  -[PXRelaxedScreenEdgePanGestureRecognizer touchesBegan:withEvent:](&v32, sel_touchesBegan_withEvent_, v11, v7);
LABEL_13:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  id v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[PXRelaxedScreenEdgePanGestureRecognizer state](self, "state"))
  {
    v23 = v7;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[PXRelaxedScreenEdgePanGestureRecognizer view](self, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "locationInView:", v14);
          v16 = v15;
          v18 = v17;

          v19 = v16 - self->_initialTouchLocation.x;
          v20 = v18 - self->_initialTouchLocation.y;
          if (hypot(v19, v20) > 0.0)
          {
            MEMORY[0x1A85CCC64](v20, v19);
            PXRadiansToDegrees();
            v22 = v21 >= 0.0 ? v21 : -v21;
            if ((-[PXRelaxedScreenEdgePanGestureRecognizer edges](self, "edges") & 2) != 0
              && v22 > 90.0 - self->_minAngleToEdge
              || (-[PXRelaxedScreenEdgePanGestureRecognizer edges](self, "edges") & 8) != 0
              && v22 < self->_minAngleToEdge + 90.0)
            {

              -[PXRelaxedScreenEdgePanGestureRecognizer setState:](self, "setState:", 5);
              v7 = v23;
              goto LABEL_20;
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = v23;
  }
  v24.receiver = self;
  v24.super_class = (Class)PXRelaxedScreenEdgePanGestureRecognizer;
  -[PXRelaxedScreenEdgePanGestureRecognizer touchesMoved:withEvent:](&v24, sel_touchesMoved_withEvent_, v6, v7);
LABEL_20:

}

- (double)translationDistanceInView:(id)a3
{
  long double v3;
  long double v4;

  -[PXRelaxedScreenEdgePanGestureRecognizer translationInView:](self, "translationInView:", a3);
  return hypot(v3, v4);
}

- (unint64_t)edges
{
  return self->_edges;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (UIEdgeInsets)edgeAllowances
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeAllowances.top;
  left = self->_edgeAllowances.left;
  bottom = self->_edgeAllowances.bottom;
  right = self->_edgeAllowances.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeAllowances:(UIEdgeInsets)a3
{
  self->_edgeAllowances = a3;
}

- (double)minAngleToEdge
{
  return self->_minAngleToEdge;
}

- (unint64_t)trackingEdge
{
  return self->_trackingEdge;
}

- (void)setTrackingEdge:(unint64_t)a3
{
  self->_trackingEdge = a3;
}

@end
