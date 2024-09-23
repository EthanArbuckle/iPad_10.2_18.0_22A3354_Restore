@implementation EventSourceWindow

- (EventSourceWindow)initWithWindowScene:(id)a3
{
  EventSourceWindow *v3;
  EventSourceWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EventSourceWindow;
  v3 = -[EventSourceWindow initWithWindowScene:](&v6, "initWithWindowScene:", a3);
  v4 = v3;
  if (v3)
    -[EventSourceWindow _commonUpdate](v3, "_commonUpdate");
  return v4;
}

- (EventSourceWindow)initWithContentRect:(CGRect)a3
{
  EventSourceWindow *v3;
  EventSourceWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EventSourceWindow;
  v3 = -[EventSourceWindow initWithContentRect:](&v6, "initWithContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[EventSourceWindow _commonUpdate](v3, "_commonUpdate");
  return v4;
}

- (void)_commonUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (sub_1002A8AA0(self) != 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EventSourceWindow theme](self, "theme"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
    -[EventSourceWindow setTintColor:](self, "setTintColor:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_keyboardDidShow:", UIKeyboardDidShowNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_keyboardWillHide:", UIKeyboardWillHideNotification, 0);

  -[EventSourceWindow _updateAnalyticsState](self, "_updateAnalyticsState");
}

- (void)_keyboardDidShow:(id)a3
{
  CGRect *p_keyboardFrame;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;

  p_keyboardFrame = &self->_keyboardFrame;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v4, "CGRectValue");
  p_keyboardFrame->origin.x = v5;
  p_keyboardFrame->origin.y = v6;
  p_keyboardFrame->size.width = v7;
  p_keyboardFrame->size.height = v8;

}

- (void)_keyboardWillHide:(id)a3
{
  CGSize size;

  size = CGRectZero.size;
  self->_keyboardFrame.origin = CGRectZero.origin;
  self->_keyboardFrame.size = size;
}

- (double)keyboardHeight
{
  return CGRectGetHeight(self->_keyboardFrame);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  EventSourceWindow *v7;
  EventSourceWindow *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  EventSourceWindow *v17;
  EventSourceWindow *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  void *v30;

  v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EventSourceWindow;
  -[EventSourceWindow setHidden:](&v26, "setHidden:");
  v5 = sub_10043196C();
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[EventSourceWindow performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
    v28 = v14;
    v29 = 1024;
    LODWORD(v30) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating hidden: %d", buf, 0x12u);

  }
  if (v3 && objc_msgSend((id)objc_opt_class(self), "_supportsCallstackSymbolLog"))
  {
    v15 = sub_10043196C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_24:

      return;
    }
    v17 = self;
    v18 = v17;
    if (!v17)
    {
      v24 = CFSTR("<nil>");
      goto LABEL_23;
    }
    v19 = (objc_class *)objc_opt_class(v17);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[EventSourceWindow performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_20;
      }

    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_20:

LABEL_23:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138543618;
    v28 = v24;
    v29 = 2112;
    v30 = v25;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}@] %@", buf, 0x16u);

    goto LABEL_24;
  }
}

+ (BOOL)_supportsCallstackSymbolLog
{
  id v2;
  NSObject *v3;
  BOOL v4;

  v2 = sub_10043196C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EventSourceWindow traitCollection](self, "traitCollection"));
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Phone] Changing trait collection from %@ to %@", buf, 0x16u);

  }
  v12.receiver = self;
  v12.super_class = (Class)EventSourceWindow;
  -[EventSourceWindow traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v8 = objc_msgSend(v4, "userInterfaceStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EventSourceWindow traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceStyle");

  if (v8 != v10)
  {
    -[EventSourceWindow _commonUpdate](self, "_commonUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("MapsWindowUserInterfaceStyleDidChangeNotification"), 0);

  }
}

- (void)_updateAnalyticsState
{
  _BOOL8 v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[EventSourceWindow traitCollection](self, "traitCollection"));
  v2 = objc_msgSend(v4, "userInterfaceStyle") == (id)2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v3, "setDeviceInDarkMode:", v2);

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
  self->_hasEventTaps = 1;

}

- (void)sendEvent:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  if (self->_hasEventTaps)
  {
    if (-[NSHashTable count](self->_eventTaps, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = self->_eventTaps;
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "sendEvent:", v4);
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }

    }
    else
    {
      self->_hasEventTaps = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EventSourceWindow;
  -[EventSourceWindow sendEvent:](&v10, "sendEvent:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTaps, 0);
}

@end
