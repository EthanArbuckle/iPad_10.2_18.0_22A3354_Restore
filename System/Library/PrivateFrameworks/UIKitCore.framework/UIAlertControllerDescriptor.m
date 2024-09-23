@implementation UIAlertControllerDescriptor

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int64_t v10;
  int64_t v11;
  int v12;
  BOOL v13;
  double v15;
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
  BOOL v26;
  double v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[UIAlertControllerDescriptor hasHeaderContentViewController](self, "hasHeaderContentViewController");
    if (v6 == objc_msgSend(v5, "hasHeaderContentViewController")
      && (v7 = -[UIAlertControllerDescriptor hasTitle](self, "hasTitle"),
          v7 == objc_msgSend(v5, "hasTitle"))
      && (v8 = -[UIAlertControllerDescriptor hasMessage](self, "hasMessage"),
          v8 == objc_msgSend(v5, "hasMessage"))
      && (v9 = -[UIAlertControllerDescriptor hasContentViewController](self, "hasContentViewController"),
          v9 == objc_msgSend(v5, "hasContentViewController"))
      && (v10 = -[UIAlertControllerDescriptor numberOfActions](self, "numberOfActions"),
          v10 == objc_msgSend(v5, "numberOfActions"))
      && (v11 = -[UIAlertControllerDescriptor numberOfVisibleActions](self, "numberOfVisibleActions"),
          v11 == objc_msgSend(v5, "numberOfVisibleActions"))
      && (v12 = -[UIAlertControllerDescriptor applicationIsFullscreen](self, "applicationIsFullscreen"),
          v12 == objc_msgSend(v5, "applicationIsFullscreen")))
    {
      -[UIAlertControllerDescriptor containerViewSafeAreaInsets](self, "containerViewSafeAreaInsets");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v5, "containerViewSafeAreaInsets");
      v26 = v18 == v25;
      if (v16 != v27)
        v26 = 0;
      if (v22 != v24)
        v26 = 0;
      v13 = v20 == v23 && v26;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)hasHeaderContentViewController
{
  return self->_hasHeaderContentViewController;
}

- (void)setHasHeaderContentViewController:(BOOL)a3
{
  self->_hasHeaderContentViewController = a3;
}

- (BOOL)hasTitle
{
  return self->_hasTitle;
}

- (void)setHasTitle:(BOOL)a3
{
  self->_hasTitle = a3;
}

- (BOOL)hasMessage
{
  return self->_hasMessage;
}

- (void)setHasMessage:(BOOL)a3
{
  self->_hasMessage = a3;
}

- (BOOL)hasContentViewController
{
  return self->_hasContentViewController;
}

- (void)setHasContentViewController:(BOOL)a3
{
  self->_hasContentViewController = a3;
}

- (int64_t)numberOfActions
{
  return self->_numberOfActions;
}

- (void)setNumberOfActions:(int64_t)a3
{
  self->_numberOfActions = a3;
}

- (BOOL)applicationIsFullscreen
{
  return self->_applicationIsFullscreen;
}

- (void)setApplicationIsFullscreen:(BOOL)a3
{
  self->_applicationIsFullscreen = a3;
}

- (UIEdgeInsets)containerViewSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_containerViewSafeAreaInsets, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContainerViewSafeAreaInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3;

  v3 = a3;
  objc_copyStruct(&self->_containerViewSafeAreaInsets, &v3, 32, 1, 0);
}

- (int64_t)numberOfVisibleActions
{
  return self->_numberOfVisibleActions;
}

- (void)setNumberOfVisibleActions:(int64_t)a3
{
  self->_numberOfVisibleActions = a3;
}

@end
