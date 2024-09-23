@implementation UIEventBus

void __27___UIEventBus_drainEvents___block_invoke(uint64_t a1)
{
  char *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t TimeStamp;
  unint64_t v14;
  int v15;
  void *v16;
  int j;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  os_signpost_id_t v24;
  char *v25;
  char *v26;
  char *v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  _OWORD v31[3];
  _OWORD v32[3];
  _OWORD v33[3];
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = (char *)off_1ECD75C00 + 648;
  if (*((_DWORD *)off_1ECD75C00 + 160) != 1)
    v2 = 0;
  v3 = *(_QWORD *)v2;
  v4 = *((unsigned int *)v2 + 9);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  for (i = 16; i != 40; i += 8)
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + i), "stopEventForModelTime:alignment:", v3, v4);
    if (v7)
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObjectIdenticalTo:", v7);
      if (v8 < v5)
        v5 = v8;
    }
  }
  if (v5)
  {
    v9 = 0;
    v30 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      TimeStamp = IOHIDEventGetTimeStamp();
      v14 = TimeStamp;
      if (v10 <= TimeStamp)
        v10 = TimeStamp;
      if (v11 - 1 >= TimeStamp)
        v11 = TimeStamp;
      if (_UIInternalPreferencesRevisionOnce != -1)
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v15 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar >= 1)
      {
        for (j = _UIInternalPreference_UseHIDEventRemoteTimestamp;
              v15 != j;
              j = _UIInternalPreference_UseHIDEventRemoteTimestamp)
        {
          if (v15 < j)
          {
            if (byte_1EDDA82C4)
            {
              v29 = _UIEventHIDEventRemoteTimestamp((uint64_t)v12);
              if (v29)
              {
                v18 = qword_1ECD802C0;
                if (!qword_1ECD802C0)
                {
                  v18 = __UILogCategoryGetNode("RemoteTimestamp", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v18, (unint64_t *)&qword_1ECD802C0);
                }
                v19 = *(NSObject **)(v18 + 8);
                if (os_signpost_enabled(v19))
                {
                  *(_DWORD *)buf = 134218240;
                  v35 = v29;
                  v36 = 2048;
                  v37 = (char *)v14;
                  _os_signpost_emit_with_name_impl(&dword_185066000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRemoteTimestamp", "eventRemoteTime=%llu, eventTime=%llu", buf, 0x16u);
                }
              }
              v20 = v30;
              if (v30 <= v29)
                v20 = v29;
              v30 = v20;
            }
            break;
          }
          _UIInternalPreferenceSync(v15, &_UIInternalPreference_UseHIDEventRemoteTimestamp, (uint64_t)CFSTR("UseHIDEventRemoteTimestamp"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        }
      }
      -[_UIEventBus inputForEvent:](*(_QWORD **)(a1 + 32), (uint64_t)v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeEvent:", v12);

      objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v12, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", 0);

      ++v9;
    }
    while (v9 != v5);
    *(_QWORD *)&xmmword_1ECD82BE0 = v10;
    *((_QWORD *)&xmmword_1ECD82BE0 + 1) = v30;
    if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck())
    {
      v21 = qword_1ECD802C8;
      if (!qword_1ECD802C8)
      {
        v21 = __UILogCategoryGetNode("EventBus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD802C8);
      }
      v22 = *(id *)(v21 + 8);
      v23 = os_signpost_id_make_with_pointer(*(os_log_t *)(v21 + 8), *(const void **)(a1 + 32));
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v24 = v23;
        if (os_signpost_enabled(v22))
        {
          memset(v33, 0, sizeof(v33));
          v25 = _UIMachTimeDebugDescriptionCopyCStr(v3, 0, (char *)v33, 0x30uLL);
          memset(v32, 0, sizeof(v32));
          v26 = _UIMachTimeDebugDescriptionCopyCStr(v11, v3, (char *)v32, 0x30uLL);
          memset(v31, 0, sizeof(v31));
          v27 = _UIMachTimeDebugDescriptionCopyCStr(v10, v3, (char *)v31, 0x30uLL);
          v28 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
          *(_DWORD *)buf = 136316162;
          v35 = (unint64_t)v25;
          v36 = 2080;
          v37 = v26;
          v38 = 2080;
          v39 = v27;
          v40 = 1024;
          v41 = v5;
          v42 = 1024;
          v43 = v28;
          _os_signpost_emit_with_name_impl(&dword_185066000, v22, OS_SIGNPOST_EVENT, v24, "DrainEvents", "modelTime=%s, minEventTime=%s, maxEventTime=%s, drained=%u, remaining=%u", buf, 0x2Cu);
        }
      }

    }
  }
}

void __25___UIEventBus_addEvents___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v7, (_QWORD)v9);
        -[_UIEventBus inputForEvent:](*(_QWORD **)(a1 + 40), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEvent:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __19___UIEventBus_init__block_invoke(uint64_t a1)
{
  _UIUpdateHIDInput *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v2 = [_UIUpdateHIDInput alloc];
  if (v2)
  {
    v14.receiver = v2;
    v14.super_class = (Class)_UIUpdateHIDInput;
    v3 = (char *)objc_msgSendSuper2(&v14, sel_init);
    if (v3)
    {
      v4 = objc_opt_new();
      v5 = (void *)*((_QWORD *)v3 + 13);
      *((_QWORD *)v3 + 13) = v4;

      *((_DWORD *)v3 + 2) = 0;
      *((_OWORD *)v3 + 1) = xmmword_186677900;
      *((_DWORD *)v3 + 8) = 0;
      *(_OWORD *)(v3 + 40) = 0u;
      *(_OWORD *)(v3 + 56) = 0u;
      *(_OWORD *)(v3 + 72) = 0u;
      *((_QWORD *)v3 + 11) = 0;
      *((_QWORD *)v3 + 12) = "HIDEvent";
      _UIUpdateInputSetAddInput((uint64_t)&commonSet, (_QWORD *)v3 + 1);
    }
  }
  else
  {
    v3 = 0;
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v3;

  +[_UIUpdateHIDDigitizerInput inputWithProfileName:]((uint64_t)_UIUpdateHIDDigitizerInput, "Touch");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v8;

  +[_UIUpdateHIDDigitizerInput inputWithProfileName:]((uint64_t)_UIUpdateHIDDigitizerInput, "Pencil");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v11;

}

void __23___UIEventBus_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD802B8;
  qword_1ECD802B8 = v0;

}

@end
