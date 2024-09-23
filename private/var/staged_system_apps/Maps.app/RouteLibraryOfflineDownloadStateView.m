@implementation RouteLibraryOfflineDownloadStateView

- (RouteLibraryOfflineDownloadStateView)initWithFrame:(CGRect)a3
{
  RouteLibraryOfflineDownloadStateView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;
  MUCircleProgressObservingView *v9;
  MUCircleProgressObservingView *progressView;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  RouteLibraryOfflineDownloadStateView *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RouteLibraryOfflineDownloadStateView;
  v3 = -[RouteLibraryOfflineDownloadStateView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.down.circle.fill")));
    -[UIImageView setImage:](v3->_imageView, "setImage:", v6);

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 7, 13.0));
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v8);

    -[UIImageView setHidden:](v3->_imageView, "setHidden:", 1);
    -[RouteLibraryOfflineDownloadStateView addSubview:](v3, "addSubview:", v3->_imageView);
    v9 = (MUCircleProgressObservingView *)objc_alloc_init((Class)MUCircleProgressObservingView);
    progressView = v3->_progressView;
    v3->_progressView = v9;

    -[MUCircleProgressObservingView setTranslatesAutoresizingMaskIntoConstraints:](v3->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUCircleProgressObservingView setHidden:](v3->_progressView, "setHidden:", 1);
    LODWORD(v11) = 1132068864;
    -[MUCircleProgressObservingView setContentCompressionResistancePriority:forAxis:](v3->_progressView, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1132068864;
    -[MUCircleProgressObservingView setContentCompressionResistancePriority:forAxis:](v3->_progressView, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    -[RouteLibraryOfflineDownloadStateView addSubview:](v3, "addSubview:", v3->_progressView);
    LODWORD(v13) = 1148846080;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _maps_constraintsEqualToEdgesOfView:priority:](v3->_imageView, "_maps_constraintsEqualToEdgesOfView:priority:", v3, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MUCircleProgressObservingView _maps_constraintsForCenteringInView:edgeInsets:](v3->_progressView, "_maps_constraintsForCenteringInView:edgeInsets:", v3, 1.0, 1.0, 1.0, 1.0));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    v17 = v3;
  }

  return v3;
}

- (void)dealloc
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (self->_subscriptionInfo)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = objc_msgSend(&off_101273818, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(&off_101273818);
          -[MapDataSubscriptionInfo removeObserver:forKeyPath:context:](self->_subscriptionInfo, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), off_1014AD2C8);
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(&off_101273818, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)RouteLibraryOfflineDownloadStateView;
  -[RouteLibraryOfflineDownloadStateView dealloc](&v7, "dealloc");
}

- (void)setSubscriptionInfo:(id)a3
{
  MapDataSubscriptionInfo *v5;
  MapDataSubscriptionInfo **p_subscriptionInfo;
  MapDataSubscriptionInfo *subscriptionInfo;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v5 = (MapDataSubscriptionInfo *)a3;
  p_subscriptionInfo = &self->_subscriptionInfo;
  subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo != v5)
  {
    if (subscriptionInfo)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = objc_msgSend(&off_101273818, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(&off_101273818);
            -[MapDataSubscriptionInfo removeObserver:forKeyPath:context:](*p_subscriptionInfo, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), off_1014AD2C8);
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v9 = objc_msgSend(&off_101273818, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v9);
      }
    }
    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    if (*p_subscriptionInfo)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v12 = objc_msgSend(&off_101273818, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(&off_101273818);
            -[MapDataSubscriptionInfo addObserver:forKeyPath:options:context:](*p_subscriptionInfo, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), 0, off_1014AD2C8);
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(&off_101273818, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        }
        while (v13);
      }
    }
    -[RouteLibraryOfflineDownloadStateView _updateIfNeeded](self, "_updateIfNeeded");
  }

}

- (void)_updateIfNeeded
{
  MapDataSubscriptionInfo *subscriptionInfo;
  void *v4;
  char *v5;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  subscriptionInfo = self->_subscriptionInfo;
  if (!subscriptionInfo)
  {
    -[UIImageView setHidden:](self->_imageView, "setHidden:", 1);
    -[MUCircleProgressObservingView setHidden:](self->_progressView, "setHidden:", 1);
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](subscriptionInfo, "state"));
  v5 = (char *)objc_msgSend(v4, "loadState");

  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (v5 == (char *)3 || v5 == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_subscriptionInfo, "state"));
      v8 = (unint64_t)objc_msgSend(v7, "downloadState");

      v9 = 1;
      if (v8 > 5)
      {
        v10 = 0;
        v14 = 0;
        goto LABEL_15;
      }
      if (((1 << v8) & 0x33) != 0)
      {
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", -1));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemFillColor](UIColor, "systemFillColor"));
LABEL_14:
        v9 = 1;
        goto LABEL_15;
      }
      v10 = 0;
      v14 = 0;
      if (v8 != 2)
        goto LABEL_15;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_subscriptionInfo, "state", 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadProgress"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_subscriptionInfo, "state"));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "downloadProgress"));

      }
      else
      {
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", -1));
      }
    }
    else
    {
      v14 = 0;
    }
    v10 = 0;
    goto LABEL_14;
  }
  v9 = 0;
  v14 = 0;
  v10 = 0;
LABEL_15:
  -[UIImageView setHidden:](self->_imageView, "setHidden:", v9);
  -[MUCircleProgressObservingView setProgress:](self->_progressView, "setProgress:", v14);
  -[MUCircleProgressObservingView setTintColor:](self->_progressView, "setTintColor:", v10);
  -[MUCircleProgressObservingView setHidden:](self->_progressView, "setHidden:", v14 == 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[4];
  id v8;
  id location;

  if (off_1014AD2C8 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005830EC;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RouteLibraryOfflineDownloadStateView;
    -[RouteLibraryOfflineDownloadStateView observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
