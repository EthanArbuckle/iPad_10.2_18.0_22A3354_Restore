@implementation CarDisplayWindow

- (CarDisplayWindow)initWithFrame:(CGRect)a3
{
  CarDisplayWindow *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarDisplayWindow;
  v3 = -[CarDisplayWindow initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _externalSystemSuperDarkGrayColor](UIColor, "_externalSystemSuperDarkGrayColor"));
    -[CarDisplayWindow setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CarDisplayWindow _setFocusableContentMargins:](v3, "_setFocusableContentMargins:", 0.0, -1.0, 0.0, -1.0);
  }
  return v3;
}

- (void)setRootViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow rootViewController](self, "rootViewController"));
  v6 = objc_opt_class(CarChromeViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    goto LABEL_4;
  v7 = objc_opt_class(CarChromeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v7);

  if ((isKindOfClass & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow rootViewController](self, "rootViewController"));
    objc_msgSend(v5, "setNotificationLayoutGuide:", 0);
LABEL_4:

  }
  v9.receiver = self;
  v9.super_class = (Class)CarDisplayWindow;
  -[CarDisplayWindow setRootViewController:](&v9, "setRootViewController:", v4);

}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSHashTable *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = objc_msgSend(v5, "_shouldSendEvent:toCarDisplayWindow:", v4, self);

  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_eventTaps;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), "sendEvent:", v4);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    v12.receiver = self;
    v12.super_class = (Class)CarDisplayWindow;
    -[CarDisplayWindow sendEvent:](&v12, "sendEvent:", v4);
  }

}

- (void)registerEventTap:(id)a3
{
  id v4;
  NSHashTable *eventTaps;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  eventTaps = self->_eventTaps;
  v8 = v4;
  if (!eventTaps)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v7 = self->_eventTaps;
    self->_eventTaps = v6;

    v4 = v8;
    eventTaps = self->_eventTaps;
  }
  -[NSHashTable addObject:](eventTaps, "addObject:", v4);

}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  CarDisplayWindow *v7;
  CarDisplayWindow *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  objc_super v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  _BOOL4 v19;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CarDisplayWindow;
  -[CarDisplayWindow setHidden:](&v15, "setHidden:");
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 1024;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] setHidden:%d", buf, 0x12u);

  }
}

- (void)becomeKeyWindow
{
  id v3;
  NSObject *v4;
  CarDisplayWindow *v5;
  CarDisplayWindow *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  objc_super v13;
  uint8_t buf[4];
  __CFString *v15;

  v13.receiver = self;
  v13.super_class = (Class)CarDisplayWindow;
  -[CarDisplayWindow becomeKeyWindow](&v13, "becomeKeyWindow");
  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] becomeKeyWindow", buf, 0xCu);

  }
}

- (void)resignKeyWindow
{
  id v3;
  NSObject *v4;
  CarDisplayWindow *v5;
  CarDisplayWindow *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  objc_super v13;
  uint8_t buf[4];
  __CFString *v15;

  v13.receiver = self;
  v13.super_class = (Class)CarDisplayWindow;
  -[CarDisplayWindow resignKeyWindow](&v13, "resignKeyWindow");
  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] resignKeyWindow", buf, 0xCu);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow traitCollection](self, "traitCollection"));
    *(_DWORD *)buf = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Car] Changing trait collection from %@ to %@", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)CarDisplayWindow;
  -[CarDisplayWindow traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1011E94A8);

}

- (void)notificationLayoutGuideDidChange
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow rootViewController](self, "rootViewController"));
  v4 = objc_opt_class(CarChromeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow notificationLayoutGuide](self, "notificationLayoutGuide"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow rootViewController](self, "rootViewController"));
    objc_msgSend(v6, "setNotificationLayoutGuide:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTaps, 0);
}

@end
