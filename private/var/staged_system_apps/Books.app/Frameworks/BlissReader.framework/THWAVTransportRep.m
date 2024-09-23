@implementation THWAVTransportRep

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportRep;
  -[THWAVTransportRep willBeRemoved](&v3, "willBeRemoved");
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
}

- (id)transportLayout
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THWAVTransportLayout);
  TSUDynamicCast(v3, -[THWAVTransportRep layout](self, "layout"));
  return result;
}

- (void)addChildViewsToArray:(id)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = objc_opt_class(THWAVTransportLayout);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THWAVTransportRep layout](self, "layout")).n128_u64[0];
  v8 = v7;
  objc_msgSend(objc_msgSend(v7, "transportController", v6), "createTransportUI");
  objc_msgSend(v8, "layoutTransportUI");
  v9 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "transportController"), "transportUI"), "onCanvasViews");
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v9, "count"))
      objc_msgSend(a3, "addObjectsFromArray:", v10);
  }
}

- (BOOL)containerManagesChildView
{
  return 1;
}

- (void)willAddChildView:(id)a3 toView:(id)a4
{
  objc_msgSend(a4, "addSubview:", a3);
  -[THWAVTransportRep setChildViewSuperview:](self, "setChildViewSuperview:", a4);
}

- (void)willRemoveChildView:(id)a3
{
  uint64_t v5;
  double v6;
  id v7;
  id v8;

  v5 = objc_opt_class(THWAVTransportLayout);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THWAVTransportRep layout](self, "layout")).n128_u64[0];
  if ((objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v7, "transportController", v6), "transportUI"), "onCanvasViews"), "containsObject:", a3) & 1) != 0|| (v8 = -[THWAVTransportRep childViewSuperview](self, "childViewSuperview"), v8 == objc_msgSend(a3, "superview")))
  {
    objc_msgSend(a3, "removeFromSuperview");
  }
}

- (void)viewScaleDidChange
{
  uint64_t v3;
  double v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWAVTransportRep;
  -[THWAVTransportRep viewScaleDidChange](&v6, "viewScaleDidChange");
  v3 = objc_opt_class(THWAVTransportLayout);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWAVTransportRep layout](self, "layout")).n128_u64[0];
  objc_msgSend(objc_msgSend(v5, "transportController", v4), "viewScaleDidChange");
}

- (id)childViewSuperview
{
  return self->_childViewSuperview;
}

- (void)setChildViewSuperview:(id)a3
{
  self->_childViewSuperview = a3;
}

@end
