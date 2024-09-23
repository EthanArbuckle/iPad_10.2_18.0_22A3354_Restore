@implementation TUIViewVisibilityController

- (TUIViewVisibilityController)initWithView:(id)a3 scrollView:(id)a4
{
  id v7;
  id v8;
  TUIViewVisibilityController *v9;
  TUIViewVisibilityController *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  NSHashTable *observers;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIViewVisibilityController;
  v9 = -[TUIViewVisibilityController init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_storeStrong((id *)&v10->_scrollView, a4);
    objc_msgSend(v7, "frame");
    v10->_frame.origin.x = v11;
    v10->_frame.origin.y = v12;
    v10->_frame.size.width = v13;
    v10->_frame.size.height = v14;
    v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v15;

  }
  return v10;
}

- (void)updateView
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  CGRect v10;

  -[UIView frame](self->_view, "frame");
  v10.origin.x = v3;
  v10.origin.y = v4;
  v10.size.width = v5;
  v10.size.height = v6;
  if (!CGRectEqualToRect(self->_frame, v10))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;

    -[TUIViewVisibilityController _updateVisibilityWithTime:](self, "_updateVisibilityWithTime:", v9);
    -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:");
  }
}

- (void)updatePopoverLayout
{
  NSHashTable *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_observers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "updatePopoverLayout", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)observeView:(id)a3 options:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TUIViewVisibilityObserver *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  _TUIViewVisibilityObserver *v17;
  id v18;
  _QWORD v20[4];
  _TUIViewVisibilityObserver *v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_TUIViewVisibilityObserver initWithView:options:kind:block:]([_TUIViewVisibilityObserver alloc], "initWithView:options:kind:block:", v8, v9, 0, v10);
  -[TUIViewVisibilityController _addObserver:](self, "_addObserver:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  -[TUIViewVisibilityController _updateVisibilityForObserver:time:](self, "_updateVisibilityForObserver:time:", v11, v14);
  if (-[_TUIViewVisibilityObserver needsTimer](v11, "needsTimer"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIViewVisibilityObserver options](v11, "options"));
    objc_msgSend(v15, "duration");
    -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:", v14 + v16);

  }
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1986C;
  v20[3] = &unk_23DA20;
  objc_copyWeak(&v22, &location);
  v17 = v11;
  v21 = v17;
  v18 = +[TUICancellable newWithCancelBlock:](TUICancellable, "newWithCancelBlock:", v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

- (id)observeNavigationBarView:(id)a3 options:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TUIViewVisibilityObserver *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  _TUIViewVisibilityObserver *v17;
  id v18;
  _QWORD v20[4];
  _TUIViewVisibilityObserver *v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_TUIViewVisibilityObserver initWithView:options:kind:block:]([_TUIViewVisibilityObserver alloc], "initWithView:options:kind:block:", v8, v9, 1, v10);
  -[TUIViewVisibilityController _addObserver:](self, "_addObserver:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  -[TUIViewVisibilityController _updateVisibilityForObserver:time:](self, "_updateVisibilityForObserver:time:", v11, v14);
  if (-[_TUIViewVisibilityObserver needsTimer](v11, "needsTimer"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIViewVisibilityObserver options](v11, "options"));
    objc_msgSend(v15, "duration");
    -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:", v14 + v16);

  }
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_19A4C;
  v20[3] = &unk_23DA20;
  objc_copyWeak(&v22, &location);
  v17 = v11;
  v21 = v17;
  v18 = +[TUICancellable newWithCancelBlock:](TUICancellable, "newWithCancelBlock:", v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

- (void)_addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)_removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)updatedVisibleBoundsOfScrollView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSHashTable *v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  if (objc_msgSend(v4, "isDescendantOfView:", self->_view))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_observers;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v12 = INFINITY;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "kind", (_QWORD)v20) != (char *)&dword_0 + 1)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
            v16 = objc_msgSend(v15, "isDescendantOfView:", v4);

            if (!v16)
              continue;
          }
          -[TUIViewVisibilityController _updateVisibilityForObserver:time:](self, "_updateVisibilityForObserver:time:", v14, v7);
          if (objc_msgSend(v14, "needsTimer"))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "options"));
            objc_msgSend(v17, "duration");
            v19 = v7 + v18;

            v12 = fmin(v12, v19);
          }
        }
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    else
    {
      v12 = INFINITY;
    }

    -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:", v12);
  }

}

- (double)_updateVisibilityWithTime:(double)a3
{
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = INFINITY;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        -[TUIViewVisibilityController _updateVisibilityForObserver:time:](self, "_updateVisibilityForObserver:time:", v11, a3, (_QWORD)v16);
        if (objc_msgSend(v11, "needsTimer"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "options"));
          objc_msgSend(v12, "duration");
          v14 = v13 + a3;

          v9 = fmin(v9, v14);
        }
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v9 = INFINITY;
  }

  return v9;
}

- (void)_updateVisibilityForObserver:(id)a3 time:(double)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
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
  double v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  void *v33;
  double v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  UIView *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  UIView *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v49 = a3;
  -[TUIViewVisibilityController _computeClippingBoundsForObserver:](self, "_computeClippingBoundsForObserver:", v49);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "options"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "view"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (!self->_visible)
    goto LABEL_4;
  v50.origin.x = v16;
  v50.origin.y = v18;
  v50.size.width = v20;
  v50.size.height = v22;
  v53.origin.x = v6;
  v53.origin.y = v8;
  v53.size.width = v10;
  v53.size.height = v12;
  if (!CGRectIntersectsRect(v50, v53))
    goto LABEL_4;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v45 = v23;
  v47 = v24;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v29 = fmin(v20, v45 - (v25 + v26));
  v44 = fmin(v22, v47 - (v27 + v28));
  v46 = v29;
  v51.origin.x = v16;
  v51.origin.y = v18;
  v51.size.width = v20;
  v51.size.height = v22;
  v54.origin.x = v6;
  v54.origin.y = v8;
  v54.size.width = v10;
  v54.size.height = v12;
  v52 = CGRectIntersection(v51, v54);
  v30 = v52.size.width * v52.size.height / (v46 * v44);
  objc_msgSend(v13, "fraction");
  if (v30 < v31)
  {
LABEL_4:
    v32 = 0;
LABEL_5:
    v33 = v49;
    v34 = a4;
    goto LABEL_6;
  }
  if ((objc_msgSend(v13, "flags") & 1) == 0)
  {
    v32 = 1;
    goto LABEL_5;
  }
  if (objc_msgSend(v49, "kind") == (char *)&dword_0 + 1)
  {
    if (-[UIScrollView isDragging](self->_scrollView, "isDragging"))
      v35 = 1;
    else
      v35 = -[UIScrollView isDecelerating](self->_scrollView, "isDecelerating");
  }
  else
  {
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "view"));
    if (v36)
    {
      v38 = (UIView *)v36;
      while (v38 != self->_view)
      {
        v39 = objc_opt_class(UIScrollView, v37);
        v40 = TUIDynamicCast(v39, v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = v41;
        if (v41)
        {
          if ((objc_msgSend(v41, "isDragging") & 1) != 0)
            v35 = 1;
          else
            v35 = objc_msgSend(v42, "isDecelerating");
        }
        else
        {
          v35 = 0;
        }
        v43 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView superview](v38, "superview", *(_QWORD *)&v44, *(_QWORD *)&v46));

        if ((v35 & 1) == 0)
        {
          v38 = v43;
          if (v43)
            continue;
        }
        goto LABEL_26;
      }
      v35 = 0;
      v43 = v38;
LABEL_26:

    }
    else
    {
      v35 = 0;
    }
  }
  v33 = v49;
  v34 = a4;
  v32 = v35 ^ 1;
LABEL_6:
  objc_msgSend(v33, "updateVisible:time:", v32, v34, *(_QWORD *)&v44, *(_QWORD *)&v46);

}

- (void)_scheduleUpdateAtTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  dispatch_time_t v9;
  _QWORD block[5];

  if (fabs(a3) != INFINITY && (!self->_queuedTimeCheck || self->_earliestTimeCheck > a3))
  {
    self->_queuedTimeCheck = 1;
    self->_earliestTimeCheck = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = a3 - v6;

    v8 = v7 * 1000000000.0;
    if (v7 <= 0.0)
      v8 = 0.0;
    v9 = dispatch_time(0, (uint64_t)v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1A124;
    block[3] = &unk_23D938;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_timeCheck
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  -[TUIViewVisibilityController _updateVisibilityWithTime:](self, "_updateVisibilityWithTime:", v5);
  -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:");
}

- (void)setVisible:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;

  if (self->_visible != a3)
  {
    self->_visible = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v5;

    -[TUIViewVisibilityController _updateVisibilityWithTime:](self, "_updateVisibilityWithTime:", v6);
    -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:");
  }
}

- (CGRect)_computeClippingBoundsForObserver:(id)a3
{
  id v4;
  UIView *v5;
  UIView *v6;
  uint64_t v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v12;
  uint64_t v14;
  UIView *v15;
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
  BOOL IsInfinite;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;
  CGRect v55;

  v4 = a3;
  v5 = self->_view;
  v6 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  if (objc_msgSend(v4, "kind") == (char *)&dword_0 + 1)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[UIView window](self->_view, "window"));

    v5 = (UIView *)v7;
  }
  x = CGRectInfinite.origin.x;
  y = CGRectInfinite.origin.y;
  width = CGRectInfinite.size.width;
  height = CGRectInfinite.size.height;
  if (v5)
    v12 = v6 == 0;
  else
    v12 = 1;
  if (!v12 && v5 != v6)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[UIView superview](v6, "superview"));
    if (v14)
    {
      v15 = (UIView *)v14;
      do
      {
        if (-[UIView clipsToBounds](v15, "clipsToBounds"))
        {
          -[UIView bounds](v15, "bounds");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          if ((objc_opt_respondsToSelector(v15, "adjustedContentInset") & 1) != 0)
          {
            -[UIView adjustedContentInset](v15, "adjustedContentInset");
            v17 = v17 + v24;
            v19 = v19 + v25;
            v21 = v21 - (v24 + v26);
            v23 = v23 - (v25 + v27);
          }
          v47.origin.x = x;
          v47.origin.y = y;
          v47.size.width = width;
          v47.size.height = height;
          IsInfinite = CGRectIsInfinite(v47);
          -[UIView convertRect:toView:](v15, "convertRect:toView:", v6, v17, v19, v21, v23);
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;
          if (!IsInfinite)
          {
            v48.origin.x = x;
            v48.origin.y = y;
            v48.size.width = width;
            v48.size.height = height;
            v49 = CGRectIntersection(v48, *(CGRect *)&v30);
            v30 = v49.origin.x;
            v32 = v49.origin.y;
            v34 = v49.size.width;
            v36 = v49.size.height;
          }
          x = v30;
          y = v32;
          width = v34;
          height = v36;
          v50.origin.x = v30;
          v50.origin.y = v32;
          v50.size.width = v34;
          v50.size.height = v36;
          if (CGRectIsEmpty(v50))
            break;
        }
        if (v15 == v5)
        {
          v15 = v5;
          break;
        }
        v37 = objc_claimAutoreleasedReturnValue(-[UIView superview](v15, "superview"));

        v15 = (UIView *)v37;
      }
      while (v37);

    }
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self->_view, "window"));
  if (v38)
  {
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    if (!CGRectIsEmpty(v51))
    {
      objc_msgSend(v38, "bounds");
      objc_msgSend(v38, "convertRect:toView:", v6);
      v55.origin.x = v39;
      v55.origin.y = v40;
      v55.size.width = v41;
      v55.size.height = v42;
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      v53 = CGRectIntersection(v52, v55);
      x = v53.origin.x;
      y = v53.origin.y;
      width = v53.size.width;
      height = v53.size.height;
    }
  }

  v43 = x;
  v44 = y;
  v45 = width;
  v46 = height;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
