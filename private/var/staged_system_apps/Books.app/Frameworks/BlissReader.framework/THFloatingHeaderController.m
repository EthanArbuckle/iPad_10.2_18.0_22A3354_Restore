@implementation THFloatingHeaderController

- (void)dealloc
{
  objc_super v3;

  self->_headersData = 0;
  self->_headersView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFloatingHeaderController;
  -[THFloatingHeaderController dealloc](&v3, "dealloc");
}

- (void)reloadData
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CALayer *v15;
  char *v16;
  char *v17;
  char *i;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  _BYTE v34[128];
  _QWORD v35[4];

  if (-[THFloatingHeaderController headersData](self, "headersData"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = -[THFloatingHeaderController headersData](self, "headersData", 0);
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v28;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v7), "valueForKey:", CFSTR("layer")), "removeFromSuperlayer");
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v5);
    }
    -[NSMutableArray removeAllObjects](-[THFloatingHeaderController headersData](self, "headersData"), "removeAllObjects");
  }
  else
  {
    -[THFloatingHeaderController setHeadersData:](self, "setHeadersData:", +[NSMutableArray array](NSMutableArray, "array"));
    v8 = -[UITableView superview](-[THFloatingHeaderController tableView](self, "tableView"), "superview");
    v9 = objc_msgSend(v8, "safeAreaLayoutGuide");
    v10 = objc_alloc((Class)UIView);
    -[UITableView frame](-[THFloatingHeaderController tableView](self, "tableView"), "frame");
    -[THFloatingHeaderController setHeadersView:](self, "setHeadersView:", objc_msgSend(v10, "initWithFrame:"));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](-[THFloatingHeaderController headersView](self, "headersView"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setBackgroundColor:](-[THFloatingHeaderController headersView](self, "headersView"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setClipsToBounds:](-[THFloatingHeaderController headersView](self, "headersView"), "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](-[THFloatingHeaderController headersView](self, "headersView"), "setUserInteractionEnabled:", 0);
    objc_msgSend(v8, "addSubview:", -[THFloatingHeaderController headersView](self, "headersView"));
    v35[0] = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView topAnchor](-[THFloatingHeaderController headersView](self, "headersView"), "topAnchor"), "constraintEqualToAnchor:", -[UITableView topAnchor](-[THFloatingHeaderController tableView](self, "tableView"), "topAnchor"));
    v35[1] = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView bottomAnchor](-[THFloatingHeaderController headersView](self, "headersView"), "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(v8, "bottomAnchor"));
    v35[2] = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView leadingAnchor](-[THFloatingHeaderController headersView](self, "headersView"), "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "leadingAnchor"));
    v35[3] = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView trailingAnchor](-[THFloatingHeaderController headersView](self, "headersView"), "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "trailingAnchor"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
    if (-[UITableView _shouldReverseLayoutDirection](-[THFloatingHeaderController tableView](self, "tableView"), "_shouldReverseLayoutDirection"))
    {
      v11 = *(_OWORD *)&CATransform3DIdentity.m33;
      *(_OWORD *)&v32.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
      *(_OWORD *)&v32.m33 = v11;
      v12 = *(_OWORD *)&CATransform3DIdentity.m43;
      *(_OWORD *)&v32.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
      *(_OWORD *)&v32.m43 = v12;
      v13 = *(_OWORD *)&CATransform3DIdentity.m13;
      *(_OWORD *)&v32.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v32.m13 = v13;
      v14 = *(_OWORD *)&CATransform3DIdentity.m23;
      *(_OWORD *)&v32.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
      *(_OWORD *)&v32.m23 = v14;
      CATransform3DScale(&v33, &v32, -1.0, 1.0, 1.0);
      v15 = -[UIView layer](-[THFloatingHeaderController headersView](self, "headersView"), "layer");
      v31 = v33;
      -[CALayer setSublayerTransform:](v15, "setSublayerTransform:", &v31);
    }
  }
  v16 = (char *)-[THFloatingHeaderControllerProtocol numberOfFloatingHeaders:](-[THFloatingHeaderController delegate](self, "delegate"), "numberOfFloatingHeaders:", self);
  if (v16)
  {
    v17 = v16;
    for (i = 0; i != v17; ++i)
    {
      v19 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      v20 = -[THFloatingHeaderControllerProtocol layerForFloatingHeaderAtIndex:forController:](-[THFloatingHeaderController delegate](self, "delegate"), "layerForFloatingHeaderAtIndex:forController:", i, self);
      v21 = -[THFloatingHeaderControllerProtocol rowNumberForFloatingHeaderAtIndex:forController:](-[THFloatingHeaderController delegate](self, "delegate"), "rowNumberForFloatingHeaderAtIndex:forController:", i, self);
      v22 = -[THFloatingHeaderControllerProtocol numberOfRowsForFloatingHeaderAtIndex:forController:](-[THFloatingHeaderController delegate](self, "delegate"), "numberOfRowsForFloatingHeaderAtIndex:forController:", i, self);
      -[CALayer addSublayer:](-[UIView layer](-[THFloatingHeaderController headersView](self, "headersView"), "layer"), "addSublayer:", v20);
      objc_msgSend(v19, "setValue:forKey:", v20, CFSTR("layer"));
      -[UITableView rowHeight](-[THFloatingHeaderController tableView](self, "tableView"), "rowHeight");
      v24 = v23 * (double)(unint64_t)v21;
      *(float *)&v24 = v24;
      objc_msgSend(v19, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24), CFSTR("miny"));
      -[UITableView rowHeight](-[THFloatingHeaderController tableView](self, "tableView"), "rowHeight");
      v26 = v25 * (double)((unint64_t)v22 + (_QWORD)v21 - 1);
      *(float *)&v26 = v26;
      objc_msgSend(v19, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26), CFSTR("maxy"));
      -[NSMutableArray addObject:](-[THFloatingHeaderController headersData](self, "headersData"), "addObject:", v19);
    }
  }
  -[THFloatingHeaderController layoutHeaders](self, "layoutHeaders");
}

- (void)layoutHeaders
{
  double v3;
  double v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  -[UITableView contentOffset](-[THFloatingHeaderController tableView](self, "tableView"), "contentOffset");
  v4 = v3;
  -[UITableView contentSize](-[THFloatingHeaderController tableView](self, "tableView"), "contentSize");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = -[THFloatingHeaderController headersData](self, "headersData", 0);
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(objc_msgSend(v10, "valueForKey:", CFSTR("miny")), "floatValue");
        v12 = v11;
        objc_msgSend(objc_msgSend(v10, "valueForKey:", CFSTR("maxy")), "floatValue");
        v14 = v12 - v4;
        v15 = v13 - v4;
        if (v12 - v4 > 0.0)
        {
          v16 = 1;
        }
        else
        {
          v14 = v15;
          v16 = v15 <= 0.0;
        }
        if (v16)
          v17 = v14;
        else
          v17 = 0.0;
        v18 = objc_msgSend(v10, "valueForKey:", CFSTR("layer"));
        objc_msgSend(v18, "setPosition:", 0.0, v17);
        objc_msgSend(v18, "removeAllAnimations");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  +[CATransaction commit](CATransaction, "commit");
}

- (void)setHeaderHidden:(BOOL)a3
{
  -[UIView setHidden:](-[THFloatingHeaderController headersView](self, "headersView"), "setHidden:", a3);
}

- (THFloatingHeaderControllerProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THFloatingHeaderControllerProtocol *)a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  self->_tableView = (UITableView *)a3;
}

- (NSMutableArray)headersData
{
  return self->_headersData;
}

- (void)setHeadersData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIView)headersView
{
  return self->_headersView;
}

- (void)setHeadersView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
