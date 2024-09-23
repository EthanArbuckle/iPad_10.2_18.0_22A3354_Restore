@implementation MFKeyboardAvoidance

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001650EC;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA160 != -1)
    dispatch_once(&qword_1005AA160, block);
  return (id)qword_1005AA158;
}

- (void)dealloc
{
  objc_super v3;

  -[MFKeyboardAvoidance _unregisterForKeyboardNotifications](self, "_unregisterForKeyboardNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MFKeyboardAvoidance;
  -[MFKeyboardAvoidance dealloc](&v3, "dealloc");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFKeyboardAvoidance;
  return -[MFKeyboardAvoidance init](&v3, "init");
}

- (void)registerKeyboardAvoidable:(id)a3
{
  id v4;
  void *v5;
  NSHashTable *v6;
  NSHashTable *keyboardAvoidables;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = v4;
  if (!self->_keyboardAvoidables)
  {
    v6 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 5, 1);
    keyboardAvoidables = self->_keyboardAvoidables;
    self->_keyboardAvoidables = v6;

  }
  v8 = MFLogGeneral(v4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = objc_opt_class(v5);
    v21 = 2048;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#keyboard registering keyboard avoidable <%{public}@:%p>", buf, 0x16u);
  }

  -[NSHashTable addObject:](self->_keyboardAvoidables, "addObject:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_keyboardAvoidables, "allObjects"));
  if (objc_msgSend(v10, "count") == (id)1)
  {
    v11 = !self->_registeredForNotifications;

    if (v11)
      -[MFKeyboardAvoidance _registerForKeyboardNotifications](self, "_registerForKeyboardNotifications");
  }
  else
  {

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016542C;
  v17[3] = &unk_10051A910;
  v17[4] = self;
  v12 = v5;
  v18 = v12;
  v13 = objc_retainBlock(v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transitionCoordinatorForKeyboardAvoidance:", self));
  if (v14)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100165440;
    v15[3] = &unk_10051C358;
    v16 = v13;
    objc_msgSend(v14, "animateAlongsideTransition:completion:", 0, v15);

  }
  else
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }

}

- (void)unregisterKeyboardAvoidable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  _QWORD *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionCoordinatorForKeyboardAvoidance:", self));
  v6 = MFLogGeneral(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = objc_opt_class(v4);
    v17 = 2048;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#keyboard unregistering keyboard avoidable <%{public}@:%p>", buf, 0x16u);
  }

  -[NSHashTable removeObject:](self->_keyboardAvoidables, "removeObject:", v4);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10016564C;
  v14[3] = &unk_10051AA98;
  v14[4] = self;
  v8 = objc_retainBlock(v14);
  v9 = v8;
  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001656DC;
    v12[3] = &unk_10051C358;
    v13 = v8;
    objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v12);
    v10 = v13;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v11 = objc_msgSend(v10, "afterDelay:performBlock:", v9, 1.0);
  }

}

- (double)_keyboardVerticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double MaxY;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v6 = a3;
  -[MFKeyboardAvoidance _frameInViewUsingForView:keyboardInfo:](self, "_frameInViewUsingForView:keyboardInfo:", v6, a4);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v11 = 0.0;
  if (!CGRectIsEmpty(v14))
  {
    objc_msgSend(v6, "bounds");
    MaxY = CGRectGetMaxY(v15);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v11 = fmax(MaxY - CGRectGetMinY(v16), 0.0);
  }

  return v11;
}

- (CGRect)_keyboardOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  v6 = a3;
  v7 = a4;
  -[MFKeyboardAvoidance _frameInViewUsingForView:keyboardInfo:](self, "_frameInViewUsingForView:keyboardInfo:", v6, v7);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (CGRectIsEmpty(v20))
  {
    v12 = CGRectNull.origin.x;
    v13 = CGRectNull.origin.y;
    v14 = CGRectNull.size.width;
    v15 = CGRectNull.size.height;
  }
  else
  {
    objc_msgSend(v6, "bounds");
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v22 = CGRectIntersection(v21, v24);
    v12 = v22.origin.x;
    v13 = v22.origin.y;
    v14 = v22.size.width;
    v15 = v22.size.height;
  }

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_frameInViewUsingForView:(id)a3 keyboardInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  NSString *v31;
  void *v32;
  NSString *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v8, "CGRectValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = objc_opt_class(UIWindow);
    if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
      v18 = v5;
    else
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v23 = v18;
    objc_msgSend(v18, "convertRect:fromWindow:", 0, v10, v12, v14, v16);
    v24 = objc_msgSend(v5, "convertRect:fromView:", 0);
    x = v25;
    y = v26;
    width = v27;
    height = v28;
    v29 = MFLogGeneral(v24);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v43.origin.x = v10;
      v43.origin.y = v12;
      v43.size.width = v14;
      v43.size.height = v16;
      v31 = NSStringFromCGRect(v43);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      v33 = NSStringFromCGRect(v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v39 = 138543618;
      v40 = v32;
      v41 = 2114;
      v42 = v34;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#keyboard _keyboardOverlap calculation - frameInScreen:%{public}@ frameInView:%{public}@", (uint8_t *)&v39, 0x16u);

    }
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)_adjustAvoidable:(id)a3 forAutomaticKeyboardInfo:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  MFKeyboardAvoidance *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewForKeyboardAvoidance:", self));
  -[MFKeyboardAvoidance _keyboardVerticalOverlapForView:usingKeyboardInfo:](self, "_keyboardVerticalOverlapForView:usingKeyboardInfo:", v10, v9);
  v12 = v11;
  -[MFKeyboardAvoidance _keyboardOverlapForView:usingKeyboardInfo:](self, "_keyboardOverlapForView:usingKeyboardInfo:", v10, v9);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100165CD4;
  v28[3] = &unk_1005211D0;
  v21 = v8;
  v31 = v12;
  v32 = v14;
  v33 = v16;
  v34 = v18;
  v35 = v20;
  v29 = v21;
  v30 = self;
  v22 = objc_retainBlock(v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  if (v5 && v25 > 0.0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIKeyboardAnimationCurveUserInfoKey));
    v27 = (_QWORD)objc_msgSend(v26, "integerValue") << 16;

    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v27, v22, 0, v25, 0.0);
  }
  else
  {
    ((void (*)(_QWORD *))v22[2])(v22);
  }

}

- (void)_adjustAvoidablesForKeyboardInfo:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSHashTable *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *v12;
  NSDictionary *currentKeyboardInfo;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;

  v4 = a3;
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#keyboard adjust avoidables for keyboard info: %{public}@", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_keyboardAvoidables;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        if (v11)
          -[MFKeyboardAvoidance _adjustAvoidable:forAutomaticKeyboardInfo:animated:](self, "_adjustAvoidable:forAutomaticKeyboardInfo:animated:", v11, v4, 1, (_QWORD)v14);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (NSDictionary *)objc_msgSend(v4, "copy");
  currentKeyboardInfo = self->_currentKeyboardInfo;
  self->_currentKeyboardInfo = v12;

}

- (void)_keyboardWillHide:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSRunLoopMode v10;
  uint8_t buf[4];
  void *v12;

  v4 = a3;
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#keyboard keyboard will hide: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = NSRunLoopCommonModes;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  -[MFKeyboardAvoidance performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_adjustAvoidablesForKeyboardInfo:", v8, v9, 0.0);

}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#keyboard keyboard will show: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  -[MFKeyboardAvoidance _adjustAvoidablesForKeyboardInfo:](self, "_adjustAvoidablesForKeyboardInfo:", v8);

  objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_adjustAvoidablesForKeyboardInfo:", 0);
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#keyboard keyboard did change frame: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  -[MFKeyboardAvoidance _adjustAvoidablesForKeyboardInfo:](self, "_adjustAvoidablesForKeyboardInfo:", v8);

  objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_adjustAvoidablesForKeyboardInfo:", 0);
}

- (void)_registerForKeyboardNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = MFLogGeneral(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#keyboard registering for keyboard notifications", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_keyboardWillShow:", UIKeyboardWillShowNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_keyboardWillHide:", UIKeyboardWillHideNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_keyboardDidChangeFrame:", UIKeyboardDidChangeFrameNotification, 0);
  self->_registeredForNotifications = 1;

}

- (void)_unregisterForKeyboardNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSDictionary *currentKeyboardInfo;
  uint8_t v7[16];

  v3 = MFLogGeneral(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#keyboard unregistering for keyboard notifications", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardDidChangeFrameNotification, 0);
  currentKeyboardInfo = self->_currentKeyboardInfo;
  self->_currentKeyboardInfo = 0;

  self->_registeredForNotifications = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKeyboardInfo, 0);
  objc_storeStrong((id *)&self->_keyboardAvoidables, 0);
}

@end
