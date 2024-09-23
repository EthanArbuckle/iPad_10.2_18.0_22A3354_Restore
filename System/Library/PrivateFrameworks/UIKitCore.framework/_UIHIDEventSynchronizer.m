@implementation _UIHIDEventSynchronizer

- (id)initWithStrategy:(void *)a3 runLoop:(const void *)a4 outputEventsHandler:(const void *)a5 completionHandler:
{
  id *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)_UIHIDEventSynchronizer;
  v9 = (id *)objc_msgSendSuper2(&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[1] = a2;
    objc_storeStrong(v9 + 5, a3);
    v11 = _Block_copy(a4);
    v12 = v10[3];
    v10[3] = v11;

    v13 = _Block_copy(a5);
    v14 = v10[4];
    v10[4] = v13;

  }
  return v10;
}

- (void)dealloc
{
  unint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  _UIHIDEventSynchronizer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = dealloc___s_category;
  if (!dealloc___s_category)
  {
    v3 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&dealloc___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v7 = self;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Decommissioned.", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIHIDEventSynchronizer;
  -[_UIHIDEventSynchronizer dealloc](&v5, sel_dealloc);
}

- (uint64_t)handleDigitizerEvent:(uint64_t)a1
{
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t TimeStamp;
  uint64_t v11;
  unint64_t v12;
  _UIHIDPath *v13;
  void *v14;
  _UIHIDPathCollection *v15;
  void *v16;
  double *v17;
  void *v18;
  uint64_t v19;
  _BYTE *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t v41[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE buf[24];
  void *v46;
  uint64_t *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  switch(*(_QWORD *)(a1 + 16))
  {
    case 0:
      v7 = qword_1ECD7C8E0;
      if (!qword_1ECD7C8E0)
      {
        v7 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD7C8E0);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v30 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = a2;
          _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Processing initial HID event: %@.", buf, 0x16u);
        }
      }
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __57___UIHIDEventSynchronizer__processInitialDigitizerEvent___block_invoke;
      v46 = &unk_1E16B1D90;
      v47 = &v37;
      _UIEventHIDEnumerateChildren(a2, 11, buf);
      if (v38[3])
      {
        BKSHIDEventGetDigitizerAttributes();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)(a1 + 48) = _UIEventHIDHitTestPointForChild(v8);
        *(_QWORD *)(a1 + 56) = v9;

        TimeStamp = IOHIDEventGetTimeStamp();
        *(double *)(a1 + 64) = _UIMediaTimeForMachTime(TimeStamp);
        v11 = *(_QWORD *)(a1 + 8);
        if (v11 == 1)
        {
          v26 = qword_1ECD7C8F8;
          if (!qword_1ECD7C8F8)
          {
            v26 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v26, (unint64_t *)&qword_1ECD7C8F8);
          }
          if ((*(_BYTE *)v26 & 1) != 0)
          {
            v32 = *(NSObject **)(v26 + 8);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v41 = 134217984;
              v42 = a1;
              _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Preparing for passthrough.", v41, 0xCu);
            }
          }
          v19 = 0;
          goto LABEL_44;
        }
        if (v11 == 2)
        {
          v12 = qword_1ECD7C8F0;
          if (!qword_1ECD7C8F0)
          {
            v12 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v12, (unint64_t *)&qword_1ECD7C8F0);
          }
          if ((*(_BYTE *)v12 & 1) != 0)
          {
            v31 = *(NSObject **)(v12 + 8);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v41 = 134217984;
              v42 = a1;
              _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Preparing for synchronization.", v41, 0xCu);
            }
          }
          v13 = objc_alloc_init(_UIHIDPath);
          v14 = *(void **)(a1 + 72);
          *(_QWORD *)(a1 + 72) = v13;

          v15 = objc_alloc_init(_UIHIDPathCollection);
          v16 = *(void **)(a1 + 80);
          *(_QWORD *)(a1 + 80) = v15;

          v17 = -[_UIHIDPathSynchronizationFilter initWithPosition:timestamp:]((double *)[_UIHIDPathSynchronizationFilter alloc], *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
          v18 = *(void **)(a1 + 88);
          *(_QWORD *)(a1 + 88) = v17;

          objc_msgSend(*(id *)(a1 + 72), "setDeliveryPhase:", 4);
          *(_QWORD *)(a1 + 96) = 5;
          objc_msgSend(*(id *)(a1 + 72), "updateWithHIDEvent:", v38[3]);
          objc_msgSend(*(id *)(a1 + 80), "updateWithHIDEvent:", a2);
          v19 = 1;
LABEL_44:
          *(_QWORD *)(a1 + 16) = 1;
          goto LABEL_51;
        }
        v27 = qword_1ECD7C900;
        if (!qword_1ECD7C900)
        {
          v27 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v27, (unint64_t *)&qword_1ECD7C900);
        }
        v28 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(_QWORD *)(a1 + 8);
          *(_DWORD *)v41 = 134218240;
          v42 = a1;
          v43 = 2048;
          v44 = v29;
          _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "[SYNCHRONIZER: %p] Unknown synchronization strategy: %lu.", v41, 0x16u);
        }
        -[_UIHIDEventSynchronizer _completeWithReason:](a1, (uint64_t)"invalid synchronization strategy");
      }
      else
      {
        v24 = qword_1ECD7C8E8;
        if (!qword_1ECD7C8E8)
        {
          v24 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v24, (unint64_t *)&qword_1ECD7C8E8);
        }
        v25 = *(NSObject **)(v24 + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 134218242;
          v42 = a1;
          v43 = 2112;
          v44 = a2;
          _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_DEFAULT, "[SYNCHRONIZER: %p] Unable to find child digitizer event in the initial HID event: %@.", v41, 0x16u);
        }
        -[_UIHIDEventSynchronizer _completeWithReason:](a1, (uint64_t)"unexpected event data");
      }
      v19 = 0;
LABEL_51:
      _Block_object_dispose(&v37, 8);
      break;
    case 1:
      v20 = (_BYTE *)qword_1ECD7C908;
      if (!qword_1ECD7C908)
      {
        v20 = (_BYTE *)(__UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v20, (unint64_t *)&qword_1ECD7C908);
      }
      if ((*v20 & 1) != 0)
        -[_UIHIDEventSynchronizer _logPerformanceData:](a1, a2);
      if (*(_QWORD *)(a1 + 8) == 1)
      {
        -[_UIHIDEventSynchronizer _completeWithReason:](a1, (uint64_t)"Passthrough session ended");
        return 0;
      }
      if (!-[_UIHIDEventSynchronizer _processDigitizerEvent:]((_QWORD *)a1, a2))
        return 0;
      if (*(_QWORD *)(a1 + 88) && !*(_QWORD *)(a1 + 104) && *(_QWORD *)(a1 + 16) == 1)
      {
        v21 = qword_1ECD7C938;
        if (!qword_1ECD7C938)
        {
          v21 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v21, (unint64_t *)&qword_1ECD7C938);
        }
        if ((*(_BYTE *)v21 & 1) != 0)
        {
          v33 = *(NSObject **)(v21 + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = *(_QWORD *)(a1 + 88);
            v35 = v33;
            if (v34)
              v36 = *(_QWORD *)(v34 + 96);
            else
              v36 = 0;
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v36;
            _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Begin rendering. Filter state: %ld.", buf, 0x16u);

          }
        }
        objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", a1, sel__renderEvents_);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 104);
        *(_QWORD *)(a1 + 104) = v22;

        objc_msgSend(*(id *)(a1 + 104), "addToRunLoop:forMode:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0C99860]);
        *(_QWORD *)(a1 + 16) = 2;
      }
      return 1;
    case 2:
    case 3:
      return -[_UIHIDEventSynchronizer _processDigitizerEvent:]((_QWORD *)a1, a2);
    case 4:
      v5 = _MergedGlobals_926;
      if (!_MergedGlobals_926)
      {
        v5 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_MergedGlobals_926);
      }
      if ((*(_BYTE *)v5 & 1) != 0)
      {
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = a1;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] event is received after synchronization session completed. Will pass through.", buf, 0xCu);
        }
      }
      return 0;
    default:
      return 0;
  }
  return v19;
}

- (uint64_t)_processDigitizerEvent:(_QWORD *)a1
{
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  unint64_t v11;
  NSObject *v12;
  char IntegerValue;
  uint64_t v14;
  _BYTE *v15;
  unsigned int v16;
  uint64_t v17;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t TimeStamp;
  double v24;
  unint64_t v25;
  NSObject *v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  _QWORD *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50___UIHIDEventSynchronizer__processDigitizerEvent___block_invoke;
  v27[3] = &unk_1E16B1D68;
  v27[4] = a1;
  v27[5] = &v28;
  _UIEventHIDEnumerateChildren(a2, 11, v27);
  if (!v29[3])
  {
    v11 = qword_1ECD7C910;
    if (!qword_1ECD7C910)
    {
      v11 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&qword_1ECD7C910);
    }
    if ((*(_BYTE *)v11 & 1) == 0)
      goto LABEL_24;
    v12 = *(NSObject **)(v11 + 8);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 134218242;
    v33 = a1;
    v34 = 2112;
    v35 = *(double *)&a2;
    v7 = "[SYNCHRONIZER: %p] Skipping event without relevant path id: %@";
    v8 = v12;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 22;
    goto LABEL_7;
  }
  if (a1[2] == 3)
  {
    v4 = qword_1ECD7C918;
    if (!qword_1ECD7C918)
    {
      v4 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1ECD7C918);
    }
    v5 = *(NSObject **)(v4 + 8);
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = a1;
      v7 = "[SYNCHRONIZER: %p] We haven't finished synthesizing the output path, but are already receiving new input path"
           ". Passing the event through.";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 12;
LABEL_7:
      _os_log_impl(&dword_185066000, v8, v9, v7, buf, v10);
LABEL_24:
      v6 = 0;
    }
  }
  else
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v14 = IOHIDEventGetIntegerValue();
    v15 = (_BYTE *)qword_1ECD7C920;
    if (!qword_1ECD7C920)
    {
      v15 = (_BYTE *)(__UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v15, (unint64_t *)&qword_1ECD7C920);
    }
    v16 = IntegerValue & 0x80;
    if ((*v15 & 1) != 0)
    {
      BKSHIDEventGetDigitizerAttributes();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = _UIEventHIDHitTestPointForChild(v19);
      v22 = v21;

      TimeStamp = IOHIDEventGetTimeStamp();
      v24 = _UIMediaTimeForMachTime(TimeStamp);
      v25 = qword_1ECD7C928;
      if (!qword_1ECD7C928)
      {
        v25 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&qword_1ECD7C928);
      }
      if ((*(_BYTE *)v25 & 1) != 0)
      {
        v26 = *(NSObject **)(v25 + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134219264;
          v33 = a1;
          v34 = 2048;
          v35 = v24;
          v36 = 2048;
          v37 = v20;
          v38 = 2048;
          v39 = v22;
          v40 = 1024;
          v41 = v14 != 0;
          v42 = 1024;
          v43 = v16 >> 7;
          _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Processing digitizer event: %f, [%f:%f], touch: %d, cancel: %d.)", buf, 0x36u);
        }
      }
    }
    if ((-[_UIHIDPathSynchronizationFilter addInputEvent:](a1[11], v29[3]) & 1) == 0)
    {
      -[_UIHIDEventSynchronizer _completeWithReason:]((uint64_t)a1, (uint64_t)"unexpected event data");
      goto LABEL_24;
    }
    if (!v14 || v16)
    {
      v17 = 6;
      if (v16)
        v17 = 7;
      a1[12] = v17;
      a1[2] = 3;
    }
    v6 = 1;
  }
  _Block_object_dispose(&v28, 8);
  return v6;
}

- (uint64_t)_completeWithReason:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = qword_1ECD7C930;
    if (!qword_1ECD7C930)
    {
      v4 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1ECD7C930);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218242;
      v13 = v3;
      v14 = 2080;
      v15 = a2;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "[SYNCHRONIZER: %p] Session finished with reason '%s'.", (uint8_t *)&v12, 0x16u);
    }
    if (*(_QWORD *)(v3 + 104))
    {
      v6 = qword_1ECD7C940;
      if (!qword_1ECD7C940)
      {
        v6 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&qword_1ECD7C940);
      }
      if ((*(_BYTE *)v6 & 1) != 0)
      {
        v8 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(v3 + 88);
          v10 = v8;
          if (v9)
            v11 = *(_QWORD *)(v9 + 96);
          else
            v11 = 0;
          v12 = 134218240;
          v13 = v3;
          v14 = 2048;
          v15 = v11;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Stop rendering. Filter state: %ld.", (uint8_t *)&v12, 0x16u);

        }
      }
      objc_msgSend(*(id *)(v3 + 104), "invalidate");
      v7 = *(void **)(v3 + 104);
      *(_QWORD *)(v3 + 104) = 0;

    }
    *(_QWORD *)(v3 + 16) = 4;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

- (void)_logPerformanceData:(uint64_t)a1
{
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t TimeStamp;
  double v8;
  double v9;
  uint64_t Latency;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47___UIHIDEventSynchronizer__logPerformanceData___block_invoke;
  v15[3] = &unk_1E16B1D90;
  v15[4] = &v16;
  _UIEventHIDEnumerateChildren(a2, 11, v15);
  if (v17[3])
  {
    BKSHIDEventGetDigitizerAttributes();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = _UIEventHIDHitTestPointForChild(v3);
    v6 = v5;

    TimeStamp = IOHIDEventGetTimeStamp();
    v8 = _UIMediaTimeForMachTime(TimeStamp);
    v9 = *(double *)(a1 + 64);
    Latency = IOHIDEventGetLatency();
    v11 = _logPerformanceData____s_category;
    if (!_logPerformanceData____s_category)
    {
      v11 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_logPerformanceData____s_category);
    }
    if ((*(_BYTE *)v11 & 1) != 0)
    {
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219520;
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(_QWORD *)(a1 + 56);
        v21 = a1;
        v22 = 2048;
        v23 = v13;
        v24 = 2048;
        v25 = v14;
        v26 = 2048;
        v27 = v4;
        v28 = 2048;
        v29 = v6;
        v30 = 2048;
        v31 = v8 - v9;
        v32 = 2048;
        v33 = (double)(unint64_t)Latency / 1000000.0;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Received second digitizer event. Initial path: [%f:%f] -> [%f:%f], duration: %f. Latency: %f.", buf, 0x48u);
      }
    }
  }
  _Block_object_dispose(&v16, 8);
}

- (void)_renderEvents:(id)a3
{
  double v4;
  _UIHIDPathCollection *outputPathCollection;
  unint64_t v6;
  _UIHIDPathSynchronizationFilter *v7;
  _UIHIDPathSynchronizationFilter *v8;
  double outputPositionTimestamp;
  unint64_t v10;
  _UIHIDPathSynchronizationFilter *v11;
  NSObject *v12;
  _UIHIDPathSynchronizationFilter *pathFilter;
  NSObject *v14;
  int64_t state;
  NSObject *v16;
  _UIHIDPathSynchronizationFilter *v17;
  NSObject *v18;
  int64_t v19;
  NSObject *v20;
  int v21;
  _UIHIDEventSynchronizer *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = CACurrentMediaTime();
    outputPathCollection = self->_outputPathCollection;
    if (self->_offsetToNextCoalescableEventIndex < 1)
    {
      -[_UIHIDPathCollection setDigitizerSenderID:](outputPathCollection, "setDigitizerSenderID:", 0x8000000800A15171);
    }
    else
    {
      -[_UIHIDPathCollection setDigitizerSenderID:](outputPathCollection, "setDigitizerSenderID:", 0x8000000800A15175);
      --self->_offsetToNextCoalescableEventIndex;
    }
    v6 = qword_1ECD7C948;
    if (!qword_1ECD7C948)
    {
      v6 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7C948);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v12 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        pathFilter = self->_pathFilter;
        v14 = v12;
        if (pathFilter)
          state = pathFilter->_state;
        else
          state = 0;
        v21 = 134218496;
        v22 = self;
        v23 = 2048;
        v24 = v4;
        v25 = 2048;
        v26 = state;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Synthesize output event with timestamp: %f. Filter state: %ld.", (uint8_t *)&v21, 0x20u);

      }
    }
    -[_UIHIDPathSynchronizationFilter computeNextOutputPosition:]((uint64_t)self->_pathFilter, v4);
    if (-[_UIHIDPath deliveryPhase](self->_outputPath, "deliveryPhase") == 4)
      -[_UIHIDPath setDeliveryPhase:](self->_outputPath, "setDeliveryPhase:", 5);
    v7 = self->_pathFilter;
    if (v7 && v7->_state == 2)
    {
      -[_UIHIDPath setDeliveryPhase:](self->_outputPath, "setDeliveryPhase:", self->_endingDeliveryPhase);
      v7 = self->_pathFilter;
    }
    -[_UIHIDPath setPosition:](self->_outputPath, "setPosition:", -[_UIHIDPathSynchronizationFilter outputPosition]((uint64_t)v7));
    -[_UIHIDPathCollection addPath:](self->_outputPathCollection, "addPath:", self->_outputPath);
    v8 = self->_pathFilter;
    if (v8)
      outputPositionTimestamp = v8->_outputPositionTimestamp;
    else
      outputPositionTimestamp = 0.0;
    -[_UIHIDPathCollection updateEventTimestamp:](self->_outputPathCollection, "updateEventTimestamp:", _UIMachTimeForMediaTime(outputPositionTimestamp));
    -[_UIHIDPathCollection hidEventFromCurrentState](self->_outputPathCollection, "hidEventFromCurrentState");
    v10 = qword_1ECD7C950;
    if (!qword_1ECD7C950)
    {
      v10 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD7C950);
    }
    if ((*(_BYTE *)v10 & 1) != 0)
    {
      v16 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = self->_pathFilter;
        v18 = v16;
        v19 = (int64_t)v17;
        v20 = v18;
        if (v17)
          v19 = v17->_state;
        v21 = 134218240;
        v22 = self;
        v23 = 2048;
        v24 = *(double *)&v19;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Deliver rendered event. Filter state: %ld.", (uint8_t *)&v21, 0x16u);

      }
    }
    (*((void (**)(void))self->_outputEventsHandler + 2))();
  }
  v11 = self->_pathFilter;
  if (v11)
  {
    if (v11->_state == 2)
      -[_UIHIDEventSynchronizer _completeWithReason:]((uint64_t)self, (uint64_t)"paths in sync");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_pathFilter, 0);
  objc_storeStrong((id *)&self->_outputPathCollection, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_outputEventsHandler, 0);
}

@end
