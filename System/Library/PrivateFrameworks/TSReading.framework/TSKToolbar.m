@implementation TSKToolbar

- (TSKToolbar)initWithFrame:(CGRect)a3
{
  TSKToolbar *v3;
  UINavigationItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKToolbar;
  v3 = -[TSKToolbar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UINavigationItem *)objc_alloc_init(MEMORY[0x24BDF6C00]);
    v3->_navigationItem = v4;
    -[TSKToolbar pushNavigationItem:animated:](v3, "pushNavigationItem:animated:", v4, 0);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKToolbar;
  -[TSKToolbar dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)TSKToolbar;
  -[TSKToolbar layoutSubviews](&v8, sel_layoutSubviews);
  if (self->_shadowLayer)
  {
    -[TSKToolbar bounds](self, "bounds");
    x = v9.origin.x;
    y = v9.origin.y;
    width = v9.size.width;
    height = v9.size.height;
    v7 = CGRectGetHeight(v9);
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    -[CALayer setFrame:](self->_shadowLayer, "setFrame:", 0.0, v7, CGRectGetWidth(v10), 2.0);
  }
}

- (id)itemWithTag:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = (void *)-[TSKToolbar subviews](self, "subviews");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          v10 = (void *)objc_msgSend(v9, "subviews", 0);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
LABEL_9:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
              if (objc_msgSend(v15, "tag") == a3)
                break;
              if (v12 == ++v14)
              {
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
                if (v12)
                  goto LABEL_9;
                goto LABEL_17;
              }
            }
            if (v15)
              return v15;
          }
        }
LABEL_17:
        ;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
  return 0;
}

- (void)setLeftItems:(id)a3 title:(id)a4 rightItems:(id)a5 duration:(double)a6
{
  _BOOL8 v10;
  double v11;
  double v12;

  -[TSKToolbar setTitle:](self, "setTitle:", a4);
  v10 = a6 > 0.0;
  -[TSKToolbar bounds](self, "bounds");
  v12 = v11;
  -[TSKToolbar setItems:animated:height:isLeft:](self, "setItems:animated:height:isLeft:", a3, v10, 1, v11);
  -[TSKToolbar setItems:animated:height:isLeft:](self, "setItems:animated:height:isLeft:", a5, v10, 0, v12);
}

- (void)setItems:(id)a3 animated:(BOOL)a4 height:(double)a5 isLeft:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  id v9;
  double v11;
  TSKToolbarButtonCollectionView *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v18[2] = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "count"))
  {
    v9 = 0;
    if (!v6)
      goto LABEL_17;
LABEL_6:
    -[UINavigationItem setLeftBarButtonItems:animated:](self->_navigationItem, "setLeftBarButtonItems:animated:", v9, v8);
    return;
  }
  objc_msgSend(v9, "firstObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v6)
      -[TSKToolbar leftToolbarItemsMaximumWidth](self, "leftToolbarItemsMaximumWidth");
    else
      -[TSKToolbar rightToolbarItemsMaximumWidth](self, "rightToolbarItemsMaximumWidth");
    v12 = -[TSKToolbarButtonCollectionView initWithHeight:items:maximumWidth:]([TSKToolbarButtonCollectionView alloc], "initWithHeight:items:maximumWidth:", v9, a5, v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v12);
    if (v6)
      -[TSKToolbar leftToolbarItemsInset](self, "leftToolbarItemsInset");
    else
      -[TSKToolbar rightToolbarItemsInset](self, "rightToolbarItemsInset");
    v15 = v14;
    if (v14 == 0.0)
    {
      v17 = v13;
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      objc_msgSend(v16, "setWidth:", v15);
      v18[0] = v16;
      v18[1] = v13;
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);

    }
    if (!v6)
      goto LABEL_17;
    goto LABEL_6;
  }
  if (v6)
    goto LABEL_6;
  v9 = (id)objc_msgSend(v9, "tsu_arrayByReversingOrder");
LABEL_17:
  -[UINavigationItem setRightBarButtonItems:animated:](self->_navigationItem, "setRightBarButtonItems:animated:", v9, v8);
}

- (NSString)title
{
  void *navigationTitleView;

  if (self->_navigationTitleView)
    navigationTitleView = self->_navigationTitleView;
  else
    navigationTitleView = self->_navigationItem;
  return (NSString *)objc_msgSend(navigationTitleView, "title");
}

- (void)setTitle:(id)a3
{
  TSKToolbarTitleView *navigationTitleView;

  navigationTitleView = self->_navigationTitleView;
  if (navigationTitleView)
    -[TSKToolbarTitleView setTitle:](navigationTitleView, "setTitle:", a3);
  else
    -[UINavigationItem setTitle:](self->_navigationItem, "setTitle:", a3);
  -[UINavigationItem setTitleView:](self->_navigationItem, "setTitleView:", self->_navigationTitleView);
}

- (UIColor)titleColor
{
  void *v2;

  v2 = (void *)-[TSKToolbar titleTextAttributes](self, "titleTextAttributes");
  return (UIColor *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDF6600]);
}

- (void)setTitleColor:(id)a3
{
  id v3;
  uint64_t v5;
  _QWORD v6[2];

  v3 = a3;
  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *MEMORY[0x24BDF6600];
    v6[0] = a3;
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  }
  -[TSKToolbar setTitleTextAttributes:](self, "setTitleTextAttributes:", a3);
  -[TSKToolbarTitleView setTitleColor:](self->_navigationTitleView, "setTitleColor:", v3);
}

- (void)setNavigationTitleView:(id)a3
{
  TSKToolbarTitleView *v5;
  id v6;

  if (self->_navigationTitleView != a3)
  {
    v6 = (id)-[NSString copy](-[TSKToolbar title](self, "title"), "copy");

    v5 = (TSKToolbarTitleView *)a3;
    self->_navigationTitleView = v5;
    -[TSKToolbarTitleView setTitle:](v5, "setTitle:", v6);
    -[TSKToolbarTitleView setTitleColor:](self->_navigationTitleView, "setTitleColor:", -[TSKToolbar titleColor](self, "titleColor"));

  }
}

- (void)setShadowEnabled:(BOOL)a3
{
  CALayer *shadowLayer;

  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    shadowLayer = self->_shadowLayer;
    if (a3)
    {
      if (!shadowLayer)
      {
        self->_shadowLayer = (CALayer *)+[TSKToolbarShadowLayer layer](TSKToolbarShadowLayer, "layer");
        objc_msgSend((id)-[TSKToolbar layer](self, "layer"), "addSublayer:", self->_shadowLayer);
        -[CALayer setNeedsDisplay](self->_shadowLayer, "setNeedsDisplay");
      }
    }
    else
    {
      -[CALayer removeFromSuperlayer](shadowLayer, "removeFromSuperlayer");
      self->_shadowLayer = 0;
    }
  }
}

- (TSKToolbarTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (BOOL)shadowEnabled
{
  return self->_shadowEnabled;
}

- (double)leftToolbarItemsInset
{
  return self->_leftToolbarItemsInset;
}

- (void)setLeftToolbarItemsInset:(double)a3
{
  self->_leftToolbarItemsInset = a3;
}

- (double)rightToolbarItemsInset
{
  return self->_rightToolbarItemsInset;
}

- (void)setRightToolbarItemsInset:(double)a3
{
  self->_rightToolbarItemsInset = a3;
}

- (double)leftToolbarItemsMaximumWidth
{
  return self->_leftToolbarItemsMaximumWidth;
}

- (void)setLeftToolbarItemsMaximumWidth:(double)a3
{
  self->_leftToolbarItemsMaximumWidth = a3;
}

- (double)rightToolbarItemsMaximumWidth
{
  return self->_rightToolbarItemsMaximumWidth;
}

- (void)setRightToolbarItemsMaximumWidth:(double)a3
{
  self->_rightToolbarItemsMaximumWidth = a3;
}

@end
