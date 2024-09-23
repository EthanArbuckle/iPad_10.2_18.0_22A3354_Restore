@implementation _UIAnalyticsTouchesSession

- (_UIAnalyticsTouchesSession)init
{
  _UIAnalyticsTouchesSession *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIAnalyticsTouchesSession;
  result = -[_UIAnalyticsTouchesSession init](&v3, sel_init);
  if (result)
    result->_valid = 1;
  return result;
}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _WORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  int multitouchDetected;
  const char *v26;
  __CFString *v27;
  NSObject *v28;
  unint64_t v29;
  NSObject *v30;
  uint64_t v31;
  char *v32;
  int v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  _UIAnalyticsTouchesSession *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  unint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_valid)
  {
    _uiMultitouchAnalyticsLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v41 = self;
      _os_log_error_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Analytics session %p: Session is no longer valid. Ignoring event.", buf, 0xCu);
    }
    goto LABEL_36;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "allTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (!v7)
  {

    if (!self->_touchesDetected)
      goto LABEL_70;
    self->_valid = 0;
    goto LABEL_48;
  }
  v8 = v7;
  v35 = v5;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v37;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(v6);
      v15 = *(_WORD **)(*((_QWORD *)&v36 + 1) + 8 * v14);
      if (!objc_msgSend(v15, "type", v35))
      {
        v16 = objc_msgSend(v15, "phase");
        if (self->_touchesDetected || v16)
        {
          v10 |= v16 == 4;
          if ((unint64_t)(v16 - 5) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_8;
        }
        else
        {
          v12 = 1;
          self->_touchesDetected = 1;
          self->_touchesStartTime = mach_absolute_time();
        }
        ++v9;
        if (v15)
          v17 = !self->_allowedGestureRecognizerHasBegun;
        else
          v17 = 0;
        if (v17 && (v15[118] & 0x400) != 0)
        {
          v11 = 1;
          self->_allowedGestureRecognizerHasBegun = 1;
        }
      }
LABEL_8:
      ++v14;
    }
    while (v8 != v14);
    v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    v8 = v18;
  }
  while (v18);

  if (v9 < 1 || self->_touchesDetected | v12 & 1)
  {
    if ((v12 & 1) != 0)
    {
      _uiMultitouchAnalyticsLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_185066000, v19, OS_LOG_TYPE_DEBUG, "Analytics session %p: Starting to track touches.", buf, 0xCu);
      }

    }
    if (self->_multitouchDetected || v9 < 2)
    {
      v5 = v35;
      if ((v11 & 1) != 0)
        goto LABEL_40;
    }
    else
    {
      _uiMultitouchAnalyticsLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v5 = v35;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_185066000, v20, OS_LOG_TYPE_DEBUG, "Analytics session %p: Multitouch detected.", buf, 0xCu);
      }

      self->_multitouchDetected = 1;
      if ((v11 & 1) == 0)
        goto LABEL_70;
LABEL_40:
      _uiMultitouchAnalyticsLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_185066000, v22, OS_LOG_TYPE_DEBUG, "Analytics session %p: An allowed gesture recognizer has been detected.", buf, 0xCu);
      }

    }
    if (!self->_touchesDetected || v9)
      goto LABEL_70;
    self->_valid = 0;
    if ((v10 & 1) != 0)
    {
      _uiMultitouchAnalyticsLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_185066000, v21, OS_LOG_TYPE_DEBUG, "Analytics session %p: Touches have been cancelled. Ignoring and invalidating session.", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_70;
    }
LABEL_48:
    _uiMultitouchAnalyticsLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v41 = self;
      _os_log_debug_impl(&dword_185066000, v23, OS_LOG_TYPE_DEBUG, "Analytics session %p: All touches have ended. Gathering metrics and ending session.", buf, 0xCu);
    }

    if (qword_1ECD825C0 != -1)
      dispatch_once(&qword_1ECD825C0, &__block_literal_global_31_5);
    v24 = mach_absolute_time();
    multitouchDetected = self->_multitouchDetected;
    if (self->_multitouchDetected)
    {
      if (self->_allowedGestureRecognizerHasBegun)
        multitouchDetected = 1;
      else
        multitouchDetected = 2;
      if (self->_allowedGestureRecognizerHasBegun)
        v26 = "HANDLED";
      else
        v26 = "NONHANDLED";
      if (self->_allowedGestureRecognizerHasBegun)
        v27 = CFSTR("handledMultitouchDuration");
      else
        v27 = CFSTR("nonHandledMultitouchDuration");
    }
    else
    {
      v27 = CFSTR("singleTouchDuration");
      v26 = "SINGLE";
    }
    v29 = (v24 - self->_touchesStartTime) * dword_1ECD825B8 / unk_1ECD825BC / 0xF4240;
    dword_1ECD82590 = multitouchDetected;
    _uiMultitouchAnalyticsLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v41 = self;
      v42 = 2080;
      v43 = v26;
      v44 = 2048;
      v45 = v29;
      _os_log_debug_impl(&dword_185066000, v30, OS_LOG_TYPE_DEBUG, "Analytics session %p: Recording data point: type: %s, duration: %llu ms", buf, 0x20u);
    }

    v31 = dword_1ECD82590;
    *(_QWORD *)&_MergedGlobals_1329[8 * dword_1ECD82590 + 88] += v29;
    v32 = &_MergedGlobals_1329[v31];
    v33 = v32[2]++ + 1;
    if (v33 == 16)
    {
      AnalyticsSendEventLazy();
      v34 = dword_1ECD82590;
      _MergedGlobals_1329[dword_1ECD82590 + 2] = 0;
      *(_QWORD *)&_MergedGlobals_1329[8 * v34 + 88] = 0;

    }
    goto LABEL_70;
  }
  _uiMultitouchAnalyticsLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v41 = self;
    _os_log_error_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Analytics session %p: Missed the beginning of a touch session. Invalidating.", buf, 0xCu);
  }

  self->_valid = 0;
  v5 = v35;
LABEL_70:

}

- (BOOL)isValid
{
  return self->_valid;
}

@end
