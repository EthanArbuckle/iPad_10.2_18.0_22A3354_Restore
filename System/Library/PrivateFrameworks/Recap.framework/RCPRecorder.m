@implementation RCPRecorder

+ (id)sharedRecorder
{
  if (sharedRecorder_onceToken != -1)
    dispatch_once(&sharedRecorder_onceToken, &__block_literal_global_7);
  return (id)sharedRecorder__sharedRecorder;
}

void __29__RCPRecorder_sharedRecorder__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v0 = objc_opt_new();
  v1 = (void *)sharedRecorder__sharedRecorder;
  sharedRecorder__sharedRecorder = v0;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v3 = (id)sharedRecorder__sharedRecorder;
  objc_msgSend(v2, "set");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3[2];
  v3[2] = v4;

}

+ (BOOL)shouldRecordSenderProperties
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldRecordSenderProperties");

  return v3;
}

+ (void)registerEventStreamRecorder:(id)a3
{
  id v3;
  void *v4;
  id *v5;

  v3 = a3;
  +[RCPRecorder sharedRecorder](RCPRecorder, "sharedRecorder");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[2], "addObject:", v3);
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "ignoreSenderProperties");
  if ((v3 & 1) == 0)
    objc_msgSend(v5, "setShouldRecordSenderProperties:", 1);
  objc_msgSend(v5, "_registerIOHIDClient");

}

+ (void)unregisterEventStreamRecorder:(id)a3
{
  id v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[RCPRecorder sharedRecorder](RCPRecorder, "sharedRecorder");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4[2], "removeObject:", v3);
  if (!objc_msgSend(v4[2], "count"))
    objc_msgSend(v4, "_unregisterIOHIDClient");
  objc_msgSend(v4, "setShouldRecordSenderProperties:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "config", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "ignoreSenderProperties");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v4, "setShouldRecordSenderProperties:", 1);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (__IOHIDEvent)_newLocationEventFromNormalPoint:(CGPoint)a3
{
  __IOHIDEvent *v3;

  v3 = (__IOHIDEvent *)IOHIDEventCreate();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  return v3;
}

- (__IOHIDEvent)_initialLocationEvent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedGlobalPointerPosition");
  v5 = v4;
  v7 = v6;

  return -[RCPRecorder _newLocationEventFromNormalPoint:](self, "_newLocationEventFromNormalPoint:", v5, v7);
}

- (void)_registerIOHIDClient
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSMutableSet *obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  RCPRecorder *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id v29;
  RCPRecorder *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!self->_ioRunLoop)
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v25 = self;
    obj = self->_activeRecorders;
    v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v41;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v41 != v22)
          {
            v6 = v5;
            objc_enumerationMutation(obj);
            v5 = v6;
          }
          v24 = v5;
          v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v5);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v7, "config");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "deviceUsagePageArray");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v37 != v11)
                  objc_enumerationMutation(v9);
                v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                if (objc_msgSend(v13, "unsignedIntValue") == 1)
                  self->_shouldRecordInitialPointerLocation = 1;
                v44 = CFSTR("DeviceUsagePage");
                v45 = v13;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v14);

                objc_msgSend(v13, "stringValue");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v15);

              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
            }
            while (v10);
          }

          v5 = v24 + 1;
        }
        while (v24 + 1 != v23);
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v23);
    }

    v16 = dispatch_semaphore_create(0);
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v17 = (void *)MEMORY[0x1E0CB3978];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __35__RCPRecorder__registerIOHIDClient__block_invoke;
    v26[3] = &unk_1E4FC2590;
    v31 = &v32;
    v18 = v16;
    v27 = v18;
    v19 = v3;
    v28 = v19;
    v20 = v4;
    v29 = v20;
    v30 = v25;
    objc_msgSend(v17, "detachNewThreadWithBlock:", v26);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    v25->_ioRunLoop = (__CFRunLoop *)v33[3];

    _Block_object_dispose(&v32, 8);
  }
}

void __35__RCPRecorder__registerIOHIDClient__block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  FILE **v7;
  id v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = CFRunLoopGetCurrent();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  RCPSetNonDecayingThreadPriority(63);
  v2 = (const void *)IOHIDEventSystemClientCreate();
  CFRunLoopGetCurrent();
  IOHIDEventSystemClientScheduleWithRunLoop();
  if (_CLTLogLevel >= 3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(", "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Recording usage pages (-d): %@\n"), v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    v7 = (FILE **)MEMORY[0x1E0C80C20];
    fputs(v6, (FILE *)*MEMORY[0x1E0C80C20]);

    fflush(*v7);
    if (_CLTLogLevel >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Actual filter array: %@\n"), *(_QWORD *)(a1 + 48));
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fputs((const char *)objc_msgSend(v8, "UTF8String"), *v7);

      fflush(*v7);
    }
  }
  IOHIDEventSystemClientSetMatchingMultiple();
  IOHIDEventSystemClientRegisterEventCallback();
  CFRunLoopRun();
  IOHIDEventSystemClientUnregisterEventCallback();
  CFRunLoopGetCurrent();
  IOHIDEventSystemClientUnscheduleWithRunLoop();
  CFRelease(v2);
}

- (void)_unregisterIOHIDClient
{
  CFRunLoopStop(self->_ioRunLoop);
  self->_ioRunLoop = 0;
}

- (BOOL)shouldRecordSenderProperties
{
  return self->_shouldRecordSenderProperties;
}

- (void)setShouldRecordSenderProperties:(BOOL)a3
{
  self->_shouldRecordSenderProperties = a3;
}

- (BOOL)shouldRecordInitialPointerLocation
{
  return self->_shouldRecordInitialPointerLocation;
}

- (void)setShouldRecordInitialPointerLocation:(BOOL)a3
{
  self->_shouldRecordInitialPointerLocation = a3;
}

- (RCPEventAction)pointerLocationAction
{
  return (RCPEventAction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPointerLocationAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerLocationAction, 0);
  objc_storeStrong((id *)&self->_activeRecorders, 0);
}

@end
