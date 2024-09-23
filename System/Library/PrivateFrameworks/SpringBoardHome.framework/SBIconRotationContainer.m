@implementation SBIconRotationContainer

- (SBIconRotationContainer)initWithFrame:(CGRect)a3 startIcon:(id)a4 endIcon:(id)a5 listView:(id)a6 coordinate:(SBIconCoordinate)a7 location:(id)a8 transitionAnimation:(int64_t)a9 offscreen:(BOOL)a10
{
  int64_t row;
  int64_t column;
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  id v23;
  SBIconRotationContainer *v24;
  SBIconRotationContainer *v25;
  uint64_t v26;
  NSString *location;
  uint64_t v28;
  SBIconView *startView;
  uint64_t v30;
  SBIconView *endView;
  SBIconView *v32;
  objc_super v34;

  row = a7.row;
  column = a7.column;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a8;
  v34.receiver = self;
  v34.super_class = (Class)SBIconRotationContainer;
  v24 = -[SBIconRotationContainer initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  v25 = v24;
  if (v24)
  {
    v24->_coordinate.column = column;
    v24->_coordinate.row = row;
    v26 = objc_msgSend(v23, "copy");
    location = v25->_location;
    v25->_location = (NSString *)v26;

    v25->_transitionAnimation = a9;
    v25->_offscreen = a10;
    objc_storeWeak((id *)&v25->_listView, v22);
    if (v20)
    {
      -[SBIconRotationContainer borrowExistingIconViewForIcon:](v25, "borrowExistingIconViewForIcon:", v20);
      -[SBIconRotationContainer addIconViewForIcon:configurationOptions:](v25, "addIconViewForIcon:configurationOptions:", v20, 4);
      v28 = objc_claimAutoreleasedReturnValue();
      startView = v25->_startView;
      v25->_startView = (SBIconView *)v28;

    }
    if (v20 == v21 && !v25->_transitionAnimation)
    {
      v32 = v25->_startView;
      endView = v25->_endView;
      v25->_endView = v32;
    }
    else
    {
      if (!v21)
      {
LABEL_10:
        -[SBIconRotationContainer layoutIfNeeded](v25, "layoutIfNeeded");
        goto LABEL_11;
      }
      -[SBIconRotationContainer addIconViewForIcon:configurationOptions:](v25, "addIconViewForIcon:configurationOptions:", v21, 4);
      v30 = objc_claimAutoreleasedReturnValue();
      endView = v25->_endView;
      v25->_endView = (SBIconView *)v30;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v25;
}

- (void)borrowExistingIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SBIconRotationContainer listView](self, "listView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconViewForIcon:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setHidden:", 1);
    -[SBIconRotationContainer addSubview:](self, "addSubview:", v5);
    -[SBIconRotationContainer setBorrowedIconView:](self, "setBorrowedIconView:", v5);
    objc_msgSend(v8, "pauseLayoutForIconView:forReason:", v5, CFSTR("rotation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconRotationContainer existingIconPauseLayoutAssertion](self, "existingIconPauseLayoutAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[SBIconRotationContainer setExistingIconPauseLayoutAssertion:](self, "setExistingIconPauseLayoutAssertion:", v6);
  }

}

- (id)addIconViewForIcon:(id)a3 configurationOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[SBIconRotationContainer listView](self, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableIconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setConfigurationOptions:", a4);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "baseIconViewClass")), "initWithConfigurationOptions:", a4);
  }
  objc_msgSend(v7, "configureIconView:forIcon:", v9, v6);

  -[SBIconRotationContainer _configureViewIfNecessary:forShowingSnapshotWhenDeactivated:](self, "_configureViewIfNecessary:forShowingSnapshotWhenDeactivated:", v9, 1);
  objc_msgSend(v9, "layoutIfNeeded");
  -[SBIconRotationContainer addSubview:](self, "addSubview:", v9);

  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconRotationContainer;
  -[SBIconRotationContainer layoutSubviews](&v7, sel_layoutSubviews);
  -[SBIconRotationContainer bounds](self, "bounds");
  UIRectGetCenter();
  v4 = v3;
  v6 = v5;
  -[SBIconView setCenter:](self->_startView, "setCenter:");
  -[SBIconView setCenter:](self->_endView, "setCenter:", v4, v6);
}

- (SBIcon)startIcon
{
  return -[SBIconView icon](self->_startView, "icon");
}

- (SBIcon)endIcon
{
  return -[SBIconView icon](self->_endView, "icon");
}

- (void)prepareToTransition
{
  SBIconView *endView;
  unint64_t v4;
  double v5;

  -[SBIconView setAlpha:](self->_startView, "setAlpha:", 1.0);
  -[SBIconView setIconAccessoryAlpha:](self->_startView, "setIconAccessoryAlpha:", 1.0);
  -[SBIconView setIconLabelAlpha:](self->_startView, "setIconLabelAlpha:", 1.0);
  -[SBIconRotationContainer _configureViewIfNecessary:forShowingSnapshotWhenDeactivated:](self, "_configureViewIfNecessary:forShowingSnapshotWhenDeactivated:", self->_startView, 1);
  endView = self->_endView;
  if (endView != self->_startView)
    -[SBIconRotationContainer _configureViewIfNecessary:forShowingSnapshotWhenDeactivated:](self, "_configureViewIfNecessary:forShowingSnapshotWhenDeactivated:", endView, 1);
  v4 = -[SBIconRotationContainer transitionAnimation](self, "transitionAnimation");
  if (v4 <= 3)
  {
    v5 = dbl_1D0193150[v4];
    -[SBIconView setAlpha:](self->_endView, "setAlpha:", dbl_1D0193130[v4]);
    -[SBIconView setIconAccessoryAlpha:](self->_endView, "setIconAccessoryAlpha:", v5);
    -[SBIconView setIconLabelAlpha:](self->_endView, "setIconLabelAlpha:", v5);
  }
}

- (void)performTransition
{
  int64_t v3;
  SBIconView *startView;
  double v5;

  v3 = -[SBIconRotationContainer transitionAnimation](self, "transitionAnimation");
  if (v3 == 3)
  {
    -[SBIconView setAlpha:](self->_startView, "setAlpha:", 0.0);
    -[SBIconView setAlpha:](self->_endView, "setAlpha:", 1.0);
  }
  else
  {
    if (v3 == 2)
    {
      -[SBIconView setAlpha:](self->_endView, "setAlpha:", 1.0);
      -[SBIconView setIconAccessoryAlpha:](self->_startView, "setIconAccessoryAlpha:", 0.0);
      startView = self->_startView;
      v5 = 0.0;
    }
    else
    {
      if (v3 != 1)
        return;
      -[SBIconView setAlpha:](self->_startView, "setAlpha:", 0.0);
      -[SBIconView setIconAccessoryAlpha:](self->_endView, "setIconAccessoryAlpha:", 1.0);
      startView = self->_endView;
      v5 = 1.0;
    }
    -[SBIconView setIconLabelAlpha:](startView, "setIconLabelAlpha:", v5);
  }
}

- (void)concludeTransition
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBIconRotationContainer startView](self, "startView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconRotationContainer endView](self, "endView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconRotationContainer _configureViewIfNecessary:forShowingSnapshotWhenDeactivated:](self, "_configureViewIfNecessary:forShowingSnapshotWhenDeactivated:", v11, 0);
  if (v3 != v11)
    -[SBIconRotationContainer _configureViewIfNecessary:forShowingSnapshotWhenDeactivated:](self, "_configureViewIfNecessary:forShowingSnapshotWhenDeactivated:", v3, 0);
  -[SBIconRotationContainer listView](self, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconRotationContainer borrowedIconView](self, "borrowedIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedIconViewForIcon:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v6)
    {
      objc_msgSend(v6, "setHidden:", 0);
      objc_msgSend(v4, "addSubview:", v6);
    }
  }
  -[SBIconRotationContainer existingIconPauseLayoutAssertion](self, "existingIconPauseLayoutAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[SBIconRotationContainer setExistingIconPauseLayoutAssertion:](self, "setExistingIconPauseLayoutAssertion:", 0);
  objc_msgSend(v4, "iconViewProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recycleIconView:", v11);
  if (v3 != v11)
    objc_msgSend(v10, "recycleIconView:", v3);
  -[SBIconRotationContainer setListView:](self, "setListView:", 0);

}

- (void)_configureViewIfNecessary:(id)a3 forShowingSnapshotWhenDeactivated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  objc_msgSend(a3, "customIconImageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setShowsSnapshotWhenDeactivated:", v4);

}

- (SBIconCoordinate)coordinate
{
  SBIconCoordinate *p_coordinate;
  int64_t column;
  int64_t row;
  SBIconCoordinate result;

  p_coordinate = &self->_coordinate;
  column = self->_coordinate.column;
  row = p_coordinate->row;
  result.row = row;
  result.column = column;
  return result;
}

- (NSString)location
{
  return self->_location;
}

- (int64_t)transitionAnimation
{
  return self->_transitionAnimation;
}

- (BOOL)isOffscreen
{
  return self->_offscreen;
}

- (SBIconView)startView
{
  return self->_startView;
}

- (SBIconView)endView
{
  return self->_endView;
}

- (SBIconView)borrowedIconView
{
  return self->_borrowedIconView;
}

- (void)setBorrowedIconView:(id)a3
{
  objc_storeStrong((id *)&self->_borrowedIconView, a3);
}

- (SBIconListView)listView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_listView);
}

- (void)setListView:(id)a3
{
  objc_storeWeak((id *)&self->_listView, a3);
}

- (BSInvalidatable)existingIconPauseLayoutAssertion
{
  return self->_existingIconPauseLayoutAssertion;
}

- (void)setExistingIconPauseLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_existingIconPauseLayoutAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingIconPauseLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_listView);
  objc_storeStrong((id *)&self->_borrowedIconView, 0);
  objc_storeStrong((id *)&self->_endView, 0);
  objc_storeStrong((id *)&self->_startView, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
