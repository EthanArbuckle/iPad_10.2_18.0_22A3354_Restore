@implementation CRLiOSKeyboardMonitor

- (CRLiOSKeyboardMonitor)init
{
  CRLiOSKeyboardMonitor *v2;
  CRLiOSKeyboardMonitor *v3;
  uint64_t v4;
  NSPointerArray *keyboardObservers;
  uint64_t v6;
  NSHashTable *modalKeyboardObservers;
  uint64_t v8;
  NSMutableArray *completionBlocks;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSKeyboardMonitor;
  v2 = -[CRLiOSKeyboardMonitor init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_keyboardIsVisibleAndDocked = 0;
    v2->_isLocalKeyboard = 1;
    v4 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    keyboardObservers = v3->_keyboardObservers;
    v3->_keyboardObservers = (NSPointerArray *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    modalKeyboardObservers = v3->_modalKeyboardObservers;
    v3->_modalKeyboardObservers = (NSHashTable *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    completionBlocks = v3->_completionBlocks;
    v3->_completionBlocks = (NSMutableArray *)v8;

    -[CRLiOSKeyboardMonitor p_installKeyboardNotifications](v3, "p_installKeyboardNotifications");
  }
  return v3;
}

- (BOOL)keyboardIsVisibleAndDocked
{
  return self->_keyboardIsVisibleAndDocked && self->_onScreenHeight > 0.0;
}

- (BOOL)keyboardIsVisibleAndUndocked
{
  return -[CRLiOSKeyboardMonitor p_isFrameCorrespondingToUndockedKeyboard:](self, "p_isFrameCorrespondingToUndockedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
}

- (BOOL)keyboardIsAnimating
{
  return self->_keyboardIsAnimatingInOrDocking || self->_keyboardIsAnimatingOutOrUndocking;
}

- (void)p_enumerateObserversUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor p_observersToNotify](self, "p_observersToNotify"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002BE2E8;
  v7[3] = &unk_10124CCE0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "crl_enumerateNonNullPointersUsingBlock:", v7);

}

- (id)p_observersToNotify
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor modalKeyboardObservers](self, "modalKeyboardObservers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor modalKeyboardObservers](self, "modalKeyboardObservers"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyboardObserversWindow"));
          objc_msgSend(v5, "addObject:", v13);
          objc_msgSend(v6, "addPointer:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardObservers](self, "keyboardObservers", 0));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "keyboardObserversWindow"));
          v21 = objc_msgSend(v5, "containsObject:", v20);

          if ((v21 & 1) == 0)
            objc_msgSend(v6, "addPointer:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardObservers](self, "keyboardObservers"));
    v6 = objc_msgSend(v5, "copy");
  }

  return v6;
}

- (void)p_keyboardWillShowOrDock:(id)a3
{
  id v4;
  NSObject *v5;
  double width;
  double height;
  double onScreenHeight;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124CD00);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CRLiOSKeyboardMonitor p_keyboardWillShowOrDock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  -[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:", v4);
  width = self->_keyboardFrame.size.width;
  if (width == 0.0
    || fabs(width) < 0.00999999978
    || (height = self->_keyboardFrame.size.height, height == 0.0)
    || fabs(height) < 0.00999999978
    || (onScreenHeight = self->_onScreenHeight, onScreenHeight == 0.0)
    || fabs(onScreenHeight) < 0.00999999978)
  {
    self->_weAreFakingAHideEvent = 1;
    if (self->_keyboardIsVisibleAndDocked)
      -[CRLiOSKeyboardMonitor p_keyboardWillHideOrUndock:](self, "p_keyboardWillHideOrUndock:", v4);
    else
      self->_suppressDidHide = 1;
  }
  else
  {
    if (self->_keyboardIsAnimatingOutOrUndocking)
    {
      self->_keyboardIsAnimatingOutOrUndocking = 0;
      -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", &stru_10124CD40);
    }
    self->_keyboardIsVisibleAndDocked = 1;
    self->_keyboardIsAnimatingInOrDocking = 1;
    -[CRLiOSKeyboardMonitor p_scheduleKeyboardIsAnimatingInTimer](self, "p_scheduleKeyboardIsAnimatingInTimer");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002BE794;
    v9[3] = &unk_10124CD68;
    v10 = v4;
    -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v9);

  }
}

- (void)p_keyboardDidShowOrDock:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124CD88);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CRLiOSKeyboardMonitor p_keyboardDidShowOrDock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (self->_weAreFakingAHideEvent)
  {
    if (!self->_suppressDidHide)
      -[CRLiOSKeyboardMonitor p_keyboardDidHideOrUndock:](self, "p_keyboardDidHideOrUndock:", v4);
    *(_WORD *)&self->_weAreFakingAHideEvent = 256;
    self->_suppressDidHide = 0;
  }
  else if (self->_keyboardIsAnimatingInOrDocking)
  {
    -[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:", v4);
    self->_keyboardIsAnimatingInOrDocking = 0;
    -[CRLiOSKeyboardMonitor p_clearKeyboardIsAnimatingInTimer](self, "p_clearKeyboardIsAnimatingInTimer");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002BE998;
    v6[3] = &unk_10124CD68;
    v7 = v4;
    -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);
    -[CRLiOSKeyboardMonitor p_performAnimationCompletionBlocksWithVisible:](self, "p_performAnimationCompletionBlocksWithVisible:", 1);

  }
}

- (void)p_keyboardWillHideOrUndock:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124CDA8);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CRLiOSKeyboardMonitor p_keyboardWillHideOrUndock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  self->_suppressDidHide = 0;
  -[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:", v4);
  if (self->_keyboardIsAnimatingInOrDocking)
  {
    self->_keyboardIsAnimatingInOrDocking = 0;
    -[CRLiOSKeyboardMonitor p_clearKeyboardIsAnimatingInTimer](self, "p_clearKeyboardIsAnimatingInTimer");
    -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", &stru_10124CDC8);
  }
  if (self->_keyboardIsVisibleAndDocked || !self->_lastHideWasFake)
  {
    self->_keyboardIsVisibleAndDocked = 0;
    self->_keyboardIsAnimatingOutOrUndocking = 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002BEBD4;
    v6[3] = &unk_10124CD68;
    v7 = v4;
    -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);

  }
}

- (void)p_keyboardDidHideOrUndock:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124CDE8);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CRLiOSKeyboardMonitor p_keyboardDidHideOrUndock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (self->_keyboardIsAnimatingOutOrUndocking)
  {
    -[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:", v4);
    self->_keyboardIsAnimatingOutOrUndocking = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002BEDA8;
    v6[3] = &unk_10124CD68;
    v7 = v4;
    -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);
    -[CRLiOSKeyboardMonitor p_performAnimationCompletionBlocksWithVisible:](self, "p_performAnimationCompletionBlocksWithVisible:", 0);
    self->_lastHideWasFake = 0;

  }
}

- (void)p_clearKeyboardIsAnimatingInTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardIsAnimatingInTimer](self, "keyboardIsAnimatingInTimer"));
  objc_msgSend(v3, "invalidate");

  -[CRLiOSKeyboardMonitor setKeyboardIsAnimatingInTimer:](self, "setKeyboardIsAnimatingInTimer:", 0);
}

- (void)p_scheduleKeyboardIsAnimatingInTimer
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardIsAnimatingInTimer](self, "keyboardIsAnimatingInTimer"));
  objc_msgSend(v3, "invalidate");

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1002BEF18;
  v8 = &unk_10124BB08;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 2.5));
  -[CRLiOSKeyboardMonitor setKeyboardIsAnimatingInTimer:](self, "setKeyboardIsAnimatingInTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addKeyboardObserver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardObservers](self, "keyboardObservers"));
  v5 = objc_msgSend(v4, "crl_indexOfPointer:", v7);

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardObservers](self, "keyboardObservers"));
    objc_msgSend(v6, "addPointer:", v7);

  }
}

- (void)removeKeyboardObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardObservers](self, "keyboardObservers"));
  v6 = objc_msgSend(v5, "crl_indexOfPointer:", v4);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardObservers](self, "keyboardObservers"));
    objc_msgSend(v7, "removePointerAtIndex:", v6);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor keyboardObservers](self, "keyboardObservers"));
  objc_msgSend(v8, "compact");

}

- (void)addModalKeyboardObserver:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor modalKeyboardObservers](self, "modalKeyboardObservers"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CE48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E195F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CE68);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKeyboardMonitor addModalKeyboardObserver:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 306, 0, "addModalKeyboardObserver attempt to add the same model observer.");

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor modalKeyboardObservers](self, "modalKeyboardObservers"));
    objc_msgSend(v10, "addObject:", v4);

  }
}

- (void)removeModalKeyboardObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSKeyboardMonitor modalKeyboardObservers](self, "modalKeyboardObservers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *completionBlocks;
  id v7;
  id v8;
  int v9;
  const char *v10;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124CE88);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CRLiOSKeyboardMonitor afterKeyboardAnimationPerformBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }
  completionBlocks = self->_completionBlocks;
  v7 = objc_msgSend(v4, "copy");
  v8 = objc_retainBlock(v7);
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v8);

}

+ (id)sharedKeyboardMonitor
{
  if (qword_101415318 != -1)
    dispatch_once(&qword_101415318, &stru_10124CEA8);
  return (id)qword_101415310;
}

+ (void)addKeyboardObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  objc_msgSend(v5, "addKeyboardObserver:", v4);

}

+ (void)removeKeyboardObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  objc_msgSend(v5, "removeKeyboardObserver:", v4);

}

+ (void)addModalKeyboardObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  objc_msgSend(v5, "addModalKeyboardObserver:", v4);

}

+ (void)removeModalKeyboardObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  objc_msgSend(v5, "removeModalKeyboardObserver:", v4);

}

+ (BOOL)isKeyboardFrameChanging:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CGRect v40;
  CGRect v41;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(NSValue, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", UIKeyboardFrameBeginUserInfoKey));
  v10 = sub_100221D0C(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  *(_QWORD *)&v13 = objc_opt_class(NSValue, v12).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo", v13));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  v18 = sub_100221D0C(v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CEC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19708();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CEE8);
    v33 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isKeyboardFrameChanging:]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 350, 0, "invalid nil value for '%{public}s'", "frameBeginValue");

    if (v19)
      goto LABEL_23;
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CF08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1967C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CF28);
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isKeyboardFrameChanging:]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 351, 0, "invalid nil value for '%{public}s'", "frameEndValue");

    goto LABEL_23;
  }
  objc_msgSend(v11, "CGRectValue");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(v19, "CGRectValue");
  v41.origin.x = v28;
  v41.origin.y = v29;
  v41.size.width = v30;
  v41.size.height = v31;
  v40.origin.x = v21;
  v40.origin.y = v23;
  v40.size.width = v25;
  v40.size.height = v27;
  if (CGRectEqualToRect(v40, v41))
  {
LABEL_23:
    v32 = 0;
    goto LABEL_24;
  }
  v32 = 1;
LABEL_24:

  return v32;
}

+ (BOOL)keyboardIsVisibleAndDocked
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  v3 = objc_msgSend(v2, "keyboardIsVisibleAndDocked");

  return v3;
}

+ (BOOL)keyboardIsVisibleAndUndocked
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  v3 = objc_msgSend(v2, "keyboardIsVisibleAndUndocked");

  return v3;
}

+ (BOOL)undockedKeyboardWillShow
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  v3 = objc_msgSend(v2, "undockedKeyboardWillShow");

  return v3;
}

+ (BOOL)undockedKeyboardWillHide
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  v3 = objc_msgSend(v2, "undockedKeyboardWillHide");

  return v3;
}

+ (BOOL)keyboardIsAnimating
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  v3 = objc_msgSend(v2, "keyboardIsAnimating");

  return v3;
}

+ (BOOL)keyboardIsAnimatingInOrDocking
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  v3 = objc_msgSend(v2, "keyboardIsAnimatingInOrDocking");

  return v3;
}

+ (BOOL)keyboardIsAnimatingOutOrUndocking
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  v3 = objc_msgSend(v2, "keyboardIsAnimatingOutOrUndocking");

  return v3;
}

+ (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedKeyboardMonitor"));
  objc_msgSend(v5, "afterKeyboardAnimationPerformBlock:", v4);

}

+ (BOOL)isLocalKeyboardForNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIKeyboardIsLocalUserInfoKey));
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CF48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19794();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CF68);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isLocalKeyboardForNotification:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 399, 0, "invalid nil value for '%{public}s'", "localUserKeyValue");

    v6 = 1;
  }

  return v6;
}

+ (BOOL)isNullInputView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CF88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19820();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CFA8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isNullInputView:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 404, 0, "invalid nil value for '%{public}s'", "inputView");

    goto LABEL_14;
  }
  if (!objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints")
    || (objc_msgSend(v4, "autoresizingMask") & 0x10) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "frame");
  v6 = v5 <= 0.0;
LABEL_15:

  return v6;
}

+ (CGRect)p_localKeyboardFrameFromReportedFrame:(CGRect)a3 screenBounds:(CGRect)a4 inputView:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  CGFloat MaxY;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  if (v14)
  {
    if (objc_msgSend(a1, "isNullInputView:", v14))
    {
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MaxY = CGRectGetMaxY(v21);
      v24.origin.x = 0.0;
      v24.size.height = 0.0;
      v22.origin.x = v12;
      v22.origin.y = v11;
      v22.size.width = v10;
      v22.size.height = v9;
      v24.origin.y = MaxY;
      v24.size.width = width;
      if (!CGRectEqualToRect(v22, v24))
      {
        if (qword_10147E498 != -1)
          dispatch_once(&qword_10147E498, &stru_10124CFC8);
        v16 = off_1013D9198;
        if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_ERROR))
          sub_100E198AC(v16, v12, v11, v10, v9, 0.0, MaxY, width, 0.0);
        v9 = 0.0;
        v10 = width;
        v11 = MaxY;
        v12 = 0.0;
      }
    }
  }

  v17 = v12;
  v18 = v11;
  v19 = v10;
  v20 = v9;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)p_installKeyboardNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_keyboardWillShowOrDock:", UIKeyboardWillShowNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_keyboardDidShowOrDock:", UIKeyboardDidShowNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_keyboardWillHideOrUndock:", UIKeyboardWillHideNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_keyboardDidHideOrUndock:", UIKeyboardDidHideNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_keyboardWillChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_keyboardDidChangeFrame:", UIKeyboardDidChangeFrameNotification, 0);

}

- (void)p_updateKeyboardInfoFromNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  void *v40;
  double v41;
  int v42;
  const char *v43;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124CFE8);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    v42 = 136315138;
    v43 = "-[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v42, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  self->_isLocalKeyboard = +[CRLiOSKeyboardMonitor isLocalKeyboardForNotification:](CRLiOSKeyboardMonitor, "isLocalKeyboardForNotification:", v4);
  *(_QWORD *)&v8 = objc_opt_class(NSValue, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", UIKeyboardFrameEndUserInfoKey, v8));
  v12 = sub_100221D0C(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keyWindow"));

    objc_msgSend(v13, "CGRectValue");
    v20 = v16;
    v21 = v17;
    v22 = v18;
    v23 = v19;
    if (self->_isLocalKeyboard)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v24, "bounds");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstResponder"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "inputView"));
      +[CRLiOSKeyboardMonitor p_localKeyboardFrameFromReportedFrame:screenBounds:inputView:](CRLiOSKeyboardMonitor, "p_localKeyboardFrameFromReportedFrame:screenBounds:inputView:", v34, v20, v21, v22, v23, v26, v28, v30, v32);
      self->_keyboardFrame.origin.x = v35;
      self->_keyboardFrame.origin.y = v36;
      self->_keyboardFrame.size.width = v37;
      self->_keyboardFrame.size.height = v38;

    }
    else
    {
      self->_keyboardFrame.origin.x = v16;
      self->_keyboardFrame.origin.y = v17;
      self->_keyboardFrame.size.width = v18;
      self->_keyboardFrame.size.height = v19;
    }
    -[CRLiOSKeyboardMonitor onScreenHeightInWindow:](self, "onScreenHeightInWindow:", v15);
    self->_onScreenHeight = v39;

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v40, "doubleValue");
  self->_keyboardAnimationDuration = v41;

}

- (void)p_performAnimationCompletionBlocksWithVisible:(BOOL)a3
{
  NSObject *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  _QWORD v12[5];
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;

  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124D008);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CRLiOSKeyboardMonitor p_performAnimationCompletionBlocksWithVisible:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_completionBlocks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1002C0884;
        v12[3] = &unk_10122F650;
        v12[4] = v11;
        v13 = a3;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects");
}

- (BOOL)p_isFrameCorrespondingToUndockedKeyboard:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MaxY;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  CGRect v24;
  CGRect v25;

  if (!+[UIDevice crl_padUI](UIDevice, "crl_padUI", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyWindow"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  objc_msgSend(v7, "convertRect:fromView:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "frame");
  objc_msgSend(v7, "convertRect:fromView:", 0);
  MaxY = CGRectGetMaxY(v24);
  if (-[CRLiOSKeyboardMonitor p_isFrameCorrespondingToRotatedKeyboard:](self, "p_isFrameCorrespondingToRotatedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "coordinateSpace"));
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;

    MaxY = v19 - (v21 - MaxY);
  }
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  v22 = CGRectGetMaxY(v25) < MaxY + -1.0;

  return v22;
}

- (BOOL)p_isFrameCorrespondingToRotatedKeyboard:(CGRect)a3
{
  double Width;
  void *v4;
  BOOL v5;
  CGRect v7;

  Width = CGRectGetWidth(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v5 = Width == CGRectGetHeight(v7);

  return v5;
}

- (double)onScreenHeightInWindow:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double Width;
  double v8;
  double Height;
  double MinY;
  CGRect v12;
  CGRect v13;

  v4 = a3;
  v5 = 0.0;
  if (CGRectGetHeight(self->_keyboardFrame) > 0.0
    && !-[CRLiOSKeyboardMonitor p_isFrameCorrespondingToUndockedKeyboard:](self, "p_isFrameCorrespondingToUndockedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height))
  {
    if (-[CRLiOSKeyboardMonitor p_isFrameCorrespondingToRotatedKeyboard:](self, "p_isFrameCorrespondingToRotatedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v6, "bounds");
      Width = CGRectGetWidth(v12);

      -[CRLiOSKeyboardMonitor p_verticalSpacingFromWindow:toWindow:](self, "p_verticalSpacingFromWindow:toWindow:", v4, 0);
      Height = Width - v8;
    }
    else
    {
      objc_msgSend(v4, "bounds");
      Height = CGRectGetHeight(v13);
    }
    MinY = CGRectGetMinY(self->_keyboardFrame);
    if (Height < MinY)
      MinY = Height;
    v5 = Height - MinY;
  }

  return v5;
}

- (double)p_verticalSpacingFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double Height;
  void *v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0.0;
  if (v7 != v6 && self->_onScreenHeight != 0.0)
  {
    if (v7)
    {
      objc_msgSend(v7, "frame");
      Height = CGRectGetHeight(v13);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v11, "bounds");
      Height = CGRectGetHeight(v14);

    }
    objc_msgSend(v6, "frame");
    v9 = fmax((Height - CGRectGetHeight(v15)) * 0.5, 0.0);
  }

  return v9;
}

- (BOOL)p_isNotificationCorrespondingToUndockedKeyboardWillShow:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  double Height;
  double v24;
  int v26;
  const char *v27;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124D028);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315138;
    v27 = "-[CRLiOSKeyboardMonitor p_isNotificationCorrespondingToUndockedKeyboardWillShow:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v26, 0xCu);
  }
  *(_QWORD *)&v7 = objc_opt_class(NSValue, v6).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", UIKeyboardFrameBeginUserInfoKey));
  v12 = sub_100221D0C(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  *(_QWORD *)&v15 = objc_opt_class(NSValue, v14).n128_u64[0];
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo", v15));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  v20 = sub_100221D0C(v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v22 = 0;
  if (v13)
  {
    if (v21)
    {
      objc_msgSend(v13, "CGRectValue");
      Height = CGRectGetHeight(v28);
      objc_msgSend(v21, "CGRectValue");
      v24 = CGRectGetHeight(v29);
      v22 = 0;
      if (Height > 0.0 && v24 > 0.0)
      {
        if (Height == v24 || vabdd_f64(Height, v24) < 0.00999999978)
        {
          objc_msgSend(v21, "CGRectValue");
          v22 = -[CRLiOSKeyboardMonitor p_isFrameCorrespondingToUndockedKeyboard:](self, "p_isFrameCorrespondingToUndockedKeyboard:");
        }
        else
        {
          v22 = 0;
        }
      }
    }
  }

  return v22;
}

- (BOOL)p_isNotificationCorrespondingToUndockedKeyboardWillHide:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  double Height;
  double v23;
  int v25;
  const char *v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124D048);
  v4 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136315138;
    v26 = "-[CRLiOSKeyboardMonitor p_isNotificationCorrespondingToUndockedKeyboardWillHide:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v25, 0xCu);
  }
  *(_QWORD *)&v6 = objc_opt_class(NSValue, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", UIKeyboardFrameBeginUserInfoKey));
  v11 = sub_100221D0C(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  *(_QWORD *)&v14 = objc_opt_class(NSValue, v13).n128_u64[0];
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo", v14));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  v19 = sub_100221D0C(v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = 0;
  if (v12 && v20)
  {
    objc_msgSend(v12, "CGRectValue");
    Height = CGRectGetHeight(v27);
    objc_msgSend(v20, "CGRectValue");
    v23 = CGRectGetHeight(v28);
    v21 = (Height == 0.0 || vabdd_f64(0.0, Height) < 0.00999999978)
       && (vabdd_f64(0.0, v23) < 0.00999999978 || v23 == 0.0);
  }

  return v21;
}

- (void)p_keyboardWillChangeFrame:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124D068);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CRLiOSKeyboardMonitor p_keyboardWillChangeFrame:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (!self->_keyboardIsAnimatingInOrDocking && !self->_keyboardIsAnimatingOutOrUndocking)
  {
    -[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:", v4);
    self->_undockedKeyboardWillShow = -[CRLiOSKeyboardMonitor p_isNotificationCorrespondingToUndockedKeyboardWillShow:](self, "p_isNotificationCorrespondingToUndockedKeyboardWillShow:", v4);
    self->_undockedKeyboardWillHide = -[CRLiOSKeyboardMonitor p_isNotificationCorrespondingToUndockedKeyboardWillHide:](self, "p_isNotificationCorrespondingToUndockedKeyboardWillHide:", v4);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002C11FC;
    v6[3] = &unk_10124CD68;
    v7 = v4;
    -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);

  }
}

- (void)p_keyboardDidChangeFrame:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL8 v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;

  v4 = a3;
  if (qword_10147E498 != -1)
    dispatch_once(&qword_10147E498, &stru_10124D088);
  v5 = off_1013D9198;
  if (os_log_type_enabled((os_log_t)off_1013D9198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CRLiOSKeyboardMonitor p_keyboardDidChangeFrame:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (!self->_keyboardIsAnimatingInOrDocking && !self->_keyboardIsAnimatingOutOrUndocking)
  {
    -[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:", v4);
    *(_WORD *)&self->_undockedKeyboardWillShow = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002C13F0;
    v7[3] = &unk_10124CD68;
    v8 = v4;
    -[CRLiOSKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v7);
    v6 = self->_keyboardFrame.size.height > 0.0 || self->_keyboardFrame.size.width > 0.0;
    -[CRLiOSKeyboardMonitor p_performAnimationCompletionBlocksWithVisible:](self, "p_performAnimationCompletionBlocksWithVisible:", v6);

  }
}

- (BOOL)keyboardIsAnimatingInOrDocking
{
  return self->_keyboardIsAnimatingInOrDocking;
}

- (void)setKeyboardIsAnimatingInOrDocking:(BOOL)a3
{
  self->_keyboardIsAnimatingInOrDocking = a3;
}

- (BOOL)keyboardIsAnimatingOutOrUndocking
{
  return self->_keyboardIsAnimatingOutOrUndocking;
}

- (BOOL)undockedKeyboardWillShow
{
  return self->_undockedKeyboardWillShow;
}

- (BOOL)undockedKeyboardWillHide
{
  return self->_undockedKeyboardWillHide;
}

- (BOOL)isLocalKeyboard
{
  return self->_isLocalKeyboard;
}

- (double)onScreenHeight
{
  return self->_onScreenHeight;
}

- (CGRect)keyboardFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_keyboardFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)keyboardAnimationDuration
{
  return self->_keyboardAnimationDuration;
}

- (NSPointerArray)keyboardObservers
{
  return self->_keyboardObservers;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (NSTimer)keyboardIsAnimatingInTimer
{
  return self->_keyboardIsAnimatingInTimer;
}

- (void)setKeyboardIsAnimatingInTimer:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardIsAnimatingInTimer, a3);
}

- (NSHashTable)modalKeyboardObservers
{
  return self->_modalKeyboardObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalKeyboardObservers, 0);
  objc_storeStrong((id *)&self->_keyboardIsAnimatingInTimer, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_keyboardObservers, 0);
}

@end
