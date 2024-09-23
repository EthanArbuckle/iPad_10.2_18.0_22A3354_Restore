@implementation PBStackContainerView

- (PBStackContainerView)initWithFrame:(CGRect)a3
{
  PBStackContainerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBStackContainerView;
  v3 = -[PBStackContainerView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(-[PBStackContainerView layer](v3, "layer"), "setNeedsLayoutOnGeometryChange:", 0);
  -[PBStackContainerView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[PBStackContainerView updateStackBounds](v3, "updateStackBounds");
  v3->_stackedViews = objc_opt_new(NSMutableArray);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBStackContainerView;
  -[PBStackContainerView dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  double Center;
  double v4;
  double v5;
  NSMutableArray *stackedViews;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[PBStackContainerView updateStackBounds](self, "updateStackBounds");
  Center = UIRectGetCenter(self->_stackBounds.origin.x, self->_stackBounds.origin.y, self->_stackBounds.size.width, self->_stackBounds.size.height);
  v5 = v4;
  self->_stackBounds.origin = CGPointZero;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  stackedViews = self->_stackedViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedViews, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(stackedViews);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "superview") == self)
        {
          objc_msgSend(v11, "setBounds:", self->_stackBounds.origin.x, self->_stackBounds.origin.y, self->_stackBounds.size.width, self->_stackBounds.size.height);
          objc_msgSend(v11, "setCenter:", Center, v5);
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedViews, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[PBStackContainerView sizeToFit:](self, "sizeToFit:", self->_defaultView);
}

- (void)updateStackBounds
{
  CGRect *p_stackBounds;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  CGRect v17;

  p_stackBounds = &self->_stackBounds;
  -[PBStackContainerView bounds](self, "bounds");
  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  v7 = v6 + left;
  v9 = v8 + top;
  v11 = v10 - (left + self->_edgeInsets.right);
  v13 = v12 - (top + self->_edgeInsets.bottom);
  p_stackBounds->origin.x = v7;
  p_stackBounds->origin.y = v9;
  p_stackBounds->size.width = v11;
  p_stackBounds->size.height = v13;
  if (v11 >= v13)
  {
    v15 = (v11 - v13) * 0.5;
    v7 = v7 + rintf(v15);
    p_stackBounds->origin.x = v7;
    p_stackBounds->size.width = v13;
    v11 = v13;
  }
  else
  {
    v14 = (v13 - v11) * 0.5;
    v9 = v9 + rintf(v14);
    p_stackBounds->origin.y = v9;
    p_stackBounds->size.height = v11;
  }
  v16 = v11;
  v17 = CGRectInset(*(CGRect *)&v7, 50.0, 50.0);
  *p_stackBounds = v17;
  *p_stackBounds = CGRectOffset(v17, 0.0, -8.0);
}

- (void)sizeToFit:(id)a3
{
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;

  -[PBStackContainerView bounds](self, "bounds");
  -[PBStackContainerView convertRect:toView:](self, "convertRect:toView:", objc_msgSend(a3, "superview"), v5, v6, v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(a3, "sizeThatFits:", v13, v15);
  v18 = v17;
  v20 = v19;
  objc_msgSend(a3, "setCenter:", UIRectGetCenter(v10, v12, v14, v16));
  if (v18 != 0.0 && v20 != 0.0)
  {
    if (v18 > v20)
      v21 = v14 / v18;
    else
      v21 = v16 / v20;
    v22 = v18 * v21;
    v23 = v20 * v21;
    objc_msgSend(a3, "setBounds:", CGPointZero.x, CGPointZero.y, rintf(v22), rintf(v23));
  }
}

- (void)addStackedView:(id)a3
{
  -[NSMutableArray addObject:](self->_stackedViews, "addObject:");
  if (self->_defaultView == a3)
    self->_defaultView = 0;
}

- (void)removeStackedView:(id)a3
{
  -[NSMutableArray removeObject:](self->_stackedViews, "removeObject:", a3);
}

- (void)setDefaultView:(id)a3
{
  self->_defaultView = (UIView *)a3;
  if (a3)
    -[NSMutableArray removeObject:](self->_stackedViews, "removeObject:");
}

- (UIView)defaultView
{
  return self->_defaultView;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    -[PBStackContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)stackBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[PBStackContainerView updateStackBounds](self, "updateStackBounds");
  x = self->_stackBounds.origin.x;
  y = self->_stackBounds.origin.y;
  width = self->_stackBounds.size.width;
  height = self->_stackBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
