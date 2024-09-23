@implementation MapsDebugActionTableRow

- (void)dealloc
{
  objc_super v3;

  -[MapsDebugActionTableRow setObservingProgress:](self, "setObservingProgress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugActionTableRow;
  -[MapsDebugTableRow dealloc](&v3, "dealloc");
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsDebugActionTableRow;
  -[MapsDebugTableRow configureCell:](&v11, "configureCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentConfiguration"));
  v6 = -[MapsDebugActionTableRow isDestructive](self, "isDestructive");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow selectionAction](self, "selectionAction"));
  if (v6)
  {
    if (v7)
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemDarkRedColor](UIColor, "systemDarkRedColor"));
  }
  else if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textProperties"));
  objc_msgSend(v10, "setColor:", v9);

  objc_msgSend(v4, "setContentConfiguration:", v5);
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsDebugActionTableRow;
  -[MapsDebugTableRow configureCollectionViewCell:](&v11, "configureCollectionViewCell:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow selectionAction](self, "selectionAction"));
  if (v7)
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v9 = (void *)v8;

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
    objc_msgSend(v10, "setColor:", v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
    objc_msgSend(v10, "setTextColor:", v9);
  }

  objc_msgSend(v5, "setContentConfiguration:", v6);
}

- (void)setObservingProgress:(id)a3
{
  NSProgress **p_observingProgress;
  NSProgress *observingProgress;
  _BOOL8 v7;
  id v8;

  v8 = a3;
  p_observingProgress = &self->_observingProgress;
  observingProgress = self->_observingProgress;
  if (observingProgress)
  {
    -[NSProgress removeObserver:forKeyPath:](observingProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
    -[NSProgress removeObserver:forKeyPath:](*p_observingProgress, "removeObserver:forKeyPath:", self, CFSTR("isFinished"));
    -[NSProgress removeObserver:forKeyPath:](*p_observingProgress, "removeObserver:forKeyPath:", self, CFSTR("isCancelled"));
  }
  objc_storeStrong((id *)&self->_observingProgress, a3);
  if (*p_observingProgress)
  {
    -[NSProgress addObserver:forKeyPath:options:context:](*p_observingProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, 0);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_observingProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 1, 0);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_observingProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("isCancelled"), 1, 0);
    v7 = *p_observingProgress == 0;
  }
  else
  {
    v7 = 1;
  }
  -[MapsDebugActionTableRow _setProgressViewHidden:](self, "_setProgressViewHidden:", v7);

}

- (id)_findTableView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
  if (v2)
  {
    do
    {
      v3 = objc_opt_class(UITableView);
      if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
        break;
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));

      v2 = (void *)v4;
    }
    while (v4);
  }
  return v2;
}

- (void)_setProgressViewHidden:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  void *v6;
  _UICellAccessoryConfigurationCustomView *progressViewAccessory;
  void *v8;
  MapsPieProgressView *progressView;
  void *v10;
  id v11;
  _UICellAccessoryConfigurationCustomView *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  v5 = -[MapsDebugActionTableRow _showingProgressView](self, "_showingProgressView");
  if (v3 && v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    objc_msgSend(v6, "setAccessoryView:", 0);

    v16 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));
    objc_msgSend(v16, "setTrailingAccessoryConfigurations:", &__NSArray0__struct);
    progressViewAccessory = self->_progressViewAccessory;
    self->_progressViewAccessory = 0;

LABEL_8:
    return;
  }
  if (((v5 | v3) & 1) == 0)
  {
    -[MapsDebugActionTableRow _createProgressViewIfNeeded](self, "_createProgressViewIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));

    if (v8)
    {
      progressView = self->_progressView;
      v16 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
      objc_msgSend(v16, "setAccessoryView:", progressView);
      goto LABEL_8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));

    if (v10)
    {
      v11 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationCustomView), "initWithCustomView:", self->_progressView);
      objc_msgSend(v11, "setMaintainsFixedSize:", 1);
      v12 = self->_progressViewAccessory;
      self->_progressViewAccessory = (_UICellAccessoryConfigurationCustomView *)v11;
      v13 = v11;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));
      v17 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

      objc_msgSend(v14, "setTrailingAccessoryConfigurations:", v15);
    }
  }
}

- (void)_createProgressViewIfNeeded
{
  MapsPieProgressView *v3;
  MapsPieProgressView *progressView;

  if (!self->_progressView)
  {
    v3 = -[MapsPieProgressView initWithFrame:]([MapsPieProgressView alloc], "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    progressView = self->_progressView;
    self->_progressView = v3;

  }
}

- (BOOL)_showingProgressView
{
  uint64_t v3;
  void *v4;
  void *v5;
  MapsPieProgressView *v6;
  MapsPieProgressView *progressView;
  void *v8;
  _UICellAccessoryConfigurationCustomView *progressViewAccessory;

  if (!self->_progressView)
    return 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    v6 = (MapsPieProgressView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryView"));
    progressView = self->_progressView;

    if (v6 == progressView)
      return 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));
  if (v8 && (progressViewAccessory = self->_progressViewAccessory, v8, progressViewAccessory))
    return 1;
  else
    return 0;
}

- (id)_progressView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryView"));
LABEL_5:

    return v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAccessoryConfigurations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "customView"));
    goto LABEL_5;
  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (self->_observingProgress == a4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007132B8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MapsDebugActionTableRow;
    -[MapsDebugActionTableRow observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3);
  }
}

- (void)setSelectionAction:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100713470;
    v6[3] = &unk_1011B0520;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)MapsDebugActionTableRow;
    -[MapsDebugTableRow setSelectionAction:](&v5, "setSelectionAction:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MapsDebugActionTableRow;
    -[MapsDebugTableRow setSelectionAction:](&v10, "setSelectionAction:", 0);
  }

}

- (NSProgress)observingProgress
{
  return self->_observingProgress;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingProgress, 0);
  objc_storeStrong((id *)&self->_progressViewAccessory, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_destroyWeak((id *)&self->_internalProgress);
}

@end
