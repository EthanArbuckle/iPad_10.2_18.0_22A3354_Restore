@implementation SPProcessEvent

- (void)takeTransaction
{
  unint64_t *p_transaction;
  void *v3;

  p_transaction = (unint64_t *)&self->_transaction;
  if (!self->_transaction)
  {
    v3 = (void *)sub_100030160("Process Event [%d]", self->_targetProcessId);
    while (!__ldxr(p_transaction))
    {
      if (!__stxr((unint64_t)v3, p_transaction))
        return;
    }
    __clrex();

  }
}

- (void)dropTransaction
{
  unint64_t *p_transaction;
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  unint64_t v5;

  transaction = self->_transaction;
  p_transaction = (unint64_t *)&self->_transaction;
  v3 = transaction;
  if (transaction)
  {
    while (1)
    {
      v5 = __ldxr(p_transaction);
      if ((OS_os_transaction *)v5 != v3)
        break;
      if (!__stxr(0, p_transaction))
      {

        return;
      }
    }
    __clrex();
  }
}

- (SPProcessEvent)init
{
  SPProcessEvent *v2;
  SPProcessEvent *v3;
  unsigned int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPProcessEvent;
  v2 = -[SPProcessEvent init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_useDsymForUUIDForEverything = 0;
    v2->_includeTextualFormatInReport = 1;
    v2->_headerOnly = 0;
    v2->_printOptions = (SASamplePrintOptions *)objc_alloc_init((Class)SASamplePrintOptions);
    v4 = byte_1000EBD4C;
    v3->_shouldSymbolicate = (byte_1000EBD4C & 8) != 0;
    v3->_shouldUseBulkSymbolication = ((v4 >> 4) & 1) == 0;
  }
  return v3;
}

- (void)dealloc
{
  int *p_targetProcessId;
  int v4;
  NSObject *v5;
  BOOL v6;
  int v7;
  _DWORD *v8;
  const __CFString *v9;
  const __CFString *v10;
  const char *CStringPtr;
  char *v12;
  char *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  BOOL v17;
  const __CFString *v18;
  const __CFString *v19;
  const char *v20;
  char *v21;
  char *v22;
  NSObject *v23;
  FILE *v24;
  const __CFString *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  FILE *v33;
  FILE *v34;
  NSObject *processingQueue;
  OS_dispatch_source *exitSource;
  OS_dispatch_source *timeoutSource;
  NSObject *completionCallbackQueue;
  id completionCallbackBlock;
  objc_super v40;

  p_targetProcessId = &self->_targetProcessId;
  if ((self->_targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBD38)
    {
      v4 = *__error();
      v5 = sub_100030318();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        sub_100092578(p_targetProcessId);
      *__error() = v4;
    }
    if (byte_1000EBD39)
      v6 = dword_1000EB4E8 <= 0;
    else
      v6 = 0;
    if (!v6)
      goto LABEL_50;
    v7 = *__error();
    v8 = sub_1000302B4(self->_targetProcessId);
    v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: dealloc with %p transaction"), v8, self->_targetProcessId, self->_transaction);
    if (v9)
    {
      v10 = v9;
      CStringPtr = CFStringGetCStringPtr(v9, 0x8000100u);
      if (CStringPtr)
      {
        v12 = (char *)CStringPtr;
        v13 = 0;
      }
      else
      {
        v12 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x94DCECFAuLL);
        CFStringGetCString(v10, v12, 1024, 0x8000100u);
        v13 = v12;
      }
      if (qword_1000EBD40)
        v24 = (FILE *)qword_1000EBD40;
      else
        v24 = __stderrp;
      fprintf(v24, "%s\n", v12);
      if (v13)
        free(v13);
      v25 = v10;
LABEL_48:
      CFRelease(v25);
LABEL_49:
      *__error() = v7;
      goto LABEL_50;
    }
    v23 = sub_100030318();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      sub_1000924F8(p_targetProcessId);
    goto LABEL_37;
  }
  if (byte_1000EBD38)
  {
    v14 = *__error();
    v15 = sub_100030318();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_100092660((uint64_t)self, v15, v16);
    *__error() = v14;
  }
  if (byte_1000EBD39)
    v17 = dword_1000EB4E8 <= 0;
  else
    v17 = 0;
  if (v17)
  {
    v7 = *__error();
    v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("dealloc with %p transaction"), self->_transaction);
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
        v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x94DCECFAuLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        v22 = v21;
      }
      if (qword_1000EBD40)
        v34 = (FILE *)qword_1000EBD40;
      else
        v34 = __stderrp;
      fprintf(v34, "%s\n", v21);
      if (v22)
        free(v22);
      v25 = v19;
      goto LABEL_48;
    }
    v26 = sub_100030318();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      sub_1000925F8((uint64_t)&self->_transaction, v26, v27, v28, v29, v30, v31, v32);
LABEL_37:
    if (qword_1000EBD40)
      v33 = (FILE *)qword_1000EBD40;
    else
      v33 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v33);
    goto LABEL_49;
  }
LABEL_50:
  -[SPProcessEvent dropTransaction](self, "dropTransaction");

  processingQueue = self->_processingQueue;
  if (processingQueue)
    dispatch_release(processingQueue);
  exitSource = self->_exitSource;
  if (exitSource)
    dispatch_release((dispatch_object_t)exitSource);
  timeoutSource = self->_timeoutSource;
  if (timeoutSource)
    dispatch_release((dispatch_object_t)timeoutSource);

  completionCallbackQueue = self->_completionCallbackQueue;
  if (completionCallbackQueue)
  {
    dispatch_release(completionCallbackQueue);
    self->_completionCallbackQueue = 0;
  }
  completionCallbackBlock = self->_completionCallbackBlock;
  if (completionCallbackBlock)
  {
    _Block_release(completionCallbackBlock);
    self->_completionCallbackBlock = 0;
  }

  v40.receiver = self;
  v40.super_class = (Class)SPProcessEvent;
  -[SPProcessEvent dealloc](&v40, "dealloc");
}

- (int)numSamples
{
  int numSamplesAtEnd;

  if (self->_isSampling)
    numSamplesAtEnd = -[SPStackshotProvider numSamples](self->_sampleProvider, "numSamples");
  else
    numSamplesAtEnd = self->_numSamplesAtEnd;
  return numSamplesAtEnd - self->_numSamplesAtStart;
}

- (int)numSamplesAvoidedDueToAudio
{
  int numSamplesAvoidedDueToAudioAtEnd;

  if (self->_isSampling)
    numSamplesAvoidedDueToAudioAtEnd = -[SPStackshotProvider numSamplesAvoidedDueToAudio](self->_sampleProvider, "numSamplesAvoidedDueToAudio");
  else
    numSamplesAvoidedDueToAudioAtEnd = self->_numSamplesAvoidedDueToAudioAtEnd;
  return numSamplesAvoidedDueToAudioAtEnd - self->_numSamplesAvoidedDueToAudioAtStart;
}

- (double)dataDuration
{
  SATimeRange *dataTimeRange;

  dataTimeRange = self->_dataTimeRange;
  if (dataTimeRange)
    return sub_1000612A4(-[SATimeRange startTime](dataTimeRange, "startTime"), -[SATimeRange endTime](self->_dataTimeRange, "endTime"));
  else
    return 0.0;
}

- (double)eventDuration
{
  SATimeRange *eventTimeRange;

  eventTimeRange = self->_eventTimeRange;
  if (eventTimeRange)
    return sub_1000612A4(-[SATimeRange startTime](eventTimeRange, "startTime"), -[SATimeRange endTime](self->_eventTimeRange, "endTime"));
  else
    return 0.0;
}

- (double)overlapDuration
{
  SATimeRange **p_eventTimeRange;
  SATimeRange *dataTimeRange;
  SATimeRange *eventTimeRange;
  SATimeRange **p_dataTimeRange;
  id v7;
  id *v8;

  p_eventTimeRange = &self->_eventTimeRange;
  dataTimeRange = self->_dataTimeRange;
  eventTimeRange = self->_eventTimeRange;
  if (dataTimeRange)
  {
    p_dataTimeRange = &self->_dataTimeRange;
    v7 = -[SATimeRange startTime](dataTimeRange, "startTime");
    if (eventTimeRange)
    {
      if (objc_msgSend(v7, "compare:", -[SATimeRange startTime](*p_eventTimeRange, "startTime")) == (id)-1)
        v8 = (id *)p_eventTimeRange;
      else
        v8 = (id *)p_dataTimeRange;
      v7 = objc_msgSend(*v8, "startTime");
      if (objc_msgSend(-[SATimeRange endTime](*p_dataTimeRange, "endTime"), "compare:", -[SATimeRange endTime](*p_eventTimeRange, "endTime")) != (id)1)p_eventTimeRange = p_dataTimeRange;
    }
    else
    {
      p_eventTimeRange = p_dataTimeRange;
    }
    return sub_1000612A4(v7, -[SATimeRange endTime](*p_eventTimeRange, "endTime"));
  }
  if (eventTimeRange)
  {
    v7 = -[SATimeRange startTime](self->_eventTimeRange, "startTime");
    return sub_1000612A4(v7, -[SATimeRange endTime](*p_eventTimeRange, "endTime"));
  }
  return 0.0;
}

- (void)filterToStartTimeIndex:(unint64_t)a3 endTimeIndex:(unint64_t)a4
{
  self->_startTimeIndex = a3;
  self->_endTimeIndex = a4;
}

- (void)filterToStartTime:(id)a3 endTime:(id)a4
{
  self->_reportTimeStart = (SATimestamp *)a3;
  self->_reportTimeEnd = (SATimestamp *)a4;
}

- (void)_setupSampleStore:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int targetProcessId;
  unsigned int *p_targetProcessId;
  int v11;
  NSObject *v12;
  _DWORD *v13;
  int v14;
  BOOL v15;
  int v16;
  _DWORD *v17;
  const __CFString *v18;
  const __CFString *v19;
  const char *v20;
  char *v21;
  char *v22;
  int v23;
  NSObject *v24;
  BOOL v25;
  const __CFString *v26;
  const char *v27;
  NSObject *v28;
  uint64_t v29;
  FILE *v30;
  uint64_t v31;
  FILE *v32;
  NSObject *v33;
  FILE *v34;
  FILE *v35;
  NSString *stepsNote;
  int numSamplesAvoidedDueToAudioAtStart;
  uint64_t v38;
  NSString *v39;
  id v40;
  NSMutableArray *findDsymsForIDs;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  NSString *v50;
  unsigned int v51;
  double v52;
  int v53;
  NSObject *v54;
  BOOL v55;
  int v56;
  _DWORD *v57;
  const __CFString *v58;
  NSObject *v59;
  FILE *v60;
  int v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  int v71;
  const __CFString *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  FILE *v81;
  const __CFString *v82;
  const char *v83;
  char *v84;
  char *v85;
  const __CFString *v86;
  const char *CStringPtr;
  char *v88;
  char *v89;
  FILE *v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  FILE *v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t v102[128];
  uint8_t buf[4];
  _DWORD *v104;
  __int16 v105;
  int v106;

  p_targetProcessId = (unsigned int *)&self->_targetProcessId;
  targetProcessId = self->_targetProcessId;
  if (!a3)
  {
    if (targetProcessId < 0)
    {
      if (byte_1000EBD38)
      {
        v61 = *__error();
        v62 = sub_100030318();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          sub_100092834(v62, v63, v64, v65, v66, v67, v68, v69);
        *__error() = v61;
      }
      if (byte_1000EBD39)
        v70 = dword_1000EB4E8 <= 3;
      else
        v70 = 0;
      if (v70)
      {
        v71 = *__error();
        v72 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: nil sampleStore"), "sampleStore");
        if (v72)
        {
          v86 = v72;
          CStringPtr = CFStringGetCStringPtr(v72, 0x8000100u);
          if (CStringPtr)
          {
            v88 = (char *)CStringPtr;
            v89 = 0;
          }
          else
          {
            v88 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x26185D76uLL);
            CFStringGetCString(v86, v88, 1024, 0x8000100u);
            v89 = v88;
          }
          if (qword_1000EBD40)
            v96 = (FILE *)qword_1000EBD40;
          else
            v96 = __stderrp;
          fprintf(v96, "%s\n", v88);
          if (v89)
            free(v89);
          CFRelease(v86);
        }
        else
        {
          v73 = sub_100030318();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
            sub_1000927C4(v73, v74, v75, v76, v77, v78, v79, v80);
          if (qword_1000EBD40)
            v81 = (FILE *)qword_1000EBD40;
          else
            v81 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v81);
        }
        *__error() = v71;
      }
      sub_1000301F0("-[SPProcessEvent _setupSampleStore:]", "SPProcessEvent.m", 267, "%s: nil sampleStore", v3, v4, v5, v6, (char)"sampleStore");
    }
    else
    {
      if (byte_1000EBD38)
      {
        v53 = *__error();
        v54 = sub_100030318();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          sub_100092748();
        *__error() = v53;
      }
      if (byte_1000EBD39)
        v55 = dword_1000EB4E8 <= 3;
      else
        v55 = 0;
      if (v55)
      {
        v56 = *__error();
        v57 = sub_1000302B4(*p_targetProcessId);
        v58 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: %s: nil sampleStore"), v57, *p_targetProcessId, "sampleStore");
        if (v58)
        {
          v82 = v58;
          v83 = CFStringGetCStringPtr(v58, 0x8000100u);
          if (v83)
          {
            v84 = (char *)v83;
            v85 = 0;
          }
          else
          {
            v84 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x26185D76uLL);
            CFStringGetCString(v82, v84, 1024, 0x8000100u);
            v85 = v84;
          }
          if (qword_1000EBD40)
            v90 = (FILE *)qword_1000EBD40;
          else
            v90 = __stderrp;
          fprintf(v90, "%s\n", v84);
          if (v85)
            free(v85);
          CFRelease(v82);
        }
        else
        {
          v59 = sub_100030318();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
            sub_1000926CC();
          if (qword_1000EBD40)
            v60 = (FILE *)qword_1000EBD40;
          else
            v60 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v60);
        }
        *__error() = v56;
      }
      v91 = sub_1000302B4(*p_targetProcessId);
      sub_1000301F0("-[SPProcessEvent _setupSampleStore:]", "SPProcessEvent.m", 267, "%s [%d]: %s: nil sampleStore", v92, v93, v94, v95, v91);
    }
    abort();
  }
  if ((targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBD38)
    {
      v11 = *__error();
      v12 = sub_100030318();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = sub_1000302B4(*p_targetProcessId);
        v14 = *p_targetProcessId;
        *(_DWORD *)buf = 136446466;
        v104 = v13;
        v105 = 1024;
        v106 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}s [%d]: Generating report", buf, 0x12u);
      }
      *__error() = v11;
    }
    if (byte_1000EBD39)
      v15 = dword_1000EB4E8 <= 1;
    else
      v15 = 0;
    if (!v15)
      goto LABEL_48;
    v16 = *__error();
    v17 = sub_1000302B4(*p_targetProcessId);
    v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Generating report"), v17, *p_targetProcessId);
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
        v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x166466F8uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        v22 = v21;
      }
      v31 = qword_1000EBD40;
      v32 = __stderrp;
LABEL_41:
      if (v31)
        v35 = (FILE *)v31;
      else
        v35 = v32;
      fprintf(v35, "%s\n", v21);
      if (v22)
        free(v22);
      CFRelease(v19);
      goto LABEL_47;
    }
    v28 = sub_100030318();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      sub_1000928A4();
    v29 = qword_1000EBD40;
    v30 = __stderrp;
    goto LABEL_35;
  }
  if (byte_1000EBD38)
  {
    v23 = *__error();
    v24 = sub_100030318();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Generating report", buf, 2u);
    }
    *__error() = v23;
  }
  if (byte_1000EBD39)
    v25 = dword_1000EB4E8 <= 1;
  else
    v25 = 0;
  if (v25)
  {
    v16 = *__error();
    v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Generating report"));
    if (v26)
    {
      v19 = v26;
      v27 = CFStringGetCStringPtr(v26, 0x8000100u);
      if (v27)
      {
        v21 = (char *)v27;
        v22 = 0;
      }
      else
      {
        v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x166466F8uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        v22 = v21;
      }
      v31 = qword_1000EBD40;
      v32 = __stderrp;
      goto LABEL_41;
    }
    v33 = sub_100030318();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      sub_100092910();
    v29 = qword_1000EBD40;
    v30 = __stderrp;
LABEL_35:
    if (v29)
      v34 = (FILE *)v29;
    else
      v34 = v30;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
LABEL_47:
    *__error() = v16;
  }
LABEL_48:
  if (self->_reason)
    objc_msgSend(a3, "setReason:");
  sub_10005993C(a3, self->_shouldSymbolicate, self->_useDsymForUUIDForEverything, self->_shouldUseBulkSymbolication);
  stepsNote = self->_stepsNote;
  numSamplesAvoidedDueToAudioAtStart = self->_numSamplesAvoidedDueToAudioAtStart;
  v38 = (self->_numSamplesAvoidedDueToAudioAtEnd - numSamplesAvoidedDueToAudioAtStart);
  if ((int)v38 >= 1)
  {
    if (stepsNote)
      v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %d samples avoided due to audio"), self->_stepsNote, v38);
    else
      v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d samples avoided due to audio"), (self->_numSamplesAvoidedDueToAudioAtEnd - numSamplesAvoidedDueToAudioAtStart), v97);
    stepsNote = v39;
  }
  objc_msgSend(a3, "setTargetThreadId:", 0);
  if ((*p_targetProcessId & 0x80000000) == 0)
    objc_msgSend(a3, "setTargetProcessId:");
  if (self->_targetThreadId)
    objc_msgSend(a3, "setTargetThreadId:");
  if (self->_targetProcessAbsolutePath)
  {
    if ((objc_msgSend(objc_msgSend(objc_msgSend(a3, "targetProcess"), "mainBinaryPath"), "isAbsolutePath") & 1) == 0)
    {
      v40 = objc_msgSend(a3, "targetProcess");
      if (v40)
        objc_msgSend(v40, "setMainBinaryPath:", self->_targetProcessAbsolutePath);
    }
  }
  objc_msgSend(a3, "setTargetHIDEventMachAbs:", self->_targetHIDEventMachAbs);
  objc_msgSend(a3, "setTargetHIDEventEndMachAbs:", self->_targetHIDEventEndMachAbs);
  if (self->_isLiveSampling)
    objc_msgSend(a3, "setShouldGatherKextStat:", !self->_headerOnly);
  if (self->_dsymPaths)
    +[SABinary addDsymPaths:](SABinary, "addDsymPaths:");
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  findDsymsForIDs = self->_findDsymsForIDs;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](findDsymsForIDs, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(_QWORD *)v99 != v44)
          objc_enumerationMutation(findDsymsForIDs);
        objc_msgSend(a3, "useDsymForUUIDFor:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i));
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](findDsymsForIDs, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
    }
    while (v43);
  }
  objc_msgSend(a3, "postprocess");

  self->_targetProcessBundleName = (NSString *)objc_msgSend(objc_msgSend(a3, "targetProcess"), "bundleName");
  self->_targetProcessBundleId = (NSString *)objc_msgSend(objc_msgSend(a3, "targetProcess"), "bundleIdentifier");
  v46 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "targetProcess"), "bundleShortVersion");
  v47 = CFSTR("???");
  if (v46)
    v48 = v46;
  else
    v48 = CFSTR("???");
  v49 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "targetProcess"), "bundleVersion");
  if (v49)
    v47 = v49;

  self->_targetProcessVersion = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@ (%@)"), v48, v47);
  self->_targetProcessAdamId = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%llu"), objc_msgSend(objc_msgSend(a3, "targetProcess"), "adamID"));

  self->_targetProcessName = (NSString *)objc_msgSend(objc_msgSend(a3, "targetProcess"), "name");
  self->_targetProcessMainBinaryUUID = (NSUUID *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "targetProcess"), "mainBinary"), "uuid");

  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "targetProcess"), "mainBinaryPath"), "isAbsolutePath"))
    v50 = (NSString *)objc_msgSend(objc_msgSend(a3, "targetProcess"), "mainBinaryPath");
  else
    v50 = 0;
  self->_targetProcessAbsolutePath = v50;
  v51 = objc_msgSend(objc_msgSend(a3, "targetProcess"), "isUnresponsive");
  v52 = 0.0;
  if (v51)
    objc_msgSend(objc_msgSend(a3, "targetProcess", 0.0), "timeOfLastResponse");
  self->_targetProcessTimeOfLastResponse = v52;

  self->_hardwareModel = (NSString *)objc_msgSend(a3, "hardwareModel");
  objc_msgSend(a3, "setEvent:", self->_event);
  objc_msgSend(a3, "setEventNote:", self->_eventNote);
  objc_msgSend(a3, "setEventTimeRange:", self->_eventTimeRange);
  objc_msgSend(a3, "setSignature:", self->_signature);
  objc_msgSend(a3, "setExtraDuration:", self->_extraDuration);
  objc_msgSend(a3, "setDurationNote:", self->_durationNote);
  objc_msgSend(a3, "setStepsNote:", stepsNote);
  objc_msgSend(a3, "setSanitizePaths:", self->_sanitizePaths);
  objc_msgSend(a3, "setCustomOutput:", self->_customOutput);
}

- (id)_samplePrinterForSampleStore:(id)a3
{
  id v5;
  void *v6;
  int v7;
  int *p_targetProcessId;
  int targetProcessId;
  int v10;
  NSObject *v11;
  BOOL v12;
  int v13;
  _DWORD *v14;
  const __CFString *v15;
  const __CFString *v16;
  const char *v17;
  char *v18;
  char *v19;
  int v21;
  NSObject *v22;
  BOOL v23;
  const __CFString *v24;
  const __CFString *v25;
  const char *CStringPtr;
  char *v27;
  char *v28;
  NSObject *v29;
  FILE *v30;
  const __CFString *v31;
  NSObject *v32;
  FILE *v33;
  FILE *v34;

  -[SPProcessEvent _setupSampleStore:](self, "_setupSampleStore:");
  v5 = objc_msgSend(objc_alloc((Class)SASamplePrinter), "initWithSampleStore:", a3);
  if (!v5)
  {
    targetProcessId = self->_targetProcessId;
    p_targetProcessId = &self->_targetProcessId;
    if (targetProcessId < 0)
    {
      if (byte_1000EBD38)
      {
        v21 = *__error();
        v22 = sub_100030318();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_100092A40();
        *__error() = v21;
      }
      if (byte_1000EBD39)
        v23 = dword_1000EB4E8 <= 3;
      else
        v23 = 0;
      if (!v23)
        return 0;
      v13 = *__error();
      v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Unable to create sample printer"));
      if (v24)
      {
        v25 = v24;
        CStringPtr = CFStringGetCStringPtr(v24, 0x8000100u);
        if (CStringPtr)
        {
          v27 = (char *)CStringPtr;
          v28 = 0;
        }
        else
        {
          v27 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xAD597AAEuLL);
          CFStringGetCString(v25, v27, 1024, 0x8000100u);
          v28 = v27;
        }
        if (qword_1000EBD40)
          v34 = (FILE *)qword_1000EBD40;
        else
          v34 = __stderrp;
        fprintf(v34, "%s\n", v27);
        if (v28)
          free(v28);
        v31 = v25;
        goto LABEL_63;
      }
      v32 = sub_100030318();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        sub_100092A14();
    }
    else
    {
      if (byte_1000EBD38)
      {
        v10 = *__error();
        v11 = sub_100030318();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1000929A8();
        *__error() = v10;
      }
      if (byte_1000EBD39)
        v12 = dword_1000EB4E8 <= 3;
      else
        v12 = 0;
      if (!v12)
        return 0;
      v13 = *__error();
      v14 = sub_1000302B4(*p_targetProcessId);
      v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Unable to create sample printer"), v14, *p_targetProcessId);
      if (v15)
      {
        v16 = v15;
        v17 = CFStringGetCStringPtr(v15, 0x8000100u);
        if (v17)
        {
          v18 = (char *)v17;
          v19 = 0;
        }
        else
        {
          v18 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xAD597AAEuLL);
          CFStringGetCString(v16, v18, 1024, 0x8000100u);
          v19 = v18;
        }
        if (qword_1000EBD40)
          v30 = (FILE *)qword_1000EBD40;
        else
          v30 = __stderrp;
        fprintf(v30, "%s\n", v18);
        if (v19)
          free(v19);
        v31 = v16;
LABEL_63:
        CFRelease(v31);
LABEL_64:
        *__error() = v13;
        return 0;
      }
      v29 = sub_100030318();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        sub_10009293C();
    }
    if (qword_1000EBD40)
      v33 = (FILE *)qword_1000EBD40;
    else
      v33 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v33);
    goto LABEL_64;
  }
  v6 = v5;
  objc_msgSend(v5, "setOptions:", self->_printOptions);
  if (self->_includeBinaryFormatInReport)
    goto LABEL_3;
  if (self->_headerOnly)
    goto LABEL_19;
  if (!-[SASamplePrintOptions printHeavyStacks](self->_printOptions, "printHeavyStacks"))
  {
LABEL_3:
    v7 = 1;
  }
  else
  {
    if (self->_headerOnly)
      goto LABEL_19;
    v7 = 0;
  }
  objc_msgSend(v6, "setHeaderNote:", sub_10004ED04((int)-[SASamplePrintOptions printHeavyStacks](self->_printOptions, "printHeavyStacks"), v7));
LABEL_19:
  objc_msgSend(objc_msgSend(v6, "options"), "setPrintTargetThreadOnly:", self->_headerOnly);
  objc_msgSend(v6, "setShareWithAppDevs:", AppAnalyticsEnabled(objc_msgSend(objc_msgSend(v6, "options"), "setDisplayFooter:", !self->_headerOnly)));
  if (*(_OWORD *)&self->_startTimeIndex == 0)
  {
    if (*(_OWORD *)&self->_reportTimeStart != 0)
      objc_msgSend(v6, "filterToTimestampRangeStart:end:");
  }
  else
  {
    objc_msgSend(v6, "filterToDisplayTimeIndexStart:end:");
  }
  objc_msgSend(objc_msgSend(v6, "options"), "setForceOneBasedTimeIndexes:", self->_forceOneBasedTimeIndexes);
  if (self->_incidentUUID)
    objc_msgSend(v6, "setIncidentUUID:");
  return v6;
}

- (void)_saveReportToStream:(__sFILE *)a3 withSampleStore:(id)a4
{
  void *v7;
  const char *v8;
  size_t v9;
  int *p_targetProcessId;
  int v11;
  NSObject *v12;
  int v13;
  _DWORD *v14;
  const __CFString *v15;
  const __CFString *v16;
  const char *v17;
  char *v18;
  char *v19;
  int v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *CStringPtr;
  char *v25;
  char *v26;
  NSObject *v27;
  FILE *v28;
  const __CFString *v29;
  NSObject *v30;
  FILE *v31;
  FILE *v32;
  int *v33;
  int targetProcessId;
  int v35;
  NSObject *v36;
  _DWORD *v37;
  int v38;
  BOOL v39;
  int v40;
  _DWORD *v41;
  const __CFString *v42;
  const __CFString *v43;
  const char *v44;
  char *v45;
  char *v46;
  int v47;
  NSObject *v48;
  BOOL v49;
  const __CFString *v50;
  const __CFString *v51;
  const char *v52;
  char *v53;
  char *v54;
  NSObject *v55;
  FILE *v56;
  const __CFString *v57;
  NSObject *v58;
  FILE *v59;
  FILE *v60;
  uint8_t buf[4];
  _DWORD *v62;
  __int16 v63;
  int v64;

  v7 = objc_autoreleasePoolPush();
  -[SPProcessEvent _setupSampleStore:](self, "_setupSampleStore:", a4);
  if (self->_includeTextualFormatInReport)
    objc_msgSend(-[SPProcessEvent _samplePrinterForSampleStore:](self, "_samplePrinterForSampleStore:", a4), "printToStream:", a3);
  if (self->_includeBinaryFormatInReport)
  {
    if (self->_includeTextualFormatInReport)
    {
      v8 = "\n\n";
      v9 = 2;
    }
    else
    {
      v8 = "Use spindump -i to generate textual report\n";
      v9 = 43;
    }
    fwrite(v8, v9, 1uLL, a3);
    if ((objc_msgSend(a4, "saveBinaryFormatToStream:", a3) & 1) == 0)
    {
      p_targetProcessId = &self->_targetProcessId;
      if (self->_targetProcessId < 0)
      {
        if (byte_1000EBD38)
        {
          v20 = *__error();
          v21 = sub_100030318();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_100092C08();
          *__error() = v20;
        }
        if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
        {
          v13 = *__error();
          v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Unable to save spindump binary format"));
          if (v22)
          {
            v23 = v22;
            CStringPtr = CFStringGetCStringPtr(v22, 0x8000100u);
            if (CStringPtr)
            {
              v25 = (char *)CStringPtr;
              v26 = 0;
            }
            else
            {
              v25 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC90302E6uLL);
              CFStringGetCString(v23, v25, 1024, 0x8000100u);
              v26 = v25;
            }
            if (qword_1000EBD40)
              v32 = (FILE *)qword_1000EBD40;
            else
              v32 = __stderrp;
            fprintf(v32, "%s\n", v25);
            if (v26)
              free(v26);
            v29 = v23;
            goto LABEL_49;
          }
          v30 = sub_100030318();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            sub_100092BDC();
LABEL_38:
          if (qword_1000EBD40)
            v31 = (FILE *)qword_1000EBD40;
          else
            v31 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v31);
          goto LABEL_50;
        }
      }
      else
      {
        if (byte_1000EBD38)
        {
          v11 = *__error();
          v12 = sub_100030318();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            sub_100092B70();
          *__error() = v11;
        }
        if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
        {
          v13 = *__error();
          v14 = sub_1000302B4(*p_targetProcessId);
          v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Unable to save spindump binary format"), v14, *p_targetProcessId);
          if (v15)
          {
            v16 = v15;
            v17 = CFStringGetCStringPtr(v15, 0x8000100u);
            if (v17)
            {
              v18 = (char *)v17;
              v19 = 0;
            }
            else
            {
              v18 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC90302E6uLL);
              CFStringGetCString(v16, v18, 1024, 0x8000100u);
              v19 = v18;
            }
            if (qword_1000EBD40)
              v28 = (FILE *)qword_1000EBD40;
            else
              v28 = __stderrp;
            fprintf(v28, "%s\n", v18);
            if (v19)
              free(v19);
            v29 = v16;
LABEL_49:
            CFRelease(v29);
LABEL_50:
            *__error() = v13;
            goto LABEL_51;
          }
          v27 = sub_100030318();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            sub_100092B04();
          goto LABEL_38;
        }
      }
    }
  }
LABEL_51:
  +[SABinary clearCoreSymbolicationCaches](SABinary, "clearCoreSymbolicationCaches");
  targetProcessId = self->_targetProcessId;
  v33 = &self->_targetProcessId;
  if ((targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBD38)
    {
      v35 = *__error();
      v36 = sub_100030318();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = sub_1000302B4(*v33);
        v38 = *v33;
        *(_DWORD *)buf = 136446466;
        v62 = v37;
        v63 = 1024;
        v64 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}s [%d]: Done generating report", buf, 0x12u);
      }
      *__error() = v35;
    }
    if (byte_1000EBD39)
      v39 = dword_1000EB4E8 <= 1;
    else
      v39 = 0;
    if (!v39)
      goto LABEL_100;
    v40 = *__error();
    v41 = sub_1000302B4(*v33);
    v42 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s [%d]: Done generating report"), v41, *v33);
    if (v42)
    {
      v43 = v42;
      v44 = CFStringGetCStringPtr(v42, 0x8000100u);
      if (v44)
      {
        v45 = (char *)v44;
        v46 = 0;
      }
      else
      {
        v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x4FAF13AuLL);
        CFStringGetCString(v43, v45, 1024, 0x8000100u);
        v46 = v45;
      }
      if (qword_1000EBD40)
        v56 = (FILE *)qword_1000EBD40;
      else
        v56 = __stderrp;
      fprintf(v56, "%s\n", v45);
      if (v46)
        free(v46);
      v57 = v43;
LABEL_98:
      CFRelease(v57);
LABEL_99:
      *__error() = v40;
      goto LABEL_100;
    }
    v55 = sub_100030318();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      sub_100092A6C();
    goto LABEL_87;
  }
  if (byte_1000EBD38)
  {
    v47 = *__error();
    v48 = sub_100030318();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Done generating report", buf, 2u);
    }
    *__error() = v47;
  }
  if (byte_1000EBD39)
    v49 = dword_1000EB4E8 <= 1;
  else
    v49 = 0;
  if (v49)
  {
    v40 = *__error();
    v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Done generating report"));
    if (v50)
    {
      v51 = v50;
      v52 = CFStringGetCStringPtr(v50, 0x8000100u);
      if (v52)
      {
        v53 = (char *)v52;
        v54 = 0;
      }
      else
      {
        v53 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x4FAF13AuLL);
        CFStringGetCString(v51, v53, 1024, 0x8000100u);
        v54 = v53;
      }
      if (qword_1000EBD40)
        v60 = (FILE *)qword_1000EBD40;
      else
        v60 = __stderrp;
      fprintf(v60, "%s\n", v53);
      if (v54)
        free(v54);
      v57 = v51;
      goto LABEL_98;
    }
    v58 = sub_100030318();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
      sub_100092AD8();
LABEL_87:
    if (qword_1000EBD40)
      v59 = (FILE *)qword_1000EBD40;
    else
      v59 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v59);
    goto LABEL_99;
  }
LABEL_100:
  objc_autoreleasePoolPop(v7);
}

- (void)_saveReportToStream:(__sFILE *)a3
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("_saveReportToStream needs to be subclassed"), 0, 0));
}

- (void)saveReportToStream:(__sFILE *)a3
{
  -[SPProcessEvent _saveReportToStream:](self, "_saveReportToStream:", a3);
  -[SPProcessEvent dropTransaction](self, "dropTransaction");
}

- (void)performSamplePrinterWork:(id)a3
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  -[SPProcessEvent _performSamplePrinterWork:](self, "_performSamplePrinterWork:", a3);
  -[SPProcessEvent dropTransaction](self, "dropTransaction");
  objc_autoreleasePoolPop(v5);
}

- (void)_performSamplePrinterWork:(id)a3
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("_performSamplePrinterWork needs to be subclassed"), 0, 0));
}

- (BOOL)targetProcessIsThirdParty
{
  NSString *targetProcessBundleId;
  uint64_t v5;
  unsigned __int8 v6;
  BOOL v7;

  targetProcessBundleId = self->_targetProcessBundleId;
  if (targetProcessBundleId && -[NSString hasPrefix:](targetProcessBundleId, "hasPrefix:", CFSTR("com.apple.")))
    return 0;
  if (!self->_targetProcessAbsolutePath)
    return 1;
  v5 = 0;
  do
  {
    v6 = -[NSString hasPrefix:](self->_targetProcessAbsolutePath, "hasPrefix:", *(__CFString **)((char *)&off_1000DD8B8 + v5));
    if ((v6 & 1) != 0)
      break;
    v7 = v5 == 40;
    v5 += 8;
  }
  while (!v7);
  return v6 ^ 1;
}

- (int)targetProcessId
{
  return self->_targetProcessId;
}

- (NSString)targetProcessName
{
  return self->_targetProcessName;
}

- (NSUUID)targetProcessMainBinaryUUID
{
  return self->_targetProcessMainBinaryUUID;
}

- (NSString)targetProcessBundleName
{
  return self->_targetProcessBundleName;
}

- (NSString)targetProcessBundleId
{
  return self->_targetProcessBundleId;
}

- (NSString)targetProcessVersion
{
  return self->_targetProcessVersion;
}

- (NSString)targetProcessAbsolutePath
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTargetProcessAbsolutePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSString)targetProcessAdamId
{
  return self->_targetProcessAdamId;
}

- (unint64_t)targetThreadId
{
  return self->_targetThreadId;
}

- (void)setTargetThreadId:(unint64_t)a3
{
  self->_targetThreadId = a3;
}

- (unint64_t)targetHIDEventMachAbs
{
  return self->_targetHIDEventMachAbs;
}

- (void)setTargetHIDEventMachAbs:(unint64_t)a3
{
  self->_targetHIDEventMachAbs = a3;
}

- (unint64_t)targetHIDEventEndMachAbs
{
  return self->_targetHIDEventEndMachAbs;
}

- (void)setTargetHIDEventEndMachAbs:(unint64_t)a3
{
  self->_targetHIDEventEndMachAbs = a3;
}

- (double)targetProcessTimeOfLastResponse
{
  return self->_targetProcessTimeOfLastResponse;
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (BOOL)isWSBased
{
  return self->_isWSBased;
}

- (BOOL)isUrgent
{
  return self->_isUrgent;
}

- (void)setIsUrgent:(BOOL)a3
{
  self->_isUrgent = a3;
}

- (BOOL)useDsymForUUIDForEverything
{
  return self->_useDsymForUUIDForEverything;
}

- (void)setUseDsymForUUIDForEverything:(BOOL)a3
{
  self->_useDsymForUUIDForEverything = a3;
}

- (NSArray)dsymPaths
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDsymPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSArray)findDsymsForIDs
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFindDsymsForIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)includeBinaryFormatInReport
{
  return self->_includeBinaryFormatInReport;
}

- (void)setIncludeBinaryFormatInReport:(BOOL)a3
{
  self->_includeBinaryFormatInReport = a3;
}

- (BOOL)shouldSymbolicate
{
  return self->_shouldSymbolicate;
}

- (void)setShouldSymbolicate:(BOOL)a3
{
  self->_shouldSymbolicate = a3;
}

- (BOOL)shouldUseBulkSymbolication
{
  return self->_shouldUseBulkSymbolication;
}

- (void)setShouldUseBulkSymbolication:(BOOL)a3
{
  self->_shouldUseBulkSymbolication = a3;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (int)numSamplesSuspended
{
  return self->_numSamplesSuspended;
}

- (BOOL)forceOneBasedTimeIndexes
{
  return self->_forceOneBasedTimeIndexes;
}

- (void)setForceOneBasedTimeIndexes:(BOOL)a3
{
  self->_forceOneBasedTimeIndexes = a3;
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSString)eventNote
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setEventNote:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (double)extraDuration
{
  return self->_extraDuration;
}

- (void)setExtraDuration:(double)a3
{
  self->_extraDuration = a3;
}

- (NSString)durationNote
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDurationNote:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSString)stepsNote
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setStepsNote:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (BOOL)sanitizePaths
{
  return self->_sanitizePaths;
}

- (void)setSanitizePaths:(BOOL)a3
{
  self->_sanitizePaths = a3;
}

- (BOOL)omitThirdPartyProcessStacks
{
  return self->_omitThirdPartyProcessStacks;
}

- (void)setOmitThirdPartyProcessStacks:(BOOL)a3
{
  self->_omitThirdPartyProcessStacks = a3;
}

- (BOOL)omitSensitiveStrings
{
  return self->_omitSensitiveStrings;
}

- (void)setOmitSensitiveStrings:(BOOL)a3
{
  self->_omitSensitiveStrings = a3;
}

- (BOOL)includeTextualFormatInReport
{
  return self->_includeTextualFormatInReport;
}

- (void)setIncludeTextualFormatInReport:(BOOL)a3
{
  self->_includeTextualFormatInReport = a3;
}

- (BOOL)headerOnly
{
  return self->_headerOnly;
}

- (void)setHeaderOnly:(BOOL)a3
{
  self->_headerOnly = a3;
}

- (NSString)customOutput
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setCustomOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSUUID)incidentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 336, 1);
}

- (void)setIncidentUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (SATimeRange)eventTimeRange
{
  return (SATimeRange *)objc_getProperty(self, a2, 344, 1);
}

- (void)setEventTimeRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (SATimeRange)dataTimeRange
{
  return (SATimeRange *)objc_getProperty(self, a2, 352, 1);
}

- (void)setDataTimeRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (SATimestamp)reportTimeStart
{
  return (SATimestamp *)objc_getProperty(self, a2, 360, 1);
}

- (void)setReportTimeStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (SATimestamp)reportTimeEnd
{
  return (SATimestamp *)objc_getProperty(self, a2, 368, 1);
}

- (void)setReportTimeEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (SASamplePrintOptions)printOptions
{
  return (SASamplePrintOptions *)objc_getProperty(self, a2, 312, 1);
}

- (void)setPrintOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

@end
