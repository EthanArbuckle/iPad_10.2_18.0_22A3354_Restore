@implementation __UISystemGestureManager

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7;

  if (self->_pendingSwipeGesture == a3 || self->_catchEdgeSwipeFailureGesture == a3 || self->_directTouchGesture == a3)
    return 1;
  -[__UISystemGestureManager exclusiveTouchGesture](self, "exclusiveTouchGesture");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != a3)
    return 0;
  if (-[NSMutableSet containsObject:](self->_externalGestures, "containsObject:", a4))
    return objc_msgSend(a4, "_recognitionEvent") != 1;
  return -[NSMutableSet containsObject:](self->_internalGestures, "containsObject:", a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[__UISystemGestureManager exclusiveTouchGesture](self, "exclusiveTouchGesture");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == a3)
  {
    v8 = -[NSMutableSet containsObject:](self->_externalGestures, "containsObject:", a4);

    if (v8 && objc_msgSend(a4, "_recognitionEvent") == 1)
    {
      if (_UIApplicationProcessIsCarousel() && _UIGetLogMoarUISystemGestureLogsForCarousel())
      {
        _systemGestureLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(a3, "_briefDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a4, "_briefDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543618;
          v18 = v10;
          v19 = 2114;
          v20 = v11;
          v12 = "shouldRequireFailureOfGestureRecognizer: YES exclusive touch and FirstTouchDown: gestureRecognizer: %{pu"
                "blic}@; otherGestureRecognizer: %{public}@";
LABEL_15:
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, 0x16u);

        }
LABEL_16:
        v13 = 1;
        goto LABEL_22;
      }
      return 1;
    }
  }
  else
  {

  }
  if (self->_catchEdgeSwipeFailureGesture == a3
    && -[NSMutableSet containsObject:](self->_externalEdgeSwipeGestures, "containsObject:", a4))
  {
    if (_UIApplicationProcessIsCarousel() && _UIGetLogMoarUISystemGestureLogsForCarousel())
    {
      _systemGestureLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "_briefDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a4, "_briefDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = v11;
        v12 = "shouldRequireFailureOfGestureRecognizer: YES edge swipes: gestureRecognizer: %{public}@; otherGestureRecog"
              "nizer: %{public}@";
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    return 1;
  }
  if (!_UIApplicationProcessIsCarousel() || !_UIGetLogMoarUISystemGestureLogsForCarousel())
    return 0;
  _systemGestureLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a3, "_briefDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a4, "_briefDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v14;
    v19 = 2114;
    v20 = v15;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "shouldRequireFailureOfGestureRecognizer: NO default: gestureRecognizer: %{public}@; otherGestureRecognizer: %{public}@",
      (uint8_t *)&v17,
      0x16u);

  }
  v13 = 0;
LABEL_22:

  return v13;
}

- (UIGestureRecognizer)exclusiveTouchGesture
{
  return self->_exclusiveTouchGesture;
}

- (void)setAchievedMaximumMovement:(BOOL)a3
{
  self->_achievedMaximumMovement = a3;
}

- (void)exclusiveTouchGestureRecognizer:(id)a3 achievedMaximumAbsoluteAccumulatedMovement:(BOOL)a4 timestamp:(double)a5
{
  if (a4)
    BSRunLoopPerformRelativeToCACommit();
  else
    -[__UISystemGestureManager setAchievedMaximumMovement:](self, "setAchievedMaximumMovement:", 0, a5);
}

- (void)_exclusiveTouchGestureChanged:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  BKSTouchStream *touchStream;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const __CFString *v12;
  int v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend(a3, "state"))
  {
    case 1:
      -[NSMutableSet addObject:](self->_recognizingGestures, "addObject:", a3);
      kdebug_trace();
      if (-[NSMutableSet count](self->_recognizingGestures, "count") == 1)
      {
        v5 = -[__UISystemGestureManager _dispatchModeForExternalGestureCompletion](self, "_dispatchModeForExternalGestureCompletion");
        _systemGestureLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          if (v5 > 3)
            v12 = CFSTR("<unknown>");
          else
            v12 = off_1E16C9418[(char)v5];
          v14 = 138543362;
          v15 = v12;
          _os_log_debug_impl(&dword_185066000, v6, OS_LOG_TYPE_DEBUG, "Exclusive touch began -- moving to dispatch mode:%{public}@", (uint8_t *)&v14, 0xCu);
        }

        touchStream = self->_touchStream;
        objc_msgSend(a3, "lastTouchTimestamp");
        -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", v5, 2);
      }
      else
      {
        _systemGestureLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v13 = -[NSMutableSet count](self->_recognizingGestures, "count");
          v14 = 67109120;
          LODWORD(v15) = v13;
          _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, "Exclusive touch began, with %d simultaneous gesture(s)", (uint8_t *)&v14, 8u);
        }

      }
      self->_didSeeExclusiveTouchBegan = 1;
      return;
    case 3:
      _systemGestureLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      LOWORD(v14) = 0;
      v10 = "Exclusive touch ended";
      break;
    case 4:
      _systemGestureLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      LOWORD(v14) = 0;
      v10 = "Exclusive touch cancelled";
      break;
    case 5:
      _systemGestureLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      LOWORD(v14) = 0;
      v10 = "Exclusive touch failed";
      break;
    default:
      _systemGestureLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v14 = 67109120;
        LODWORD(v15) = objc_msgSend(a3, "state");
        _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "Exclusive touch ignored state:%d", (uint8_t *)&v14, 8u);
      }

      return;
  }
  _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 2u);
LABEL_13:

  -[__UISystemGestureManager _exclusiveTouchGestureDidTerminate:](self, "_exclusiveTouchGestureDidTerminate:", a3);
}

- (void)_exclusiveTouchGestureDidTerminate:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  BKSTouchStream *touchStream;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet removeObject:](self->_recognizingGestures, "removeObject:");
  if (!self->_didSeeExclusiveTouchBegan)
  {
    v5 = -[__UISystemGestureManager _dispatchModeForExternalGestureCompletion](self, "_dispatchModeForExternalGestureCompletion");
    _systemGestureLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v5 > 3)
        v7 = CFSTR("<unknown>");
      else
        v7 = off_1E16C9418[(char)v5];
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_INFO, ">>>>> Exclusive touch terminated without .Began, posting remedial state dispatch mode change:%{public}@", (uint8_t *)&v9, 0xCu);
    }

    touchStream = self->_touchStream;
    objc_msgSend(a3, "lastTouchTimestamp");
    -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", v5, 2);
  }
  self->_didSeeExclusiveTouchBegan = 0;
}

- (unsigned)_dispatchModeForExternalGestureCompletion
{
  if (-[NSMutableSet count](self->_externalEdgeSwipeGestures, "count"))
    return 2;
  else
    return 1;
}

- (void)_directTouchDown:(id)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  UIGestureRecognizer *exclusiveTouchGesture;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_recognizingGestures;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138412290;
    v21 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        if (-[NSMutableSet containsObject:](self->_externalGestures, "containsObject:", v10, v21, (_QWORD)v22))
        {
          _systemGestureLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "name");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (!v16)
              v16 = objc_opt_class();
            *(_DWORD *)buf = v21;
            v27 = v16;
            _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, "check recognizing %@", buf, 0xCu);

          }
          objc_msgSend(v10, "allowedTouchTypes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "containsObject:", &unk_1E1A97CC8))
          {
            if (v10)
            {
              v13 = v10[9] - 1;

              if (v13 < 3)
                goto LABEL_19;
            }
            else
            {

            }
            _systemGestureLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v10, "name");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)v18;
              if (!v18)
                v18 = objc_opt_class();
              *(_DWORD *)buf = v21;
              v27 = v18;
              _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "CANCEL indirect %@", buf, 0xCu);

            }
            if (v10 && (v10[1] & 0x200000000) != 0)
              objc_msgSend(v10, "setState:", 5);
            exclusiveTouchGesture = self->_exclusiveTouchGesture;
            if (exclusiveTouchGesture && (*(_QWORD *)&exclusiveTouchGesture->_gestureFlags & 0x200000000) != 0)
              -[UIGestureRecognizer setState:](exclusiveTouchGesture, "setState:", 5);
          }
          else
          {

          }
        }
LABEL_19:
        ++v9;
      }
      while (v7 != v9);
      v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      v7 = v20;
    }
    while (v20);
  }

}

- (void)_externalGestureRecognizerChanged:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  BKSTouchStream *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSMutableSet *externalGestures;
  id v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  BKSTouchStream *v26;
  BKSTouchStream *touchStream;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a3, "_recognitionEvent");
  if (v6 != 2)
  {
    v7 = v6;
    switch(objc_msgSend(a3, "state"))
    {
      case 1:
        kdebug_trace();
        -[NSMutableSet addObject:](self->_recognizingGestures, "addObject:", a3);
        v8 = objc_msgSend(a3, "cancelsTouchesInView");
        _systemGestureLog();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v10)
          {
            objc_msgSend(a3, "name");
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v37;
            if (!v37)
              v37 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v48 = v37;
            _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "EX %{public}@ began & stealing touches", buf, 0xCu);

          }
          v11 = v7 == 3;
          v12 = 3;
        }
        else
        {
          if (v10)
          {
            objc_msgSend(a3, "name");
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)v39;
            if (!v39)
              v39 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v48 = v39;
            _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "EX %{public}@ began & also allowing touches to reach app", buf, 0xCu);

          }
          v11 = 2;
          v12 = 2;
        }
        touchStream = self->_touchStream;
        objc_msgSend(a3, "lastTouchTimestamp");
        v16 = touchStream;
        v18 = v12;
        v19 = v11;
        goto LABEL_23;
      case 2:
        _systemGestureLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a3, "name");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          if (!v28)
            v28 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v48 = v28;
          _os_log_debug_impl(&dword_185066000, v13, OS_LOG_TYPE_DEBUG, "EX changed %{public}@", buf, 0xCu);

        }
        break;
      case 3:
        kdebug_trace();
        _systemGestureLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a3, "name");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (!v30)
            v30 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v48 = v30;
          _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "EX ended %{public}@", buf, 0xCu);

        }
        goto LABEL_12;
      case 4:
        _systemGestureLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a3, "name");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (!v32)
            v32 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v48 = v32;
          _os_log_debug_impl(&dword_185066000, v15, OS_LOG_TYPE_DEBUG, "EX cancelled %{public}@", buf, 0xCu);

        }
        kdebug_trace();
LABEL_12:
        -[NSMutableSet removeObject:](self->_recognizingGestures, "removeObject:", a3);
        v16 = self->_touchStream;
        v17 = 0.0;
        v18 = 2;
        v19 = 2;
LABEL_23:
        -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](v16, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", v18, v19, v17);
        break;
      case 5:
        _systemGestureLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a3, "name");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          if (!v34)
            v34 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v48 = v34;
          _os_log_debug_impl(&dword_185066000, v20, OS_LOG_TYPE_DEBUG, "EX failed %{public}@", buf, 0xCu);

        }
        kdebug_trace();
        -[NSMutableSet removeObject:](self->_recognizingGestures, "removeObject:", a3);
        externalGestures = self->_externalGestures;
        v41 = MEMORY[0x1E0C809B0];
        v42 = 3221225472;
        v43 = __62____UISystemGestureManager__externalGestureRecognizerChanged___block_invoke;
        v44 = &unk_1E16C9368;
        v45 = a3;
        v22 = v5;
        v46 = v22;
        -[NSMutableSet enumerateObjectsUsingBlock:](externalGestures, "enumerateObjectsUsingBlock:", &v41);
        _systemGestureLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v48 = (uint64_t)v22;
          _os_log_debug_impl(&dword_185066000, v23, OS_LOG_TYPE_DEBUG, "EX remaining possible: %{public}@", buf, 0xCu);
        }

        if (objc_msgSend(v22, "count", v41, v42, v43, v44, v45))
        {
          v24 = -[__UISystemGestureManager _dispatchModeForExternalGestureCompletion](self, "_dispatchModeForExternalGestureCompletion");
          _systemGestureLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            if (v24 > 3)
              v36 = CFSTR("<unknown>");
            else
              v36 = off_1E16C9418[(char)v24];
            *(_DWORD *)buf = 138543362;
            v48 = (uint64_t)v36;
            _os_log_debug_impl(&dword_185066000, v25, OS_LOG_TYPE_DEBUG, "External recognizer failed -- moving to dispatch mode:%{public}@", buf, 0xCu);
          }

          v26 = self->_touchStream;
          if (v7 == 3)
            -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](v26, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", v24, 2, 0.0);
          else
            -[BKSTouchStream setEventDispatchMode:lastTouchTimestamp:](v26, "setEventDispatchMode:lastTouchTimestamp:", v24, 0.0);
        }

        break;
      default:
        break;
    }
  }

}

- (__UISystemGestureManager)initWithDisplayIdentity:(id)a3
{
  __UISystemGestureManager *v5;
  uint64_t v6;
  FBSDisplayIdentity *displayIdentity;
  void *v8;
  uint64_t v9;
  _UISystemGestureWindow *v10;
  _UISystemGestureWindow *systemGestureWindow;
  NSMutableSet *v12;
  NSMutableSet *recognizingGestures;
  NSMutableSet *v14;
  NSMutableSet *internalGestures;
  NSMutableSet *v16;
  NSMutableSet *externalGestures;
  NSMutableSet *v18;
  NSMutableSet *externalEdgeSwipeGestures;
  _UIExclusiveTouchGestureRecognizer *v20;
  void *v21;
  void *v22;
  _UIPendingEdgeSwipeGestureRecognizer *v23;
  UIImmediateEdgeSwipeGestureRecognizer *v24;
  _UIDirectTouchObserverGestureRecognizer *v25;
  id v26;
  void *v27;
  uint64_t v28;
  BSInvalidatable *stateCaptureToken;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id from;
  id v39;
  id v40;
  id location;
  objc_super v42;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UISystemGestureManager.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  v42.receiver = self;
  v42.super_class = (Class)__UISystemGestureManager;
  v5 = -[__UISystemGestureManager init](&v42, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(a3, "copy");
    displayIdentity = v5->_displayIdentity;
    v5->_displayIdentity = (FBSDisplayIdentity *)v6;

    +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v5->_displayIdentity);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v9;
    v10 = -[_UISystemGestureWindow initWithDisplayConfiguration:]([_UISystemGestureWindow alloc], "initWithDisplayConfiguration:", v9);
    systemGestureWindow = v5->_systemGestureWindow;
    v5->_systemGestureWindow = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    recognizingGestures = v5->_recognizingGestures;
    v5->_recognizingGestures = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    internalGestures = v5->_internalGestures;
    v5->_internalGestures = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    externalGestures = v5->_externalGestures;
    v5->_externalGestures = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    externalEdgeSwipeGestures = v5->_externalEdgeSwipeGestures;
    v5->_externalEdgeSwipeGestures = v18;

    v20 = objc_alloc_init(_UIExclusiveTouchGestureRecognizer);
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v20, "_setRequiresSystemGesturesToFail:", 0);
    -[UIGestureRecognizer setRequiresExclusiveTouchType:](v20, "setRequiresExclusiveTouchType:", 0);
    -[UIGestureRecognizer allowedTouchTypes](v20, "allowedTouchTypes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v22, "removeObject:", &unk_1E1A97CC8);
    -[UIGestureRecognizer setAllowedTouchTypes:](v20, "setAllowedTouchTypes:", v22);
    -[UIGestureRecognizer addTarget:action:](v20, "addTarget:action:", v5, sel__exclusiveTouchGestureChanged_);
    -[UIGestureRecognizer setDelegate:](v20, "setDelegate:", v5);
    -[_UIExclusiveTouchGestureRecognizer setMaximumAbsoluteAccumulatedMovement:](v20, "setMaximumAbsoluteAccumulatedMovement:", 10.0, 10.0);
    -[__UISystemGestureManager setExclusiveTouchGesture:](v5, "setExclusiveTouchGesture:", v20);
    -[NSMutableSet addObject:](v5->_internalGestures, "addObject:", v20);
    v23 = objc_alloc_init(_UIPendingEdgeSwipeGestureRecognizer);
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v23, "_setRequiresSystemGesturesToFail:", 0);
    -[UIGestureRecognizer setRequiresExclusiveTouchType:](v23, "setRequiresExclusiveTouchType:", 0);
    -[UIGestureRecognizer addTarget:action:](v23, "addTarget:action:", v5, sel__pendingSwipeGestureChanged_);
    -[UIGestureRecognizer setDelegate:](v23, "setDelegate:", v5);
    -[__UISystemGestureManager setPendingSwipeGesture:](v5, "setPendingSwipeGesture:", v23);
    -[NSMutableSet addObject:](v5->_internalGestures, "addObject:", v23);
    v24 = objc_alloc_init(UIImmediateEdgeSwipeGestureRecognizer);
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v24, "_setRequiresSystemGesturesToFail:", 0);
    -[UIGestureRecognizer setRequiresExclusiveTouchType:](v24, "setRequiresExclusiveTouchType:", 0);
    -[UIGestureRecognizer addTarget:action:](v24, "addTarget:action:", v5, sel__catchSwipeFailureGestureChanged_);
    -[UIGestureRecognizer setDelegate:](v24, "setDelegate:", v5);
    -[__UISystemGestureManager setCatchEdgeSwipeFailureGesture:](v5, "setCatchEdgeSwipeFailureGesture:", v24);
    -[NSMutableSet addObject:](v5->_internalGestures, "addObject:", v24);
    v25 = objc_alloc_init(_UIDirectTouchObserverGestureRecognizer);
    -[UIGestureRecognizer setAllowedTouchTypes:](v25, "setAllowedTouchTypes:", &unk_1E1A93560);
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v25, "_setRequiresSystemGesturesToFail:", 0);
    -[UIGestureRecognizer setRequiresExclusiveTouchType:](v25, "setRequiresExclusiveTouchType:", 0);
    -[UIGestureRecognizer setDelegate:](v25, "setDelegate:", v5);
    -[UIGestureRecognizer addTarget:action:](v25, "addTarget:action:", v5, sel__directTouchDown_);
    -[__UISystemGestureManager setDirectTouchGesture:](v5, "setDirectTouchGesture:", v25);
    -[NSMutableSet addObject:](v5->_internalGestures, "addObject:", v25);
    -[UIGestureRecognizer setEnabled:](v24, "setEnabled:", 0);
    -[UIGestureRecognizer setEnabled:](v23, "setEnabled:", 0);
    objc_initWeak(&location, v5->_internalGestures);
    objc_initWeak(&v40, v5->_externalGestures);
    objc_initWeak(&v39, v5->_externalEdgeSwipeGestures);
    objc_initWeak(&from, v5->_systemGestureWindow);
    v26 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIKit - SystemGestureState - %@"), a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v34, &from);
    objc_copyWeak(&v35, &location);
    objc_copyWeak(&v36, &v40);
    objc_copyWeak(&v37, &v39);
    BSLogAddStateCaptureBlockWithTitle();
    v28 = objc_claimAutoreleasedReturnValue();
    stateCaptureToken = v5->_stateCaptureToken;
    v5->_stateCaptureToken = (BSInvalidatable *)v28;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (void)_addInternalGesturesToView:(id)a3
{
  NSMutableSet *internalGestures;
  _QWORD v4[5];

  internalGestures = self->_internalGestures;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55____UISystemGestureManager__addInternalGesturesToView___block_invoke;
  v4[3] = &unk_1E16C93D8;
  v4[4] = a3;
  -[NSMutableSet enumerateObjectsUsingBlock:](internalGestures, "enumerateObjectsUsingBlock:", v4);
}

- (void)_removeInternalGestures
{
  NSMutableSet *internalGestures;
  _QWORD v3[5];

  internalGestures = self->_internalGestures;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51____UISystemGestureManager__removeInternalGestures__block_invoke;
  v3[3] = &unk_1E16C93D8;
  v3[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](internalGestures, "enumerateObjectsUsingBlock:", v3);
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  -[__UISystemGestureManager _removeInternalGestures](self, "_removeInternalGestures");
  -[BKSTouchStream invalidate](self->_touchStream, "invalidate");
  -[UIWindow setWindowScene:](self->_systemGestureWindow, "setWindowScene:", 0);
  v3.receiver = self;
  v3.super_class = (Class)__UISystemGestureManager;
  -[__UISystemGestureManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__UISystemGestureManager;
  -[__UISystemGestureManager description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("displayIdentity = %@\n"), self->_displayIdentity);
  objc_msgSend(v4, "appendFormat:", CFSTR("internalGestures = %@\n"), self->_internalGestures);
  objc_msgSend(v4, "appendFormat:", CFSTR("externalGestures = %@\n"), self->_externalGestures);
  objc_msgSend(v4, "appendFormat:", CFSTR("externalEdgeSwipeGestures = %@\n"), self->_externalEdgeSwipeGestures);
  objc_msgSend(v4, "appendFormat:", CFSTR("recognizingGestures = %@\n"), self->_recognizingGestures);
  return (NSString *)v4;
}

- (NSSet)gestureRecognizers
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_externalGestures, "copy");
}

- (void)addGestureRecognizer:(id)a3 recognitionEvent:(int64_t)a4
{
  _UISystemGestureWindow *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  FBSDisplayIdentity *displayIdentity;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UISystemGestureManager.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recognitionEvent != _UISystemGestureRecognitionEventUnknown"));

  }
  v8 = self->_systemGestureWindow;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UISystemGestureManager.m"), 309, CFSTR("failed to find a rootWindow for displayIdentity=%@"), self->_displayIdentity);

  }
  -[_UISystemGestureWindow _systemGestureView](v8, "_systemGestureView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIApplicationProcessIsCarousel() && _UIGetLogMoarUISystemGestureLogsForCarousel())
  {
    _systemGestureLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a3, "_briefDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if ((unint64_t)a4 > 3)
        v13 = "<nil>";
      else
        v13 = off_1E16C93F8[a4];
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2082;
      v29 = v13;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Adding gesture to system gesture manager: %{public}@; with recognition event: %{public}s",
        buf,
        0x16u);

    }
  }
  if (!-[NSMutableSet count](self->_externalGestures, "count"))
  {
    +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", self->_displayIdentity);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      displayIdentity = self->_displayIdentity;
      +[UIScreen _screens]();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UISystemGestureManager.m"), 318, CFSTR("failed to find the hardwareIdentifier for displayIdentity=%@ -> displays=%@"), displayIdentity, v25);

    }
    v16 = objc_alloc_init(MEMORY[0x1E0D00DD0]);
    v17 = objc_alloc(MEMORY[0x1E0D00E20]);
    v18 = -[UIWindow _contextId](v8, "_contextId");
    objc_msgSend(v15, "hardwareIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithContextID:displayUUID:identifier:policy:", v18, v19, 1, v16);

    -[__UISystemGestureManager setTouchStream:](self, "setTouchStream:", v20);
    -[__UISystemGestureManager _addInternalGesturesToView:](self, "_addInternalGesturesToView:", v9);

  }
  objc_msgSend(a3, "_setRecognitionEvent:", a4);
  if (a4 == 3)
  {
    -[NSMutableSet addObject:](self->_externalEdgeSwipeGestures, "addObject:", a3);
    -[UIGestureRecognizer setEnabled:](self->_catchEdgeSwipeFailureGesture, "setEnabled:", 1);
    -[UIGestureRecognizer setEnabled:](self->_pendingSwipeGesture, "setEnabled:", 1);
  }
  -[NSMutableSet addObject:](self->_externalGestures, "addObject:", a3);
  objc_msgSend(a3, "addTarget:action:", self, sel__externalGestureRecognizerChanged_);
  objc_msgSend(a3, "_setRequiresSystemGesturesToFail:", 0);
  objc_msgSend(v9, "addGestureRecognizer:", a3);

}

- (void)addGestureRecognizer:(id)a3
{
  uint64_t v5;

  if (objc_msgSend(a3, "_isTouchGestureRecognizer"))
    v5 = 1;
  else
    v5 = 2;
  -[__UISystemGestureManager addGestureRecognizer:recognitionEvent:](self, "addGestureRecognizer:recognitionEvent:", a3, v5);
}

- (void)removeGestureRecognizer:(id)a3
{
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  v5 = -[NSMutableSet count](self->_externalGestures, "count");
  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", a3);

  objc_msgSend(a3, "removeTarget:action:", self, 0);
  -[NSMutableSet removeObject:](self->_externalGestures, "removeObject:", a3);
  -[NSMutableSet removeObject:](self->_externalEdgeSwipeGestures, "removeObject:", a3);
  -[NSMutableSet removeObject:](self->_recognizingGestures, "removeObject:", a3);
  v7 = -[NSMutableSet count](self->_externalEdgeSwipeGestures, "count") != 0;
  -[UIGestureRecognizer setEnabled:](self->_catchEdgeSwipeFailureGesture, "setEnabled:", v7);
  -[UIGestureRecognizer setEnabled:](self->_pendingSwipeGesture, "setEnabled:", v7);
  if (!-[NSMutableSet count](self->_externalGestures, "count"))
  {
    if (v5)
    {
      -[BKSTouchStream invalidate](self->_touchStream, "invalidate");
      -[__UISystemGestureManager setTouchStream:](self, "setTouchStream:", 0);
      -[__UISystemGestureManager _removeInternalGestures](self, "_removeInternalGestures");
    }
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  _UISystemGestureWindow *v6;
  void *v7;
  __int128 v8;
  void *v9;
  _OWORD v10[3];

  v6 = self->_systemGestureWindow;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UISystemGestureManager.m"), 376, CFSTR("failed to find a rootWindow for displayIdentity=%@, cannot set transform"), self->_displayIdentity);

  }
  -[_UISystemGestureWindow _systemGestureView](v6, "_systemGestureView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v7, "setTransform:", v10);

}

- (void)clearTransform
{
  _UISystemGestureWindow *v4;
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v8[3];

  v4 = self->_systemGestureWindow;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UISystemGestureManager.m"), 381, CFSTR("failed to find a rootWindow for displayIdentity=%@, cannot remove transform"), self->_displayIdentity);

  }
  -[_UISystemGestureWindow _systemGestureView](v4, "_systemGestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "setTransform:", v8);

}

- (id)windowForSystemGestures
{
  return self->_systemGestureWindow;
}

- (void)_failedPendingSwipe
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[UIGestureRecognizer isEnabled](self->_pendingSwipeGesture, "isEnabled");
  _systemGestureLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      v6 = !self->_didProcessPendingSwipeBegan;
      v8 = 67109120;
      v9 = v6;
      _os_log_debug_impl(&dword_185066000, v4, OS_LOG_TYPE_DEBUG, "Caught edge swipe gesture failure (early:%{BOOL}u)", (uint8_t *)&v8, 8u);
    }

    -[UIGestureRecognizer setEnabled:](self->_pendingSwipeGesture, "setEnabled:", 0);
    -[UIGestureRecognizer setEnabled:](self->_pendingSwipeGesture, "setEnabled:", 1);
  }
  else
  {
    if (v5)
    {
      v7 = !self->_didProcessPendingSwipeBegan;
      v8 = 67109120;
      v9 = v7;
      _os_log_debug_impl(&dword_185066000, v4, OS_LOG_TYPE_DEBUG, "Caught edge swipe gesture failure (early:%{BOOL}u), but we already disabled _pendingSwipeGesture", (uint8_t *)&v8, 8u);
    }

  }
}

- (void)_pendingSwipeGestureDidBegin:(id)a3
{
  NSObject *v5;
  BKSTouchStream *touchStream;
  uint8_t v7[16];

  if (!self->_didProcessPendingSwipeBegan)
  {
    self->_didProcessPendingSwipeBegan = 1;
    _systemGestureLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "Pending swipe began -- moving to send / defer", v7, 2u);
    }

    -[NSMutableSet addObject:](self->_recognizingGestures, "addObject:", a3);
    kdebug_trace();
    touchStream = self->_touchStream;
    objc_msgSend(a3, "lastTouchTimestamp");
    -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", 2, 1);
  }
}

- (void)_pendingSwipeGestureDidTerminate:(id)a3
{
  NSObject *v5;
  BKSTouchStream *touchStream;
  uint8_t v7[16];

  if (self->_didProcessPendingSwipeBegan)
  {
    self->_didProcessPendingSwipeBegan = 0;
    _systemGestureLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "Pending swipe terminate -- moving to send / process", v7, 2u);
    }

    touchStream = self->_touchStream;
    objc_msgSend(a3, "lastTouchTimestamp");
    -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", 2, 2);
    if (a3)
      -[NSMutableSet removeObject:](self->_recognizingGestures, "removeObject:", a3);
  }
}

- (void)_pendingSwipeGestureChanged:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend(a3, "state"))
  {
    case 1:
      -[__UISystemGestureManager _pendingSwipeGestureDidBegin:](self, "_pendingSwipeGestureDidBegin:", a3);
      return;
    case 3:
      _systemGestureLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      LOWORD(v8[0]) = 0;
      v7 = "Pending swipe ended";
      break;
    case 4:
      _systemGestureLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      LOWORD(v8[0]) = 0;
      v7 = "Pending swipe cancelled";
      break;
    case 5:
      _systemGestureLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      LOWORD(v8[0]) = 0;
      v7 = "Pending swipe failed";
      break;
    default:
      _systemGestureLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v8[0] = 67109120;
        v8[1] = objc_msgSend(a3, "state");
        _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "Pending swipe ignored state:%d", (uint8_t *)v8, 8u);
      }

      return;
  }
  _os_log_debug_impl(&dword_185066000, v6, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)v8, 2u);
LABEL_11:

  -[__UISystemGestureManager _pendingSwipeGestureDidTerminate:](self, "_pendingSwipeGestureDidTerminate:", a3);
}

- (void)_catchSwipeFailureGestureChanged:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[__UISystemGestureManager _failedPendingSwipe](self, "_failedPendingSwipe");
}

- (void)_handleTooMuchMovementWithLastTouchTimestamp:(double)a3
{
  void *v5;
  NSMutableSet *recognizingGestures;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_recognizingGestures, "count"))
  {
    v5 = (void *)objc_opt_new();
    recognizingGestures = self->_recognizingGestures;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke;
    v11[3] = &unk_1E16C9390;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v7, "appendCollection:withName:itemBlock:", recognizingGestures, 0, v11);
    _systemGestureLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "UIKit magic hysteresis reached. Gestures still recognizing: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    kdebug_trace();
    _systemGestureLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "UIKit magic hysteresis reached with no gestures still recognizing. Moving to send/process.", buf, 2u);
    }

    -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](self->_touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", 2, 2, a3);
  }
}

- (void)setExclusiveTouchGesture:(id)a3
{
  objc_storeStrong((id *)&self->_exclusiveTouchGesture, a3);
}

- (UIGestureRecognizer)pendingSwipeGesture
{
  return self->_pendingSwipeGesture;
}

- (void)setPendingSwipeGesture:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSwipeGesture, a3);
}

- (UIGestureRecognizer)catchEdgeSwipeFailureGesture
{
  return self->_catchEdgeSwipeFailureGesture;
}

- (void)setCatchEdgeSwipeFailureGesture:(id)a3
{
  objc_storeStrong((id *)&self->_catchEdgeSwipeFailureGesture, a3);
}

- (UIGestureRecognizer)directTouchGesture
{
  return self->_directTouchGesture;
}

- (void)setDirectTouchGesture:(id)a3
{
  objc_storeStrong((id *)&self->_directTouchGesture, a3);
}

- (BOOL)achievedMaximumMovement
{
  return self->_achievedMaximumMovement;
}

- (BOOL)didSeeExclusiveTouchBegan
{
  return self->_didSeeExclusiveTouchBegan;
}

- (void)setDidSeeExclusiveTouchBegan:(BOOL)a3
{
  self->_didSeeExclusiveTouchBegan = a3;
}

- (BOOL)didProcessPendingSwipeBegan
{
  return self->_didProcessPendingSwipeBegan;
}

- (void)setDidProcessPendingSwipeBegan:(BOOL)a3
{
  self->_didProcessPendingSwipeBegan = a3;
}

- (BKSTouchStream)touchStream
{
  return self->_touchStream;
}

- (void)setTouchStream:(id)a3
{
  objc_storeStrong((id *)&self->_touchStream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchStream, 0);
  objc_storeStrong((id *)&self->_directTouchGesture, 0);
  objc_storeStrong((id *)&self->_catchEdgeSwipeFailureGesture, 0);
  objc_storeStrong((id *)&self->_pendingSwipeGesture, 0);
  objc_storeStrong((id *)&self->_exclusiveTouchGesture, 0);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_externalGestures, 0);
  objc_storeStrong((id *)&self->_internalGestures, 0);
  objc_storeStrong((id *)&self->_externalEdgeSwipeGestures, 0);
  objc_storeStrong((id *)&self->_recognizingGestures, 0);
  objc_storeStrong((id *)&self->_systemGestureWindow, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end
