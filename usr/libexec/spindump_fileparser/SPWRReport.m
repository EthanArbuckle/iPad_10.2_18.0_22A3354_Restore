@implementation SPWRReport

- (SPWRReport)initWithReportReason:(id)a3 reportedSignpostTracker:(id)a4 task:(id)a5 timeRange:(id)a6 thread:(id)a7 dispatchQueue:(id)a8
{
  SPWRReport *v14;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  int v26;
  const __CFString *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  FILE *v36;
  const char *CStringPtr;
  char *v38;
  char *v39;
  FILE *v40;
  const __CFString *theString;

  if (!((unint64_t)a7 | (unint64_t)a8))
  {
    if (byte_1000EBD38)
    {
      v16 = *__error();
      v17 = sub_100030318();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100083260(v17, v18, v19, v20, v21, v22, v23, v24);
      *__error() = v16;
    }
    if (byte_1000EBD39)
      v25 = dword_1000EB4E8 <= 3;
    else
      v25 = 0;
    if (v25)
    {
      v26 = *__error();
      v27 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: No thread nor dispatch queue"), "thread || dispatchQueue");
      if (v27)
      {
        theString = v27;
        CStringPtr = CFStringGetCStringPtr(v27, 0x8000100u);
        if (CStringPtr)
        {
          v38 = (char *)CStringPtr;
          v39 = 0;
        }
        else
        {
          v38 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD11332AEuLL);
          CFStringGetCString(theString, v38, 1024, 0x8000100u);
          v39 = v38;
        }
        if (qword_1000EBD40)
          v40 = (FILE *)qword_1000EBD40;
        else
          v40 = __stderrp;
        fprintf(v40, "%s\n", v38);
        if (v39)
          free(v39);
        CFRelease(theString);
      }
      else
      {
        v28 = sub_100030318();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          sub_1000831F0(v28, v29, v30, v31, v32, v33, v34, v35);
        if (qword_1000EBD40)
          v36 = (FILE *)qword_1000EBD40;
        else
          v36 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v36);
      }
      *__error() = v26;
    }
    sub_1000301F0("-[SPWRReport initWithReportReason:reportedSignpostTracker:task:timeRange:thread:dispatchQueue:]", "monitor-WorkflowResponsiveness.m", 95, "%s: No thread nor dispatch queue", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (char)"thread || dispatchQueue");
    abort();
  }
  v14 = -[SPWRReport init](self, "init");
  if (v14)
  {
    v14->_reportReason = (SPWRReportReason *)a3;
    v14->_reportedSignpostTracker = (WRSignpostTracker *)a4;
    v14->_task = (SATask *)a5;
    v14->_timeRange = (SATimeRange *)a6;
    v14->_thread = (SAThread *)a7;
    v14->_dispatchQueue = (SADispatchQueue *)a8;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPWRReport;
  -[SPWRReport dealloc](&v3, "dealloc");
}

- (SPWRReportReason)reportReason
{
  return self->_reportReason;
}

- (WRSignpostTracker)reportedSignpostTracker
{
  return self->_reportedSignpostTracker;
}

- (SATimeRange)timeRange
{
  return self->_timeRange;
}

- (SATask)task
{
  return self->_task;
}

- (SAThread)thread
{
  return self->_thread;
}

- (SADispatchQueue)dispatchQueue
{
  return self->_dispatchQueue;
}

@end
