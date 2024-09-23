@implementation SPSampledProcess

- (SPSampledProcess)initWithPid:(int)a3 isWSBased:(BOOL)a4
{
  SPSampledProcess *v6;
  NSObject *v7;
  objc_super v9;
  char __str[64];

  v9.receiver = self;
  v9.super_class = (Class)SPSampledProcess;
  v6 = -[SPMonitoredProcess initWithPid:](&v9, "initWithPid:");
  if (v6)
  {
    snprintf(__str, 0x40uLL, "com.apple.spindump.sampled_process_%d", a3);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->super.super._processingQueue = (OS_dispatch_queue *)dispatch_queue_create(__str, v7);
    dispatch_release(v7);
    v6->super.super._isWSBased = a4;
    v6->_samplingMode = 3;
    v6->_sampledProcesses = 0;
    v6->_cancelOnMemoryPressure = 0;
  }
  return v6;
}

- (void)dealloc
{
  NSObject *hidEventSem;
  OS_dispatch_source *exitHIDSource;
  objc_super v5;

  hidEventSem = self->_hidEventSem;
  if (hidEventSem)
    dispatch_release(hidEventSem);
  exitHIDSource = self->_exitHIDSource;
  if (exitHIDSource)
    dispatch_release((dispatch_object_t)exitHIDSource);

  v5.receiver = self;
  v5.super_class = (Class)SPSampledProcess;
  -[SPProcessEvent dealloc](&v5, "dealloc");
}

- (BOOL)cancelOnMemoryPressure
{
  return self->_cancelOnMemoryPressure;
}

- (void)setCancelOnMemoryPressure:(BOOL)a3
{
  self->_cancelOnMemoryPressure = a3;
  if (a3)
    +[SPSampledProcess startMemoryPressureTimer](SPSampledProcess, "startMemoryPressureTimer");
}

+ (id)copySampledProcessForPid:(int)a3 isWSBased:(BOOL)a4 createIfUnsampled:(BOOL)a5 wasSampled:(BOOL *)a6
{
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[7];
  int v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v9 = *(_QWORD *)&a3;
  if (qword_1000E3C70 != -1)
    dispatch_once(&qword_1000E3C70, &stru_1000D58E0);
  v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v9);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_10005DAA0;
  v21 = sub_10005DAB0;
  v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005DABC;
  v13[3] = &unk_1000D5908;
  v13[4] = v10;
  v13[5] = &v17;
  v15 = a5;
  v14 = v9;
  v16 = a4;
  v13[6] = a6;
  dispatch_sync((dispatch_queue_t)qword_1000E3C80, v13);

  v11 = (void *)v18[5];
  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (id)allSampledProcesses
{
  return objc_msgSend((id)qword_1000E3C78, "allValues");
}

- (void)removeSelfFromPidCache
{
  int targetProcessId;
  _QWORD v3[5];
  int v4;

  if (self->super.super._isSelfInPidCache)
  {
    self->super.super._isSelfInPidCache = 0;
    targetProcessId = self->super.super._targetProcessId;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10005DC2C;
    v3[3] = &unk_1000D5828;
    v4 = targetProcessId;
    v3[4] = self;
    dispatch_async((dispatch_queue_t)qword_1000E3C80, v3);
  }
}

- (void)gatherLoadInfoForPid:(int)a3
{
  -[SPStackshotProvider gatherLoadInfoForPid:](self->super.super._sampleProvider, "gatherLoadInfoForPid:", *(_QWORD *)&a3);
}

- (void)createHIDExitSource
{
  int *p_targetProcessId;
  uintptr_t targetProcessId;
  NSObject *global_queue;
  OS_dispatch_source *v6;
  int v7;
  NSObject *v8;
  BOOL v9;
  int v10;
  _DWORD *v11;
  const __CFString *v12;
  const __CFString *v13;
  const char *CStringPtr;
  char *v15;
  char *v16;
  int v17;
  NSObject *v18;
  BOOL v19;
  const __CFString *v20;
  const __CFString *v21;
  const char *v22;
  char *v23;
  char *v24;
  NSObject *v25;
  FILE *v26;
  const __CFString *v27;
  NSObject *v28;
  FILE *v29;
  FILE *v30;
  _QWORD handler[5];

  if (self->_exitHIDSource)
    return;
  p_targetProcessId = &self->super.super._targetProcessId;
  targetProcessId = self->super.super._targetProcessId;
  global_queue = dispatch_get_global_queue(25, 2uLL);
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, targetProcessId, 0xA0000000uLL, global_queue);
  self->_exitHIDSource = v6;
  if (v6)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005E054;
    handler[3] = &unk_1000D5600;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
    dispatch_resume((dispatch_object_t)self->_exitHIDSource);
    return;
  }
  if ((*p_targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E3CF8)
    {
      v7 = *__error();
      v8 = sub_10002ABEC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10008D520();
      *__error() = v7;
    }
    if (byte_1000E3CF9)
      v9 = dword_1000E34A8 <= 3;
    else
      v9 = 0;
    if (!v9)
      return;
    v10 = *__error();
    v11 = sub_10002AB88(*p_targetProcessId);
    v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Unable to allocate proc exit HID dispatch source"), v11, *p_targetProcessId);
    if (v12)
    {
      v13 = v12;
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      if (CStringPtr)
      {
        v15 = (char *)CStringPtr;
        v16 = 0;
      }
      else
      {
        v15 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x3E81B049uLL);
        CFStringGetCString(v13, v15, 1024, 0x8000100u);
        v16 = v15;
      }
      if (qword_1000E3D00)
        v26 = (FILE *)qword_1000E3D00;
      else
        v26 = __stderrp;
      fprintf(v26, "%s\n", v15);
      if (v16)
        free(v16);
      v27 = v13;
LABEL_51:
      CFRelease(v27);
LABEL_52:
      *__error() = v10;
      return;
    }
    v25 = sub_10002ABEC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_10008D4B4();
    goto LABEL_40;
  }
  if (byte_1000E3CF8)
  {
    v17 = *__error();
    v18 = sub_10002ABEC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10008D5B8();
    *__error() = v17;
  }
  if (byte_1000E3CF9)
    v19 = dword_1000E34A8 <= 3;
  else
    v19 = 0;
  if (v19)
  {
    v10 = *__error();
    v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Unable to allocate proc exit HID dispatch source"));
    if (v20)
    {
      v21 = v20;
      v22 = CFStringGetCStringPtr(v20, 0x8000100u);
      if (v22)
      {
        v23 = (char *)v22;
        v24 = 0;
      }
      else
      {
        v23 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x3E81B049uLL);
        CFStringGetCString(v21, v23, 1024, 0x8000100u);
        v24 = v23;
      }
      if (qword_1000E3D00)
        v30 = (FILE *)qword_1000E3D00;
      else
        v30 = __stderrp;
      fprintf(v30, "%s\n", v23);
      if (v24)
        free(v24);
      v27 = v21;
      goto LABEL_51;
    }
    v28 = sub_10002ABEC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      sub_10008D58C();
LABEL_40:
    if (qword_1000E3D00)
      v29 = (FILE *)qword_1000E3D00;
    else
      v29 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v29);
    goto LABEL_52;
  }
}

- (void)deleteHIDExitSource
{
  OS_dispatch_source *exitHIDSource;

  exitHIDSource = self->_exitHIDSource;
  if (exitHIDSource)
  {
    dispatch_release((dispatch_object_t)exitHIDSource);
    self->_exitHIDSource = 0;
  }
}

- (void)requireHIDEvent:(BOOL)a3
{
  NSObject *processingQueue;
  _QWORD v4[5];
  BOOL v5;

  processingQueue = self->super.super._processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005EA9C;
  v4[3] = &unk_1000D5980;
  v4[4] = self;
  v5 = a3;
  dispatch_async(processingQueue, v4);
}

+ (BOOL)receivedHidEventForPid:(int)a3 eventTimeMachAbs:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6
{
  char v6;
  _QWORD v8[8];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100060310;
  v8[3] = &unk_1000D59A8;
  v9 = a3;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = &v10;
  v8[7] = a4;
  sub_10005E3AC((uint64_t)v8);
  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)setSamplingMode:(unsigned __int8)a3 withAdditionalSampledProcesses:(id)a4
{
  id v4;
  int v5;
  int *p_targetProcessId;
  int v8;
  NSObject *v9;
  BOOL v10;
  int v11;
  _DWORD *v12;
  const __CFString *v13;
  const __CFString *v14;
  const char *v15;
  char *v16;
  char *v17;
  int v18;
  NSObject *v19;
  BOOL v20;
  const __CFString *v21;
  const __CFString *v22;
  const char *CStringPtr;
  char *v24;
  char *v25;
  NSObject *v26;
  FILE *v27;
  const __CFString *v28;
  NSObject *v29;
  FILE *v30;
  FILE *v31;
  NSMutableSet *sampledProcesses;
  NSMutableSet *v33;
  int *v34;
  int targetProcessId;
  int v36;
  NSObject *v37;
  BOOL v38;
  int v39;
  _DWORD *v40;
  const __CFString *v41;
  const __CFString *v42;
  const char *v43;
  char *v44;
  char *v45;
  int v46;
  NSObject *v47;
  BOOL v48;
  const __CFString *v49;
  const __CFString *v50;
  const char *v51;
  char *v52;
  char *v53;
  NSObject *v54;
  FILE *v55;
  const __CFString *v56;
  NSObject *v57;
  FILE *v58;
  FILE *v59;

  v4 = a4;
  v5 = a3;
  if (a3 == 3 && a4)
  {
    p_targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v18 = *__error();
        v19 = sub_10002ABEC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_10008E858();
        *__error() = v18;
      }
      if (byte_1000E3CF9)
        v20 = dword_1000E34A8 <= 3;
      else
        v20 = 0;
      if (!v20)
        goto LABEL_24;
      v11 = *__error();
      v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Pids is ignored when sampling all processes"));
      if (v21)
      {
        v22 = v21;
        CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
        if (CStringPtr)
        {
          v24 = (char *)CStringPtr;
          v25 = 0;
        }
        else
        {
          v24 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD3012E27uLL);
          CFStringGetCString(v22, v24, 1024, 0x8000100u);
          v25 = v24;
        }
        if (qword_1000E3D00)
          v31 = (FILE *)qword_1000E3D00;
        else
          v31 = __stderrp;
        fprintf(v31, "%s\n", v24);
        if (v25)
          free(v25);
        v28 = v22;
        goto LABEL_50;
      }
      v29 = sub_10002ABEC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        sub_10008E82C();
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v8 = *__error();
        v9 = sub_10002ABEC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_10008E7C0();
        *__error() = v8;
      }
      if (byte_1000E3CF9)
        v10 = dword_1000E34A8 <= 3;
      else
        v10 = 0;
      if (!v10)
      {
LABEL_24:
        v4 = 0;
        goto LABEL_52;
      }
      v11 = *__error();
      v12 = sub_10002AB88(*p_targetProcessId);
      v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Pids is ignored when sampling all processes"), v12, *p_targetProcessId);
      if (v13)
      {
        v14 = v13;
        v15 = CFStringGetCStringPtr(v13, 0x8000100u);
        if (v15)
        {
          v16 = (char *)v15;
          v17 = 0;
        }
        else
        {
          v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD3012E27uLL);
          CFStringGetCString(v14, v16, 1024, 0x8000100u);
          v17 = v16;
        }
        if (qword_1000E3D00)
          v27 = (FILE *)qword_1000E3D00;
        else
          v27 = __stderrp;
        fprintf(v27, "%s\n", v16);
        if (v17)
          free(v17);
        v28 = v14;
LABEL_50:
        CFRelease(v28);
LABEL_51:
        v4 = 0;
        *__error() = v11;
        goto LABEL_52;
      }
      v26 = sub_10002ABEC();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        sub_10008E754();
    }
    if (qword_1000E3D00)
      v30 = (FILE *)qword_1000E3D00;
    else
      v30 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }
LABEL_52:
  if (!self->super.super._hasSampled || self->super.super._isSampling)
  {
    if (self->_samplingMode != v5
      || v4 && (!self->_sampledProcesses || (objc_msgSend(v4, "isSubsetOfSet:") & 1) == 0))
    {
      self->_samplingMode = v5;
      sampledProcesses = self->_sampledProcesses;
      if (v5 == 3)
      {

        self->_sampledProcesses = 0;
      }
      else
      {
        if (!sampledProcesses)
        {
          v33 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          self->_sampledProcesses = v33;
          if ((self->super.super._targetProcessId & 0x80000000) == 0)
            -[NSMutableSet addObject:](v33, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
        }
        if (v4)
          -[NSMutableSet unionSet:](self->_sampledProcesses, "unionSet:", v4);
      }
      if (self->super.super._isSampling)
        -[SPStackshotProvider sampleProcesses:onlyMainThreads:](self->super.super._sampleProvider, "sampleProcesses:onlyMainThreads:", self->_sampledProcesses, self->_samplingMode == 1);
    }
    return;
  }
  targetProcessId = self->super.super._targetProcessId;
  v34 = &self->super.super._targetProcessId;
  if ((targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E3CF8)
    {
      v36 = *__error();
      v37 = sub_10002ABEC();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_10008E690();
      *__error() = v36;
    }
    if (byte_1000E3CF9)
      v38 = dword_1000E34A8 <= 3;
    else
      v38 = 0;
    if (!v38)
      return;
    v39 = *__error();
    v40 = sub_10002AB88(*v34);
    v41 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Attempted to change sampling target after done sampling"), v40, *v34);
    if (v41)
    {
      v42 = v41;
      v43 = CFStringGetCStringPtr(v41, 0x8000100u);
      if (v43)
      {
        v44 = (char *)v43;
        v45 = 0;
      }
      else
      {
        v44 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE9F1A1D6uLL);
        CFStringGetCString(v42, v44, 1024, 0x8000100u);
        v45 = v44;
      }
      if (qword_1000E3D00)
        v55 = (FILE *)qword_1000E3D00;
      else
        v55 = __stderrp;
      fprintf(v55, "%s\n", v44);
      if (v45)
        free(v45);
      v56 = v42;
LABEL_114:
      CFRelease(v56);
LABEL_115:
      *__error() = v39;
      return;
    }
    v54 = sub_10002ABEC();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      sub_10008E624();
    goto LABEL_103;
  }
  if (byte_1000E3CF8)
  {
    v46 = *__error();
    v47 = sub_10002ABEC();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_10008E728();
    *__error() = v46;
  }
  if (byte_1000E3CF9)
    v48 = dword_1000E34A8 <= 3;
  else
    v48 = 0;
  if (v48)
  {
    v39 = *__error();
    v49 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Attempted to change sampling target after done sampling"));
    if (v49)
    {
      v50 = v49;
      v51 = CFStringGetCStringPtr(v49, 0x8000100u);
      if (v51)
      {
        v52 = (char *)v51;
        v53 = 0;
      }
      else
      {
        v52 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE9F1A1D6uLL);
        CFStringGetCString(v50, v52, 1024, 0x8000100u);
        v53 = v52;
      }
      if (qword_1000E3D00)
        v59 = (FILE *)qword_1000E3D00;
      else
        v59 = __stderrp;
      fprintf(v59, "%s\n", v52);
      if (v53)
        free(v53);
      v56 = v50;
      goto LABEL_114;
    }
    v57 = sub_10002ABEC();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      sub_10008E6FC();
LABEL_103:
    if (qword_1000E3D00)
      v58 = (FILE *)qword_1000E3D00;
    else
      v58 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v58);
    goto LABEL_115;
  }
}

- (unsigned)samplingIntervalUs
{
  return self->_samplingIntervalUs;
}

- (void)setSamplingIntervalUs:(unsigned int)a3
{
  uint64_t v3;
  int v5;
  NSObject *v6;
  BOOL v7;
  int v8;
  _DWORD *v9;
  const __CFString *v10;
  const __CFString *v11;
  const char *CStringPtr;
  char *v13;
  char *v14;
  int v15;
  NSObject *v16;
  BOOL v17;
  const __CFString *v18;
  const __CFString *v19;
  const char *v20;
  char *v21;
  char *v22;
  NSObject *v23;
  _DWORD *v24;
  unsigned int v25;
  int v26;
  FILE *v27;
  const __CFString *v28;
  NSObject *v29;
  FILE *v30;
  FILE *v31;
  _DWORD *v32;
  unsigned int samplingIntervalUs;
  int targetProcessId;
  uint8_t buf[4];
  _DWORD *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unsigned int v42;

  v3 = *(_QWORD *)&a3;
  if (!self->super.super._hasSampled)
  {
    self->_samplingIntervalUs = a3;
    return;
  }
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E3CF8)
    {
      v5 = *__error();
      v6 = sub_10002ABEC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10002AB88(self->super.super._targetProcessId);
        samplingIntervalUs = self->_samplingIntervalUs;
        targetProcessId = self->super.super._targetProcessId;
        *(_DWORD *)buf = 136446978;
        v36 = v32;
        v37 = 1024;
        v38 = targetProcessId;
        v39 = 1024;
        v40 = v3;
        v41 = 1024;
        v42 = samplingIntervalUs;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
      }
      *__error() = v5;
    }
    if (byte_1000E3CF9)
      v7 = dword_1000E34A8 <= 3;
    else
      v7 = 0;
    if (!v7)
      return;
    v8 = *__error();
    v9 = sub_10002AB88(self->super.super._targetProcessId);
    v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus"), v9, self->super.super._targetProcessId, v3, self->_samplingIntervalUs);
    if (v10)
    {
      v11 = v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (CStringPtr)
      {
        v13 = (char *)CStringPtr;
        v14 = 0;
      }
      else
      {
        v13 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC77751D4uLL);
        CFStringGetCString(v11, v13, 1024, 0x8000100u);
        v14 = v13;
      }
      if (qword_1000E3D00)
        v27 = (FILE *)qword_1000E3D00;
      else
        v27 = __stderrp;
      fprintf(v27, "%s\n", v13);
      if (v14)
        free(v14);
      v28 = v11;
LABEL_50:
      CFRelease(v28);
LABEL_51:
      *__error() = v8;
      return;
    }
    v23 = sub_10002ABEC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = sub_10002AB88(self->super.super._targetProcessId);
      v25 = self->_samplingIntervalUs;
      v26 = self->super.super._targetProcessId;
      *(_DWORD *)buf = 136315906;
      v36 = v24;
      v37 = 1024;
      v38 = v26;
      v39 = 1024;
      v40 = v3;
      v41 = 1024;
      v42 = v25;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
    }
    goto LABEL_39;
  }
  if (byte_1000E3CF8)
  {
    v15 = *__error();
    v16 = sub_10002ABEC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10008E8E8();
    *__error() = v15;
  }
  if (byte_1000E3CF9)
    v17 = dword_1000E34A8 <= 3;
  else
    v17 = 0;
  if (v17)
  {
    v8 = *__error();
    v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Attempted to change sampling interval to %uus while already sampling/sampled at %uus"), v3, self->_samplingIntervalUs);
    if (v18)
    {
      v19 = v18;
      v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        v21 = (char *)v20;
        v22 = 0;
      }
      else
      {
        v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC77751D4uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        v22 = v21;
      }
      if (qword_1000E3D00)
        v31 = (FILE *)qword_1000E3D00;
      else
        v31 = __stderrp;
      fprintf(v31, "%s\n", v21);
      if (v22)
        free(v22);
      v28 = v19;
      goto LABEL_50;
    }
    v29 = sub_10002ABEC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      sub_10008E884();
LABEL_39:
    if (qword_1000E3D00)
      v30 = (FILE *)qword_1000E3D00;
    else
      v30 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }
}

- (unsigned)occasionalDataIntervalSec
{
  return self->_occasionalDataIntervalSec;
}

- (void)setOccasionalDataIntervalSec:(unsigned int)a3
{
  uint64_t v3;
  int v5;
  NSObject *v6;
  BOOL v7;
  int v8;
  _DWORD *v9;
  const __CFString *v10;
  const __CFString *v11;
  const char *CStringPtr;
  char *v13;
  char *v14;
  int v15;
  NSObject *v16;
  BOOL v17;
  const __CFString *v18;
  const __CFString *v19;
  const char *v20;
  char *v21;
  char *v22;
  NSObject *v23;
  _DWORD *v24;
  unsigned int v25;
  int v26;
  FILE *v27;
  const __CFString *v28;
  NSObject *v29;
  FILE *v30;
  FILE *v31;
  _DWORD *v32;
  unsigned int occasionalDataIntervalSec;
  int targetProcessId;
  uint8_t buf[4];
  _DWORD *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unsigned int v42;

  v3 = *(_QWORD *)&a3;
  if (!self->super.super._hasSampled)
  {
    self->_occasionalDataIntervalSec = a3;
    return;
  }
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E3CF8)
    {
      v5 = *__error();
      v6 = sub_10002ABEC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10002AB88(self->super.super._targetProcessId);
        occasionalDataIntervalSec = self->_occasionalDataIntervalSec;
        targetProcessId = self->super.super._targetProcessId;
        *(_DWORD *)buf = 136446978;
        v36 = v32;
        v37 = 1024;
        v38 = targetProcessId;
        v39 = 1024;
        v40 = v3;
        v41 = 1024;
        v42 = occasionalDataIntervalSec;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
      }
      *__error() = v5;
    }
    if (byte_1000E3CF9)
      v7 = dword_1000E34A8 <= 3;
    else
      v7 = 0;
    if (!v7)
      return;
    v8 = *__error();
    v9 = sub_10002AB88(self->super.super._targetProcessId);
    v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus"), v9, self->super.super._targetProcessId, v3, self->_occasionalDataIntervalSec);
    if (v10)
    {
      v11 = v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (CStringPtr)
      {
        v13 = (char *)CStringPtr;
        v14 = 0;
      }
      else
      {
        v13 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6F766282uLL);
        CFStringGetCString(v11, v13, 1024, 0x8000100u);
        v14 = v13;
      }
      if (qword_1000E3D00)
        v27 = (FILE *)qword_1000E3D00;
      else
        v27 = __stderrp;
      fprintf(v27, "%s\n", v13);
      if (v14)
        free(v14);
      v28 = v11;
LABEL_50:
      CFRelease(v28);
LABEL_51:
      *__error() = v8;
      return;
    }
    v23 = sub_10002ABEC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = sub_10002AB88(self->super.super._targetProcessId);
      v25 = self->_occasionalDataIntervalSec;
      v26 = self->super.super._targetProcessId;
      *(_DWORD *)buf = 136315906;
      v36 = v24;
      v37 = 1024;
      v38 = v26;
      v39 = 1024;
      v40 = v3;
      v41 = 1024;
      v42 = v25;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
    }
    goto LABEL_39;
  }
  if (byte_1000E3CF8)
  {
    v15 = *__error();
    v16 = sub_10002ABEC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10008E9B8();
    *__error() = v15;
  }
  if (byte_1000E3CF9)
    v17 = dword_1000E34A8 <= 3;
  else
    v17 = 0;
  if (v17)
  {
    v8 = *__error();
    v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Attempted to change occasional data interval to %uus while already sampling/sampled at %uus"), v3, self->_occasionalDataIntervalSec);
    if (v18)
    {
      v19 = v18;
      v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        v21 = (char *)v20;
        v22 = 0;
      }
      else
      {
        v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6F766282uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        v22 = v21;
      }
      if (qword_1000E3D00)
        v31 = (FILE *)qword_1000E3D00;
      else
        v31 = __stderrp;
      fprintf(v31, "%s\n", v21);
      if (v22)
        free(v22);
      v28 = v19;
      goto LABEL_50;
    }
    v29 = sub_10002ABEC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      sub_10008E954();
LABEL_39:
    if (qword_1000E3D00)
      v30 = (FILE *)qword_1000E3D00;
    else
      v30 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }
}

- (void)setSamplingTimeoutAtTime:(double)a3
{
  int *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  int v9;
  _DWORD *v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *v13;
  char *v14;
  char *v15;
  double Current;
  double v17;
  double v18;
  int targetProcessId;
  int *p_targetProcessId;
  int v21;
  NSObject *v22;
  BOOL v23;
  int v24;
  _DWORD *v25;
  const __CFString *v26;
  const __CFString *v27;
  const char *v28;
  char *v29;
  char *v30;
  int v31;
  NSObject *v32;
  BOOL v33;
  const __CFString *v34;
  const __CFString *v35;
  const char *v36;
  char *v37;
  char *v38;
  int v39;
  NSObject *v40;
  BOOL v41;
  const __CFString *v42;
  const __CFString *v43;
  const char *CStringPtr;
  char *v45;
  char *v46;
  NSObject *v47;
  NSObject *v48;
  FILE *v49;
  const __CFString *v50;
  FILE *v51;
  const __CFString *v52;
  NSObject *v53;
  FILE *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  FILE *v63;
  FILE *v64;
  FILE *v65;
  NSObject *processingQueue;
  _DWORD *v67;
  int v68;
  _QWORD block[7];
  uint8_t buf[4];
  double v71;
  __int16 v72;
  int v73;
  __int16 v74;
  double v75;

  if (self->super.super._timeoutTime <= a3)
  {
    Current = SAMachAbsTimeSecondsGetCurrent(self);
    v17 = Current;
    if (Current < a3)
      v18 = a3;
    else
      v18 = Current;
    p_targetProcessId = &self->super.super._targetProcessId;
    targetProcessId = self->super.super._targetProcessId;
    self->super.super._timeoutTime = v18;
    if (targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v39 = *__error();
        v40 = sub_10002ABEC();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v71 = v18 - v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Setting sampling timeout for %.2f seconds from now", buf, 0xCu);
        }
        *__error() = v39;
      }
      if (byte_1000E3CF9)
        v41 = dword_1000E34A8 <= 0;
      else
        v41 = 0;
      if (!v41)
        goto LABEL_103;
      v24 = *__error();
      v42 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Setting sampling timeout for %.2f seconds from now"), v18 - v17);
      if (v42)
      {
        v43 = v42;
        CStringPtr = CFStringGetCStringPtr(v42, 0x8000100u);
        if (CStringPtr)
        {
          v45 = (char *)CStringPtr;
          v46 = 0;
        }
        else
        {
          v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF452902CuLL);
          CFStringGetCString(v43, v45, 1024, 0x8000100u);
          v46 = v45;
        }
        if (qword_1000E3D00)
          v65 = (FILE *)qword_1000E3D00;
        else
          v65 = __stderrp;
        fprintf(v65, "%s\n", v45);
        if (v46)
          free(v46);
        v52 = v43;
        goto LABEL_101;
      }
      v55 = sub_10002ABEC();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        sub_10008EBE8(v55, v56, v57, v58, v59, v60, v61, v62);
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v21 = *__error();
        v22 = sub_10002ABEC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v67 = sub_10002AB88(*p_targetProcessId);
          v68 = *p_targetProcessId;
          *(_DWORD *)buf = 136446722;
          v71 = *(double *)&v67;
          v72 = 1024;
          v73 = v68;
          v74 = 2048;
          v75 = v18 - v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}s [%d]: Setting sampling timeout for %.2f seconds from now", buf, 0x1Cu);
        }
        *__error() = v21;
      }
      if (byte_1000E3CF9)
        v23 = dword_1000E34A8 <= 0;
      else
        v23 = 0;
      if (!v23)
        goto LABEL_103;
      v24 = *__error();
      v25 = sub_10002AB88(*p_targetProcessId);
      v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Setting sampling timeout for %.2f seconds from now"), v25, *p_targetProcessId, v18 - v17);
      if (v26)
      {
        v27 = v26;
        v28 = CFStringGetCStringPtr(v26, 0x8000100u);
        if (v28)
        {
          v29 = (char *)v28;
          v30 = 0;
        }
        else
        {
          v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF452902CuLL);
          CFStringGetCString(v27, v29, 1024, 0x8000100u);
          v30 = v29;
        }
        if (qword_1000E3D00)
          v51 = (FILE *)qword_1000E3D00;
        else
          v51 = __stderrp;
        fprintf(v51, "%s\n", v29);
        if (v30)
          free(v30);
        v52 = v27;
LABEL_101:
        CFRelease(v52);
LABEL_102:
        *__error() = v24;
LABEL_103:
        processingQueue = self->super.super._processingQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100062580;
        block[3] = &unk_1000D5130;
        block[4] = self;
        *(double *)&block[5] = v18;
        *(double *)&block[6] = v17;
        dispatch_async(processingQueue, block);
        return;
      }
      v48 = sub_10002ABEC();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
        sub_10008EB54(&self->super.super._targetProcessId);
    }
    if (qword_1000E3D00)
      v63 = (FILE *)qword_1000E3D00;
    else
      v63 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
    goto LABEL_102;
  }
  v5 = &self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E3CF8)
    {
      v6 = *__error();
      v7 = sub_10002ABEC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_10008EA90();
      *__error() = v6;
    }
    if (byte_1000E3CF9)
      v8 = dword_1000E34A8 <= 0;
    else
      v8 = 0;
    if (!v8)
      return;
    v9 = *__error();
    v10 = sub_10002AB88(*v5);
    v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Asked to stop sooner than the existing timeout"), v10, *v5);
    if (v11)
    {
      v12 = v11;
      v13 = CFStringGetCStringPtr(v11, 0x8000100u);
      if (v13)
      {
        v14 = (char *)v13;
        v15 = 0;
      }
      else
      {
        v14 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x38B5FEC3uLL);
        CFStringGetCString(v12, v14, 1024, 0x8000100u);
        v15 = v14;
      }
      if (qword_1000E3D00)
        v49 = (FILE *)qword_1000E3D00;
      else
        v49 = __stderrp;
      fprintf(v49, "%s\n", v14);
      if (v15)
        free(v15);
      v50 = v12;
LABEL_92:
      CFRelease(v50);
LABEL_93:
      *__error() = v9;
      return;
    }
    v47 = sub_10002ABEC();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      sub_10008EA24();
    goto LABEL_75;
  }
  if (byte_1000E3CF8)
  {
    v31 = *__error();
    v32 = sub_10002ABEC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      sub_10008EB28();
    *__error() = v31;
  }
  if (byte_1000E3CF9)
    v33 = dword_1000E34A8 <= 0;
  else
    v33 = 0;
  if (v33)
  {
    v9 = *__error();
    v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Asked to stop sooner than the existing timeout"));
    if (v34)
    {
      v35 = v34;
      v36 = CFStringGetCStringPtr(v34, 0x8000100u);
      if (v36)
      {
        v37 = (char *)v36;
        v38 = 0;
      }
      else
      {
        v37 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x38B5FEC3uLL);
        CFStringGetCString(v35, v37, 1024, 0x8000100u);
        v38 = v37;
      }
      if (qword_1000E3D00)
        v64 = (FILE *)qword_1000E3D00;
      else
        v64 = __stderrp;
      fprintf(v64, "%s\n", v37);
      if (v38)
        free(v38);
      v50 = v35;
      goto LABEL_92;
    }
    v53 = sub_10002ABEC();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      sub_10008EAFC();
LABEL_75:
    if (qword_1000E3D00)
      v54 = (FILE *)qword_1000E3D00;
    else
      v54 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v54);
    goto LABEL_93;
  }
}

- (void)setSamplingCompletionHandlerQueue:(id)a3 andBlock:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  NSObject *processingQueue;
  int *p_targetProcessId;
  int v14;
  NSObject *v15;
  BOOL v16;
  int v17;
  _DWORD *v18;
  const __CFString *v19;
  NSObject *v20;
  FILE *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  int v32;
  const __CFString *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  FILE *v42;
  const __CFString *v43;
  const char *v44;
  char *v45;
  char *v46;
  const __CFString *v47;
  const char *CStringPtr;
  char *v49;
  char *v50;
  FILE *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  FILE *v57;
  _QWORD block[7];

  if (!a3 || !a4)
  {
    p_targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v22 = *__error();
        v23 = sub_10002ABEC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_10008F148(v23, v24, v25, v26, v27, v28, v29, v30);
        *__error() = v22;
      }
      if (byte_1000E3CF9)
        v31 = dword_1000E34A8 <= 3;
      else
        v31 = 0;
      if (v31)
      {
        v32 = *__error();
        v33 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Must provide both queue and block"), "queue && block");
        if (v33)
        {
          v47 = v33;
          CStringPtr = CFStringGetCStringPtr(v33, 0x8000100u);
          if (CStringPtr)
          {
            v49 = (char *)CStringPtr;
            v50 = 0;
          }
          else
          {
            v49 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1AD4BD14uLL);
            CFStringGetCString(v47, v49, 1024, 0x8000100u);
            v50 = v49;
          }
          if (qword_1000E3D00)
            v57 = (FILE *)qword_1000E3D00;
          else
            v57 = __stderrp;
          fprintf(v57, "%s\n", v49);
          if (v50)
            free(v50);
          CFRelease(v47);
        }
        else
        {
          v34 = sub_10002ABEC();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            sub_10008F0D8(v34, v35, v36, v37, v38, v39, v40, v41);
          if (qword_1000E3D00)
            v42 = (FILE *)qword_1000E3D00;
          else
            v42 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v42);
        }
        *__error() = v32;
      }
      sub_10002AAC4("-[SPSampledProcess setSamplingCompletionHandlerQueue:andBlock:]", "SPProcessEvent.m", 1121, "%s: Must provide both queue and block", v4, v5, v6, v7, (char)"queue && block");
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v14 = *__error();
        v15 = sub_10002ABEC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10008F05C();
        *__error() = v14;
      }
      if (byte_1000E3CF9)
        v16 = dword_1000E34A8 <= 3;
      else
        v16 = 0;
      if (v16)
      {
        v17 = *__error();
        v18 = sub_10002AB88(*p_targetProcessId);
        v19 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: %s: Must provide both queue and block"), v18, *p_targetProcessId, "queue && block");
        if (v19)
        {
          v43 = v19;
          v44 = CFStringGetCStringPtr(v19, 0x8000100u);
          if (v44)
          {
            v45 = (char *)v44;
            v46 = 0;
          }
          else
          {
            v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1AD4BD14uLL);
            CFStringGetCString(v43, v45, 1024, 0x8000100u);
            v46 = v45;
          }
          if (qword_1000E3D00)
            v51 = (FILE *)qword_1000E3D00;
          else
            v51 = __stderrp;
          fprintf(v51, "%s\n", v45);
          if (v46)
            free(v46);
          CFRelease(v43);
        }
        else
        {
          v20 = sub_10002ABEC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            sub_10008EFE0();
          if (qword_1000E3D00)
            v21 = (FILE *)qword_1000E3D00;
          else
            v21 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v21);
        }
        *__error() = v17;
      }
      v52 = sub_10002AB88(*p_targetProcessId);
      sub_10002AAC4("-[SPSampledProcess setSamplingCompletionHandlerQueue:andBlock:]", "SPProcessEvent.m", 1121, "%s [%d]: %s: Must provide both queue and block", v53, v54, v55, v56, v52);
    }
    abort();
  }
  dispatch_retain((dispatch_object_t)a3);
  v11 = _Block_copy(a4);
  processingQueue = self->super.super._processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006333C;
  block[3] = &unk_1000D59D0;
  block[4] = self;
  block[5] = a3;
  block[6] = v11;
  dispatch_async(processingQueue, block);
}

- (void)setStopWhenProcessExits:(BOOL)a3
{
  NSObject *processingQueue;
  _QWORD v4[5];
  BOOL v5;

  processingQueue = self->super.super._processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000633EC;
  v4[3] = &unk_1000D5980;
  v5 = a3;
  v4[4] = self;
  dispatch_async(processingQueue, v4);
}

- (BOOL)startSampling
{
  id v4;
  void *v5;

  if (self->super.super._hasSampled || !self->_samplingIntervalUs)
    return 0;
  -[SPProcessEvent takeTransaction](self, "takeTransaction");
  v4 = +[SPStackshotProvider snapshotWithSamplingIntervalUs:andOccasionalDataIntervalSec:andOnlySampleProcesses:andOnlySampleMainThreads:andOmitSensitiveStrings:](SPStackshotProvider, "snapshotWithSamplingIntervalUs:andOccasionalDataIntervalSec:andOnlySampleProcesses:andOnlySampleMainThreads:andOmitSensitiveStrings:", self->_samplingIntervalUs, self->_occasionalDataIntervalSec, self->_sampledProcesses, self->_samplingMode == 1, self->super.super._omitSensitiveStrings);
  if (!v4)
  {
    -[SPProcessEvent dropTransaction](self, "dropTransaction");
    return 0;
  }
  v5 = v4;
  self->super.super._numSamplesAvoidedDueToAudioAtStart = objc_msgSend(v4, "numSamplesAvoidedDueToAudio");
  self->super.super._numSamplesAtStart = objc_msgSend(v5, "numSamples");
  self->_startedMonitoringTimestamp = (SATimestamp *)objc_msgSend(v5, "timestamp");
  self->super.super._sampleProvider = (SPStackshotProvider *)objc_msgSend(v5, "stackshotProvider");
  *(_WORD *)&self->super.super._isSampling = 257;
  return 1;
}

- (void)stopSamplingWithReason:(unsigned __int8)a3
{
  unsigned int v3;
  NSObject *processingQueue;
  int *p_targetProcessId;
  int v7;
  NSObject *v8;
  BOOL v9;
  int v10;
  _DWORD *v11;
  const __CFString *v12;
  const __CFString *v13;
  const char *CStringPtr;
  char *v15;
  char *v16;
  int v17;
  NSObject *v18;
  BOOL v19;
  const __CFString *v20;
  const __CFString *v21;
  const char *v22;
  char *v23;
  char *v24;
  NSObject *v25;
  FILE *v26;
  const __CFString *v27;
  NSObject *v28;
  FILE *v29;
  FILE *v30;
  _QWORD block[5];
  unsigned __int8 v32;

  v3 = a3;
  if (self->super.super._isSampling)
  {
    processingQueue = self->super.super._processingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064258;
    block[3] = &unk_1000D5980;
    block[4] = self;
    v32 = a3;
    dispatch_async(processingQueue, block);
    return;
  }
  p_targetProcessId = &self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E3CF8)
    {
      v7 = *__error();
      v8 = sub_10002ABEC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_10008F500(p_targetProcessId, v3, v8);
      *__error() = v7;
    }
    if (byte_1000E3CF9)
      v9 = dword_1000E34A8 <= 0;
    else
      v9 = 0;
    if (!v9)
      return;
    v10 = *__error();
    v11 = sub_10002AB88(*p_targetProcessId);
    v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Already not sampling when stopped with reason %d"), v11, *p_targetProcessId, v3);
    if (v12)
    {
      v13 = v12;
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      if (CStringPtr)
      {
        v15 = (char *)CStringPtr;
        v16 = 0;
      }
      else
      {
        v15 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x52B7F0E3uLL);
        CFStringGetCString(v13, v15, 1024, 0x8000100u);
        v16 = v15;
      }
      if (qword_1000E3D00)
        v26 = (FILE *)qword_1000E3D00;
      else
        v26 = __stderrp;
      fprintf(v26, "%s\n", v15);
      if (v16)
        free(v16);
      v27 = v13;
LABEL_50:
      CFRelease(v27);
LABEL_51:
      *__error() = v10;
      return;
    }
    v25 = sub_10002ABEC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_10008F470(p_targetProcessId);
    goto LABEL_39;
  }
  if (byte_1000E3CF8)
  {
    v17 = *__error();
    v18 = sub_10002ABEC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_10008F61C(v3, v18);
    *__error() = v17;
  }
  if (byte_1000E3CF9)
    v19 = dword_1000E34A8 <= 0;
  else
    v19 = 0;
  if (v19)
  {
    v10 = *__error();
    v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Already not sampling when stopped with reason %d"), v3);
    if (v20)
    {
      v21 = v20;
      v22 = CFStringGetCStringPtr(v20, 0x8000100u);
      if (v22)
      {
        v23 = (char *)v22;
        v24 = 0;
      }
      else
      {
        v23 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x52B7F0E3uLL);
        CFStringGetCString(v21, v23, 1024, 0x8000100u);
        v24 = v23;
      }
      if (qword_1000E3D00)
        v30 = (FILE *)qword_1000E3D00;
      else
        v30 = __stderrp;
      fprintf(v30, "%s\n", v23);
      if (v24)
        free(v24);
      v27 = v21;
      goto LABEL_50;
    }
    v28 = sub_10002ABEC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      sub_10008F5AC(v3, v28);
LABEL_39:
    if (qword_1000E3D00)
      v29 = (FILE *)qword_1000E3D00;
    else
      v29 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v29);
    goto LABEL_51;
  }
}

- (void)_samplingHasCompletedWithEndSnapshot:(id)a3 withReason:(unsigned __int8)a4
{
  int v4;
  unsigned int v7;
  unsigned int *v8;
  int v9;
  NSObject *v10;
  _DWORD *v11;
  int v12;
  BOOL v13;
  int v14;
  _DWORD *v15;
  const __CFString *v16;
  NSObject *v17;
  int *p_targetProcessId;
  int v19;
  NSObject *v20;
  BOOL v21;
  int v22;
  _DWORD *v23;
  const __CFString *v24;
  const __CFString *v25;
  const char *v26;
  char *v27;
  char *v28;
  int v29;
  NSObject *v30;
  BOOL v31;
  const __CFString *v32;
  const __CFString *v33;
  const char *CStringPtr;
  char *v35;
  char *v36;
  int v37;
  NSObject *v38;
  BOOL v39;
  const __CFString *v40;
  const char *v41;
  char *v42;
  char *v43;
  NSObject *v44;
  FILE *v45;
  const __CFString *v46;
  NSObject *v47;
  FILE *v48;
  FILE *v49;
  FILE *v50;
  SPStackshotProvider *sampleProvider;
  NSObject *v52;
  FILE *v53;
  NSObject *hidEventSem;
  dispatch_time_t v55;
  int v56;
  NSObject *v57;
  _DWORD *v58;
  int v59;
  int v60;
  _DWORD *v61;
  const __CFString *v62;
  NSObject *v63;
  int v64;
  NSObject *v65;
  int v66;
  _DWORD *v67;
  const __CFString *v68;
  const __CFString *v69;
  const char *v70;
  char *v71;
  char *v72;
  int v73;
  NSObject *v74;
  const __CFString *v75;
  const char *v76;
  char *v77;
  char *v78;
  int v79;
  NSObject *v80;
  _DWORD *v81;
  int v82;
  int v83;
  _DWORD *v84;
  const __CFString *v85;
  NSObject *v86;
  int v87;
  NSObject *v88;
  _DWORD *v89;
  int v90;
  _DWORD *v91;
  const __CFString *v92;
  NSObject *v93;
  FILE *v94;
  int v95;
  NSObject *v96;
  const __CFString *v97;
  const char *v98;
  malloc_type_id_t v99;
  int v100;
  NSObject *v101;
  char *v102;
  char *v103;
  NSObject *v104;
  FILE *v105;
  int v106;
  NSObject *v107;
  const __CFString *v108;
  const __CFString *v109;
  const char *v110;
  char *v111;
  char *v112;
  FILE *v113;
  NSObject *v114;
  NSObject *v115;
  FILE *v116;
  NSObject *completionCallbackQueue;
  NSObject *v118;
  FILE *v119;
  const __CFString *v120;
  NSObject *v121;
  FILE *v122;
  FILE *v123;
  _QWORD v124[6];
  char v125;
  _QWORD block[5];
  char v127;
  _QWORD v128[5];
  uint8_t buf[4];
  _DWORD *v130;
  __int16 v131;
  int v132;

  v4 = a4;
  if (!self->super.super._isUrgent)
    -[SPStackshotProvider waitForSamplingToComplete](self->super.super._sampleProvider, "waitForSamplingToComplete");
  v7 = v4 - 6;
  if (!a3 || v7 < 0xFFFFFFFC || !self->_hidEventSem)
  {
    p_targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v29 = *__error();
        v30 = sub_10002ABEC();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          sub_10008F794();
        *__error() = v29;
      }
      if (byte_1000E3CF9)
        v31 = dword_1000E34A8 <= 0;
      else
        v31 = 0;
      if (!v31)
      {
LABEL_87:
        if (v7 <= 0xFFFFFFFB)
          goto LABEL_209;
LABEL_88:
        sampleProvider = self->super.super._sampleProvider;
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472;
        v124[2] = sub_100065818;
        v124[3] = &unk_1000D5A48;
        v125 = v4;
        v124[4] = self;
        v124[5] = a3;
        -[SPStackshotProvider performSampleStoreWork:](sampleProvider, "performSampleStoreWork:", v124);
        return;
      }
      v22 = *__error();
      v32 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("No HID event required"));
      if (v32)
      {
        v33 = v32;
        CStringPtr = CFStringGetCStringPtr(v32, 0x8000100u);
        if (CStringPtr)
        {
          v35 = (char *)CStringPtr;
          v36 = 0;
        }
        else
        {
          v35 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF7045B2EuLL);
          CFStringGetCString(v33, v35, 1024, 0x8000100u);
          v36 = v35;
        }
        if (qword_1000E3D00)
          v50 = (FILE *)qword_1000E3D00;
        else
          v50 = __stderrp;
        fprintf(v50, "%s\n", v35);
        if (v36)
          free(v36);
        v46 = v33;
        goto LABEL_85;
      }
      v47 = sub_10002ABEC();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        sub_10008F768();
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v19 = *__error();
        v20 = sub_10002ABEC();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          sub_10008F6FC();
        *__error() = v19;
      }
      if (byte_1000E3CF9)
        v21 = dword_1000E34A8 <= 0;
      else
        v21 = 0;
      if (!v21)
        goto LABEL_87;
      v22 = *__error();
      v23 = sub_10002AB88(*p_targetProcessId);
      v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: No HID event required"), v23, *p_targetProcessId);
      if (v24)
      {
        v25 = v24;
        v26 = CFStringGetCStringPtr(v24, 0x8000100u);
        if (v26)
        {
          v27 = (char *)v26;
          v28 = 0;
        }
        else
        {
          v27 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF7045B2EuLL);
          CFStringGetCString(v25, v27, 1024, 0x8000100u);
          v28 = v27;
        }
        if (qword_1000E3D00)
          v45 = (FILE *)qword_1000E3D00;
        else
          v45 = __stderrp;
        fprintf(v45, "%s\n", v27);
        if (v28)
          free(v28);
        v46 = v25;
LABEL_85:
        CFRelease(v46);
LABEL_86:
        *__error() = v22;
        goto LABEL_87;
      }
      v44 = sub_10002ABEC();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        sub_10008F690();
    }
    if (qword_1000E3D00)
      v48 = (FILE *)qword_1000E3D00;
    else
      v48 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
    goto LABEL_86;
  }
  v8 = (unsigned int *)&self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E3CF8)
    {
      v9 = *__error();
      v10 = sub_10002ABEC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = sub_10002AB88(*v8);
        v12 = *v8;
        *(_DWORD *)buf = 136446466;
        v130 = v11;
        v131 = 1024;
        v132 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}s [%d]: Waiting for HID event...", buf, 0x12u);
      }
      *__error() = v9;
    }
    if (byte_1000E3CF9)
      v13 = dword_1000E34A8 <= 1;
    else
      v13 = 0;
    if (!v13)
      goto LABEL_96;
    v14 = *__error();
    v15 = sub_10002AB88(*v8);
    v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Waiting for HID event..."), v15, *v8);
    if (!v16)
    {
      v17 = sub_10002ABEC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_10008FAB8();
LABEL_91:
      if (qword_1000E3D00)
        v53 = (FILE *)qword_1000E3D00;
      else
        v53 = __stderrp;
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v53);
LABEL_95:
      *__error() = v14;
      goto LABEL_96;
    }
    goto LABEL_54;
  }
  if (byte_1000E3CF8)
  {
    v37 = *__error();
    v38 = sub_10002ABEC();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Waiting for HID event...", buf, 2u);
    }
    *__error() = v37;
  }
  if (byte_1000E3CF9)
    v39 = dword_1000E34A8 <= 1;
  else
    v39 = 0;
  if (v39)
  {
    v14 = *__error();
    v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Waiting for HID event..."));
    if (!v16)
    {
      v52 = sub_10002ABEC();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        sub_10008FB24();
      goto LABEL_91;
    }
LABEL_54:
    v40 = v16;
    v41 = CFStringGetCStringPtr(v16, 0x8000100u);
    if (v41)
    {
      v42 = (char *)v41;
      v43 = 0;
    }
    else
    {
      v42 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x984730BCuLL);
      CFStringGetCString(v40, v42, 1024, 0x8000100u);
      v43 = v42;
    }
    if (qword_1000E3D00)
      v49 = (FILE *)qword_1000E3D00;
    else
      v49 = __stderrp;
    fprintf(v49, "%s\n", v42);
    if (v43)
      free(v43);
    CFRelease(v40);
    goto LABEL_95;
  }
LABEL_96:
  hidEventSem = self->_hidEventSem;
  v55 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(hidEventSem, v55))
  {
    if (-[SPProcessEvent eventTimeRange](self, "eventTimeRange"))
    {
      if (objc_msgSend(-[SATimeRange startTime](-[SPProcessEvent eventTimeRange](self, "eventTimeRange"), "startTime"), "compare:", objc_msgSend(a3, "timestamp")) == (id)-1&& objc_msgSend(-[SATimeRange endTime](-[SPProcessEvent eventTimeRange](self, "eventTimeRange"), "endTime"), "compare:", self->_startedMonitoringTimestamp) == (id)1)
      {
        if ((*v8 & 0x80000000) != 0)
        {
          if (byte_1000E3CF8)
          {
            v106 = *__error();
            v107 = sub_10002ABEC();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
              sub_10008F95C();
            *__error() = v106;
          }
          if (!byte_1000E3CF9 || dword_1000E34A8 > 0)
            goto LABEL_237;
          v66 = *__error();
          v108 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Received HID event, reporting spin"));
          if (v108)
          {
            v109 = v108;
            v110 = CFStringGetCStringPtr(v108, 0x8000100u);
            if (v110)
            {
              v111 = (char *)v110;
              v112 = 0;
            }
            else
            {
              v111 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9F24426AuLL);
              CFStringGetCString(v109, v111, 1024, 0x8000100u);
              v112 = v111;
            }
            if (qword_1000E3D00)
              v123 = (FILE *)qword_1000E3D00;
            else
              v123 = __stderrp;
            fprintf(v123, "%s\n", v111);
            if (v112)
              free(v112);
            v120 = v109;
            goto LABEL_235;
          }
          v121 = sub_10002ABEC();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
            sub_10008F930();
        }
        else
        {
          if (byte_1000E3CF8)
          {
            v64 = *__error();
            v65 = sub_10002ABEC();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              sub_10008F8C4();
            *__error() = v64;
          }
          if (!byte_1000E3CF9 || dword_1000E34A8 > 0)
            goto LABEL_237;
          v66 = *__error();
          v67 = sub_10002AB88(*v8);
          v68 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Received HID event, reporting spin"), v67, *v8);
          if (v68)
          {
            v69 = v68;
            v70 = CFStringGetCStringPtr(v68, 0x8000100u);
            if (v70)
            {
              v71 = (char *)v70;
              v72 = 0;
            }
            else
            {
              v71 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9F24426AuLL);
              CFStringGetCString(v69, v71, 1024, 0x8000100u);
              v72 = v71;
            }
            if (qword_1000E3D00)
              v119 = (FILE *)qword_1000E3D00;
            else
              v119 = __stderrp;
            fprintf(v119, "%s\n", v71);
            if (v72)
              free(v72);
            v120 = v69;
LABEL_235:
            CFRelease(v120);
LABEL_236:
            *__error() = v66;
LABEL_237:
            if (v4 == 3)
              LOBYTE(v4) = 4;
            goto LABEL_88;
          }
          v118 = sub_10002ABEC();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT))
            sub_10008F858();
        }
        if (qword_1000E3D00)
          v122 = (FILE *)qword_1000E3D00;
        else
          v122 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v122);
        goto LABEL_236;
      }
      if ((*v8 & 0x80000000) != 0)
      {
        if (byte_1000E3CF8)
        {
          v95 = *__error();
          v96 = sub_10002ABEC();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Canceling spin with no HID event in its time range", buf, 2u);
          }
          *__error() = v95;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000E3CF9 || dword_1000E34A8 > 2)
          goto LABEL_209;
        v83 = *__error();
        v85 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Canceling spin with no HID event in its time range"));
        if (!v85)
        {
          v114 = sub_10002ABEC();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT))
            sub_10008F9F4();
          goto LABEL_203;
        }
      }
      else
      {
        if (byte_1000E3CF8)
        {
          v79 = *__error();
          v80 = sub_10002ABEC();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            v81 = sub_10002AB88(*v8);
            v82 = *v8;
            *(_DWORD *)buf = 136446466;
            v130 = v81;
            v131 = 1024;
            v132 = v82;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%{public}s [%d]: Canceling spin with no HID event in its time range", buf, 0x12u);
          }
          *__error() = v79;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000E3CF9 || dword_1000E34A8 > 2)
          goto LABEL_209;
        v83 = *__error();
        v84 = sub_10002AB88(*v8);
        v85 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Canceling spin with no HID event in its time range"), v84, *v8);
        if (!v85)
        {
          v86 = sub_10002ABEC();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
            sub_10008F988();
LABEL_203:
          if (qword_1000E3D00)
            v116 = (FILE *)qword_1000E3D00;
          else
            v116 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v116);
LABEL_207:
          *__error() = v83;
          goto LABEL_208;
        }
      }
      v97 = v85;
      v98 = CFStringGetCStringPtr(v85, 0x8000100u);
      if (!v98)
      {
        v99 = 1922378494;
LABEL_192:
        v102 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v99);
        CFStringGetCString(v97, v102, 1024, 0x8000100u);
        v103 = v102;
        goto LABEL_193;
      }
    }
    else
    {
      if ((*v8 & 0x80000000) != 0)
      {
        if (byte_1000E3CF8)
        {
          v100 = *__error();
          v101 = sub_10002ABEC();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Canceling spin with no HID event where process exited", buf, 2u);
          }
          *__error() = v100;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000E3CF9 || dword_1000E34A8 > 2)
          goto LABEL_209;
        v83 = *__error();
        v92 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Canceling spin with no HID event where process exited"));
        if (!v92)
        {
          v115 = sub_10002ABEC();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT))
            sub_10008F82C();
          goto LABEL_203;
        }
      }
      else
      {
        if (byte_1000E3CF8)
        {
          v87 = *__error();
          v88 = sub_10002ABEC();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            v89 = sub_10002AB88(*v8);
            v90 = *v8;
            *(_DWORD *)buf = 136446466;
            v130 = v89;
            v131 = 1024;
            v132 = v90;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%{public}s [%d]: Canceling spin with no HID event where process exited", buf, 0x12u);
          }
          *__error() = v87;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000E3CF9 || dword_1000E34A8 > 2)
          goto LABEL_209;
        v83 = *__error();
        v91 = sub_10002AB88(*v8);
        v92 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Canceling spin with no HID event where process exited"), v91, *v8);
        if (!v92)
        {
          v93 = sub_10002ABEC();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
            sub_10008F7C0();
          goto LABEL_203;
        }
      }
      v97 = v92;
      v98 = CFStringGetCStringPtr(v92, 0x8000100u);
      if (!v98)
      {
        v99 = 1974474667;
        goto LABEL_192;
      }
    }
    v102 = (char *)v98;
    v103 = 0;
LABEL_193:
    if (qword_1000E3D00)
      v113 = (FILE *)qword_1000E3D00;
    else
      v113 = __stderrp;
    fprintf(v113, "%s\n", v102);
    if (v103)
      free(v103);
    CFRelease(v97);
    goto LABEL_207;
  }
  if ((*v8 & 0x80000000) != 0)
  {
    if (byte_1000E3CF8)
    {
      v73 = *__error();
      v74 = sub_10002ABEC();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Timed out waiting for HID event, canceling spin", buf, 2u);
      }
      *__error() = v73;
    }
    if (!byte_1000E3CF9 || dword_1000E34A8 > 2)
      goto LABEL_181;
    v60 = *__error();
    v62 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Timed out waiting for HID event, canceling spin"));
    if (!v62)
    {
      v104 = sub_10002ABEC();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
        sub_10008FA8C();
      goto LABEL_176;
    }
LABEL_127:
    v75 = v62;
    v76 = CFStringGetCStringPtr(v62, 0x8000100u);
    if (v76)
    {
      v77 = (char *)v76;
      v78 = 0;
    }
    else
    {
      v77 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x18BF36B5uLL);
      CFStringGetCString(v75, v77, 1024, 0x8000100u);
      v78 = v77;
    }
    if (qword_1000E3D00)
      v94 = (FILE *)qword_1000E3D00;
    else
      v94 = __stderrp;
    fprintf(v94, "%s\n", v77);
    if (v78)
      free(v78);
    CFRelease(v75);
    goto LABEL_180;
  }
  if (byte_1000E3CF8)
  {
    v56 = *__error();
    v57 = sub_10002ABEC();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = sub_10002AB88(*v8);
      v59 = *v8;
      *(_DWORD *)buf = 136446466;
      v130 = v58;
      v131 = 1024;
      v132 = v59;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}s [%d]: Timed out waiting for HID event, canceling spin", buf, 0x12u);
    }
    *__error() = v56;
  }
  if (!byte_1000E3CF9 || dword_1000E34A8 > 2)
    goto LABEL_181;
  v60 = *__error();
  v61 = sub_10002AB88(*v8);
  v62 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Timed out waiting for HID event, canceling spin"), v61, *v8);
  if (v62)
    goto LABEL_127;
  v63 = sub_10002ABEC();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
    sub_10008FA20();
LABEL_176:
  if (qword_1000E3D00)
    v105 = (FILE *)qword_1000E3D00;
  else
    v105 = __stderrp;
  fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v105);
LABEL_180:
  *__error() = v60;
LABEL_181:
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_1000654EC;
  v128[3] = &unk_1000D5930;
  v128[4] = self;
  sub_10005E3AC((uint64_t)v128);
LABEL_208:
  LOBYTE(v4) = 8;
LABEL_209:
  completionCallbackQueue = self->super.super._completionCallbackQueue;
  if (completionCallbackQueue)
  {
    if (self->super.super._completionCallbackBlock)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000657D4;
      block[3] = &unk_1000D5980;
      block[4] = self;
      v127 = v4;
      dispatch_async(completionCallbackQueue, block);
      dispatch_release((dispatch_object_t)self->super.super._completionCallbackQueue);
      self->super.super._completionCallbackQueue = 0;
    }
  }
}

- (void)_saveReportToStream:(__sFILE *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *p_targetProcessId;
  int v10;
  NSObject *v11;
  const char *v12;
  int v13;
  BOOL v14;
  int v15;
  _DWORD *v16;
  const __CFString *v17;
  const __CFString *v18;
  const char *v19;
  char *v20;
  char *v21;
  int v22;
  NSObject *v23;
  BOOL v24;
  const __CFString *v25;
  const __CFString *v26;
  const char *v27;
  char *v28;
  char *v29;
  NSObject *v30;
  FILE *v31;
  const __CFString *v32;
  NSObject *v33;
  FILE *v34;
  FILE *v35;
  SPStackshotProvider *sampleProvider;
  int v37;
  NSObject *v38;
  const char *v39;
  int targetProcessId;
  _BOOL4 v41;
  _BOOL4 v42;
  BOOL v43;
  int v44;
  NSObject *v45;
  BOOL v46;
  _BOOL8 v47;
  int v48;
  _DWORD *v49;
  const __CFString *v50;
  NSObject *v51;
  const char *v52;
  int v53;
  _BOOL4 v54;
  _BOOL4 v55;
  FILE *v56;
  _BOOL4 v57;
  int v58;
  const __CFString *v59;
  NSObject *v60;
  _BOOL4 isSampling;
  _BOOL4 hasSampled;
  FILE *v63;
  const __CFString *v64;
  const char *v65;
  char *v66;
  char *v67;
  const __CFString *v68;
  const char *CStringPtr;
  char *v70;
  char *v71;
  FILE *v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  FILE *v78;
  int v79;
  _QWORD v80[6];
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  _BYTE v86[10];
  _BOOL4 v87;
  __int16 v88;
  _BOOL4 v89;
  __int16 v90;
  _BOOL4 v91;

  if (!a3 || self->super.super._isSampling || !self->super.super._hasSampled)
  {
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v44 = *__error();
        v45 = sub_10002ABEC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_10008FE6C();
        *__error() = v44;
      }
      if (byte_1000E3CF9)
        v46 = dword_1000E34A8 < 4;
      else
        v46 = 0;
      if (v46)
      {
        v57 = a3 != 0;
        v58 = *__error();
        v59 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: save report fail %d %d %d"), "stream && !_isSampling && _hasSampled", a3 != 0, self->super.super._isSampling, self->super.super._hasSampled);
        if (v59)
        {
          v68 = v59;
          v79 = v58;
          CStringPtr = CFStringGetCStringPtr(v59, 0x8000100u);
          if (CStringPtr)
          {
            v70 = (char *)CStringPtr;
            v71 = 0;
          }
          else
          {
            v70 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5BECA00EuLL);
            CFStringGetCString(v68, v70, 1024, 0x8000100u);
            v71 = v70;
          }
          if (qword_1000E3D00)
            v78 = (FILE *)qword_1000E3D00;
          else
            v78 = __stderrp;
          fprintf(v78, "%s\n", v70);
          if (v71)
            free(v71);
          CFRelease(v68);
          v58 = v79;
        }
        else
        {
          v60 = sub_10002ABEC();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            isSampling = self->super.super._isSampling;
            hasSampled = self->super.super._hasSampled;
            *(_DWORD *)buf = 136315906;
            v82 = "stream && !_isSampling && _hasSampled";
            v83 = 1024;
            v84 = v57;
            v85 = 1024;
            *(_DWORD *)v86 = isSampling;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = hasSampled;
            _os_log_fault_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_FAULT, "Unable to format: %s: save report fail %d %d %d", buf, 0x1Eu);
          }
          if (qword_1000E3D00)
            v63 = (FILE *)qword_1000E3D00;
          else
            v63 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
        }
        *__error() = v58;
      }
      sub_10002AAC4("-[SPSampledProcess _saveReportToStream:]", "SPProcessEvent.m", 1417, "%s: save report fail %d %d %d", v3, v4, v5, v6, (char)"stream && !_isSampling && _hasSampled");
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v37 = *__error();
        v38 = sub_10002ABEC();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (const char *)sub_10002AB88(self->super.super._targetProcessId);
          targetProcessId = self->super.super._targetProcessId;
          v41 = self->super.super._isSampling;
          v42 = self->super.super._hasSampled;
          *(_DWORD *)buf = 136316418;
          v82 = v39;
          v83 = 1024;
          v84 = targetProcessId;
          v85 = 2080;
          *(_QWORD *)v86 = "stream && !_isSampling && _hasSampled";
          *(_WORD *)&v86[8] = 1024;
          v87 = a3 != 0;
          v88 = 1024;
          v89 = v41;
          v90 = 1024;
          v91 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
        }
        *__error() = v37;
      }
      if (byte_1000E3CF9)
        v43 = dword_1000E34A8 < 4;
      else
        v43 = 0;
      if (v43)
      {
        v47 = a3 != 0;
        v48 = *__error();
        v49 = sub_10002AB88(self->super.super._targetProcessId);
        v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: %s: save report fail %d %d %d"), v49, self->super.super._targetProcessId, "stream && !_isSampling && _hasSampled", v47, self->super.super._isSampling, self->super.super._hasSampled);
        if (v50)
        {
          v64 = v50;
          v65 = CFStringGetCStringPtr(v50, 0x8000100u);
          if (v65)
          {
            v66 = (char *)v65;
            v67 = 0;
          }
          else
          {
            v66 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5BECA00EuLL);
            CFStringGetCString(v64, v66, 1024, 0x8000100u);
            v67 = v66;
          }
          if (qword_1000E3D00)
            v72 = (FILE *)qword_1000E3D00;
          else
            v72 = __stderrp;
          fprintf(v72, "%s\n", v66);
          if (v67)
            free(v67);
          CFRelease(v64);
        }
        else
        {
          v51 = sub_10002ABEC();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            v52 = (const char *)sub_10002AB88(self->super.super._targetProcessId);
            v53 = self->super.super._targetProcessId;
            v54 = self->super.super._isSampling;
            v55 = self->super.super._hasSampled;
            *(_DWORD *)buf = 136316418;
            v82 = v52;
            v83 = 1024;
            v84 = v53;
            v85 = 2080;
            *(_QWORD *)v86 = "stream && !_isSampling && _hasSampled";
            *(_WORD *)&v86[8] = 1024;
            v87 = v47;
            v88 = 1024;
            v89 = v54;
            v90 = 1024;
            v91 = v55;
            _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
          }
          if (qword_1000E3D00)
            v56 = (FILE *)qword_1000E3D00;
          else
            v56 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v56);
        }
        *__error() = v48;
      }
      v73 = sub_10002AB88(self->super.super._targetProcessId);
      sub_10002AAC4("-[SPSampledProcess _saveReportToStream:]", "SPProcessEvent.m", 1417, "%s [%d]: %s: save report fail %d %d %d", v74, v75, v76, v77, v73);
    }
    abort();
  }
  if (!self->super.super._isUrgent)
  {
    p_targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v22 = *__error();
        v23 = sub_10002ABEC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Waiting for sampling to complete", buf, 2u);
        }
        *__error() = v22;
      }
      if (byte_1000E3CF9)
        v24 = dword_1000E34A8 <= 1;
      else
        v24 = 0;
      if (!v24)
        goto LABEL_54;
      v15 = *__error();
      v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Waiting for sampling to complete"));
      if (v25)
      {
        v26 = v25;
        v27 = CFStringGetCStringPtr(v25, 0x8000100u);
        if (v27)
        {
          v28 = (char *)v27;
          v29 = 0;
        }
        else
        {
          v28 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x8D9ED53DuLL);
          CFStringGetCString(v26, v28, 1024, 0x8000100u);
          v29 = v28;
        }
        if (qword_1000E3D00)
          v35 = (FILE *)qword_1000E3D00;
        else
          v35 = __stderrp;
        fprintf(v35, "%s\n", v28);
        if (v29)
          free(v29);
        v32 = v26;
        goto LABEL_52;
      }
      v33 = sub_10002ABEC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        sub_10008FF48();
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v10 = *__error();
        v11 = sub_10002ABEC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (const char *)sub_10002AB88(*p_targetProcessId);
          v13 = *p_targetProcessId;
          *(_DWORD *)buf = 136446466;
          v82 = v12;
          v83 = 1024;
          v84 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s [%d]: Waiting for sampling to complete", buf, 0x12u);
        }
        *__error() = v10;
      }
      if (byte_1000E3CF9)
        v14 = dword_1000E34A8 <= 1;
      else
        v14 = 0;
      if (!v14)
        goto LABEL_54;
      v15 = *__error();
      v16 = sub_10002AB88(*p_targetProcessId);
      v17 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Waiting for sampling to complete"), v16, *p_targetProcessId);
      if (v17)
      {
        v18 = v17;
        v19 = CFStringGetCStringPtr(v17, 0x8000100u);
        if (v19)
        {
          v20 = (char *)v19;
          v21 = 0;
        }
        else
        {
          v20 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x8D9ED53DuLL);
          CFStringGetCString(v18, v20, 1024, 0x8000100u);
          v21 = v20;
        }
        if (qword_1000E3D00)
          v31 = (FILE *)qword_1000E3D00;
        else
          v31 = __stderrp;
        fprintf(v31, "%s\n", v20);
        if (v21)
          free(v21);
        v32 = v18;
LABEL_52:
        CFRelease(v32);
LABEL_53:
        *__error() = v15;
LABEL_54:
        -[SPStackshotProvider waitForSamplingToComplete](self->super.super._sampleProvider, "waitForSamplingToComplete");
        goto LABEL_55;
      }
      v30 = sub_10002ABEC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        sub_10008FEDC();
    }
    if (qword_1000E3D00)
      v34 = (FILE *)qword_1000E3D00;
    else
      v34 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
    goto LABEL_53;
  }
LABEL_55:
  sampleProvider = self->super.super._sampleProvider;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_1000669CC;
  v80[3] = &unk_1000D5A70;
  v80[4] = self;
  v80[5] = a3;
  -[SPStackshotProvider performSampleStoreWork:](sampleProvider, "performSampleStoreWork:", v80);
}

- (void)_performSamplePrinterWork:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *p_targetProcessId;
  int v10;
  NSObject *v11;
  const char *v12;
  int v13;
  BOOL v14;
  int v15;
  _DWORD *v16;
  const __CFString *v17;
  const __CFString *v18;
  const char *v19;
  char *v20;
  char *v21;
  int v22;
  NSObject *v23;
  BOOL v24;
  const __CFString *v25;
  const __CFString *v26;
  const char *v27;
  char *v28;
  char *v29;
  NSObject *v30;
  FILE *v31;
  const __CFString *v32;
  NSObject *v33;
  FILE *v34;
  FILE *v35;
  SPStackshotProvider *sampleProvider;
  int v37;
  NSObject *v38;
  const char *v39;
  int targetProcessId;
  _BOOL4 v41;
  _BOOL4 v42;
  BOOL v43;
  int v44;
  NSObject *v45;
  BOOL v46;
  _BOOL8 v47;
  int v48;
  _DWORD *v49;
  const __CFString *v50;
  NSObject *v51;
  const char *v52;
  int v53;
  _BOOL4 v54;
  _BOOL4 v55;
  FILE *v56;
  _BOOL4 v57;
  int v58;
  const __CFString *v59;
  NSObject *v60;
  _BOOL4 isSampling;
  _BOOL4 hasSampled;
  FILE *v63;
  const __CFString *v64;
  const char *v65;
  char *v66;
  char *v67;
  const __CFString *v68;
  const char *CStringPtr;
  char *v70;
  char *v71;
  FILE *v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  FILE *v78;
  int v79;
  _QWORD v80[6];
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  _BYTE v86[10];
  _BOOL4 v87;
  __int16 v88;
  _BOOL4 v89;
  __int16 v90;
  _BOOL4 v91;

  if (!a3 || self->super.super._isSampling || !self->super.super._hasSampled)
  {
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v44 = *__error();
        v45 = sub_10002ABEC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_10008FF74();
        *__error() = v44;
      }
      if (byte_1000E3CF9)
        v46 = dword_1000E34A8 < 4;
      else
        v46 = 0;
      if (v46)
      {
        v57 = a3 != 0;
        v58 = *__error();
        v59 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: save report fail %d %d %d"), "callback && !_isSampling && _hasSampled", a3 != 0, self->super.super._isSampling, self->super.super._hasSampled);
        if (v59)
        {
          v68 = v59;
          v79 = v58;
          CStringPtr = CFStringGetCStringPtr(v59, 0x8000100u);
          if (CStringPtr)
          {
            v70 = (char *)CStringPtr;
            v71 = 0;
          }
          else
          {
            v70 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5B63B3CCuLL);
            CFStringGetCString(v68, v70, 1024, 0x8000100u);
            v71 = v70;
          }
          if (qword_1000E3D00)
            v78 = (FILE *)qword_1000E3D00;
          else
            v78 = __stderrp;
          fprintf(v78, "%s\n", v70);
          if (v71)
            free(v71);
          CFRelease(v68);
          v58 = v79;
        }
        else
        {
          v60 = sub_10002ABEC();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            isSampling = self->super.super._isSampling;
            hasSampled = self->super.super._hasSampled;
            *(_DWORD *)buf = 136315906;
            v82 = "callback && !_isSampling && _hasSampled";
            v83 = 1024;
            v84 = v57;
            v85 = 1024;
            *(_DWORD *)v86 = isSampling;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = hasSampled;
            _os_log_fault_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_FAULT, "Unable to format: %s: save report fail %d %d %d", buf, 0x1Eu);
          }
          if (qword_1000E3D00)
            v63 = (FILE *)qword_1000E3D00;
          else
            v63 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
        }
        *__error() = v58;
      }
      sub_10002AAC4("-[SPSampledProcess _performSamplePrinterWork:]", "SPProcessEvent.m", 1433, "%s: save report fail %d %d %d", v3, v4, v5, v6, (char)"callback && !_isSampling && _hasSampled");
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v37 = *__error();
        v38 = sub_10002ABEC();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (const char *)sub_10002AB88(self->super.super._targetProcessId);
          targetProcessId = self->super.super._targetProcessId;
          v41 = self->super.super._isSampling;
          v42 = self->super.super._hasSampled;
          *(_DWORD *)buf = 136316418;
          v82 = v39;
          v83 = 1024;
          v84 = targetProcessId;
          v85 = 2080;
          *(_QWORD *)v86 = "callback && !_isSampling && _hasSampled";
          *(_WORD *)&v86[8] = 1024;
          v87 = a3 != 0;
          v88 = 1024;
          v89 = v41;
          v90 = 1024;
          v91 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
        }
        *__error() = v37;
      }
      if (byte_1000E3CF9)
        v43 = dword_1000E34A8 < 4;
      else
        v43 = 0;
      if (v43)
      {
        v47 = a3 != 0;
        v48 = *__error();
        v49 = sub_10002AB88(self->super.super._targetProcessId);
        v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: %s: save report fail %d %d %d"), v49, self->super.super._targetProcessId, "callback && !_isSampling && _hasSampled", v47, self->super.super._isSampling, self->super.super._hasSampled);
        if (v50)
        {
          v64 = v50;
          v65 = CFStringGetCStringPtr(v50, 0x8000100u);
          if (v65)
          {
            v66 = (char *)v65;
            v67 = 0;
          }
          else
          {
            v66 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5B63B3CCuLL);
            CFStringGetCString(v64, v66, 1024, 0x8000100u);
            v67 = v66;
          }
          if (qword_1000E3D00)
            v72 = (FILE *)qword_1000E3D00;
          else
            v72 = __stderrp;
          fprintf(v72, "%s\n", v66);
          if (v67)
            free(v67);
          CFRelease(v64);
        }
        else
        {
          v51 = sub_10002ABEC();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            v52 = (const char *)sub_10002AB88(self->super.super._targetProcessId);
            v53 = self->super.super._targetProcessId;
            v54 = self->super.super._isSampling;
            v55 = self->super.super._hasSampled;
            *(_DWORD *)buf = 136316418;
            v82 = v52;
            v83 = 1024;
            v84 = v53;
            v85 = 2080;
            *(_QWORD *)v86 = "callback && !_isSampling && _hasSampled";
            *(_WORD *)&v86[8] = 1024;
            v87 = v47;
            v88 = 1024;
            v89 = v54;
            v90 = 1024;
            v91 = v55;
            _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
          }
          if (qword_1000E3D00)
            v56 = (FILE *)qword_1000E3D00;
          else
            v56 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v56);
        }
        *__error() = v48;
      }
      v73 = sub_10002AB88(self->super.super._targetProcessId);
      sub_10002AAC4("-[SPSampledProcess _performSamplePrinterWork:]", "SPProcessEvent.m", 1433, "%s [%d]: %s: save report fail %d %d %d", v74, v75, v76, v77, v73);
    }
    abort();
  }
  if (!self->super.super._isUrgent)
  {
    p_targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E3CF8)
      {
        v22 = *__error();
        v23 = sub_10002ABEC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Waiting for sampling to complete", buf, 2u);
        }
        *__error() = v22;
      }
      if (byte_1000E3CF9)
        v24 = dword_1000E34A8 <= 1;
      else
        v24 = 0;
      if (!v24)
        goto LABEL_54;
      v15 = *__error();
      v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Waiting for sampling to complete"));
      if (v25)
      {
        v26 = v25;
        v27 = CFStringGetCStringPtr(v25, 0x8000100u);
        if (v27)
        {
          v28 = (char *)v27;
          v29 = 0;
        }
        else
        {
          v28 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5FD08EACuLL);
          CFStringGetCString(v26, v28, 1024, 0x8000100u);
          v29 = v28;
        }
        if (qword_1000E3D00)
          v35 = (FILE *)qword_1000E3D00;
        else
          v35 = __stderrp;
        fprintf(v35, "%s\n", v28);
        if (v29)
          free(v29);
        v32 = v26;
        goto LABEL_52;
      }
      v33 = sub_10002ABEC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        sub_10008FF48();
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v10 = *__error();
        v11 = sub_10002ABEC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (const char *)sub_10002AB88(*p_targetProcessId);
          v13 = *p_targetProcessId;
          *(_DWORD *)buf = 136446466;
          v82 = v12;
          v83 = 1024;
          v84 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s [%d]: Waiting for sampling to complete", buf, 0x12u);
        }
        *__error() = v10;
      }
      if (byte_1000E3CF9)
        v14 = dword_1000E34A8 <= 1;
      else
        v14 = 0;
      if (!v14)
        goto LABEL_54;
      v15 = *__error();
      v16 = sub_10002AB88(*p_targetProcessId);
      v17 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Waiting for sampling to complete"), v16, *p_targetProcessId);
      if (v17)
      {
        v18 = v17;
        v19 = CFStringGetCStringPtr(v17, 0x8000100u);
        if (v19)
        {
          v20 = (char *)v19;
          v21 = 0;
        }
        else
        {
          v20 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5FD08EACuLL);
          CFStringGetCString(v18, v20, 1024, 0x8000100u);
          v21 = v20;
        }
        if (qword_1000E3D00)
          v31 = (FILE *)qword_1000E3D00;
        else
          v31 = __stderrp;
        fprintf(v31, "%s\n", v20);
        if (v21)
          free(v21);
        v32 = v18;
LABEL_52:
        CFRelease(v32);
LABEL_53:
        *__error() = v15;
LABEL_54:
        -[SPStackshotProvider waitForSamplingToComplete](self->super.super._sampleProvider, "waitForSamplingToComplete");
        goto LABEL_55;
      }
      v30 = sub_10002ABEC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        sub_10008FEDC();
    }
    if (qword_1000E3D00)
      v34 = (FILE *)qword_1000E3D00;
    else
      v34 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
    goto LABEL_53;
  }
LABEL_55:
  sampleProvider = self->super.super._sampleProvider;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100067358;
  v80[3] = &unk_1000D5A98;
  v80[4] = self;
  v80[5] = a3;
  -[SPStackshotProvider performSampleStoreWork:](sampleProvider, "performSampleStoreWork:", v80);
}

- (unsigned)samplingMode
{
  return self->_samplingMode;
}

@end
