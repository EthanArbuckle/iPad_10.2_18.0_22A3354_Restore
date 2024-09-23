@implementation CarMapControlsAutohidingContainerView

- (CGSize)intrinsicContentSize
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  CGSize result;

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView subviews](self, "subviews", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "intrinsicContentSize");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView subviews](self, "subviews"));
  v11 = objc_msgSend(v10, "count");

  if ((unint64_t)v11 >= 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView subviews](self, "subviews"));
    v7 = v7 + (double)((unint64_t)objc_msgSend(v13, "count") - 1) * 8.5;

  }
  v14 = UIRoundToViewScale(self, v12, v7);
  v15 = 28.0;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarMapControlsAutohidingContainerView;
  -[CarMapControlsAutohidingContainerView layoutSubviews](&v7, "layoutSubviews");
  -[CarMapControlsAutohidingContainerView frame](self, "frame");
  v4 = ceil(v3);
  -[CarMapControlsAutohidingContainerView intrinsicContentSize](self, "intrinsicContentSize");
  v6 = 0.0;
  if (v4 >= floor(v5))
    v6 = 1.0;
  -[CarMapControlsAutohidingContainerView setAlpha:](self, "setAlpha:", v6);
}

- (void)setAlpha:(double)a3
{
  double v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  objc_super v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  uint64_t v15;

  -[CarMapControlsAutohidingContainerView alpha](self, "alpha");
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)CarMapControlsAutohidingContainerView;
  -[CarMapControlsAutohidingContainerView setAlpha:](&v11, "setAlpha:", a3);
  -[CarMapControlsAutohidingContainerView alpha](self, "alpha");
  if (v6 != v7)
  {
    v8 = sub_100432E6C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[CarMapControlsAutohidingContainerView alpha](self, "alpha");
      *(_DWORD *)buf = 134218240;
      v13 = v6;
      v14 = 2048;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Changing alpha from %f to %f", buf, 0x16u);
    }

    -[CarMapControlsAutohidingContainerView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)addSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarMapControlsAutohidingContainerView;
  -[CarMapControlsAutohidingContainerView addSubview:](&v4, "addSubview:", a3);
  -[CarMapControlsAutohidingContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (NSArray)focusOrderSubItems
{
  double v3;
  CarMapControlsAutohidingContainerView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  -[CarMapControlsAutohidingContainerView alpha](self, "alpha");
  if (v3 == 0.0)
    return (NSArray *)&__NSArray0__struct;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView subviews](v5, "subviews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_1011C0A18));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___CarFocusOrderCollection, (_QWORD)v17))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "focusOrderSubItems"));
          objc_msgSend(v6, "addObjectsFromArray:", v15);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v6, "copy");
  return (NSArray *)v16;
}

- (NSArray)preferredFocusEnvironments
{
  double v3;
  CarMapControlsAutohidingContainerView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];

  -[CarMapControlsAutohidingContainerView alpha](self, "alpha");
  if (v3 == 0.0)
    return (NSArray *)&__NSArray0__struct;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView subviews](v5, "subviews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_1011C0A18));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___CarFocusOrderCollection, (_QWORD)v19))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "focusOrderSubItems"));
          objc_msgSend(v6, "addObjectsFromArray:", v15);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v6, "copy");
  if (objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
    v23 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));

  }
  else
  {
    v18 = &__NSArray0__struct;
  }

  return (NSArray *)v18;
}

@end
