@implementation SPStackshotProvider

- (SPStackshotProvider)init
{
  SPStackshotProvider *v2;
  SPStackshotProvider *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  SASampleStore *v7;
  int v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *CStringPtr;
  char *v14;
  char *v15;
  NSObject *v16;
  FILE *v17;
  FILE *v18;
  int v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *v24;
  char *v25;
  char *v26;
  NSObject *v27;
  FILE *v28;
  FILE *v29;
  uint8_t buf[16];
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SPStackshotProvider;
  v2 = -[SPStackshotProvider init](&v32, "init");
  v3 = v2;
  if (v2)
  {
    v2->_numClientsSampling = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v3->_storeReportingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spindump.sample_store", v5);
    dispatch_release(v5);
    v6 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v3->_stackshotParsingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spindump.stackshot_parsing", v6);
    v3->_pidsToGatherLoadInfo = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dispatch_release(v6);
    dispatch_release(v4);
    v3->_samplingGroup = (OS_dispatch_group *)dispatch_group_create();
    v3->_pidsSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v7 = (SASampleStore *)objc_msgSend(objc_alloc((Class)SASampleStore), "initForLiveSampling");
    v3->_sampleStore = v7;
    sub_10005A478(v7, (byte_1000E3D0C >> 3) & 1, (byte_1000E3D0C >> 2) & 1, (byte_1000E3D0C & 0x10) == 0);
    if ((byte_1000E3D0C & 2) != 0 && sub_100020888())
    {
      if (byte_1000E3CF8)
      {
        v8 = *__error();
        v9 = sub_10002ABEC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Avoiding inspecting live processes for stackshot report due to audio running", buf, 2u);
        }
        *__error() = v8;
      }
      if (byte_1000E3CF9 && dword_1000E34A8 <= 2)
      {
        v10 = *__error();
        v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Avoiding inspecting live processes for stackshot report due to audio running"));
        if (v11)
        {
          v12 = v11;
          CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
          if (CStringPtr)
          {
            v14 = (char *)CStringPtr;
            v15 = 0;
          }
          else
          {
            v14 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5DD56AFCuLL);
            CFStringGetCString(v12, v14, 1024, 0x8000100u);
            v15 = v14;
          }
          if (qword_1000E3D00)
            v18 = (FILE *)qword_1000E3D00;
          else
            v18 = __stderrp;
          fprintf(v18, "%s\n", v14);
          if (v15)
            free(v15);
          CFRelease(v12);
        }
        else
        {
          v16 = sub_10002ABEC();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            sub_100090D8C();
          if (qword_1000E3D00)
            v17 = (FILE *)qword_1000E3D00;
          else
            v17 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v17);
        }
        *__error() = v10;
      }
      -[SASampleStore setDataGatheringOptions:](v3->_sampleStore, "setDataGatheringOptions:", (unint64_t)-[SASampleStore dataGatheringOptions](v3->_sampleStore, "dataGatheringOptions") & 0xFFFFFFFFFFFFFFFDLL);
    }
    -[SASampleStore gatherMachineArchitecture](v3->_sampleStore, "gatherMachineArchitecture");
    if (byte_1000E3CF8)
    {
      v19 = *__error();
      v20 = sub_10002ABEC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        sub_100090D60();
      *__error() = v19;
    }
    if (byte_1000E3CF9 && dword_1000E34A8 <= 0)
    {
      v21 = *__error();
      v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Created shared SPStackshotProvider"));
      if (v22)
      {
        v23 = v22;
        v24 = CFStringGetCStringPtr(v22, 0x8000100u);
        if (v24)
        {
          v25 = (char *)v24;
          v26 = 0;
        }
        else
        {
          v25 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x870B609uLL);
          CFStringGetCString(v23, v25, 1024, 0x8000100u);
          v26 = v25;
        }
        if (qword_1000E3D00)
          v29 = (FILE *)qword_1000E3D00;
        else
          v29 = __stderrp;
        fprintf(v29, "%s\n", v25);
        if (v26)
          free(v26);
        CFRelease(v23);
      }
      else
      {
        v27 = sub_10002ABEC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          sub_100090D34();
        if (qword_1000E3D00)
          v28 = (FILE *)qword_1000E3D00;
        else
          v28 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v28);
      }
      *__error() = v21;
    }
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *p_numClientsSampling;
  int v8;
  NSObject *v9;
  BOOL v10;
  int v11;
  const __CFString *v12;
  NSObject *v13;
  FILE *v14;
  const char *CStringPtr;
  char *v16;
  char *v17;
  FILE *v18;
  const __CFString *theString;
  int v20;
  objc_super v21;

  p_numClientsSampling = &self->_numClientsSampling;
  if (self->_numClientsSampling)
  {
    if (byte_1000E3CF8)
    {
      v8 = *__error();
      v9 = sub_10002ABEC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100090E28();
      *__error() = v8;
    }
    if (byte_1000E3CF9)
      v10 = dword_1000E34A8 <= 3;
    else
      v10 = 0;
    if (v10)
    {
      v11 = *__error();
      v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Still have %d clients sampling when dealloc'ed"), "_numClientsSampling == 0", *p_numClientsSampling);
      v20 = v11;
      if (v12)
      {
        theString = v12;
        CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
        if (CStringPtr)
        {
          v16 = (char *)CStringPtr;
          v17 = 0;
        }
        else
        {
          v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA6E5828FuLL);
          CFStringGetCString(theString, v16, 1024, 0x8000100u);
          v17 = v16;
        }
        if (qword_1000E3D00)
          v18 = (FILE *)qword_1000E3D00;
        else
          v18 = __stderrp;
        fprintf(v18, "%s\n", v16);
        if (v17)
          free(v17);
        CFRelease(theString);
      }
      else
      {
        v13 = sub_10002ABEC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          sub_100090DB8();
        if (qword_1000E3D00)
          v14 = (FILE *)qword_1000E3D00;
        else
          v14 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v14);
      }
      *__error() = v20;
    }
    sub_10002AAC4("-[SPStackshotProvider dealloc]", "SPSampleProvider.m", 499, "%s: Still have %d clients sampling when dealloc'ed", v2, v3, v4, v5, (char)"_numClientsSampling == 0");
    abort();
  }
  -[SPStackshotProvider stopSamplingThread](self, "stopSamplingThread");

  dispatch_release((dispatch_object_t)self->_storeReportingQueue);
  dispatch_release((dispatch_object_t)self->_stackshotParsingQueue);
  dispatch_release((dispatch_object_t)self->_samplingGroup);

  dispatch_release((dispatch_object_t)self->_pidsSem);
  v21.receiver = self;
  v21.super_class = (Class)SPStackshotProvider;
  -[SPStackshotProvider dealloc](&v21, "dealloc");
}

- (void)startSamplingThread
{
  int v3;
  NSObject *v4;
  BOOL v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  char *CStringPtr;
  char *v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  char *v17;
  char *v18;
  NSObject *v19;
  FILE *v20;
  FILE *v21;
  NSObject *v22;
  FILE *v23;
  FILE *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  char *v33;
  int v34;
  char *v35;
  const __CFString *v36;
  const __CFString *v37;
  NSObject *v38;
  char *v39;
  FILE *v40;
  char *v41;
  char *v42;
  FILE *v43;
  int __errnum[2];
  _DWORD v45[8];
  uint8_t buf[40];

  objc_sync_enter(self);
  if (self->_samplingThread)
  {
    if (byte_1000E3CF8)
    {
      v3 = *__error();
      v4 = sub_10002ABEC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        sub_100090F80();
      *__error() = v3;
    }
    if (byte_1000E3CF9)
      v5 = dword_1000E34A8 <= 0;
    else
      v5 = 0;
    if (v5)
    {
      v6 = *__error();
      v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Already have a sampling thread"));
      v8 = v7;
      if (v7)
      {
        CStringPtr = (char *)CFStringGetCStringPtr(v7, 0x8000100u);
        if (CStringPtr)
        {
          v10 = 0;
        }
        else
        {
          CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xDA9EEA40uLL);
          CFStringGetCString(v8, CStringPtr, 1024, 0x8000100u);
          v10 = CStringPtr;
        }
        if (qword_1000E3D00)
          v21 = (FILE *)qword_1000E3D00;
        else
          v21 = __stderrp;
        fprintf(v21, "%s\n", CStringPtr);
        if (v10)
          free(v10);
        CFRelease(v8);
      }
      else
      {
        v19 = sub_10002ABEC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          sub_100090F54();
        if (qword_1000E3D00)
          v20 = (FILE *)qword_1000E3D00;
        else
          v20 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v20);
      }
      *__error() = v6;
    }
  }
  else
  {
    self->_samplingStoppedSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    if (byte_1000E3CF8)
    {
      v11 = *__error();
      v12 = sub_10002ABEC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Starting sampling thread", buf, 2u);
      }
      *__error() = v11;
    }
    if (byte_1000E3CF9)
      v13 = dword_1000E34A8 <= 1;
    else
      v13 = 0;
    if (v13)
    {
      v14 = *__error();
      v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Starting sampling thread"));
      v16 = v15;
      if (v15)
      {
        v17 = (char *)CFStringGetCStringPtr(v15, 0x8000100u);
        if (v17)
        {
          v18 = 0;
        }
        else
        {
          v17 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xDA5638ECuLL);
          CFStringGetCString(v16, v17, 1024, 0x8000100u);
          v18 = v17;
        }
        if (qword_1000E3D00)
          v24 = (FILE *)qword_1000E3D00;
        else
          v24 = __stderrp;
        fprintf(v24, "%s\n", v17);
        if (v18)
          free(v18);
        CFRelease(v16);
      }
      else
      {
        v22 = sub_10002ABEC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          sub_100090F28();
        if (qword_1000E3D00)
          v23 = (FILE *)qword_1000E3D00;
        else
          v23 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v23);
      }
      *__error() = v14;
    }
    v25 = pthread_create(&self->_samplingThread, 0, (void *(__cdecl *)(void *))sub_10006A950, self);
    if ((_DWORD)v25)
    {
      *(_QWORD *)__errnum = v25;
      if (byte_1000E3CF8)
      {
        v31 = *__error();
        v32 = sub_10002ABEC();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = strerror(__errnum[0]);
          sub_100090EE0((uint64_t)v33, buf, __errnum[0]);
        }
        *__error() = v31;
      }
      if (byte_1000E3CF9)
        v26 = dword_1000E34A8 <= 3;
      else
        v26 = 0;
      if (v26)
      {
        v34 = *__error();
        v35 = strerror(__errnum[0]);
        v36 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Unable to create sampling thread: %d (%s)"), "ret == 0", *(_QWORD *)__errnum, v35);
        v37 = v36;
        if (v36)
        {
          v41 = (char *)CFStringGetCStringPtr(v36, 0x8000100u);
          if (v41)
          {
            v42 = 0;
          }
          else
          {
            v41 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x98EFEE2EuLL);
            CFStringGetCString(v37, v41, 1024, 0x8000100u);
            v42 = v41;
          }
          if (qword_1000E3D00)
            v43 = (FILE *)qword_1000E3D00;
          else
            v43 = __stderrp;
          fprintf(v43, "%s\n", v41);
          if (v42)
            free(v42);
          CFRelease(v37);
        }
        else
        {
          v38 = sub_10002ABEC();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            v39 = strerror(__errnum[0]);
            sub_100090E98((uint64_t)v39, v45, __errnum[0]);
          }
          if (qword_1000E3D00)
            v40 = (FILE *)qword_1000E3D00;
          else
            v40 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v40);
        }
        *__error() = v34;
      }
      strerror(__errnum[0]);
      sub_10002AAC4("-[SPStackshotProvider startSamplingThread]", "SPSampleProvider.m", 517, "%s: Unable to create sampling thread: %d (%s)", v27, v28, v29, v30, (char)"ret == 0");
      abort();
    }
  }
  objc_sync_exit(self);
}

- (void)stopSamplingThread
{
  int v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  char *CStringPtr;
  char *v9;
  int v10;
  NSObject *v11;
  BOOL v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  char *v16;
  char *v17;
  int v18;
  NSObject *v19;
  BOOL v20;
  const __CFString *v21;
  const __CFString *v22;
  char *v23;
  char *v24;
  int v25;
  NSObject *v26;
  BOOL v27;
  const __CFString *v28;
  const __CFString *v29;
  char *v30;
  char *v31;
  NSObject *v32;
  FILE *v33;
  FILE *v34;
  NSObject *v35;
  FILE *v36;
  NSObject *v37;
  FILE *v38;
  FILE *v39;
  int *v40;
  FILE *v41;
  NSObject *v42;
  FILE *v43;
  FILE *v44;
  int v45;
  NSObject *v46;
  int v47;
  const __CFString *v48;
  const __CFString *v49;
  char *v50;
  char *v51;
  NSObject *v52;
  FILE *v53;
  FILE *v54;
  uint8_t v55[16];
  uint8_t v56[16];
  uint8_t v57[16];
  uint8_t buf[16];

  objc_sync_enter(self);
  if (self->_samplingThread)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_samplingStoppedSem);
    if (byte_1000E3CF9)
    {
      if (qword_1000E3D58 && dispatch_group_wait((dispatch_group_t)qword_1000E3D58, 0))
      {
        if (byte_1000E3D51)
          goto LABEL_109;
        if (byte_1000E3CF8)
        {
          v3 = *__error();
          v4 = sub_10002ABEC();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sampling completed, waiting for SIGINFO...", buf, 2u);
          }
          *__error() = v3;
        }
        if (!byte_1000E3CF9 || dword_1000E34A8 > 2)
          goto LABEL_109;
        v5 = *__error();
        v6 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Sampling completed, waiting for SIGINFO..."));
        v7 = v6;
        if (v6)
        {
          CStringPtr = (char *)CFStringGetCStringPtr(v6, 0x8000100u);
          if (CStringPtr)
          {
            v9 = 0;
          }
          else
          {
            CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x34D87FFDuLL);
            CFStringGetCString(v7, CStringPtr, 1024, 0x8000100u);
            v9 = CStringPtr;
          }
          if (qword_1000E3D00)
            v44 = (FILE *)qword_1000E3D00;
          else
            v44 = __stderrp;
          fprintf(v44, "%s\n", CStringPtr);
          if (v9)
            free(v9);
          CFRelease(v7);
        }
        else
        {
          v42 = sub_10002ABEC();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
            sub_100091248();
          if (qword_1000E3D00)
            v43 = (FILE *)qword_1000E3D00;
          else
            v43 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v43);
        }
        v40 = __error();
      }
      else if ((byte_1000E3D0C & 0x18) == 0x10)
      {
        if (byte_1000E3CF8)
        {
          v18 = *__error();
          v19 = sub_10002ABEC();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sampling completed, generating report...", v56, 2u);
          }
          *__error() = v18;
        }
        if (byte_1000E3CF9)
          v20 = dword_1000E34A8 <= 2;
        else
          v20 = 0;
        if (!v20)
          goto LABEL_109;
        v5 = *__error();
        v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Sampling completed, generating report..."));
        v22 = v21;
        if (v21)
        {
          v23 = (char *)CFStringGetCStringPtr(v21, 0x8000100u);
          if (v23)
          {
            v24 = 0;
          }
          else
          {
            v23 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE90DD6FFuLL);
            CFStringGetCString(v22, v23, 1024, 0x8000100u);
            v24 = v23;
          }
          if (qword_1000E3D00)
            v39 = (FILE *)qword_1000E3D00;
          else
            v39 = __stderrp;
          fprintf(v39, "%s\n", v23);
          if (v24)
            free(v24);
          CFRelease(v22);
        }
        else
        {
          v35 = sub_10002ABEC();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            sub_1000911F0();
          if (qword_1000E3D00)
            v36 = (FILE *)qword_1000E3D00;
          else
            v36 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v36);
        }
        v40 = __error();
      }
      else
      {
        if (byte_1000E3CF8)
        {
          v25 = *__error();
          v26 = sub_10002ABEC();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v57 = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sampling completed, processing symbols...", v57, 2u);
          }
          *__error() = v25;
        }
        if (byte_1000E3CF9)
          v27 = dword_1000E34A8 <= 2;
        else
          v27 = 0;
        if (!v27)
          goto LABEL_109;
        v5 = *__error();
        v28 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Sampling completed, processing symbols..."));
        v29 = v28;
        if (v28)
        {
          v30 = (char *)CFStringGetCStringPtr(v28, 0x8000100u);
          if (v30)
          {
            v31 = 0;
          }
          else
          {
            v30 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF202B765uLL);
            CFStringGetCString(v29, v30, 1024, 0x8000100u);
            v31 = v30;
          }
          if (qword_1000E3D00)
            v41 = (FILE *)qword_1000E3D00;
          else
            v41 = __stderrp;
          fprintf(v41, "%s\n", v30);
          if (v31)
            free(v31);
          CFRelease(v29);
        }
        else
        {
          v37 = sub_10002ABEC();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            sub_10009121C();
          if (qword_1000E3D00)
            v38 = (FILE *)qword_1000E3D00;
          else
            v38 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v38);
        }
        v40 = __error();
      }
      *v40 = v5;
    }
LABEL_109:
    if (byte_1000E3CF8)
    {
      v45 = *__error();
      v46 = sub_10002ABEC();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Stopping sampling thread", v55, 2u);
      }
      *__error() = v45;
      if (byte_1000E3CF9 && dword_1000E34A8 <= 1)
      {
        v47 = *__error();
        v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Stopping sampling thread"));
        v49 = v48;
        if (v48)
        {
          v50 = (char *)CFStringGetCStringPtr(v48, 0x8000100u);
          if (v50)
          {
            v51 = 0;
          }
          else
          {
            v50 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF83B09A7uLL);
            CFStringGetCString(v49, v50, 1024, 0x8000100u);
            v51 = v50;
          }
          if (qword_1000E3D00)
            v54 = (FILE *)qword_1000E3D00;
          else
            v54 = __stderrp;
          fprintf(v54, "%s\n", v50);
          if (v51)
            free(v51);
          CFRelease(v49);
        }
        else
        {
          v52 = sub_10002ABEC();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
            sub_1000911C4();
          if (qword_1000E3D00)
            v53 = (FILE *)qword_1000E3D00;
          else
            v53 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v53);
        }
        *__error() = v47;
      }
    }
    pthread_join(self->_samplingThread, 0);
    dispatch_release((dispatch_object_t)self->_samplingStoppedSem);
    self->_samplingThread = 0;
    goto LABEL_132;
  }
  if (byte_1000E3CF8)
  {
    v10 = *__error();
    v11 = sub_10002ABEC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100091198();
    *__error() = v10;
  }
  if (byte_1000E3CF9)
    v12 = dword_1000E34A8 <= 0;
  else
    v12 = 0;
  if (v12)
  {
    v13 = *__error();
    v14 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("No sampling thread to stop"));
    v15 = v14;
    if (v14)
    {
      v16 = (char *)CFStringGetCStringPtr(v14, 0x8000100u);
      if (v16)
      {
        v17 = 0;
      }
      else
      {
        v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5D81E1D0uLL);
        CFStringGetCString(v15, v16, 1024, 0x8000100u);
        v17 = v16;
      }
      if (qword_1000E3D00)
        v34 = (FILE *)qword_1000E3D00;
      else
        v34 = __stderrp;
      fprintf(v34, "%s\n", v16);
      if (v17)
        free(v17);
      CFRelease(v15);
    }
    else
    {
      v32 = sub_10002ABEC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        sub_10009116C();
      if (qword_1000E3D00)
        v33 = (FILE *)qword_1000E3D00;
      else
        v33 = __stderrp;
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v33);
    }
    *__error() = v13;
  }
LABEL_132:
  objc_sync_exit(self);
}

+ (id)sharedInstanceLock
{
  if (qword_1000E3CB0 != -1)
    dispatch_once(&qword_1000E3CB0, &stru_1000D5B98);
  return (id)qword_1000E3CB8;
}

+ (id)snapshotWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7
{
  id v7;
  _QWORD v9[6];
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  if (!a3)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_10006C75C;
  v18 = sub_10006C76C;
  v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006C778;
  v9[3] = &unk_1000D5BC0;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v9[4] = a5;
  v9[5] = &v14;
  dispatch_sync((dispatch_queue_t)+[SPStackshotProvider sharedInstanceLock](SPStackshotProvider, "sharedInstanceLock"), v9);
  v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)sampleProcesses:(id)a3 onlyMainThreads:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableSet *sampleOnlyPids;
  id v8;
  int v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  char *CStringPtr;
  char *v15;
  int v16;
  NSObject *v17;
  BOOL v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  char *v22;
  char *v23;
  int v24;
  NSObject *v25;
  const __CFString *v26;
  const __CFString *v27;
  char *v28;
  char *v29;
  NSObject *v30;
  FILE *v31;
  FILE *v32;
  int *v33;
  NSObject *v34;
  FILE *v35;
  NSObject *v36;
  FILE *v37;
  FILE *v38;
  int v39;
  NSObject *v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  char *v44;
  char *v45;
  NSObject *v46;
  FILE *v47;
  FILE *v48;
  FILE *v49;
  uint8_t v50[32];
  uint8_t buf[4];
  id v52;

  v4 = a4;
  objc_sync_enter(self);
  if (self->_numClientsSampling)
  {
    sampleOnlyPids = self->_sampleOnlyPids;
    if (a3)
    {
      if (sampleOnlyPids)
      {
        v8 = objc_msgSend(a3, "mutableCopy");
        objc_msgSend(v8, "minusSet:", self->_sampleOnlyPids);
        if (objc_msgSend(v8, "count"))
        {
          dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
          self->_sampleOnlyPidsHasUpdate = 1;
          -[NSMutableSet unionSet:](self->_sampleOnlyPids, "unionSet:", v8);
          if (byte_1000E3CF8)
          {
            v9 = *__error();
            v10 = sub_10002ABEC();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v52 = objc_msgSend(objc_msgSend(v8, "description"), "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Changing to sampling %s also", buf, 0xCu);
            }
            *__error() = v9;
          }
          if (byte_1000E3CF9 && dword_1000E34A8 <= 1)
          {
            v11 = *__error();
            v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Changing to sampling %s also"), objc_msgSend(objc_msgSend(v8, "description"), "UTF8String"));
            v13 = v12;
            if (v12)
            {
              CStringPtr = (char *)CFStringGetCStringPtr(v12, 0x8000100u);
              if (CStringPtr)
              {
                v15 = 0;
              }
              else
              {
                CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x76625223uLL);
                CFStringGetCString(v13, CStringPtr, 1024, 0x8000100u);
                v15 = CStringPtr;
              }
              if (qword_1000E3D00)
                v38 = (FILE *)qword_1000E3D00;
              else
                v38 = __stderrp;
              fprintf(v38, "%s\n", CStringPtr);
              if (v15)
                free(v15);
              CFRelease(v13);
            }
            else
            {
              v34 = sub_10002ABEC();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
                sub_1000913C0((uint64_t)objc_msgSend(objc_msgSend(v8, "description"), "UTF8String"), (uint64_t)buf, v34);
              if (qword_1000E3D00)
                v35 = (FILE *)qword_1000E3D00;
              else
                v35 = __stderrp;
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v35);
            }
            *__error() = v11;
          }
          dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
        }

      }
      if (!v4 && -[SASampleStore sampleOnlyMainThreads](self->_sampleStore, "sampleOnlyMainThreads"))
      {
        if (byte_1000E3CF8)
        {
          v39 = *__error();
          v40 = sub_10002ABEC();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v50 = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Upping sampling to include non-main threads", v50, 2u);
          }
          *__error() = v39;
        }
        if (byte_1000E3CF9 && dword_1000E34A8 <= 1)
        {
          v41 = *__error();
          v42 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Upping sampling to include non-main threads"));
          v43 = v42;
          if (v42)
          {
            v44 = (char *)CFStringGetCStringPtr(v42, 0x8000100u);
            if (v44)
            {
              v45 = 0;
            }
            else
            {
              v44 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6F456C6EuLL);
              CFStringGetCString(v43, v44, 1024, 0x8000100u);
              v45 = v44;
            }
            if (qword_1000E3D00)
              v49 = (FILE *)qword_1000E3D00;
            else
              v49 = __stderrp;
            fprintf(v49, "%s\n", v44);
            if (v45)
              free(v45);
            CFRelease(v43);
          }
          else
          {
            v46 = sub_10002ABEC();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
              sub_100091394();
            if (qword_1000E3D00)
              v47 = (FILE *)qword_1000E3D00;
            else
              v47 = __stderrp;
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v47);
          }
          *__error() = v41;
        }
        -[SASampleStore setSampleOnlyMainThreads:](self->_sampleStore, "setSampleOnlyMainThreads:", 0);
      }
      goto LABEL_111;
    }
    if (sampleOnlyPids)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
      self->_sampleOnlyPidsHasUpdate = 1;

      self->_sampleOnlyPids = 0;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
      if (-[SASampleStore sampleOnlyMainThreads](self->_sampleStore, "sampleOnlyMainThreads"))
        -[SASampleStore setSampleOnlyMainThreads:](self->_sampleStore, "setSampleOnlyMainThreads:", 0);
      -[SASampleStore setStackshotsOnlyIncludeSpecificProcesses:](self->_sampleStore, "setStackshotsOnlyIncludeSpecificProcesses:", 0);
      if (byte_1000E3CF8)
      {
        v24 = *__error();
        v25 = sub_10002ABEC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Changing to sampling everything", buf, 2u);
        }
        *__error() = v24;
      }
      if (byte_1000E3CF9 && dword_1000E34A8 <= 1)
      {
        v19 = *__error();
        v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Changing to sampling everything"));
        v27 = v26;
        if (v26)
        {
          v28 = (char *)CFStringGetCStringPtr(v26, 0x8000100u);
          if (v28)
          {
            v29 = 0;
          }
          else
          {
            v28 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD26AF731uLL);
            CFStringGetCString(v27, v28, 1024, 0x8000100u);
            v29 = v28;
          }
          if (qword_1000E3D00)
            v48 = (FILE *)qword_1000E3D00;
          else
            v48 = __stderrp;
          fprintf(v48, "%s\n", v28);
          if (v29)
            free(v29);
          CFRelease(v27);
        }
        else
        {
          v36 = sub_10002ABEC();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
            sub_100091368();
          if (qword_1000E3D00)
            v37 = (FILE *)qword_1000E3D00;
          else
            v37 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v37);
        }
        v33 = __error();
LABEL_101:
        *v33 = v19;
      }
    }
  }
  else
  {
    if (a3)
      -[SASampleStore setStackshotsOnlyIncludeSpecificProcesses:](self->_sampleStore, "setStackshotsOnlyIncludeSpecificProcesses:", 1);
    if (byte_1000E3CF8)
    {
      v16 = *__error();
      v17 = sub_10002ABEC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100091318((uint64_t)objc_msgSend(a3, "description"), v4, (uint64_t)buf, v17);
      *__error() = v16;
    }
    if (byte_1000E3CF9)
      v18 = dword_1000E34A8 <= 3;
    else
      v18 = 0;
    if (v18)
    {
      v19 = *__error();
      v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("No one's sampling when requested to adjust sampling target to %@ %d"), objc_msgSend(a3, "description"), v4);
      v21 = v20;
      if (v20)
      {
        v22 = (char *)CFStringGetCStringPtr(v20, 0x8000100u);
        if (v22)
        {
          v23 = 0;
        }
        else
        {
          v22 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF089C3E9uLL);
          CFStringGetCString(v21, v22, 1024, 0x8000100u);
          v23 = v22;
        }
        if (qword_1000E3D00)
          v32 = (FILE *)qword_1000E3D00;
        else
          v32 = __stderrp;
        fprintf(v32, "%s\n", v22);
        if (v23)
          free(v23);
        CFRelease(v21);
      }
      else
      {
        v30 = sub_10002ABEC();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          sub_1000912CC((uint64_t)objc_msgSend(a3, "description"), (uint64_t)v50, v4, v30);
        if (qword_1000E3D00)
          v31 = (FILE *)qword_1000E3D00;
        else
          v31 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v31);
      }
      v33 = __error();
      goto LABEL_101;
    }
  }
LABEL_111:
  objc_sync_exit(self);
}

- (BOOL)startWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  int numClientsSampling;
  unsigned int v14;
  int v15;
  NSObject *v16;
  BOOL v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  char *CStringPtr;
  char *v22;
  BOOL v23;
  int v24;
  NSObject *v25;
  BOOL v26;
  int v27;
  NSObject *v28;
  BOOL v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  char *v33;
  char *v34;
  int v35;
  NSObject *v36;
  int v37;
  const __CFString *v38;
  const __CFString *v39;
  char *v40;
  char *v41;
  int v42;
  const __CFString *v43;
  const __CFString *v44;
  char *v45;
  char *v46;
  NSObject *v47;
  FILE *v48;
  int v49;
  NSObject *v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  char *v54;
  char *v55;
  FILE *v56;
  NSObject *v57;
  FILE *v58;
  int v59;
  NSObject *v60;
  const __CFString *v61;
  char *v62;
  char *v63;
  NSObject *v64;
  FILE *v65;
  FILE *v66;
  FILE *v67;
  int *v68;
  unsigned int *p_occasionalDataIntervalSec;
  int v70;
  NSObject *v71;
  unsigned int v72;
  int v73;
  const __CFString *v74;
  const __CFString *v75;
  char *v76;
  char *v77;
  NSObject *v78;
  FILE *v79;
  unsigned int samplingIntervalUs;
  unsigned int occasionalDataIntervalSec;
  NSObject *v82;
  FILE *v83;
  FILE *v84;
  NSObject *v85;
  FILE *v86;
  FILE *v87;
  double Current;
  double v89;
  NSObject *global_queue;
  NSObject *v91;
  FILE *v92;
  int v93;
  NSObject *v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  const __CFString *v99;
  const __CFString *v100;
  char *v101;
  char *v102;
  NSObject *v103;
  FILE *v104;
  FILE *v105;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  const char *v110;
  FILE *v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  const char *v116;
  _QWORD block[6];
  uint8_t buf[4];
  _BYTE v119[10];
  __int16 v120;
  _QWORD v121[2];
  _BYTE v122[16];

  if (a3)
  {
    v7 = a7;
    v8 = a6;
    v10 = *(_QWORD *)&a4;
    v11 = *(_QWORD *)&a3;
    objc_sync_enter(self);
    numClientsSampling = self->_numClientsSampling;
    if (numClientsSampling)
    {
      if (self->_samplingIntervalUs != (_DWORD)v11
        || (_DWORD)v10 && (v14 = self->_occasionalDataIntervalSec) != 0 && v14 != (_DWORD)v10)
      {
        if (byte_1000E3CF8)
        {
          v15 = *__error();
          v16 = sub_10002ABEC();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            samplingIntervalUs = self->_samplingIntervalUs;
            occasionalDataIntervalSec = self->_occasionalDataIntervalSec;
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)v119 = samplingIntervalUs;
            *(_WORD *)&v119[4] = 1024;
            *(_DWORD *)&v119[6] = occasionalDataIntervalSec;
            v120 = 1024;
            LODWORD(v121[0]) = v11;
            WORD2(v121[0]) = 1024;
            *(_DWORD *)((char *)v121 + 6) = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data", buf, 0x1Au);
          }
          *__error() = v15;
        }
        if (byte_1000E3CF9)
          v17 = dword_1000E34A8 <= 3;
        else
          v17 = 0;
        if (v17)
        {
          v18 = *__error();
          v19 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data"), self->_samplingIntervalUs, self->_occasionalDataIntervalSec, v11, v10);
          v20 = v19;
          if (v19)
          {
            CStringPtr = (char *)CFStringGetCStringPtr(v19, 0x8000100u);
            if (CStringPtr)
            {
              v22 = 0;
            }
            else
            {
              CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x4D27C969uLL);
              CFStringGetCString(v20, CStringPtr, 1024, 0x8000100u);
              v22 = CStringPtr;
            }
            if (qword_1000E3D00)
              v56 = (FILE *)qword_1000E3D00;
            else
              v56 = __stderrp;
            fprintf(v56, "%s\n", CStringPtr);
            if (v22)
              free(v22);
            CFRelease(v20);
          }
          else
          {
            v47 = sub_10002ABEC();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
            {
              v112 = self->_samplingIntervalUs;
              v113 = self->_occasionalDataIntervalSec;
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)v119 = v112;
              *(_WORD *)&v119[4] = 1024;
              *(_DWORD *)&v119[6] = v113;
              v120 = 1024;
              LODWORD(v121[0]) = v11;
              WORD2(v121[0]) = 1024;
              *(_DWORD *)((char *)v121 + 6) = v10;
              _os_log_fault_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "Unable to format: Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data", buf, 0x1Au);
            }
            if (qword_1000E3D00)
              v48 = (FILE *)qword_1000E3D00;
            else
              v48 = __stderrp;
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
          }
          v23 = 0;
          *__error() = v18;
          goto LABEL_201;
        }
        goto LABEL_29;
      }
      if (!v7 || self->_omitSensitiveStrings)
      {
        self->_numClientsSampling = numClientsSampling + 1;
        if (byte_1000E3CF8)
        {
          v27 = *__error();
          v28 = sub_10002ABEC();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            sub_100091620();
          *__error() = v27;
        }
        if (byte_1000E3CF9)
          v29 = dword_1000E34A8 <= 0;
        else
          v29 = 0;
        if (v29)
        {
          v30 = *__error();
          v31 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Already sampling with %uus-interval stackshots and %us-interval occasional data"), self->_samplingIntervalUs, self->_occasionalDataIntervalSec);
          v32 = v31;
          if (v31)
          {
            v33 = (char *)CFStringGetCStringPtr(v31, 0x8000100u);
            if (v33)
            {
              v34 = 0;
            }
            else
            {
              v33 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x275E42D2uLL);
              CFStringGetCString(v32, v33, 1024, 0x8000100u);
              v34 = v33;
            }
            if (qword_1000E3D00)
              v67 = (FILE *)qword_1000E3D00;
            else
              v67 = __stderrp;
            fprintf(v67, "%s\n", v33);
            if (v34)
              free(v34);
            CFRelease(v32);
          }
          else
          {
            v64 = sub_10002ABEC();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              sub_1000915AC();
            if (qword_1000E3D00)
              v65 = (FILE *)qword_1000E3D00;
            else
              v65 = __stderrp;
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v65);
          }
          *__error() = v30;
        }
        v68 = (int *)-[SPStackshotProvider sampleProcesses:onlyMainThreads:](self, "sampleProcesses:onlyMainThreads:", a5, v8);
        p_occasionalDataIntervalSec = &self->_occasionalDataIntervalSec;
        if (!self->_occasionalDataIntervalSec)
        {
          *p_occasionalDataIntervalSec = v10;
          if (byte_1000E3CF8)
          {
            v70 = *__error();
            v71 = sub_10002ABEC();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              v72 = *p_occasionalDataIntervalSec;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v119 = v72;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Turned on occasional data gathering at %us-intervals for additional client", buf, 8u);
            }
            v68 = __error();
            *v68 = v70;
          }
          if (byte_1000E3CF9 && dword_1000E34A8 <= 1)
          {
            v73 = *__error();
            v74 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Turned on occasional data gathering at %us-intervals for additional client"), *p_occasionalDataIntervalSec);
            v75 = v74;
            if (v74)
            {
              v76 = (char *)CFStringGetCStringPtr(v74, 0x8000100u);
              if (v76)
              {
                v77 = 0;
              }
              else
              {
                v76 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xCBE22889uLL);
                CFStringGetCString(v75, v76, 1024, 0x8000100u);
                v77 = v76;
              }
              if (qword_1000E3D00)
                v87 = (FILE *)qword_1000E3D00;
              else
                v87 = __stderrp;
              fprintf(v87, "%s\n", v76);
              if (v77)
                free(v77);
              CFRelease(v75);
            }
            else
            {
              v82 = sub_10002ABEC();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
                sub_100091548();
              if (qword_1000E3D00)
                v83 = (FILE *)qword_1000E3D00;
              else
                v83 = __stderrp;
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v83);
            }
            v68 = __error();
            *v68 = v73;
          }
        }
        Current = SAMachAbsTimeSecondsGetCurrent(v68);
        if ((_DWORD)v10)
        {
          v89 = Current;
          global_queue = dispatch_get_global_queue(25, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10006E40C;
          block[3] = &unk_1000D4E28;
          *(double *)&block[5] = v89;
          block[4] = self;
          dispatch_async(global_queue, block);
        }
LABEL_200:
        v23 = 1;
        goto LABEL_201;
      }
      if (byte_1000E3CF8)
      {
        v59 = *__error();
        v60 = sub_10002ABEC();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          sub_100091518();
        *__error() = v59;
      }
      v23 = 0;
      if (!byte_1000E3CF9 || dword_1000E34A8 > 3)
        goto LABEL_201;
      v42 = *__error();
      v61 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Already sampling with sensitive strings, so can't start monitoring since we don't want sensitive strings"));
      v44 = v61;
      if (v61)
      {
        v62 = (char *)CFStringGetCStringPtr(v61, 0x8000100u);
        if (v62)
        {
          v63 = 0;
        }
        else
        {
          v62 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9FC0D6DCuLL);
          CFStringGetCString(v44, v62, 1024, 0x8000100u);
          v63 = v62;
        }
        if (qword_1000E3D00)
          v111 = (FILE *)qword_1000E3D00;
        else
          v111 = __stderrp;
        fprintf(v111, "%s\n", v62);
        if (v63)
          free(v63);
LABEL_107:
        CFRelease(v44);
        goto LABEL_108;
      }
      v91 = sub_10002ABEC();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
        sub_1000914EC();
      if (qword_1000E3D00)
        v58 = (FILE *)qword_1000E3D00;
      else
        v58 = __stderrp;
    }
    else
    {
      if (!self->_hasSampled)
      {
        dispatch_group_enter((dispatch_group_t)self->_samplingGroup);
        self->_hasSampled = 1;
        ++self->_numClientsSampling;
        self->_samplingIntervalUs = v11;
        self->_occasionalDataIntervalSec = v10;
        self->_previousTimeOccasionalDataWasGathered = 0.0;
        self->_omitSensitiveStrings = v7;
        -[SASampleStore setOmitSensitiveStrings:](self->_sampleStore, "setOmitSensitiveStrings:", v7);
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
        self->_sampleOnlyPidsHasUpdate = 1;

        if (a5)
        {
          self->_sampleOnlyPids = (NSMutableSet *)objc_msgSend(a5, "mutableCopy");
          if (byte_1000E3CF8)
          {
            v35 = *__error();
            v36 = sub_10002ABEC();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)v119 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Sampling only %s", buf, 0xCu);
            }
            *__error() = v35;
          }
          if (byte_1000E3CF9 && dword_1000E34A8 <= 1)
          {
            v37 = *__error();
            v38 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Sampling only %s"), objc_msgSend(objc_msgSend(a5, "description"), "UTF8String"));
            v39 = v38;
            if (v38)
            {
              v40 = (char *)CFStringGetCStringPtr(v38, 0x8000100u);
              if (v40)
              {
                v41 = 0;
              }
              else
              {
                v40 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x313082CuLL);
                CFStringGetCString(v39, v40, 1024, 0x8000100u);
                v41 = v40;
              }
              if (qword_1000E3D00)
                v84 = (FILE *)qword_1000E3D00;
              else
                v84 = __stderrp;
              fprintf(v84, "%s\n", v40);
              if (v41)
                free(v41);
              CFRelease(v39);
            }
            else
            {
              v78 = sub_10002ABEC();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
                sub_100091454((uint64_t)objc_msgSend(objc_msgSend(a5, "description"), "UTF8String"), (uint64_t)v122, v78);
              if (qword_1000E3D00)
                v79 = (FILE *)qword_1000E3D00;
              else
                v79 = __stderrp;
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v79);
            }
            *__error() = v37;
          }
        }
        else
        {
          self->_sampleOnlyPids = 0;
          if (byte_1000E3CF8)
          {
            v49 = *__error();
            v50 = sub_10002ABEC();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              sub_100091428();
            *__error() = v49;
          }
          v8 = 0;
          if (byte_1000E3CF9 && dword_1000E34A8 <= 0)
          {
            v51 = *__error();
            v52 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Sampling everything"));
            v53 = v52;
            if (v52)
            {
              v54 = (char *)CFStringGetCStringPtr(v52, 0x8000100u);
              if (v54)
              {
                v55 = 0;
              }
              else
              {
                v54 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x45049F48uLL);
                CFStringGetCString(v53, v54, 1024, 0x8000100u);
                v55 = v54;
              }
              if (qword_1000E3D00)
                v92 = (FILE *)qword_1000E3D00;
              else
                v92 = __stderrp;
              fprintf(v92, "%s\n", v54);
              if (v55)
                free(v55);
              CFRelease(v53);
            }
            else
            {
              v85 = sub_10002ABEC();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
                sub_1000913FC();
              if (qword_1000E3D00)
                v86 = (FILE *)qword_1000E3D00;
              else
                v86 = __stderrp;
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v86);
            }
            v8 = 0;
            *__error() = v51;
          }
        }
        -[SASampleStore setSampleOnlyMainThreads:](self->_sampleStore, "setSampleOnlyMainThreads:", v8);
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
        -[SPStackshotProvider startSamplingThread](self, "startSamplingThread");
        if (byte_1000E3CF8)
        {
          v93 = *__error();
          v94 = sub_10002ABEC();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            v108 = self->_samplingIntervalUs;
            v107 = self->_occasionalDataIntervalSec;
            v109 = -[SASampleStore sampleOnlyMainThreads](self->_sampleStore, "sampleOnlyMainThreads");
            v110 = "";
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v119 = v108;
            if (v109)
              v110 = ", sampling only main threads";
            *(_WORD *)&v119[4] = 1024;
            *(_DWORD *)&v119[6] = v107;
            v120 = 2080;
            v121[0] = v110;
            _os_log_debug_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "Started sampling with %uus-interval stackshots and %us-interval occasional data%s", buf, 0x18u);
          }
          *__error() = v93;
        }
        v23 = 1;
        if (!byte_1000E3CF9 || dword_1000E34A8 > 0)
          goto LABEL_201;
        v95 = *__error();
        v96 = self->_samplingIntervalUs;
        v97 = self->_occasionalDataIntervalSec;
        if (-[SASampleStore sampleOnlyMainThreads](self->_sampleStore, "sampleOnlyMainThreads"))
          v98 = ", sampling only main threads";
        else
          v98 = "";
        v99 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Started sampling with %uus-interval stackshots and %us-interval occasional data%s"), v96, v97, v98);
        v100 = v99;
        if (v99)
        {
          v101 = (char *)CFStringGetCStringPtr(v99, 0x8000100u);
          if (v101)
          {
            v102 = 0;
          }
          else
          {
            v101 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x3B5D1D96uLL);
            CFStringGetCString(v100, v101, 1024, 0x8000100u);
            v102 = v101;
          }
          if (qword_1000E3D00)
            v105 = (FILE *)qword_1000E3D00;
          else
            v105 = __stderrp;
          fprintf(v105, "%s\n", v101);
          if (v102)
            free(v102);
          CFRelease(v100);
        }
        else
        {
          v103 = sub_10002ABEC();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
          {
            v115 = self->_samplingIntervalUs;
            v114 = self->_occasionalDataIntervalSec;
            if (-[SASampleStore sampleOnlyMainThreads](self->_sampleStore, "sampleOnlyMainThreads"))
              v116 = ", sampling only main threads";
            else
              v116 = "";
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v119 = v115;
            *(_WORD *)&v119[4] = 1024;
            *(_DWORD *)&v119[6] = v114;
            v120 = 2080;
            v121[0] = v116;
            _os_log_fault_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_FAULT, "Unable to format: Started sampling with %uus-interval stackshots and %us-interval occasional data%s", buf, 0x18u);
          }
          if (qword_1000E3D00)
            v104 = (FILE *)qword_1000E3D00;
          else
            v104 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v104);
        }
        *__error() = v95;
        goto LABEL_200;
      }
      if (byte_1000E3CF8)
      {
        v24 = *__error();
        v25 = sub_10002ABEC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000914BC();
        *__error() = v24;
      }
      if (byte_1000E3CF9)
        v26 = dword_1000E34A8 <= 3;
      else
        v26 = 0;
      if (!v26)
      {
LABEL_29:
        v23 = 0;
LABEL_201:
        objc_sync_exit(self);
        return v23;
      }
      v42 = *__error();
      v43 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Caught a sampling provider that isn't sampling, but has already sampled"));
      v44 = v43;
      if (v43)
      {
        v45 = (char *)CFStringGetCStringPtr(v43, 0x8000100u);
        if (v45)
        {
          v46 = 0;
        }
        else
        {
          v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x16F449BAuLL);
          CFStringGetCString(v44, v45, 1024, 0x8000100u);
          v46 = v45;
        }
        if (qword_1000E3D00)
          v66 = (FILE *)qword_1000E3D00;
        else
          v66 = __stderrp;
        fprintf(v66, "%s\n", v45);
        if (v46)
          free(v46);
        goto LABEL_107;
      }
      v57 = sub_10002ABEC();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        sub_100091490();
      if (qword_1000E3D00)
        v58 = (FILE *)qword_1000E3D00;
      else
        v58 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v58);
LABEL_108:
    v23 = 0;
    *__error() = v42;
    goto LABEL_201;
  }
  return 0;
}

- (void)stopAndWaitForAllSamplingToComplete:(BOOL)a3 withCompletionCallbackOnQueue:(id)a4 withBlock:(id)a5
{
  id v9;
  uint64_t v10;
  int v11;
  NSObject *global_queue;
  _QWORD *v13;
  _QWORD v14[9];
  BOOL v15;
  _QWORD v16[5];
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E658;
  block[3] = &unk_1000D5600;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)+[SPStackshotProvider sharedInstanceLock](SPStackshotProvider, "sharedInstanceLock"), block);
  objc_sync_enter(self);
  if (self->_numClientsSampling)
  {
    v9 = +[SATimestamp timestamp](SATimestamp, "timestamp");
    v10 = *(_QWORD *)&self->_numSamples;
    v11 = self->_numClientsSampling - 1;
    self->_numClientsSampling = v11;
    if (!v11)
    {
      -[SPStackshotProvider stopSamplingThread](self, "stopSamplingThread");
      dispatch_group_leave((dispatch_group_t)self->_samplingGroup);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
      self->_sampleOnlyPidsHasUpdate = 1;

      self->_sampleOnlyPids = 0;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
    }
    global_queue = dispatch_get_global_queue(25, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006E9DC;
    v14[3] = &unk_1000D5C38;
    v14[4] = v9;
    v14[5] = self;
    v14[6] = a4;
    v14[7] = a5;
    v14[8] = v10;
    v15 = a3;
    v13 = v14;
    goto LABEL_8;
  }
  if (a4 && a5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006E9CC;
    v16[3] = &unk_1000D5B08;
    v16[4] = a5;
    v13 = v16;
    global_queue = a4;
LABEL_8:
    dispatch_async(global_queue, v13);
  }
  objc_sync_exit(self);
}

- (void)waitForSamplingToComplete
{
  dispatch_group_wait((dispatch_group_t)self->_samplingGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)performSampleStoreWork:(id)a3
{
  NSObject *storeReportingQueue;
  _QWORD v4[6];

  storeReportingQueue = self->_storeReportingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006EBB0;
  v4[3] = &unk_1000D5778;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(storeReportingQueue, v4);
}

- (void)gatherLoadInfoForPid:(int)a3
{
  NSObject *stackshotParsingQueue;
  _QWORD v4[5];
  int v5;

  stackshotParsingQueue = self->_stackshotParsingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006EC20;
  v4[3] = &unk_1000D5828;
  v4[4] = self;
  v5 = a3;
  dispatch_async(stackshotParsingQueue, v4);
}

- (int)numSamples
{
  return self->_numSamples;
}

- (int)numSamplesAvoidedDueToAudio
{
  return self->_numSamplesAvoidedDueToAudio;
}

@end
