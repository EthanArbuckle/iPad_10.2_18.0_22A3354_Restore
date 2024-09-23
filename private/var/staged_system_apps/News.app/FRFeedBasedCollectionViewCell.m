@implementation FRFeedBasedCollectionViewCell

+ (void)initialize
{
  id v3;

  if ((id)objc_opt_class(FRFeedBasedCollectionViewCell, a2) == a1)
    v3 = objc_msgSend(a1, "notificationBadgeImage");
}

+ (id)notificationBadgeImage
{
  if (qword_10010A478 != -1)
    dispatch_once(&qword_10010A478, &stru_1000D9900);
  return (id)qword_10010A470;
}

- (FRFeedBasedCollectionViewCell)initWithFrame:(CGRect)a3
{
  FRFeedBasedCollectionViewCell *v3;
  FRFeedBasedCollectionViewCell *v4;
  void *v5;
  FRSubscriptionButton *v6;
  FRSubscriptionButton *actionButton;
  id v8;
  void *v9;
  UIView *v10;
  UIView *highlightedScrimView;
  void *v12;
  FRTouchInsetsButton *v13;
  FRTouchInsetsButton *notificationsBadgeButton;
  FRTouchInsetsButton *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FRFeedBasedCollectionViewCell;
  v3 = -[FRFeedBasedCollectionViewCell initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v5, "setAutoresizesSubviews:", 1);

    v6 = -[FRSubscriptionButton initWithStyle:]([FRSubscriptionButton alloc], "initWithStyle:", 0);
    actionButton = v4->_actionButton;
    v4->_actionButton = v6;

    -[FRTouchInsetsButton setTouchInsets:](v4->_actionButton, "setTouchInsets:", -8.0, -8.0, -8.0, -8.0);
    -[FRSubscriptionButton setHidden:](v4->_actionButton, "setHidden:", 1);
    -[FRSubscriptionButton setIsAccessibilityElement:](v4->_actionButton, "setIsAccessibilityElement:", 0);
    -[FRSubscriptionButton addTarget:action:forControlEvents:](v4->_actionButton, "addTarget:action:forControlEvents:", v4, "_actionButtonTapped:", 64);
    v8 = objc_alloc((Class)UIView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v9, "bounds");
    v10 = (UIView *)objc_msgSend(v8, "initWithFrame:");
    highlightedScrimView = v4->_highlightedScrimView;
    v4->_highlightedScrimView = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
    -[UIView setBackgroundColor:](v4->_highlightedScrimView, "setBackgroundColor:", v12);

    -[UIView setAutoresizingMask:](v4->_highlightedScrimView, "setAutoresizingMask:", 18);
    -[UIView setIsAccessibilityElement:](v4->_highlightedScrimView, "setIsAccessibilityElement:", 0);
    -[UIView setHidden:](v4->_highlightedScrimView, "setHidden:", 1);
    v13 = -[FRTouchInsetsButton initWithFrame:]([FRTouchInsetsButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    notificationsBadgeButton = v4->_notificationsBadgeButton;
    v4->_notificationsBadgeButton = v13;

    v15 = v4->_notificationsBadgeButton;
    v17 = objc_msgSend((id)objc_opt_class(v4, v16), "notificationBadgeImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[FRTouchInsetsButton setImage:forState:](v15, "setImage:forState:", v18, 0);

    -[FRTouchInsetsButton setTouchInsets:](v4->_notificationsBadgeButton, "setTouchInsets:", -8.0, -8.0, -8.0, -8.0);
    -[FRTouchInsetsButton setContentMode:](v4->_notificationsBadgeButton, "setContentMode:", 4);
    -[FRTouchInsetsButton setHidden:](v4->_notificationsBadgeButton, "setHidden:", 1);
    -[FRTouchInsetsButton setIsAccessibilityElement:](v4->_notificationsBadgeButton, "setIsAccessibilityElement:", 0);
    -[FRTouchInsetsButton addTarget:action:forControlEvents:](v4->_notificationsBadgeButton, "addTarget:action:forControlEvents:", v4, "_notificationsBadgeButtonTapped:", 64);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v19, "addSubview:", v4->_notificationsBadgeButton);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v20, "addSubview:", v4->_actionButton);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v21, "addSubview:", v4->_highlightedScrimView);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRFeedBasedCollectionViewCell;
  -[FRFeedBasedCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[FRFeedBasedCollectionViewCell setRankInSource:](self, "setRankInSource:", 0);
  -[FRFeedBasedCollectionViewCell setSubscriptionModificationDelegate:](self, "setSubscriptionModificationDelegate:", 0);
}

- (void)_updateHighlightedState
{
  uint64_t v3;
  id v4;

  if ((-[FRFeedBasedCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0)
    v3 = 0;
  else
    v3 = -[FRFeedBasedCollectionViewCell isSelected](self, "isSelected") ^ 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell highlightedScrimView](self, "highlightedScrimView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FRFeedBasedCollectionViewCell;
  -[FRFeedBasedCollectionViewCell setHighlighted:](&v4, "setHighlighted:", a3);
  -[FRFeedBasedCollectionViewCell _updateHighlightedState](self, "_updateHighlightedState");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FRFeedBasedCollectionViewCell;
  -[FRFeedBasedCollectionViewCell setSelected:](&v4, "setSelected:", a3);
  -[FRFeedBasedCollectionViewCell _updateHighlightedState](self, "_updateHighlightedState");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)FRFeedBasedCollectionViewCell;
  v4 = a3;
  -[FRFeedBasedCollectionViewCell applyLayoutAttributes:](&v29, "applyLayoutAttributes:", v4);
  objc_msgSend(v4, "bounds", v29.receiver, v29.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  objc_msgSend(v4, "bounds");
  v15 = v14;

  if (v15 <= 130.0)
    v16 = 25.0;
  else
    v16 = 29.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v16, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell notificationsBadgeButton](self, "notificationsBadgeButton"));
  objc_msgSend(v18, "setFrame:", v15 - v16 + -8.0, 8.0, v16, v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell highlightedScrimView](self, "highlightedScrimView"));
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

}

- (void)setMode:(unint64_t)a3
{
  void *v5;

  if (self->_mode != a3)
  {
    -[FRFeedBasedCollectionViewCell setPreviousMode:](self, "setPreviousMode:");
    self->_mode = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
    objc_msgSend(v5, "setHidden:", a3 == 0);

    -[FRFeedBasedCollectionViewCell _updateButtonImage](self, "_updateButtonImage");
    -[FRFeedBasedCollectionViewCell _updateNotificationsBadgeButton](self, "_updateNotificationsBadgeButton");
  }
}

- (void)setNotificationUIEnabled:(BOOL)a3
{
  if (self->_notificationUIEnabled != a3)
  {
    self->_notificationUIEnabled = a3;
    -[FRFeedBasedCollectionViewCell _updateNotificationsBadgeButton](self, "_updateNotificationsBadgeButton");
  }
}

- (void)_updateButtonImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  if ((id)-[FRFeedBasedCollectionViewCell mode](self, "mode") == (id)1)
  {
    if (-[FRFeedBasedCollectionViewCell isAddable](self, "isAddable")
      && -[FRFeedBasedCollectionViewCell isRemovable](self, "isRemovable"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
      objc_msgSend(v3, "setHidden:", 0);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
      v8 = v4;
      v5 = 2;
    }
    else
    {
      v6 = -[FRFeedBasedCollectionViewCell isRemovable](self, "isRemovable");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
      v8 = v7;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v7, "setHidden:", 1);
LABEL_10:

        return;
      }
      objc_msgSend(v7, "setHidden:", 0);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
      v8 = v4;
      v5 = 1;
    }
    objc_msgSend(v4, "setSubscriptionState:animated:completion:", v5, 0, 0);
    goto LABEL_10;
  }
}

- (void)_updateNotificationsBadgeButton
{
  void *v3;
  uint64_t v4;
  id v5;

  if (!-[FRFeedBasedCollectionViewCell mode](self, "mode")
    && -[FRFeedBasedCollectionViewCell hasNotificationsEnabled](self, "hasNotificationsEnabled")
    && -[FRFeedBasedCollectionViewCell notificationUIEnabled](self, "notificationUIEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell notificationsBadgeButton](self, "notificationsBadgeButton"));
    v5 = v3;
    v4 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell notificationsBadgeButton](self, "notificationsBadgeButton"));
    v5 = v3;
    v4 = 1;
  }
  objc_msgSend(v3, "setHidden:", v4);

}

- (void)_actionButtonTapped:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FRFeedBasedCollectionViewCell _actionButtonTapped:]";
    v9 = 2080;
    v10 = "FRFeedBasedCollectionViewCell.m";
    v11 = 1024;
    v12 = 194;
    v13 = 2114;
    v14 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedCollectionViewCell _actionButtonTapped:]"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v5, 0));

  objc_exception_throw(v6);
}

- (void)_notificationsBadgeButtonTapped:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FRFeedBasedCollectionViewCell _notificationsBadgeButtonTapped:]";
    v9 = 2080;
    v10 = "FRFeedBasedCollectionViewCell.m";
    v11 = 1024;
    v12 = 199;
    v13 = 2114;
    v14 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedCollectionViewCell _notificationsBadgeButtonTapped:]"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v5, 0));

  objc_exception_throw(v6);
}

- (BOOL)isAddable
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFeedBasedCollectionViewCell isAddable]";
    v7 = 2080;
    v8 = "FRFeedBasedCollectionViewCell.m";
    v9 = 1024;
    v10 = 204;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedCollectionViewCell isAddable]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (BOOL)isSubscribedTo
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFeedBasedCollectionViewCell isSubscribedTo]";
    v7 = 2080;
    v8 = "FRFeedBasedCollectionViewCell.m";
    v9 = 1024;
    v10 = 209;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedCollectionViewCell isSubscribedTo]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (BOOL)isRemovable
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFeedBasedCollectionViewCell isRemovable]";
    v7 = 2080;
    v8 = "FRFeedBasedCollectionViewCell.m";
    v9 = 1024;
    v10 = 214;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedCollectionViewCell isRemovable]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (BOOL)hasNotificationsEnabled
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFeedBasedCollectionViewCell hasNotificationsEnabled]";
    v7 = 2080;
    v8 = "FRFeedBasedCollectionViewCell.m";
    v9 = 1024;
    v10 = 219;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedCollectionViewCell hasNotificationsEnabled]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (BOOL)isAccessibilityElement
{
  return !+[FRMacros isUIAutomationRunning](FRMacros, "isUIAutomationRunning");
}

- (id)accessibilityElements
{
  return 0;
}

- (NSString)accessibilityPublisherOrTopicName
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFeedBasedCollectionViewCell accessibilityPublisherOrTopicName]";
    v7 = 2080;
    v8 = "FRFeedBasedCollectionViewCell.m";
    v9 = 1024;
    v10 = 239;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedCollectionViewCell accessibilityPublisherOrTopicName]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (BOOL)accessibilitySupportsCellSelection
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell fr_parentCollectionView](self, "fr_parentCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "collectionView:didSelectItemAtIndexPath:");

  return v4 & 1;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v2;
  unsigned int v3;
  UIAccessibilityTraits v4;

  v2 = UIAccessibilityTraitNone;
  v3 = -[FRFeedBasedCollectionViewCell accessibilitySupportsCellSelection](self, "accessibilitySupportsCellSelection");
  v4 = UIAccessibilityTraitButton;
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (BOOL)notificationUIEnabled
{
  return self->_notificationUIEnabled;
}

- (unint64_t)rankInSource
{
  return self->_rankInSource;
}

- (void)setRankInSource:(unint64_t)a3
{
  self->_rankInSource = a3;
}

- (BOOL)hideHighlightState
{
  return self->_hideHighlightState;
}

- (void)setHideHighlightState:(BOOL)a3
{
  self->_hideHighlightState = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (FRFeedBasedCollectionViewCellSubscriptionModificationDelegate)subscriptionModificationDelegate
{
  return (FRFeedBasedCollectionViewCellSubscriptionModificationDelegate *)objc_loadWeakRetained((id *)&self->_subscriptionModificationDelegate);
}

- (void)setSubscriptionModificationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subscriptionModificationDelegate, a3);
}

- (FRSubscriptionButton)actionButton
{
  return self->_actionButton;
}

- (unint64_t)previousMode
{
  return self->_previousMode;
}

- (void)setPreviousMode:(unint64_t)a3
{
  self->_previousMode = a3;
}

- (UIView)highlightedScrimView
{
  return self->_highlightedScrimView;
}

- (FRTouchInsetsButton)notificationsBadgeButton
{
  return self->_notificationsBadgeButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsBadgeButton, 0);
  objc_storeStrong((id *)&self->_highlightedScrimView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_destroyWeak((id *)&self->_subscriptionModificationDelegate);
}

@end
