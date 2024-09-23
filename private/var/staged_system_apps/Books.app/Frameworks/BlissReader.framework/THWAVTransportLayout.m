@implementation THWAVTransportLayout

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THWAVTransportLayout;
  -[THWAVTransportLayout dealloc](&v2, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWAVTransportRep, a2);
}

- (id)computeLayoutGeometry
{
  id v3;
  double v4;
  double v5;
  __int128 v6;
  double v7;
  _OWORD v9[3];

  v3 = objc_alloc((Class)TSDLayoutGeometry);
  objc_msgSend(-[THWAVTransportLayout parent](self, "parent"), "frame");
  v5 = v4;
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return objc_msgSend(v3, "initWithSize:transform:", v9, v7, v5);
}

- (void)parentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportLayout;
  -[THWAVTransportLayout parentDidChange](&v3, "parentDidChange");
  if (-[THWAVTransportLayout parent](self, "parent"))
    -[THWAVTransportController wasAddedToCanvas](-[THWAVTransportLayout transportController](self, "transportController"), "wasAddedToCanvas");
}

- (void)validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportLayout;
  -[THWAVTransportLayout validate](&v3, "validate");
  -[THWAVTransportLayout layoutTransportUI](self, "layoutTransportUI");
}

- (void)layoutTransportUI
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;

  if (-[THWAVTransportController transportUI](-[THWAVTransportLayout transportController](self, "transportController"), "transportUI"))
  {
    v3 = objc_msgSend(-[THWAVTransportLayout layoutController](self, "layoutController"), "canvas");
    -[THWAVTransportLayout frameInRoot](self, "frameInRoot");
    objc_msgSend(v3, "convertUnscaledToBoundsRect:");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[THWAVTransportUI layoutRect](-[THWAVTransportController transportUI](-[THWAVTransportLayout transportController](self, "transportController"), "transportUI"), "layoutRect");
    v17.origin.x = v12;
    v17.origin.y = v13;
    v17.size.width = v14;
    v17.size.height = v15;
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    if (!CGRectEqualToRect(v16, v17))
    {
      -[THWAVTransportUI setLayoutRect:](-[THWAVTransportController transportUI](-[THWAVTransportLayout transportController](self, "transportController"), "transportUI"), "setLayoutRect:", v5, v7, v9, v11);
      -[THWAVTransportUI willLayout](-[THWAVTransportController transportUI](-[THWAVTransportLayout transportController](self, "transportController"), "transportUI"), "willLayout");
      -[THWAVTransportUI layout](-[THWAVTransportController transportUI](-[THWAVTransportLayout transportController](self, "transportController"), "transportUI"), "layout");
      -[THWAVTransportUI didLayout](-[THWAVTransportController transportUI](-[THWAVTransportLayout transportController](self, "transportController"), "transportUI"), "didLayout");
    }
  }
}

- (THWAVTransportController)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
  self->_transportController = (THWAVTransportController *)a3;
}

@end
