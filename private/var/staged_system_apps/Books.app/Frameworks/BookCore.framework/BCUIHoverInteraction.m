@implementation BCUIHoverInteraction

- (BCUIHoverInteraction)initWithDelegate:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  BCUIHoverInteraction *v8;
  BCUIHoverInteraction *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *regionBounds;
  NSSet *v12;
  NSSet *regionState;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCUIHoverInteraction;
  v8 = -[BCUIHoverInteraction init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_opt_new(NSMutableDictionary);
    regionBounds = v9->_regionBounds;
    v9->_regionBounds = v10;

    v12 = objc_opt_new(NSSet);
    regionState = v9->_regionState;
    v9->_regionState = v12;

    objc_storeWeak((id *)&v9->_targetView, v7);
    v9->_settleDuration = 0.25;
    v9->_lastUpdatedTime = 0;
    v9->_checkSettled = objc_opt_respondsToSelector(v6, "hoverInteractionDidSettle:") & 1;
  }

  return v9;
}

- (void)willMoveToView:(id)a3
{
  id WeakRetained;
  UIHoverGestureRecognizer *gestureRecognizer;

  if (self->_gestureRecognizer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_gestureRecognizer);

    gestureRecognizer = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;

  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  UIHoverGestureRecognizer *v5;
  UIHoverGestureRecognizer *gestureRecognizer;
  id WeakRetained;

  p_view = &self->_view;
  objc_storeWeak((id *)&self->_view, a3);
  v5 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", self, "_hoverGesture:");
  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = v5;

  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "addGestureRecognizer:", self->_gestureRecognizer);

}

- (void)_hoverGesture:(id)a3
{
  if (self->_gestureRecognizer == a3)
    -[BCUIHoverInteraction _updateState](self, "_updateState");
}

- (BOOL)stateForRegionWithKey:(id)a3
{
  return -[NSSet containsObject:](self->_regionState, "containsObject:", a3);
}

- (void)rebuildAllRegionsWithBlock:(id)a3
{
  void (**v4)(id, BCUIHoverInteraction *);

  v4 = (void (**)(id, BCUIHoverInteraction *))a3;
  -[NSMutableDictionary removeAllObjects](self->_regionBounds, "removeAllObjects");
  if (v4)
    v4[2](v4, self);
  -[BCUIHoverInteraction _updateState](self, "_updateState");

}

- (void)rebuildRegionWithKey:(id)a3 block:(id)a4
{
  void (**v6)(id, _BCUIHoverRegionBuilder *);
  _BCUIHoverRegionBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _BCUIHoverRegionBuilder *))a4;
  v7 = objc_alloc_init(_BCUIHoverRegionBuilder);
  if (v6)
    v6[2](v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_BCUIHoverRegionBuilder bounds](v7, "bounds"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BCUIHoverRegionBuilder bounds](v7, "bounds"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regionBounds, "setObject:forKeyedSubscript:", v10, v11);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regionBounds, "setObject:forKeyedSubscript:", 0, v11);
  }
  -[BCUIHoverInteraction _updateState](self, "_updateState");

}

- (void)addRegionWithKey:(id)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  NSMutableArray *v9;
  void *v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_regionBounds, "objectForKeyedSubscript:"));
  if (!v9)
  {
    v9 = objc_opt_new(NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regionBounds, "setObject:forKeyedSubscript:", v9, v11);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
  -[NSMutableArray addObject:](v9, "addObject:", v10);

}

- (BOOL)isHovering
{
  return (char *)-[UIHoverGestureRecognizer state](self->_gestureRecognizer, "state") - 1 < (_BYTE *)&dword_0 + 2;
}

- (void)_updateSettled
{
  dispatch_time_t v3;

  if (self->_checkSettled)
  {
    v3 = dispatch_time(0, 0);
    self->_lastUpdatedTime = v3;
    -[BCUIHoverInteraction _checkIfSettledWithTime:](self, "_checkIfSettledWithTime:", v3);
  }
}

- (void)_checkIfSettledWithTime:(unint64_t)a3
{
  dispatch_time_t v5;
  _QWORD v6[6];

  if (!self->_settleCheckScheduled)
  {
    self->_settleCheckScheduled = 1;
    v5 = dispatch_time(a3, (uint64_t)(self->_settleDuration * 1000000000.0));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_14967C;
    v6[3] = &unk_28B938;
    v6[4] = self;
    v6[5] = a3;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_updateState
{
  unsigned int v3;
  NSMutableSet *v4;
  UIHoverGestureRecognizer *gestureRecognizer;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *regionBounds;
  id v12;
  NSSet *regionState;
  id v14;
  id v15;
  _QWORD v16[4];
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = -[BCUIHoverInteraction isHovering](self, "isHovering");
  if ((char *)-[UIHoverGestureRecognizer state](self->_gestureRecognizer, "state") - 1 <= (_BYTE *)&dword_0 + 1)
    -[BCUIHoverInteraction _updateSettled](self, "_updateSettled");
  v4 = objc_opt_new(NSMutableSet);
  if (v3)
  {
    gestureRecognizer = self->_gestureRecognizer;
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    -[UIHoverGestureRecognizer locationInView:](gestureRecognizer, "locationInView:", WeakRetained);
    v8 = v7;
    v10 = v9;

    regionBounds = self->_regionBounds;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_149850;
    v16[3] = &unk_292668;
    v18 = v8;
    v19 = v10;
    v17 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](regionBounds, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
  v15 = -[NSSet mutableCopy](self->_regionState, "mutableCopy");
  objc_msgSend(v15, "intersectSet:", v4);
  v12 = -[NSSet mutableCopy](self->_regionState, "mutableCopy");
  objc_msgSend(v12, "unionSet:", v4);
  objc_msgSend(v12, "minusSet:", v15);
  regionState = self->_regionState;
  self->_regionState = &v4->super;

  if (objc_msgSend(v12, "count"))
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "hoverInteraction:didChangeStateForRegionWithKeys:", self, v12);

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (BCUIHoverInteractionDelegate)delegate
{
  return (BCUIHoverInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)settleDuration
{
  return self->_settleDuration;
}

- (void)setSettleDuration:(double)a3
{
  self->_settleDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_regionState, 0);
  objc_storeStrong((id *)&self->_regionBounds, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end
