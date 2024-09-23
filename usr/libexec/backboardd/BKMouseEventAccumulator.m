@implementation BKMouseEventAccumulator

- (BKMouseEventAccumulator)init
{
  BKMouseEventAccumulator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *eventStateBySenderID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKMouseEventAccumulator;
  v2 = -[BKMouseEventAccumulator init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 4);
    eventStateBySenderID = v2->_eventStateBySenderID;
    v2->_eventStateBySenderID = v3;

    v2->_shouldScrollNaturally = 1;
  }
  return v2;
}

- (BKMouseEventAccumulator)initWithInterpolatedEventTypeMask:(unint64_t)a3 postEventsBlock:(id)a4
{
  id v6;
  BKMouseEventAccumulator *v7;
  BKMouseEventAccumulator *v8;
  id v9;
  id postEventAsyncBlock;

  v6 = a4;
  v7 = -[BKMouseEventAccumulator init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_interpolateEventTypeMask = a3;
    v9 = objc_msgSend(v6, "copy");
    postEventAsyncBlock = v8->_postEventAsyncBlock;
    v8->_postEventAsyncBlock = v9;

  }
  return v8;
}

- (void)dealloc
{
  NSString *v4;
  void *v5;
  NSString *v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BKMouseEventAccumulator *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  if (!self->_isInvalid)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("forgot to invalidate %@"), objc_opt_class(self, a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue(v6);
      v9 = (objc_class *)objc_opt_class(self, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138544642;
      v14 = v7;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("BKMousePointerEventAccumulator.mm");
      v21 = 1024;
      v22 = 723;
      v23 = 2114;
      v24 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    __break(0);
    JUMPOUT(0x10007CC7CLL);
  }
  v12.receiver = self;
  v12.super_class = (Class)BKMouseEventAccumulator;
  -[BKMouseEventAccumulator dealloc](&v12, "dealloc");
}

- (void)invalidate
{
  id postEventAsyncBlock;

  self->_isInvalid = 1;
  postEventAsyncBlock = self->_postEventAsyncBlock;
  self->_postEventAsyncBlock = 0;

}

- (BOOL)isSenderLocked
{
  if (self->_scrollPhaseTracker._eventSender && self->_scrollPhaseTracker._outputPhase
    || self->_translationPhaseTracker._eventSender && self->_translationPhaseTracker._outputPhase
    || self->_rotationPhaseTracker._eventSender && self->_rotationPhaseTracker._outputPhase)
  {
    return 1;
  }
  if (self->_scalePhaseTracker._eventSender)
    return self->_scalePhaseTracker._outputPhase != 0;
  return 0;
}

- (BOOL)_shouldHitTestForGestureBegan
{
  int outputPhase;
  __int16 *v4;
  int v5;
  __int16 *v7;
  int v8;
  __int16 *v10;
  int v11;
  __int16 *v12;
  BOOL v13;
  __int16 v15;

  v15 = 0;
  outputPhase = self->_scrollPhaseTracker._outputPhase;
  if (outputPhase == 1)
  {
    v4 = &v15;
    goto LABEL_9;
  }
  if (outputPhase == 4 || outputPhase == 2)
  {
    v4 = (__int16 *)((char *)&v15 + 1);
LABEL_9:
    *(_BYTE *)v4 = 1;
  }
  v5 = self->_translationPhaseTracker._outputPhase;
  if (v5 == 1)
  {
    v7 = &v15;
    goto LABEL_18;
  }
  if (v5 == 4 || v5 == 2)
  {
    v7 = (__int16 *)((char *)&v15 + 1);
LABEL_18:
    *(_BYTE *)v7 = 1;
  }
  v8 = self->_rotationPhaseTracker._outputPhase;
  if (v8 == 1)
  {
    v10 = &v15;
    goto LABEL_27;
  }
  if (v8 == 4 || v8 == 2)
  {
    v10 = (__int16 *)((char *)&v15 + 1);
LABEL_27:
    *(_BYTE *)v10 = 1;
  }
  v11 = self->_scalePhaseTracker._outputPhase;
  if (v11 == 1)
  {
    v12 = &v15;
  }
  else
  {
    if (v11 != 4 && v11 != 2)
      goto LABEL_34;
    v12 = (__int16 *)((char *)&v15 + 1);
  }
  *(_BYTE *)v12 = 1;
LABEL_34:
  if (HIBYTE(v15))
    v13 = 1;
  else
    v13 = v15 == 0;
  return !v13;
}

- (int64_t)hitTestReason
{
  unsigned int v3;
  unsigned int buttonMask;

  v3 = -[BKMouseEventAccumulator isSenderLocked](self, "isSenderLocked");
  buttonMask = self->_buttonMask;
  if (v3)
  {
    if (buttonMask || !-[BKMouseEventAccumulator _shouldHitTestForGestureBegan](self, "_shouldHitTestForGestureBegan"))
      return 0;
    else
      return 6;
  }
  else if (buttonMask)
  {
    if (self->_previousButtonMask)
    {
      if (self->_shouldUseButtonDownRecenteringBehavior)
        return 3;
      else
        return 0;
    }
    else
    {
      return 2;
    }
  }
  else
  {
    return 1;
  }
}

- (BOOL)scrollPhaseDidChange
{
  return self->_scrollPhaseDidChange;
}

- (unint64_t)eventSequenceStartTimestamp
{
  return self->_eventSequenceStartTimestamp;
}

- (BOOL)buttonMaskDidChange
{
  return self->_buttonMaskDidChange && !self->_shouldUseButtonDownRecenteringBehavior;
}

- (BOOL)touchingPathIndexesDidChange
{
  return self->_touchingPathIndexesDidChange;
}

- (CGPoint)acceleratedRelativePointerPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_pointerAcceleratedDelta.x;
  y = self->_pointerAcceleratedDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)unacceleratedRelativePointerPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_pointerUnacceleratedDelta.x;
  y = self->_pointerUnacceleratedDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)addScrollEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  uint64_t v7;
  unsigned int Phase;
  int64_t discreteScrollGeneration;
  unsigned __int16 v10;
  __int16 v11;
  int64_t v12;
  void (**postEventAsyncBlock)(id, _QWORD *, double);
  uint64_t TimeStamp;
  uint64_t v15;
  uint64_t v16;
  double FloatValue;
  double v18;
  uint64_t Children;
  NSObject *v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  CGFloat v39;
  CGFloat v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  id v52;
  int64_t v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  _BYTE v64[128];

  v45 = a4;
  objc_storeStrong((id *)&self->_mostRecentSender, a4);
  v7 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", v45));
  Phase = IOHIDEventGetPhase(a3);
  kdebug_trace(730468392, Phase, 0, 0, 0);
  discreteScrollGeneration = self->_discreteScrollGeneration;
  self->_discreteScrollGeneration = discreteScrollGeneration + 1;
  v10 = Phase;
  if (!Phase)
  {
    if (v7)
      v11 = *(_WORD *)(v7 + 18);
    else
      LOBYTE(v11) = 0;
    v12 = discreteScrollGeneration + 2;
    self->_discreteScrollGeneration = v12;
    postEventAsyncBlock = (void (**)(id, _QWORD *, double))self->_postEventAsyncBlock;
    if (postEventAsyncBlock)
    {
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100082584;
      v50[3] = &unk_1000ECE90;
      v53 = v12;
      v50[4] = self;
      v51 = (id)v7;
      v52 = v45;
      postEventAsyncBlock[2](postEventAsyncBlock, v50, 0.2);

    }
    if ((v11 & 3) != 0)
      v10 = 2;
    else
      v10 = 1;
  }
  if (v7)
  {
    *(_BYTE *)(v7 + 16) = Phase == 0;
    *(_WORD *)(v7 + 18) = v10;
  }
  TimeStamp = IOHIDEventGetTimeStamp(a3);
  v15 = sub_100081128((uint64_t)&self->_scrollPhaseTracker, v10, v45, TimeStamp);
  if ((_DWORD)v15)
  {
    self->_eventTypeMask |= 0x40uLL;
    FloatValue = IOHIDEventGetFloatValue(a3, 393216);
    v18 = IOHIDEventGetFloatValue(a3, 393217);
    Children = IOHIDEventGetChildren(a3);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue(Children);
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    v22 = FloatValue;
    v23 = v18;
    if (v21)
    {
      v24 = *(_QWORD *)v47;
      v22 = FloatValue;
      v23 = v18;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          if (IOHIDEventGetType(v26) == 6)
          {
            v22 = IOHIDEventGetFloatValue(v26, 393216);
            v23 = IOHIDEventGetFloatValue(v26, 393217);
          }
        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
      }
      while (v21);
    }

    kdebug_trace(730468396, *(_QWORD *)&FloatValue, 0, 0, 0);
    kdebug_trace(730468400, *(_QWORD *)&v18, 0, 0, 0);
    ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))kdebug_trace)(730468404, v22 / FloatValue, 0, 0, 0);
    v27 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))kdebug_trace)(730468408, v23 / v18, 0, 0, 0);
    if (Phase)
    {
      v29 = BKLogMousePointer(v27, v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v41 = BKNSStringFromIOHIDEventPhase(v10);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        *(_DWORD *)buf = 138544386;
        v55 = v42;
        v56 = 2048;
        v57 = v18;
        v58 = 2048;
        v59 = v18;
        v60 = 2048;
        v61 = v22;
        v62 = 2048;
        v63 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, " -> scroll (%{public}@) %g,%g accel:%g,%g", buf, 0x34u);

      }
      if ((self->_interpolateEventTypeMask & 0x40) != 0)
      {
        if (v7)
          v31 = *(void **)(v7 + 72);
        else
          v31 = 0;
        v32 = v31;
        v33 = IOHIDEventGetTimeStamp(a3);
        v34 = sub_100081A08((uint64_t)v32);
        sub_100082218((uint64_t)&self->_scrollInterpolator, v33, FloatValue, v18, v22, v23, v34);

        goto LABEL_34;
      }
    }
    else
    {
      v37 = BKLogMousePointer(v27, v28);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v43 = BKNSStringFromIOHIDEventPhase(v10);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        *(_DWORD *)buf = 138544386;
        v55 = v44;
        v56 = 2048;
        v57 = FloatValue;
        v58 = 2048;
        v59 = v18;
        v60 = 2048;
        v61 = v22;
        v62 = 2048;
        v63 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, " -> discrete scroll (%{public}@) %g,%g accel:%g,%g", buf, 0x34u);

      }
    }
    v39 = v18 + self->_scrollUnacceleratedDelta.y;
    self->_scrollUnacceleratedDelta.x = FloatValue + self->_scrollUnacceleratedDelta.x;
    self->_scrollUnacceleratedDelta.y = v39;
    v40 = v23 + self->_scrollAcceleratedDelta.y;
    self->_scrollAcceleratedDelta.x = v22 + self->_scrollAcceleratedDelta.x;
    self->_scrollAcceleratedDelta.y = v40;
LABEL_34:
    self->_scrollPhaseDidChange |= self->_scrollPhase != self->_scrollPhaseTracker._inputPhase;
    self->_scrollPhase = v10;
    goto LABEL_35;
  }
  v35 = BKLogMousePointer(v15, v16);
  v20 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v36 = objc_msgSend(v45, "senderID");
    *(_DWORD *)buf = 134217984;
    v55 = v36;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, " -> scroll rejected from sender:%llX", buf, 0xCu);
  }
LABEL_35:

}

- (void)addSyntheticTopLevelEventIfNeeded
{
  if (!self->_eventTypeMask)
  {
    self->_eventTypeMask = 0x20000;
    self->_pointerUnacceleratedDelta = 0u;
    self->_pointerAcceleratedDelta = 0u;
  }
}

- (void)invalidateAbsolutePosition
{
  self->_absolutePositionIsValid = 0;
}

- (void)addTopLevelEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v8;
  BOOL v9;
  double FloatValue;
  double v11;
  uint64_t v12;
  uint64_t v13;
  _BKMovingMedian *v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t TimeStamp;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t Children;
  id v35;
  id v36;
  double v37;
  double v38;
  uint64_t v39;
  void *i;
  uint64_t v41;
  int Type;
  uint64_t IntegerValue;
  uint64_t v44;
  uint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int64_t positionType;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  id v60;
  double v61;
  void *v62;
  NSString *v63;
  id v64;
  uint64_t v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  BOOL v69;
  __IOHIDEvent *v70;
  uint64_t *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[22];
  __int16 v78;
  BKMouseEventAccumulator *v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;

  v8 = a4;
  objc_storeStrong((id *)&self->_mostRecentSender, a4);
  if (IOHIDEventGetType(a3) != 17)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("you know better")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v63 = NSStringFromSelector(a2);
      v64 = (id)objc_claimAutoreleasedReturnValue(v63);
      v66 = (objc_class *)objc_opt_class(self, v65);
      v67 = NSStringFromClass(v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      *(_DWORD *)v77 = 138544642;
      *(_QWORD *)&v77[4] = v64;
      *(_WORD *)&v77[12] = 2114;
      *(_QWORD *)&v77[14] = v68;
      v78 = 2048;
      v79 = self;
      v80 = 2114;
      v81 = CFSTR("BKMousePointerEventAccumulator.mm");
      v82 = 1024;
      v83 = 920;
      v84 = 2114;
      v85 = v62;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v77, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v62), "UTF8String"));
    __break(0);
    JUMPOUT(0x10007DD74);
  }
  v9 = -[BKMouseEventAccumulator isSenderLocked](self, "isSenderLocked") || self->_buttonMask != 0;
  FloatValue = IOHIDEventGetFloatValue(a3, 1114112);
  v11 = IOHIDEventGetFloatValue(a3, 1114113);
  v69 = v9;
  kdebug_trace(730468356, 0, 0, 0, 0);
  self->_eventTypeMask |= 0x20000uLL;
  v12 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", v8));
  v13 = v12;
  v71 = (uint64_t *)v12;
  if (v12)
  {
    if (!*(_QWORD *)(v12 + 72))
    {
      v14 = [_BKMovingMedian alloc];
      if (v14)
      {
        *(_QWORD *)v77 = v14;
        *(_QWORD *)&v77[8] = _BKMovingMedian;
        v15 = objc_msgSendSuper2((objc_super *)v77, "init");
        v16 = v15;
        if (v15)
        {
          v15[1] = 100;
          v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 100);
          v18 = (void *)v16[2];
          v16[2] = v17;

          v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 100);
          v20 = (void *)v16[3];
          v16[3] = v19;

        }
      }
      else
      {
        v16 = 0;
      }
      v21 = (void *)v71[9];
      v71[9] = (uint64_t)v16;

      v13 = (uint64_t)v71;
      sub_1000822A8(v71[9], 0.01499925);
    }
    TimeStamp = IOHIDEventGetTimeStamp(a3);
    v23 = BSMonotonicReferencedTimeFromMachTime(TimeStamp - *(_QWORD *)(v13 + 8));
    *(_QWORD *)(v13 + 8) = TimeStamp;
    v26 = sub_100081A08(*(_QWORD *)(v13 + 72));
    if (v23 / v26 > 0.2 && v23 / v26 < 5.0)
    {
      sub_1000822A8(*(_QWORD *)(v13 + 72), v23);
      v31 = kdebug_trace(730468760, *(_QWORD *)&v26, 0, 0, 0);
      v33 = BKLogMousePointer(v31, v32);
      v29 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v77 = 134218240;
        *(double *)&v77[4] = v26 * 1000.0;
        *(_WORD *)&v77[12] = 2048;
        *(double *)&v77[14] = v23 * 1000.0;
        v30 = "updatePeriodFromEvent: period:%g - delta: %g";
        goto LABEL_68;
      }
    }
    else
    {
      v28 = BKLogMousePointer(v24, v25);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v77 = 134218240;
        *(double *)&v77[4] = v26 * 1000.0;
        *(_WORD *)&v77[12] = 2048;
        *(double *)&v77[14] = v23 * 1000.0;
        v30 = "updatePeriodFromEvent: period:%g - delta: %g - outlier filtered";
LABEL_68:
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, v30, v77, 0x16u);
      }
    }

  }
  Children = IOHIDEventGetChildren(a3);
  v70 = a3;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v35 = (id)objc_claimAutoreleasedReturnValue(Children);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  v37 = FloatValue;
  v38 = v11;
  if (v36)
  {
    v39 = *(_QWORD *)v73;
    v37 = FloatValue;
    v38 = v11;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v39)
          objc_enumerationMutation(v35);
        v41 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        Type = IOHIDEventGetType(v41);
        switch(Type)
        {
          case 1:
            IntegerValue = IOHIDEventGetIntegerValue(v41, 0x10000);
            v44 = IOHIDEventGetIntegerValue(v41, 65537);
            if (IntegerValue == 65280 && v44 == 17)
              goto LABEL_32;
            break;
          case 2:
            -[BKMouseEventAccumulator addButtonEvent:fromSender:](self, "addButtonEvent:fromSender:", v41, v8);
            break;
          case 3:
          case 8:
          case 9:
          case 10:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
            continue;
          case 4:
            -[BKMouseEventAccumulator addTranslationEvent:fromSender:](self, "addTranslationEvent:fromSender:", v41, v8);
            break;
          case 5:
            -[BKMouseEventAccumulator addRotationEvent:fromSender:](self, "addRotationEvent:fromSender:", v41, v8);
            break;
          case 6:
            -[BKMouseEventAccumulator addScrollEvent:fromSender:](self, "addScrollEvent:fromSender:", v41, v8);
            break;
          case 7:
            -[BKMouseEventAccumulator addScaleEvent:fromSender:](self, "addScaleEvent:fromSender:", v41, v8);
            break;
          case 11:
            -[BKMouseEventAccumulator addDigitizerEvent:fromSender:](self, "addDigitizerEvent:fromSender:", v41, v8);
            break;
          case 17:
            v37 = IOHIDEventGetFloatValue(v41, 1114112);
            v38 = IOHIDEventGetFloatValue(v41, 1114113);
            break;
          default:
            if (Type == 41)
LABEL_32:
              -[BKMouseEventAccumulator addForceEvent:fromSender:](self, "addForceEvent:fromSender:", v41, v8);
            break;
        }
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v36);
  }

  v46 = v71;
  if (-[BKMouseEventAccumulator isSenderLocked](self, "isSenderLocked") || self->_buttonMask)
  {
    if (v69)
      goto LABEL_48;
    v47 = IOHIDEventGetTimeStamp(v70);
  }
  else
  {
    v47 = 0;
  }
  self->_eventSequenceStartTimestamp = v47;
LABEL_48:
  kdebug_trace(730468368, *(_QWORD *)&FloatValue, 0, 0, 0);
  kdebug_trace(730468372, *(_QWORD *)&v11, 0, 0, 0);
  IOHIDEventGetEventFlags(v70);
  positionType = self->_positionType;
  if ((v48 & 1) != 0)
  {
    if (positionType != 1)
    {
      v56 = BKLogMousePointer(v48, v49);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "switching to absolute coordinates", v77, 2u);
      }

      self->_positionType = 1;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventTimestamp = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventDeltaTimestamp = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._x._p1 = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._y._p0 = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._y._pN = 0u;
      self->_pointerInterpolator._accelerationFactor = 0u;
      self->_pointerUnacceleratedDelta = 0u;
      self->_pointerAcceleratedDelta = 0u;
    }
    self->_pointerAbsolutePosition.x = FloatValue;
    self->_pointerAbsolutePosition.y = v11;
    self->_absolutePositionIsValid = 1;
  }
  else
  {
    if (positionType)
    {
      v51 = BKLogMousePointer(v48, v49);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "switching to relative coordinates", v77, 2u);
      }

      self->_positionType = 0;
      v46 = v71;
    }
    ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))kdebug_trace)(730468376, v37 / FloatValue, 0, 0, 0);
    ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))kdebug_trace)(730468380, v38 / v11, 0, 0, 0);
    v53 = IOHIDEventGetTimeStamp(v70);
    if ((self->_interpolateEventTypeMask & 0x20000) != 0)
    {
      v58 = v53;
      if (FloatValue == 0.0 && v11 == 0.0)
      {
        self->_pointerInterpolator._accelerationFactor = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._y._pN = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._y._p0 = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._x._p1 = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventDeltaTimestamp = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventTimestamp = 0u;
      }
      if (v46)
        v59 = (void *)v46[9];
      else
        v59 = 0;
      v60 = v59;
      v61 = sub_100081A08((uint64_t)v60);
      sub_100082218((uint64_t)&self->_pointerInterpolator, v58, FloatValue, v11, v37, v38, v61);

    }
    else
    {
      v54 = v11 + self->_pointerUnacceleratedDelta.y;
      self->_pointerUnacceleratedDelta.x = FloatValue + self->_pointerUnacceleratedDelta.x;
      self->_pointerUnacceleratedDelta.y = v54;
      v55 = v38 + self->_pointerAcceleratedDelta.y;
      self->_pointerAcceleratedDelta.x = v37 + self->_pointerAcceleratedDelta.x;
      self->_pointerAcceleratedDelta.y = v55;
    }
  }

}

- (void)appendSubeventsForEventTypeMask:(unint64_t)a3 toTopLevelEvent:(__IOHIDEvent *)a4 interfaceOrientation:(int64_t)a5 getEventSummary:(unint64_t *)a6
{
  uint64_t buttonMask;
  unint64_t v10;
  __n128 v11;
  double x;
  double y;
  uint64_t outputPhase;
  const void *ScrollEvent;
  const void *v16;
  __n128 v17;
  __n128 v18;
  const void *RotationEvent;
  uint64_t v20;
  __n128 v21;
  const void *ScaleEvent;
  uint64_t v23;
  __n128 v24;
  const void *TranslationEvent;
  uint64_t v26;
  __n128 v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  unsigned int v35;
  void *v36;
  const void *ButtonEvent;
  __n128 v38;
  char v39;
  unint64_t v40;
  id v41;
  __n128 v42;
  uint64_t v43;
  void *j;
  uint64_t v45;
  __IOHIDEvent *forceEvent;
  unint64_t v47;
  uint64_t SenderID;
  uint64_t TimeStamp;
  NSMutableArray *obj;
  NSMutableArray *obja;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];

  if (self->_shouldUseButtonDownRecenteringBehavior)
    buttonMask = 0;
  else
    buttonMask = self->_buttonMask;
  IOHIDEventSetIntegerValue(a4, 1114115, buttonMask);
  if (a6)
    *a6 = 0;
  v10 = self->_eventTypeMask & a3;
  if (v10)
  {
    TimeStamp = IOHIDEventGetTimeStamp(a4);
    SenderID = IOHIDEventGetSenderID(a4);
    v47 = v10;
    if ((v10 & 0x40) != 0)
    {
      x = self->_scrollAcceleratedDelta.x;
      y = self->_scrollAcceleratedDelta.y;
      outputPhase = self->_scrollPhaseTracker._outputPhase;
      ScrollEvent = (const void *)IOHIDEventCreateScrollEvent(kCFAllocatorDefault, TimeStamp, 0, self->_scrollUnacceleratedDelta.x, self->_scrollUnacceleratedDelta.y, 0.0);
      IOHIDEventSetSenderID(ScrollEvent, SenderID);
      IOHIDEventSetPhase(ScrollEvent, outputPhase);
      v16 = (const void *)IOHIDEventCreateScrollEvent(kCFAllocatorDefault, TimeStamp, 0, x, y, 0.0);
      IOHIDEventSetSenderID(v16, SenderID);
      v17.n128_f64[0] = IOHIDEventSetPhase(v16, outputPhase);
      IOHIDEventAppendEvent(ScrollEvent, v16, 0, v17);
      CFRelease(v16);
      IOHIDEventAppendEvent(a4, ScrollEvent, 0, v18);
      CFRelease(ScrollEvent);
      if (a6)
      {
        if ((outputPhase & 0xC) != 0)
          *a6 |= 2uLL;
      }
    }
    if ((v47 & 0x20) != 0)
    {
      RotationEvent = (const void *)IOHIDEventCreateRotationEvent(kCFAllocatorDefault, TimeStamp, 0, 0.0, 0.0, self->_rotationZ);
      IOHIDEventSetSenderID(RotationEvent, SenderID);
      v20 = self->_rotationPhaseTracker._outputPhase;
      v21.n128_f64[0] = IOHIDEventSetPhase(RotationEvent, v20);
      IOHIDEventAppendEvent(a4, RotationEvent, 0, v21);
      CFRelease(RotationEvent);
      if (a6)
      {
        if ((v20 & 0xC) != 0)
          *a6 |= 0x10uLL;
      }
    }
    if ((v47 & 0x80) != 0)
    {
      ScaleEvent = (const void *)IOHIDEventCreateScaleEvent(kCFAllocatorDefault, TimeStamp, 0, 0.0, 0.0, self->_scaleZ);
      IOHIDEventSetSenderID(ScaleEvent, SenderID);
      v23 = self->_scalePhaseTracker._outputPhase;
      v24.n128_f64[0] = IOHIDEventSetPhase(ScaleEvent, v23);
      IOHIDEventAppendEvent(a4, ScaleEvent, 0, v24);
      CFRelease(ScaleEvent);
      if (a6)
      {
        if ((v23 & 0xC) != 0)
          *a6 |= 4uLL;
      }
    }
    if ((v47 & 0x10) != 0)
    {
      TranslationEvent = (const void *)IOHIDEventCreateTranslationEvent(kCFAllocatorDefault, TimeStamp, 0, self->_translationDelta.x, self->_translationDelta.y, 0.0);
      IOHIDEventSetSenderID(TranslationEvent, SenderID);
      v26 = self->_translationPhaseTracker._outputPhase;
      v27.n128_f64[0] = IOHIDEventSetPhase(TranslationEvent, v26);
      IOHIDEventAppendEvent(a4, TranslationEvent, 0, v27);
      CFRelease(TranslationEvent);
      if (a6)
      {
        if ((v26 & 0xC) != 0)
          *a6 |= 8uLL;
      }
    }
    if ((v47 & 4) != 0 && !self->_shouldUseButtonDownRecenteringBehavior)
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = self->_buttonEvents;
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v29)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", 0));
            v33 = objc_msgSend(v32, "integerValue");

            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", 1));
            v35 = objc_msgSend(v34, "BOOLValue");

            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", 2));
            LODWORD(v34) = objc_msgSend(v36, "unsignedIntValue");

            ButtonEvent = (const void *)IOHIDEventCreateButtonEvent(kCFAllocatorDefault, TimeStamp, 0, 0);
            IOHIDEventSetSenderID(ButtonEvent, SenderID);
            IOHIDEventSetIntegerValue(ButtonEvent, 131073, v33);
            IOHIDEventSetIntegerValue(ButtonEvent, 131076, v35);
            IOHIDEventSetIntegerValue(ButtonEvent, 0x20000, v34);
            IOHIDEventAppendEvent(a4, ButtonEvent, 0, v38);
            CFRelease(ButtonEvent);
            if (a6)
              v39 = v35;
            else
              v39 = 1;
            if ((v39 & 1) == 0)
              *a6 |= 0x20uLL;
          }
          v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        }
        while (v28);
      }

    }
    v40 = v47;
    if ((v47 & 0x800) != 0)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      obja = self->_digitizerEvents;
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v41)
      {
        v43 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v41; j = (char *)j + 1)
          {
            if (*(_QWORD *)v54 != v43)
              objc_enumerationMutation(obja);
            v45 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
            IOHIDEventAppendEvent(a4, v45, 0, v42);
            if (a6 && (IOHIDEventGetIntegerValue(v45, 720920) & 2) != 0 && !IOHIDEventGetIntegerValue(v45, 720905))
              *a6 |= 0x40uLL;
          }
          v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v41);
      }

      v40 = v47;
    }
    if ((v40 & 0x20000000002) != 0)
    {
      forceEvent = self->_forceEvent;
      if (forceEvent)
        IOHIDEventAppendEvent(a4, forceEvent, 0, v11);
    }
  }
}

- (void)nextEvent
{
  self->_eventTypeMask = 0;
  self->_previousButtonMask = self->_buttonMask;
  if ((self->_interpolateEventTypeMask & 0x40) != 0
    && (self->_scrollPhaseTracker._inputPhase & 0xC) != 0
    && self->_scrollPhaseTracker._eventSender
    && self->_scrollPhaseTracker._outputPhase
    && !self->_scrollPhaseTracker._sentTerminalEvent)
  {
    self->_eventTypeMask = 64;
    self->_scrollPhaseTracker._sentTerminalEvent = 1;
  }
}

- (void)frameWillBegin
{
  uint64_t v3;
  float64x2_t v4;
  CGFloat v5;
  float64x2_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  unsigned __int16 inputPhase;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;

  v3 = mach_absolute_time();
  if (self->_pointerInterpolator._interpolator._remainingInterpolations >= 1
    && (self->_interpolateEventTypeMask & 0x20000) != 0)
  {
    sub_100082094((uint64_t)&self->_pointerInterpolator, v3);
    self->_pointerUnacceleratedDelta.x = v4.f64[0];
    self->_pointerUnacceleratedDelta.y = v5;
    v4.f64[1] = v5;
    self->_pointerAcceleratedDelta = (CGPoint)vmulq_f64(v4, (float64x2_t)self->_pointerInterpolator._accelerationFactor);
  }
  if (self->_scrollInterpolator._interpolator._remainingInterpolations >= 1
    && (self->_interpolateEventTypeMask & 0x40) != 0)
  {
    sub_100082094((uint64_t)&self->_scrollInterpolator, v3);
    self->_scrollUnacceleratedDelta.x = v6.f64[0];
    self->_scrollUnacceleratedDelta.y = v7;
    v6.f64[1] = v7;
    self->_scrollAcceleratedDelta = (CGPoint)vmulq_f64(v6, (float64x2_t)self->_scrollInterpolator._accelerationFactor);
  }
  if (self->_scaleInterpolator._remainingInterpolations >= 1 && (self->_interpolateEventTypeMask & 0x80) != 0)
    self->_scaleZ = sub_100081FDC((uint64_t)&self->_scaleInterpolator, v3);
  if (self->_translationInterpolator._remainingInterpolations >= 1 && (self->_interpolateEventTypeMask & 0x10) != 0)
  {
    sub_100082094((uint64_t)&self->_translationInterpolator, v3);
    self->_translationDelta.x = v8;
    self->_translationDelta.y = v9;
  }
  if (self->_rotationInterpolator._remainingInterpolations >= 1 && (self->_interpolateEventTypeMask & 0x20) != 0)
    self->_rotationZ = sub_100081FDC((uint64_t)&self->_rotationInterpolator, v3);
  self->_scrollPhaseTracker._sentTerminalEvent = 0;
  if (self->_scrollPhaseTracker._reportBeganPhase)
  {
    self->_scrollPhaseTracker._outputPhase = 1;
    self->_scrollPhaseTracker._reportBeganPhase = 0;
  }
  else
  {
    inputPhase = self->_scrollPhaseTracker._inputPhase;
    if ((inputPhase & 1) != 0)
      inputPhase = 2;
    self->_scrollPhaseTracker._outputPhase = inputPhase;
  }
  self->_rotationPhaseTracker._sentTerminalEvent = 0;
  if (self->_rotationPhaseTracker._reportBeganPhase)
  {
    self->_rotationPhaseTracker._outputPhase = 1;
    self->_rotationPhaseTracker._reportBeganPhase = 0;
  }
  else
  {
    v11 = self->_rotationPhaseTracker._inputPhase;
    if ((v11 & 1) != 0)
      v11 = 2;
    self->_rotationPhaseTracker._outputPhase = v11;
  }
  self->_translationPhaseTracker._sentTerminalEvent = 0;
  if (self->_translationPhaseTracker._reportBeganPhase)
  {
    self->_translationPhaseTracker._outputPhase = 1;
    self->_translationPhaseTracker._reportBeganPhase = 0;
  }
  else
  {
    v12 = self->_translationPhaseTracker._inputPhase;
    if ((v12 & 1) != 0)
      v12 = 2;
    self->_translationPhaseTracker._outputPhase = v12;
  }
  self->_scalePhaseTracker._sentTerminalEvent = 0;
  if (self->_scalePhaseTracker._reportBeganPhase)
  {
    self->_scalePhaseTracker._outputPhase = 1;
    self->_scalePhaseTracker._reportBeganPhase = 0;
  }
  else
  {
    v13 = self->_scalePhaseTracker._inputPhase;
    if ((v13 & 1) != 0)
      v13 = 2;
    self->_scalePhaseTracker._outputPhase = v13;
  }
}

- (void)frameDidEnd
{
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  BKHIDEventSenderInfo *v6;
  uint64_t v7;
  NSObject *v8;
  BKHIDEventSenderInfo *v9;
  uint64_t v10;
  NSObject *v11;
  BKHIDEventSenderInfo *v12;
  NSMutableArray *buttonEvents;
  NSMutableArray *digitizerEvents;
  __IOHIDEvent *forceEvent;
  NSMutableDictionary *eventStateBySenderID;
  void *v17;
  BKHIDEventSenderInfo *mostRecentSender;
  NSMutableSet *doomedSenderIDs;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSMutableSet *v29;
  uint64_t v30;
  NSObject *v31;
  BKHIDEventSenderInfo *eventSender;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BKHIDEventSenderInfo *v36;
  int v37;
  uint64_t Name;

  v3 = (unint64_t)(self->_pointerInterpolator._interpolator._remainingInterpolations > 0) << 17;
  self->_eventTypeMask = v3;
  if (self->_scrollInterpolator._interpolator._remainingInterpolations < 1)
  {
    if ((self->_scrollPhaseTracker._inputPhase & 0xC) != 0
      && self->_scrollPhaseTracker._eventSender
      && self->_scrollPhaseTracker._outputPhase)
    {
      *(_OWORD *)&self->_scrollInterpolator._interpolator._y._pN = 0u;
      self->_scrollInterpolator._accelerationFactor = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._x._p1 = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._y._p0 = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._time._eventTimestamp = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._time._eventDeltaTimestamp = 0u;
      v30 = BKLogMousePointer(self, a2);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v37 = 138543362;
        Name = IOHIDEventTypeGetName(6);
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v37, 0xCu);
      }

      eventSender = self->_scrollPhaseTracker._eventSender;
      self->_scrollPhaseTracker._eventSender = 0;

      *(_DWORD *)&self->_scrollPhaseTracker._inputPhase = 0;
      self->_scrollPhaseTracker._sentTerminalEvent = 0;
    }
  }
  else
  {
    self->_eventTypeMask = v3 | 0x40;
  }
  if ((self->_scalePhaseTracker._inputPhase & 0xC) != 0
    && self->_scalePhaseTracker._eventSender
    && self->_scalePhaseTracker._outputPhase)
  {
    v4 = BKLogMousePointer(self, a2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v33 = IOHIDEventTypeGetName(7);
      v37 = 138543362;
      Name = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v37, 0xCu);
    }

    v6 = self->_scalePhaseTracker._eventSender;
    self->_scalePhaseTracker._eventSender = 0;

    *(_DWORD *)&self->_scalePhaseTracker._inputPhase = 0;
    self->_scalePhaseTracker._sentTerminalEvent = 0;
  }
  if ((self->_rotationPhaseTracker._inputPhase & 0xC) != 0
    && self->_rotationPhaseTracker._eventSender
    && self->_rotationPhaseTracker._outputPhase)
  {
    v7 = BKLogMousePointer(self, a2);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v34 = IOHIDEventTypeGetName(5);
      v37 = 138543362;
      Name = v34;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v37, 0xCu);
    }

    v9 = self->_rotationPhaseTracker._eventSender;
    self->_rotationPhaseTracker._eventSender = 0;

    *(_DWORD *)&self->_rotationPhaseTracker._inputPhase = 0;
    self->_rotationPhaseTracker._sentTerminalEvent = 0;
  }
  if ((self->_translationPhaseTracker._inputPhase & 0xC) != 0
    && self->_translationPhaseTracker._eventSender
    && self->_translationPhaseTracker._outputPhase)
  {
    v10 = BKLogMousePointer(self, a2);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v35 = IOHIDEventTypeGetName(4);
      v37 = 138543362;
      Name = v35;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v37, 0xCu);
    }

    v12 = self->_translationPhaseTracker._eventSender;
    self->_translationPhaseTracker._eventSender = 0;

    *(_DWORD *)&self->_translationPhaseTracker._inputPhase = 0;
    self->_translationPhaseTracker._sentTerminalEvent = 0;
  }
  self->_translationDelta.x = 0.0;
  self->_translationDelta.y = 0.0;
  self->_rotationZ = 0.0;
  self->_scaleZ = 0.0;
  self->_pointerUnacceleratedDelta = 0u;
  self->_pointerAcceleratedDelta = 0u;
  self->_scrollUnacceleratedDelta = 0u;
  self->_scrollAcceleratedDelta = 0u;
  buttonEvents = self->_buttonEvents;
  self->_buttonEvents = 0;

  digitizerEvents = self->_digitizerEvents;
  self->_digitizerEvents = 0;

  *(_WORD *)&self->_touchingPathIndexesDidChange = 0;
  self->_scrollPhaseDidChange = 0;
  self->_shouldUseButtonDownRecenteringBehavior = 0;
  self->_forceDidChange = 0;
  forceEvent = self->_forceEvent;
  if (forceEvent)
  {
    CFRelease(forceEvent);
    self->_forceEvent = 0;
  }
  if (-[NSMutableSet count](self->_doomedSenderIDs, "count"))
  {
    eventStateBySenderID = self->_eventStateBySenderID;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_doomedSenderIDs, "allObjects"));
    -[NSMutableDictionary removeObjectsForKeys:](eventStateBySenderID, "removeObjectsForKeys:", v17);

    mostRecentSender = self->_mostRecentSender;
    if (mostRecentSender)
    {
      doomedSenderIDs = self->_doomedSenderIDs;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BKHIDEventSenderInfo senderID](mostRecentSender, "senderID")));
      LODWORD(doomedSenderIDs) = -[NSMutableSet containsObject:](doomedSenderIDs, "containsObject:", v20);

      if ((_DWORD)doomedSenderIDs)
      {
        v21 = -[NSMutableDictionary count](self->_eventStateBySenderID, "count");
        if (v21)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_eventStateBySenderID, "allValues"));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastObject"));
          v25 = (void *)v24;
          if (v24)
            v26 = *(void **)(v24 + 24);
          else
            v26 = 0;
          objc_storeStrong((id *)&self->_mostRecentSender, v26);

        }
        v27 = BKLogMousePointer(v21, v22);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v36 = self->_mostRecentSender;
          v37 = 138543362;
          Name = (uint64_t)v36;
          _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "fixup mostRecentSender:%{public}@", (uint8_t *)&v37, 0xCu);
        }

      }
    }
    v29 = self->_doomedSenderIDs;
    self->_doomedSenderIDs = 0;

  }
}

- (void)deviceServiceDidAppear:(id)a3
{
  id v3;

  v3 = -[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", a3);
}

- (void)deviceServiceDidTerminate:(id)a3
{
  void *v4;
  NSMutableSet *doomedSenderIDs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "senderID")));
  doomedSenderIDs = self->_doomedSenderIDs;
  if (!doomedSenderIDs)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_doomedSenderIDs;
    self->_doomedSenderIDs = v6;

    doomedSenderIDs = self->_doomedSenderIDs;
  }
  -[NSMutableSet addObject:](doomedSenderIDs, "addObject:", v4);
  -[BKMouseEventAccumulator _terminateAllGesturesForSender:](self, "_terminateAllGesturesForSender:", v12);
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_eventStateBySenderID, "objectForKeyedSubscript:", v4));
  v9 = (void *)v8;
  if (v8)
  {
    v10 = *(_QWORD *)(v8 + 32);
    if (v10)
    {
      for (i = 1; i != 32; ++i)
      {
        if ((v10 & (1 << (i - 1))) != 0)
          -[BKMouseEventAccumulator addButtonNumber:down:fromSender:](self, "addButtonNumber:down:fromSender:", i, 0, v12);
      }
    }
  }

}

- (BOOL)senderPostsAtHighFrequency:(unint64_t)a3
{
  BOOL v3;
  NSMutableDictionary *eventStateBySenderID;
  void *v5;
  uint64_t *v6;

  if (self->_shouldUseButtonDownRecenteringBehavior)
    return 0;
  eventStateBySenderID = self->_eventStateBySenderID;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v6 = (uint64_t *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](eventStateBySenderID, "objectForKeyedSubscript:", v5));

  if (v6)
    v3 = sub_100081A08(v6[9]) < 0.0111111111;
  else
    v3 = 0;

  return v3;
}

- (void)addButtonNumber:(int64_t)a3 down:(BOOL)a4 fromSender:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSMutableArray *v12;
  NSMutableArray *buttonEvents;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int buttonMask;
  _QWORD v33[3];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  id v39;

  v5 = a4;
  v8 = a5;
  v10 = BKLogMousePointer(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v35 = a3;
    v36 = 1024;
    v37 = v5;
    v38 = 2048;
    v39 = objc_msgSend(v8, "senderID");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  ->  button number:%d down:%{BOOL}u (sender %llX)", buf, 0x18u);
  }

  self->_eventTypeMask |= 4uLL;
  if (!self->_buttonEvents)
  {
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    buttonEvents = self->_buttonEvents;
    self->_buttonEvents = v12;

  }
  v14 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", v8));
  v15 = (id *)v14;
  if (v14)
  {
    v16 = *(_QWORD *)(v14 + 32);
    v17 = 1 << (a3 - 1);
    v18 = v16 | v17;
    v19 = v16 & ~v17;
    if (v5)
      v20 = v18;
    else
      v20 = v19;
    *(_QWORD *)(v14 + 32) = v20;
  }
  else if (v5)
  {
    v20 = 1 << (a3 - 1);
  }
  else
  {
    v20 = 0;
  }
  v21 = sub_100081B14(v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (v15)
    objc_storeStrong(v15 + 7, v22);

  v23 = self->_buttonEvents;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v33[0] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v33[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20));
  v33[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3));
  -[NSMutableArray addObject:](v23, "addObject:", v27);

  if (v5)
    v28 = 730468384;
  else
    v28 = 730468388;
  kdebug_trace(v28, a3, 0, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_eventStateBySenderID, "allValues"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bs_reduce:block:", &off_1000F7588, &stru_1000EC2F0));

  v31 = objc_msgSend(v30, "unsignedIntValue");
  buttonMask = self->_buttonMask;
  self->_buttonMaskDidChange = buttonMask != v31;
  self->_previousButtonMask = buttonMask;
  self->_buttonMask = v31;
  -[BKMouseEventAccumulator _updateTouchingPathIndexesFromDeviceEventState](self, "_updateTouchingPathIndexesFromDeviceEventState");

}

- (void)setShouldSwapPrimaryAndSecondaryButtons:(BOOL)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (self->_shouldSwapPrimaryAndSecondaryButtons != a3)
  {
    self->_shouldSwapPrimaryAndSecondaryButtons = a3;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_eventStateBySenderID, "allValues", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6);
          if (v7)
          {
            if (*(_BYTE *)(v7 + 17))
              *(_QWORD *)(v7 + 32) = *(_QWORD *)(v7 + 32) & 0xFFFFFFFFFFFFFFFCLL | (2 * (*(_QWORD *)(v7 + 32) & 1)) | (*(_QWORD *)(v7 + 32) >> 1) & 1;
          }
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)addButtonEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t IntegerValue;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  unint64_t v15;
  id v16;

  v16 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:"));
  v7 = (_BYTE *)v6;
  if (v6)
    v8 = *(_QWORD *)(v6 + 32);
  else
    v8 = 0;
  IntegerValue = IOHIDEventGetIntegerValue(a3, 0x20000);
  v10 = IntegerValue;
  if (v7 && self->_shouldSwapPrimaryAndSecondaryButtons && v7[17])
    v10 = IntegerValue & 0xFFFFFFFFFFFFFFFCLL | (2 * (IntegerValue & 1)) | (IntegerValue >> 1) & 1;
  v11 = 0;
  do
  {
    v12 = v11 + 1;
    v13 = 1 << v11;
    v14 = (v13 & v8) == 0;
    v15 = v13 & v10;
    if (((v14 ^ (v15 != 0)) & 1) == 0)
      -[BKMouseEventAccumulator addButtonNumber:down:fromSender:](self, "addButtonNumber:down:fromSender:", v12, v15 != 0, v16);
    v11 = v12;
  }
  while (v12 != 32);

}

- (void)_updateTouchingPathIndexesFromDeviceEventState
{
  void *v3;
  void *v4;
  NSIndexSet **p_touchingPathIndexes;
  NSIndexSet *touchingPathIndexes;
  uint64_t v7;
  NSIndexSet *v8;
  id obj;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_eventStateBySenderID, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_reduce:block:", v4, &stru_1000EC330));

  p_touchingPathIndexes = &self->_touchingPathIndexes;
  touchingPathIndexes = self->_touchingPathIndexes;
  if (!touchingPathIndexes)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    v8 = *p_touchingPathIndexes;
    *p_touchingPathIndexes = (NSIndexSet *)v7;

    touchingPathIndexes = *p_touchingPathIndexes;
  }
  if ((BSEqualObjects(touchingPathIndexes, obj) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_touchingPathIndexes, obj);
    self->_touchingPathIndexesDidChange = 1;
  }

}

- (void)addDigitizerEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *digitizerEvents;
  const void *Copy;
  id *v11;
  id v12;
  void *v13;
  uint64_t Children;
  id v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  _BOOL4 v26;
  id v27;
  uint64_t v28;
  id v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  int v39;
  id v40;
  id v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  id v54;
  id v55;
  __CFString *v56;
  id v57;
  __CFString *v58;
  id v59;
  __CFString *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  __CFString *v66;
  id v67;
  __CFString *v68;
  id v69;
  __CFString *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  void *v84;
  id v85;
  __CFString *v86;
  void *v87;
  uint64_t ConciseDescription;
  void *v89;
  NSString *v90;
  id v91;
  uint64_t v92;
  objc_class *v93;
  NSString *v94;
  void *v95;
  __int128 v96;
  id v97;
  const void *v98;
  id v99;
  uint64_t IntegerValue;
  id v102;
  id v103;
  id obj;
  int v105;
  uint64_t v106;
  id v107;
  unsigned int log;
  NSObject *loga;
  id *v110;
  _QWORD v111[4];
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t buf[4];
  id v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  _BYTE v122[24];
  _BYTE v123[10];
  _BYTE v124[10];
  id v125;
  __int16 v126;
  void *v127;
  uint8_t v128[4];
  double FloatValue;
  __int16 v130;
  double v131;
  __int16 v132;
  id *v133;
  __int16 v134;
  const __CFString *v135;
  __int16 v136;
  int v137;
  __int16 v138;
  id v139;

  v99 = a4;
  v6 = BKLogMousePointer(v99, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v128 = 134218240;
    FloatValue = IOHIDEventGetFloatValue(a3, 720896);
    v130 = 2048;
    v131 = IOHIDEventGetFloatValue(a3, 720897);
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, " -> digitizer %g,%g", v128, 0x16u);
  }

  self->_eventTypeMask |= 0x800uLL;
  if (!self->_digitizerEvents)
  {
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    digitizerEvents = self->_digitizerEvents;
    self->_digitizerEvents = v8;

  }
  Copy = (const void *)IOHIDEventCreateCopy(kCFAllocatorDefault, a3);
  -[NSMutableArray addObject:](self->_digitizerEvents, "addObject:", Copy);
  CFRelease(Copy);
  v11 = (id *)objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", v99));
  v110 = v11;
  if (v11)
  {
    if (IOHIDEventGetType(Copy) != 11)
    {
      v103 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("need digitizer event")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v90 = NSStringFromSelector("updateFromDigitizerEvent:");
        v91 = (id)objc_claimAutoreleasedReturnValue(v90);
        v93 = (objc_class *)objc_opt_class(v11, v92);
        v94 = NSStringFromClass(v93);
        v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
        *(_DWORD *)v128 = 138544642;
        FloatValue = *(double *)&v91;
        v130 = 2114;
        v131 = *(double *)&v95;
        v132 = 2048;
        v133 = v11;
        v134 = 2114;
        v135 = CFSTR("BKMousePointerEventAccumulator.mm");
        v136 = 1024;
        v137 = 509;
        v138 = 2114;
        v139 = v103;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v128, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v103), "UTF8String"));
      __break(0);
      JUMPOUT(0x10007FDF4);
    }
    v102 = objc_alloc_init((Class)NSMutableIndexSet);
    v12 = sub_100081B14((uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v98 = Copy;
    v97 = objc_msgSend(v13, "copy");

    IntegerValue = IOHIDEventGetIntegerValue(Copy, 720923);
    Children = IOHIDEventGetChildren(Copy);
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(Children);
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
    if (v15)
    {
      v106 = *(_QWORD *)v114;
      *(_QWORD *)&v16 = 134219522;
      v96 = v16;
      do
      {
        v17 = 0;
        v107 = v15;
        do
        {
          if (*(_QWORD *)v114 != v106)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)v17);
          if (IOHIDEventGetType(v18) == 11)
          {
            v19 = IOHIDEventGetIntegerValue(v18, 720903);
            v20 = IOHIDEventGetIntegerValue(v18, 720901);
            v21 = IOHIDEventGetIntegerValue(v18, 720904);
            v22 = IOHIDEventGetIntegerValue(v18, 720905);
            v23 = objc_msgSend(v110[5], "containsIndex:", v20);
            log = objc_msgSend(v110[6], "containsIndex:", v20);
            v24 = objc_msgSend(v110[8], "containsIndex:", v20);
            v105 = (int)v24;
            if ((v19 & 0x80) != 0)
            {
              objc_msgSend(v110[6], "removeIndex:", v20);
              objc_msgSend(v110[5], "removeIndex:", v20);
              v41 = objc_msgSend(v110[8], "removeIndex:", v20);
              v30 = 0;
              if (!v22)
              {
                v43 = 0;
                v46 = 0;
                goto LABEL_33;
              }
              v39 = 1;
              v43 = 0;
              v26 = 0;
            }
            else
            {
              v26 = log;
              if ((v19 & 1) != 0)
              {
                v27 = sub_100081B9C(v21 != 0, v20, v110[6]);
                v28 = objc_claimAutoreleasedReturnValue(v27);
                v29 = v110[6];
                v110[6] = (id)v28;

                v26 = v21 != 0;
              }
              v30 = v23;
              if ((v19 & 2) != 0)
              {
                if (v22)
                  v31 = v23;
                else
                  v31 = 0;
                if (v31 == 1)
                {
                  v32 = BKLogMousePointer(v24, v25);
                  v33 = objc_claimAutoreleasedReturnValue(v32);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    v73 = objc_msgSend(v110[3], "senderID");
                    *(_DWORD *)buf = 134218496;
                    v118 = v73;
                    v119 = 2048;
                    v120 = IntegerValue;
                    v121 = 1024;
                    *(_DWORD *)v122 = v20;
                    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "sender %llX gen %ld path %d received touch down, but was already down", buf, 0x1Cu);
                  }

                }
                v34 = sub_100081B9C(v22 != 0, v20, v110[5]);
                v35 = objc_claimAutoreleasedReturnValue(v34);
                v36 = v110[5];
                v110[5] = (id)v35;

                v30 = v22 != 0;
              }
              v37 = sub_100081B9C(v30 & ((unsigned __int16)(v19 & 0x200) >> 9), v20, v110[8]);
              v38 = objc_claimAutoreleasedReturnValue(v37);
              v39 = v22 != 0;
              v40 = v110[8];
              v110[8] = (id)v38;

              v43 = (v19 >> 9) & 1;
              if (v39 == v30)
              {
LABEL_32:
                v46 = v26;
LABEL_33:
                if (v23 != v30 || ((log ^ v46) & 1) != 0 || v105 != v43)
                {
                  v62 = BKLogMousePointer(v41, v42);
                  v51 = objc_claimAutoreleasedReturnValue(v62);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    loga = v51;
                    v63 = objc_msgSend(v110[3], "senderID");
                    v64 = sub_100081C24(v18);
                    v65 = (id)objc_claimAutoreleasedReturnValue(v64);
                    v66 = sub_100081D88(v110[5]);
                    v67 = (id)objc_claimAutoreleasedReturnValue(v66);
                    v68 = sub_100081D88(v110[6]);
                    v69 = (id)objc_claimAutoreleasedReturnValue(v68);
                    v70 = sub_100081D88(v110[8]);
                    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
                    *(_DWORD *)buf = 134220290;
                    v118 = v63;
                    v119 = 2048;
                    v120 = IntegerValue;
                    v121 = 1024;
                    *(_DWORD *)v122 = v20;
                    *(_WORD *)&v122[4] = 1024;
                    *(_DWORD *)&v122[6] = v30;
                    *(_WORD *)&v122[10] = 1024;
                    *(_DWORD *)&v122[12] = v46;
                    *(_WORD *)&v122[16] = 1024;
                    *(_DWORD *)&v122[18] = v30 & v43;
                    *(_WORD *)&v122[22] = 2114;
                    *(_QWORD *)v123 = v65;
                    *(_WORD *)&v123[8] = 2114;
                    *(_QWORD *)v124 = v67;
                    *(_WORD *)&v124[8] = 2114;
                    v125 = v69;
                    v126 = 2114;
                    v127 = v71;
                    v51 = loga;
                    _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "sender %llX gen %ld path %d now touching:%{BOOL}u in-range:%{BOOL}u resting:%{BOOL}u (%{public}@) -- down:{%{public}@} range:{%{public}@} rest:{%{public}@}", buf, 0x56u);

                  }
LABEL_45:

                }
                else if ((objc_msgSend(v110[5], "containsIndex:", v20) & 1) == 0)
                {
                  v47 = objc_msgSend(v110[6], "containsIndex:", v20);
                  v49 = v19 == 32 ? 1 : (char)v47;
                  if ((v49 & 1) == 0)
                  {
                    v50 = BKLogMousePointer(v47, v48);
                    v51 = objc_claimAutoreleasedReturnValue(v50);
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      v52 = v51;
                      v53 = objc_msgSend(v110[3], "senderID");
                      v54 = sub_100081C24(v18);
                      v55 = (id)objc_claimAutoreleasedReturnValue(v54);
                      v56 = sub_100081D88(v110[5]);
                      v57 = (id)objc_claimAutoreleasedReturnValue(v56);
                      v58 = sub_100081D88(v110[6]);
                      v59 = (id)objc_claimAutoreleasedReturnValue(v58);
                      v60 = sub_100081D88(v110[8]);
                      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
                      *(_DWORD *)buf = v96;
                      v118 = v53;
                      v119 = 2048;
                      v120 = IntegerValue;
                      v121 = 1024;
                      *(_DWORD *)v122 = v20;
                      *(_WORD *)&v122[4] = 2114;
                      *(_QWORD *)&v122[6] = v55;
                      *(_WORD *)&v122[14] = 2114;
                      *(_QWORD *)&v122[16] = v57;
                      *(_WORD *)v123 = 2114;
                      *(_QWORD *)&v123[2] = v59;
                      *(_WORD *)v124 = 2114;
                      *(_QWORD *)&v124[2] = v61;
                      v51 = v52;
                      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "received event from sender %llX gen %ld for path %d -- not touching or in range (%{public}@) -- down:{%{public}@} range:{%{public}@} rest:{%{public}@}", buf, 0x44u);

                    }
                    goto LABEL_45;
                  }
                }
                objc_msgSend(v102, "addIndex:", v20, v96);
                goto LABEL_47;
              }
            }
            v44 = BKLogMousePointer(v41, v42);
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v72 = objc_msgSend(v110[3], "senderID");
              *(_DWORD *)buf = 134219008;
              v118 = v72;
              v119 = 2048;
              v120 = IntegerValue;
              v121 = 1024;
              *(_DWORD *)v122 = v20;
              *(_WORD *)&v122[4] = 1024;
              *(_DWORD *)&v122[6] = v30;
              *(_WORD *)&v122[10] = 1024;
              *(_DWORD *)&v122[12] = v39;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "sender %llX gen %ld path %d touch state mismatch:%{BOOL}u event:%{BOOL}u", buf, 0x28u);
            }

            goto LABEL_32;
          }
LABEL_47:
          v17 = (char *)v17 + 1;
        }
        while (v107 != v17);
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
        v15 = v74;
      }
      while (v74);
    }

    v75 = (uint64_t)v110;
    v76 = v110[5];
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_100081E98;
    v111[3] = &unk_1000EC2B0;
    v77 = v102;
    v112 = v77;
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "indexesPassingTest:", v111));
    v79 = objc_msgSend(v78, "count");
    if (v79)
    {
      v81 = BKLogMousePointer(v79, v80);
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        v85 = objc_msgSend(v110[3], "senderID");
        v86 = sub_100081D88(v78);
        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
        ConciseDescription = BKSHIDEventGetConciseDescription(v98);
        v89 = (void *)objc_claimAutoreleasedReturnValue(ConciseDescription);
        *(_DWORD *)buf = 134218754;
        v118 = v85;
        v119 = 2048;
        v120 = IntegerValue;
        v121 = 2114;
        *(_QWORD *)v122 = v87;
        *(_WORD *)&v122[8] = 2114;
        *(_QWORD *)&v122[10] = v89;
        _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "sender %llX gen %ld missing expected touching paths:{%{public}@} event:%{public}@", buf, 0x2Au);

      }
      v75 = (uint64_t)v110;
    }
    v83 = sub_100081B14(v75);
    v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
    objc_msgSend(v97, "isEqualToIndexSet:", v84);

    v11 = v110;
  }
  -[BKMouseEventAccumulator _updateTouchingPathIndexesFromDeviceEventState](self, "_updateTouchingPathIndexesFromDeviceEventState", v96);

}

- (void)addScaleEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v7;
  uint64_t Phase;
  double FloatValue;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t TimeStamp;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  double v25;
  double p1;
  uint64_t v27;
  void *v28;
  id v29;
  int v30;
  id v31;
  __int16 v32;
  double v33;

  v7 = a4;
  objc_storeStrong((id *)&self->_mostRecentSender, a4);
  Phase = IOHIDEventGetPhase(a3);
  FloatValue = IOHIDEventGetFloatValue(a3, 458754);
  kdebug_trace(730468472, Phase, 0, 0, 0);
  v10 = kdebug_trace(730468476, *(_QWORD *)&FloatValue, 0, 0, 0);
  v12 = BKLogMousePointer(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v27 = BKNSStringFromIOHIDEventPhase(Phase);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v30 = 138543618;
    v31 = v28;
    v32 = 2048;
    v33 = FloatValue;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, " -> scale phase:%{public}@ %g", (uint8_t *)&v30, 0x16u);

  }
  v14 = IOHIDEventGetPhase(a3);
  TimeStamp = IOHIDEventGetTimeStamp(a3);
  v16 = sub_1000817D0((uint64_t)&self->_scalePhaseTracker, v14, v7, TimeStamp);
  if ((_DWORD)v16)
  {
    self->_eventTypeMask |= 0x80uLL;
    if ((self->_interpolateEventTypeMask & 0x80) != 0)
    {
      v20 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", v7));
      v21 = (void *)v20;
      if (v20)
        v22 = *(void **)(v20 + 72);
      else
        v22 = 0;
      v23 = v22;
      v24 = IOHIDEventGetTimeStamp(a3);
      v25 = sub_100081A08((uint64_t)v23);
      sub_100081AA0((uint64_t)&self->_scaleInterpolator, v24, v25);
      p1 = self->_scaleInterpolator._z._p1;
      self->_scaleInterpolator._z._p0 = p1;
      self->_scaleInterpolator._z._p1 = FloatValue + p1;
      self->_scaleInterpolator._remainingInterpolations = 3;

    }
    else
    {
      self->_scaleZ = FloatValue + self->_scaleZ;
    }
  }
  else
  {
    v18 = BKLogMousePointer(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v29 = objc_msgSend(v7, "senderID");
      v30 = 134217984;
      v31 = v29;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "    ignored scale from conflicting sender %llX", (uint8_t *)&v30, 0xCu);
    }

  }
}

- (void)addRotationEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v6;
  uint64_t Phase;
  double FloatValue;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t TimeStamp;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  double v24;
  double p1;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  id v30;
  __int16 v31;
  double v32;

  v6 = a4;
  Phase = IOHIDEventGetPhase(a3);
  FloatValue = IOHIDEventGetFloatValue(a3, 327682);
  kdebug_trace(730468552, Phase, 0, 0, 0);
  v9 = kdebug_trace(730468556, *(_QWORD *)&FloatValue, 0, 0, 0);
  v11 = BKLogMousePointer(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v26 = BKNSStringFromIOHIDEventPhase(Phase);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v29 = 138543618;
    v30 = v27;
    v31 = 2048;
    v32 = FloatValue;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, " -> rotation phase:%{public}@ %g", (uint8_t *)&v29, 0x16u);

  }
  v13 = IOHIDEventGetPhase(a3);
  TimeStamp = IOHIDEventGetTimeStamp(a3);
  v15 = sub_100081598((uint64_t)&self->_rotationPhaseTracker, v13, v6, TimeStamp);
  if ((_DWORD)v15)
  {
    self->_eventTypeMask |= 0x20uLL;
    if ((self->_interpolateEventTypeMask & 0x20) != 0)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", v6));
      v20 = (void *)v19;
      if (v19)
        v21 = *(void **)(v19 + 72);
      else
        v21 = 0;
      v22 = v21;
      v23 = IOHIDEventGetTimeStamp(a3);
      v24 = sub_100081A08((uint64_t)v22);
      sub_100081AA0((uint64_t)&self->_rotationInterpolator, v23, v24);
      p1 = self->_rotationInterpolator._z._p1;
      self->_rotationInterpolator._z._p0 = p1;
      self->_rotationInterpolator._z._p1 = FloatValue + p1;
      self->_rotationInterpolator._remainingInterpolations = 3;

    }
    else
    {
      self->_rotationZ = FloatValue + self->_rotationZ;
    }
  }
  else
  {
    v17 = BKLogMousePointer(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v28 = objc_msgSend(v6, "senderID");
      v29 = 134217984;
      v30 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "    ignored rotation from conflicting sender %llX", (uint8_t *)&v29, 0xCu);
    }

  }
}

- (void)addTranslationEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v6;
  uint64_t Phase;
  double FloatValue;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t TimeStamp;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  double v26;
  double p1;
  double v28;
  uint64_t v29;
  void *v30;
  id v31;
  int v32;
  id v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;

  v6 = a4;
  Phase = IOHIDEventGetPhase(a3);
  FloatValue = IOHIDEventGetFloatValue(a3, 0x40000);
  v9 = IOHIDEventGetFloatValue(a3, 262145);
  v12 = BKLogMousePointer(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v29 = BKNSStringFromIOHIDEventPhase(Phase);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v32 = 138543874;
    v33 = v30;
    v34 = 2048;
    v35 = FloatValue;
    v36 = 2048;
    v37 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, " -> translation phase:%{public}@ %g,%g", (uint8_t *)&v32, 0x20u);

  }
  kdebug_trace(730468512, Phase, 0, 0, 0);
  kdebug_trace(730468516, *(_QWORD *)&FloatValue, 0, 0, 0);
  kdebug_trace(730468520, *(_QWORD *)&v9, 0, 0, 0);
  v14 = IOHIDEventGetPhase(a3);
  TimeStamp = IOHIDEventGetTimeStamp(a3);
  v16 = sub_100081360((uint64_t)&self->_translationPhaseTracker, v14, v6, TimeStamp);
  if ((_DWORD)v16)
  {
    self->_eventTypeMask |= 0x10uLL;
    if ((self->_interpolateEventTypeMask & 0x10) != 0)
    {
      v21 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:", v6));
      v22 = (void *)v21;
      if (v21)
        v23 = *(void **)(v21 + 72);
      else
        v23 = 0;
      v24 = v23;
      v25 = IOHIDEventGetTimeStamp(a3);
      v26 = sub_100081A08((uint64_t)v24);
      sub_100081AA0((uint64_t)&self->_translationInterpolator, v25, v26);
      p1 = self->_translationInterpolator._x._p1;
      self->_translationInterpolator._x._p0 = p1;
      self->_translationInterpolator._x._p1 = FloatValue + p1;
      v28 = self->_translationInterpolator._y._p1;
      self->_translationInterpolator._y._p0 = v28;
      self->_translationInterpolator._y._p1 = v9 + v28;
      self->_translationInterpolator._remainingInterpolations = 3;

    }
    else
    {
      v18 = v9 + self->_translationDelta.y;
      self->_translationDelta.x = FloatValue + self->_translationDelta.x;
      self->_translationDelta.y = v18;
    }
  }
  else
  {
    v19 = BKLogMousePointer(v16, v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(v6, "senderID");
      v32 = 134217984;
      v33 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "    ignored translation from conflicting sender %llX", (uint8_t *)&v32, 0xCu);
    }

  }
}

- (void)addForceEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v7;
  int Type;
  int v9;
  unsigned int IntegerValue;
  uint64_t v11;
  double DoubleValue;
  double v13;
  double v14;
  double v15;
  uint64_t VendorDefinedData;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  __IOHIDEvent *forceEvent;
  uint64_t v28;
  void *v29;
  void *v30;
  NSString *v31;
  id v32;
  uint64_t v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  _BYTE v42[34];
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;

  v7 = a4;
  Type = IOHIDEventGetType(a3);
  v9 = Type;
  if (Type == 1)
  {
    v37 = 0;
    v38 = 0;
    VendorDefinedData = IOHIDEventGetVendorDefinedData(a3, &v38, &v37);
    IntegerValue = 0;
    v18 = v38;
    DoubleValue = 0.0;
    if (v38)
    {
      v19 = v37;
      v11 = 0;
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      if (v37 >= 1)
      {
        self->_eventTypeMask |= 2uLL;
        if (v19 <= 0x2F)
        {
          v20 = BKLogMousePointer(VendorDefinedData, v17);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v40 = 48;
            v41 = 2048;
            *(_QWORD *)v42 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Force stage event size mismatch want:%lu got:%ld", buf, 0x16u);
          }

        }
        IntegerValue = *(_DWORD *)v18;
        v11 = *(unsigned int *)(v18 + 4);
        DoubleValue = *(double *)(v18 + 8);
        v13 = *(double *)(v18 + 16);
        v14 = *(double *)(v18 + 24);
        v15 = *(double *)(v18 + 32);
      }
    }
    else
    {
      v11 = 0;
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
    }
  }
  else
  {
    if (Type != 41)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("need vendor defined / force stage event")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v31 = NSStringFromSelector(a2);
        v32 = (id)objc_claimAutoreleasedReturnValue(v31);
        v34 = (objc_class *)objc_opt_class(self, v33);
        v35 = NSStringFromClass(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        *(_DWORD *)buf = 138544642;
        v40 = (uint64_t)v32;
        v41 = 2114;
        *(_QWORD *)v42 = v36;
        *(_WORD *)&v42[8] = 2048;
        *(_QWORD *)&v42[10] = self;
        *(_WORD *)&v42[18] = 2114;
        *(_QWORD *)&v42[20] = CFSTR("BKMousePointerEventAccumulator.mm");
        *(_WORD *)&v42[28] = 1024;
        *(_DWORD *)&v42[30] = 1521;
        v43 = 2114;
        v44 = *(double *)&v30;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v30), "UTF8String"));
      __break(0);
      JUMPOUT(0x100080BBCLL);
    }
    self->_eventTypeMask |= 0x20000000000uLL;
    IntegerValue = IOHIDEventGetIntegerValue(a3, 2686976);
    v11 = IOHIDEventGetIntegerValue(a3, 2686977);
    DoubleValue = IOHIDEventGetDoubleValue(a3, 2686978);
    v13 = IOHIDEventGetDoubleValue(a3, 2686979);
    v14 = IOHIDEventGetDoubleValue(a3, 2686980);
    v15 = IOHIDEventGetDoubleValue(a3, 2686981);
  }
  v22 = CFSTR("Vendor Defined");
  if (v9 == 41)
    v22 = CFSTR("POR");
  v23 = v22;
  v25 = BKLogMousePointer(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v28 = NSStringFromBKSHIDForceStageTransition(v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 138544898;
    v40 = (uint64_t)v23;
    v41 = 1024;
    *(_DWORD *)v42 = IntegerValue;
    *(_WORD *)&v42[4] = 2114;
    *(_QWORD *)&v42[6] = v29;
    *(_WORD *)&v42[14] = 2048;
    *(double *)&v42[16] = v15;
    *(_WORD *)&v42[24] = 2048;
    *(double *)&v42[26] = DoubleValue;
    v43 = 2048;
    v44 = v13;
    v45 = 2048;
    v46 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, " -> %{public}@ force stage:%u transition:%{public}@ progress:%f nextThreshold:%f pressedThreshold:%f releasedThreshold:%f", buf, 0x44u);

  }
  forceEvent = self->_forceEvent;
  if (forceEvent)
    CFRelease(forceEvent);
  self->_forceEvent = (__IOHIDEvent *)IOHIDEventCreateCopy(kCFAllocatorDefault, a3);
  self->_forceDidChange = self->_force != v15;
  self->_stage = IntegerValue;
  self->_force = v15;

}

- (void)_terminateAllGesturesForSender:(id)a3
{
  id v4;

  v4 = a3;
  -[BKMouseEventAccumulator _terminateScrollingForSender:](self, "_terminateScrollingForSender:");
  if (sub_100081360((uint64_t)&self->_translationPhaseTracker, 4, v4, 0))
  {
    self->_translationPhaseTracker._sentTerminalEvent = 1;
    self->_translationDelta.x = 0.0;
    self->_translationDelta.y = 0.0;
    self->_eventTypeMask |= 0x10uLL;
  }
  if (sub_100081598((uint64_t)&self->_rotationPhaseTracker, 4, v4, 0))
  {
    self->_rotationPhaseTracker._sentTerminalEvent = 1;
    self->_rotationZ = 0.0;
    self->_eventTypeMask |= 0x20uLL;
  }
  if (sub_1000817D0((uint64_t)&self->_scalePhaseTracker, 4, v4, 0))
  {
    self->_scalePhaseTracker._sentTerminalEvent = 1;
    self->_scaleZ = 0.0;
    self->_eventTypeMask |= 0x80uLL;
  }

}

- (void)_terminateScrollingForSender:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = sub_100081128((uint64_t)&self->_scrollPhaseTracker, 4, a3, 0);
  if ((_DWORD)v4)
  {
    v6 = BKLogMousePointer(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, " -> discrete scroll -- end phase (service disappeared)", v8, 2u);
    }

    ++self->_discreteScrollGeneration;
    self->_scrollPhaseTracker._sentTerminalEvent = 1;
    self->_scrollPhaseDidChange = 1;
    self->_scrollPhase = 4;
    self->_eventTypeMask |= 0x40uLL;
    self->_scrollUnacceleratedDelta = 0u;
    self->_scrollAcceleratedDelta = 0u;
  }
}

- (id)_eventStateForSender:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  _BKMouseDeviceEventState *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  objc_super v19;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "senderID")));
  v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_eventStateBySenderID, "objectForKeyedSubscript:", v6));
  if (!v7)
  {
    v8 = [_BKMouseDeviceEventState alloc];
    v9 = v5;
    if (v8)
    {
      v19.receiver = v8;
      v19.super_class = (Class)_BKMouseDeviceEventState;
      v10 = -[BKMouseEventAccumulator init](&v19, "init");
      v7 = (uint64_t)v10;
      if (v10)
      {
        objc_storeStrong((id *)v10 + 3, a3);
        *(_DWORD *)(v7 + 20) = objc_msgSend(v9, "eventSource");
        if (objc_msgSend(v9, "eventSource") == 11)
        {
          v12 = objc_opt_class(BKIOHIDService, v11);
          v13 = v9;
          v14 = v13;
          if (v12)
          {
            if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
              v15 = v14;
            else
              v15 = 0;
          }
          else
          {
            v15 = 0;
          }
          v16 = v15;

          v17 = objc_msgSend(v16, "claimsToConformToUsagePage:usage:", 13, 12);
          *(_BYTE *)(v7 + 17) = v17 ^ 1;
        }
        else
        {
          *(_BYTE *)(v7 + 17) = 0;
        }
      }
    }
    else
    {
      v7 = 0;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventStateBySenderID, "setObject:forKeyedSubscript:", v7, v6);
  }

  return (id)v7;
}

- (unint64_t)eventTypeMask
{
  return self->_eventTypeMask;
}

- (unsigned)previousButtonMask
{
  return self->_previousButtonMask;
}

- (unsigned)buttonMask
{
  return self->_buttonMask;
}

- (double)force
{
  return self->_force;
}

- (unsigned)stage
{
  return self->_stage;
}

- (BOOL)forceDidChange
{
  return self->_forceDidChange;
}

- (NSIndexSet)touchingPathIndexes
{
  return self->_touchingPathIndexes;
}

- (NSMutableArray)digitizerEvents
{
  return self->_digitizerEvents;
}

- (void)setDigitizerEvents:(id)a3
{
  objc_storeStrong((id *)&self->_digitizerEvents, a3);
}

- (unsigned)scrollPhase
{
  return self->_scrollPhase;
}

- (CGPoint)pointerAbsolutePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_pointerAbsolutePosition.x;
  y = self->_pointerAbsolutePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)absolutePositionIsValid
{
  return self->_absolutePositionIsValid;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (BKHIDEventSenderInfo)mostRecentSender
{
  return self->_mostRecentSender;
}

- (BOOL)shouldScrollNaturally
{
  return self->_shouldScrollNaturally;
}

- (void)setShouldScrollNaturally:(BOOL)a3
{
  self->_shouldScrollNaturally = a3;
}

- (BOOL)shouldSwapPrimaryAndSecondaryButtons
{
  return self->_shouldSwapPrimaryAndSecondaryButtons;
}

- (BOOL)shouldUseButtonDownRecenteringBehavior
{
  return self->_shouldUseButtonDownRecenteringBehavior;
}

- (void)setShouldUseButtonDownRecenteringBehavior:(BOOL)a3
{
  self->_shouldUseButtonDownRecenteringBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentSender, 0);
  objc_storeStrong((id *)&self->_touchingPathIndexes, 0);
  objc_storeStrong((id *)&self->_buttonEvents, 0);
  objc_storeStrong((id *)&self->_digitizerEvents, 0);

  objc_storeStrong((id *)&self->_doomedSenderIDs, 0);
  objc_storeStrong((id *)&self->_eventStateBySenderID, 0);
  objc_storeStrong(&self->_postEventAsyncBlock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 47) = 0;
  *((_QWORD *)self + 63) = 0;
  *((_QWORD *)self + 75) = 0;
  return self;
}

@end
