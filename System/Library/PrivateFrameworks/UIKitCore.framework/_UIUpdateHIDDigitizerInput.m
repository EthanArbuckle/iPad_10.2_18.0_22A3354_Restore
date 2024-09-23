@implementation _UIUpdateHIDDigitizerInput

- (__IOHIDEvent)stopEventForModelTime:(unint64_t)a3 alignment:(int)a4
{
  int64_t eventModelTimeDifferenceMin;
  int64_t shiftDuration;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __IOHIDEvent *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  eventModelTimeDifferenceMin = self->_eventModelTimeDifferenceMin;
  shiftDuration = self->_input._alignments[a4].shiftDuration;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_events;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = a3 - eventModelTimeDifferenceMin - shiftDuration;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v7);
      v13 = *(__IOHIDEvent **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      if ((IOHIDEventGetEventFlags() & 0x40) == 0 && v10 < IOHIDEventGetTimeStamp())
        break;
      if (v9 == ++v12)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v13 = 0;
  }

  return v13;
}

- (void)removeEvent:(__IOHIDEvent *)a3
{
  _UIUpdateInputInternal *p_input;

  p_input = &self->_input;
  -[NSMutableArray removeObjectIdenticalTo:](self->_events, "removeObjectIdenticalTo:", a3);
  if (-[NSMutableArray count](self->_events, "count"))
  {
    -[NSMutableArray firstObject](self->_events, "firstObject");

    self->_input._state.earliestModelTime = self->_eventModelTimeDifferenceMin + IOHIDEventGetTimeStamp();
  }
  else
  {
    self->_input._state.mode = self->_nextEventExpected;
  }
  _UIUpdateInputSetInputChanged(self->_input._set, (uint64_t)p_input);
}

- (void)addEvent:(__IOHIDEvent *)a3
{
  unint64_t TimeStamp;
  int64_t eventModelTimeDifferenceMin;
  int64_t eventModelTimeDifferenceMax;
  unsigned int EventFlags;
  char v9;
  _BOOL4 nextEventExpected;
  void *v11;
  int v12;
  __int16 v13;
  int64_t nextEventReceiveDeadlineTimeDifference;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  BOOL v19;
  NSMutableArray *events;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  _BOOL4 v26;
  double v27;
  double v28;
  int v29;
  int mode;
  char *v31;
  int v32;
  _BOOL4 v33;
  int v34;
  unsigned int v35;
  _BOOL4 v36;
  unsigned int v37;
  _QWORD v38[6];
  _QWORD v39[7];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  char v48[48];
  uint8_t buf[4];
  int v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  int v56;
  __int16 v57;
  unsigned int v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  int v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  TimeStamp = IOHIDEventGetTimeStamp();
  eventModelTimeDifferenceMin = self->_eventModelTimeDifferenceMin;
  eventModelTimeDifferenceMax = self->_eventModelTimeDifferenceMax;
  EventFlags = IOHIDEventGetEventFlags();
  v9 = IOHIDEventGetEventFlags();
  nextEventExpected = self->_nextEventExpected;
  BKSHIDEventGetDigitizerAttributes();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = EventFlags;
  v12 = v9 & 0x40;
  v13 = objc_msgSend(v11, "options");

  if ((v13 & 0x200) == 0 && self->_input._state.latestModelTime < eventModelTimeDifferenceMax + TimeStamp)
    self->_input._state.latestModelTime = eventModelTimeDifferenceMax + TimeStamp;
  nextEventReceiveDeadlineTimeDifference = self->_nextEventReceiveDeadlineTimeDifference;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v15 = self->_profile->var6 && v12 == 0;
  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke;
    v39[3] = &unk_1E16E08C0;
    v39[4] = self;
    v39[5] = &v44;
    v39[6] = &v40;
    _UIEventHIDEnumerateChildren((uint64_t)a3, 1, v39);
  }
  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke_2;
  v38[3] = &unk_1E16E08E8;
  v38[4] = self;
  v38[5] = a3;
  _UIEventHIDEnumerateChildren((uint64_t)a3, 11, v38);
  v17 = -[NSMutableSet count](self->_touches, "count");
  v18 = (_BYTE *)v41[3];
  v19 = v18 == 0;
  self->_nextEventExpected = v17 != 0;
  if (!v17)
    v19 = 0;
  if (v18 && v17)
    v19 = *v18 != 0;
  self->_nextEventExpected = v19;
  events = self->_events;
  if (*((_BYTE *)v45 + 24))
  {
    if (!-[NSMutableArray count](events, "count"))
      self->_input._state.mode = self->_nextEventExpected;
  }
  else
  {
    if (!-[NSMutableArray count](events, "count"))
    {
      v21 = eventModelTimeDifferenceMin + TimeStamp;
      if (v12)
        v21 = 0;
      self->_input._state.earliestModelTime = v21;
      self->_input._state.mode = 2;
    }
    -[NSMutableArray addObject:](self->_events, "addObject:", a3);
  }
  if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck())
  {
    v22 = addEvent____s_category_0;
    if (!addEvent____s_category_0)
    {
      v22 = __UILogCategoryGetNode("EventBus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&addEvent____s_category_0);
    }
    v23 = *(id *)(v22 + 8);
    v24 = os_signpost_id_make_with_pointer(*(os_log_t *)(v22 + 8), self);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v25 = v24;
      if (os_signpost_enabled(v23))
      {
        v35 = v12;
        v36 = nextEventExpected;
        v26 = v41[3] != 0;
        v33 = self->_nextEventExpected;
        v34 = *((unsigned __int8 *)v45 + 24);
        v27 = _UIMediaDurationForMachDuration(nextEventReceiveDeadlineTimeDifference);
        v28 = _UIMediaDurationForMachDuration(self->_nextEventReceiveDeadlineTimeDifference);
        v32 = -[NSMutableArray count](self->_events, "count");
        v29 = -[NSMutableSet count](self->_touches, "count");
        mode = self->_input._state.mode;
        memset(v48, 0, sizeof(v48));
        v31 = _UIMachTimeDebugDescriptionCopyCStr(TimeStamp, 0, v48, 0x30uLL);
        *(_DWORD *)buf = 67112194;
        v50 = (v37 >> 5) & 1;
        v51 = 1024;
        v52 = v36;
        v53 = 1024;
        v54 = v33;
        v55 = 1024;
        v56 = (unsigned __int16)(v13 & 0x200) >> 9;
        v57 = 1024;
        v58 = v35 >> 6;
        v59 = 1024;
        v60 = v26;
        v61 = 1024;
        v62 = v34;
        v63 = 2048;
        v64 = v27;
        v65 = 2048;
        v66 = v28;
        v67 = 1024;
        v68 = v32;
        v69 = 1024;
        v70 = v29;
        v71 = 1024;
        v72 = mode;
        v73 = 2080;
        v74 = v31;
        _os_signpost_emit_with_name_impl(&dword_185066000, v23, OS_SIGNPOST_EVENT, v25, "EventAdded", "interpolated=%u, expected=%u, nextExpected=%u, multiplexedMore=%u, synthetic=%u, nextInfo=%u, onlyInfo=%u, deadline=%.06f, nextDeadline=%.06f, events=%u, touches=%u, mode=%u, event=%s", buf, 0x5Cu);
      }
    }

  }
  _UIUpdateInputSetInputChanged(self->_input._set, (uint64_t)&self->_input);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

+ (char)inputWithProfileName:(uint64_t)a1
{
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  _UIUpdateHIDDigitizerInput *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[22];
  __int16 v23;
  char *v24;
  _OWORD v25[64];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  memset(v25, 0, 512);
  v3 = _UIUpdateInputTimingProfileLoad(a2, (uint64_t)v25);
  v4 = inputWithProfileName____s_category;
  if (!inputWithProfileName____s_category)
  {
    v4 = __UILogCategoryGetNode("EventBus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&inputWithProfileName____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = SLODWORD(v25[0]);
    v7 = v5;
    if (v6 >= 3)
      abort();
    v8 = v7;
    v9 = off_1E16E0908[v6];
    *(_DWORD *)v22 = 136315650;
    *(_QWORD *)&v22[4] = a2;
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = v9;
    v23 = 2080;
    v24 = (char *)v25 + 4;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Event Timing Profile for %s: %s, path=\"%s\", v22, 0x20u);

  }
  if (v3 && (v10 = [_UIUpdateHIDDigitizerInput alloc]) != 0)
  {
    *(_QWORD *)v22 = v10;
    *(_QWORD *)&v22[8] = _UIUpdateHIDDigitizerInput;
    v11 = (char *)objc_msgSendSuper2((objc_super *)v22, sel_init);
    v12 = v11;
    if (v11)
    {
      *((_QWORD *)v11 + 13) = v3;
      v13 = objc_opt_new();
      v14 = (void *)*((_QWORD *)v12 + 14);
      *((_QWORD *)v12 + 14) = v13;

      v15 = objc_opt_new();
      v16 = (void *)*((_QWORD *)v12 + 15);
      *((_QWORD *)v12 + 15) = v15;

      v17 = *(unsigned __int8 *)(v3 + 24);
      *((_QWORD *)v12 + 2) = 0;
      *((_QWORD *)v12 + 3) = 0;
      *((_QWORD *)v12 + 1) = 0;
      *((_DWORD *)v12 + 8) = v17;
      *(_OWORD *)(v12 + 40) = 0u;
      *(_OWORD *)(v12 + 56) = 0u;
      *((_QWORD *)v12 + 9) = 0;
      *((_QWORD *)v12 + 10) = _UIUpdateHIDDigitizerReadyForModelTime;
      *((_QWORD *)v12 + 11) = v12;
      *((_QWORD *)v12 + 12) = a2;
      _UIUpdateInputSetAddInput((uint64_t)&commonSet, (_QWORD *)v12 + 1);
      v18 = *((_QWORD *)v12 + 13);
      v19 = *(_QWORD *)(v18 + 8) + *(_QWORD *)v18;
      *((_QWORD *)v12 + 16) = v19 - *(_QWORD *)(v18 + 16);
      *((_QWORD *)v12 + 17) = *(_QWORD *)(v18 + 16) + v19;
      if (*(_BYTE *)(v18 + 24))
        *((_QWORD *)v12 + 6) = *(_QWORD *)(v18 + 32);
      v20 = *(_QWORD *)(v18 + 72);
      if (v20 && *(_BYTE *)(v20 + 8) || (v20 = *(_QWORD *)(v18 + 80)) != 0 && *(_BYTE *)(v20 + 8))
        *((_QWORD *)v12 + 18) = *(_QWORD *)v20;
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_profile);
  v3.receiver = self;
  v3.super_class = (Class)_UIUpdateHIDDigitizerInput;
  -[_UIUpdateHIDDigitizerInput dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
