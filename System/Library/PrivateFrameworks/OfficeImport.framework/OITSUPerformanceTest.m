@implementation OITSUPerformanceTest

- (OITSUPerformanceTest)initWithName:(id)a3 selector:(SEL)a4 target:(id)a5 goalTime:(double)a6
{
  char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OITSUPerformanceTest;
  v10 = -[OITSUPerformanceTest init](&v12, sel_init);
  if (v10)
  {
    *((_QWORD *)v10 + 1) = objc_msgSend(a3, "copy");
    *((_QWORD *)v10 + 2) = a4;
    *((_QWORD *)v10 + 3) = a5;
    *(_OWORD *)(v10 + 56) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 120) = 0u;
    *((double *)v10 + 4) = a6;
    v10[48] = 0;
    v10[136] = 0;
    *((_QWORD *)v10 + 5) = 0x3FA999999999999ALL;
  }
  return (OITSUPerformanceTest *)v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUPerformanceTest;
  -[OITSUPerformanceTest dealloc](&v3, sel_dealloc);
}

- (void)run
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  IMP MethodImplementation;
  uint64_t v7;
  timeval *p_last_time;
  uint64_t v9;
  __darwin_suseconds_t tv_usec;
  __darwin_time_t v11;
  int v12;
  uint64_t tv_sec;
  __darwin_suseconds_t v14;
  unint64_t v15;
  timeval *p_min_time;
  BOOL v17;
  timeval *p_max_time;
  __darwin_time_t v19;
  BOOL v20;
  void *v21;
  unint64_t count;
  double v23;
  __darwin_suseconds_t v24;
  long double v25;
  timeval v26;

  if (!self->mQuiet)
    NSLog((NSString *)CFSTR("test '%@' starting..."), a2, self->mName);
  v3 = (void *)objc_msgSend(self->mTarget, "methodSignatureForSelector:", self->mSelector);
  if (!v3)
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUPerformanceTest run]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUPerformanceTest.m"), 61, 0, "Can't get signature for test selector '%@'!", NSStringFromSelector(self->mSelector));
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (objc_msgSend(v3, "numberOfArguments") != 2)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v3);
    objc_msgSend(v21, "setTarget:", self->mTarget);
    objc_msgSend(v21, "setSelector:", self->mSelector);
    v26.tv_sec = (__darwin_time_t)&self->mTiming;
    objc_msgSend(v21, "setArgument:atIndex:", &v26, 2);
    objc_msgSend(v21, "invoke");
    count = self->mTiming.count;
    tv_sec = self->mTiming.total_time.tv_sec;
    goto LABEL_29;
  }
  v5 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v5, self->mSelector);
  if (self->mTiming.running)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void TSUOpstatStart(TSUOpstat *)");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUOpstat.h"), 48, 0, "Opstat is already running!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  p_last_time = &self->mTiming.last_time;
  gettimeofday(&self->mTiming.last_time, 0);
  self->mTiming.running = 1;
  ((void (*)(id, SEL))MethodImplementation)(self->mTarget, self->mSelector);
  if (!self->mTiming.running)
  {
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void TSUOpstatStop(TSUOpstat *)");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUOpstat.h"), 69, 0, "Opstat is already stopped!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v26.tv_sec = 0;
  *(_QWORD *)&v26.tv_usec = 0;
  gettimeofday(&v26, 0);
  self->mTiming.running = 0;
  tv_usec = self->mTiming.last_time.tv_usec;
  v11 = v26.tv_sec - self->mTiming.last_time.tv_sec;
  self->mTiming.last_time.tv_sec = v11;
  v12 = v26.tv_usec - tv_usec;
  self->mTiming.last_time.tv_usec = v12;
  if (v12 < 0)
  {
    self->mTiming.last_time.tv_sec = --v11;
    v12 += 1000000;
    self->mTiming.last_time.tv_usec = v12;
  }
  tv_sec = self->mTiming.total_time.tv_sec + v11;
  self->mTiming.total_time.tv_sec = tv_sec;
  v14 = self->mTiming.total_time.tv_usec + v12;
  self->mTiming.total_time.tv_usec = v14;
  if (v14 > 999999)
  {
    self->mTiming.total_time.tv_sec = ++tv_sec;
    self->mTiming.total_time.tv_usec = v14 - 1000000;
  }
  v15 = self->mTiming.count;
  p_min_time = &self->mTiming.min_time;
  if (v15)
  {
    v17 = v11 < p_min_time->tv_sec;
    if (v11 == p_min_time->tv_sec)
      v17 = v12 < self->mTiming.min_time.tv_usec;
    if (v17)
      *p_min_time = *p_last_time;
    p_max_time = &self->mTiming.max_time;
    v19 = self->mTiming.max_time.tv_sec;
    v20 = v11 <= v19;
    if (v11 == v19)
      v20 = v12 <= self->mTiming.max_time.tv_usec;
    if (v20)
      goto LABEL_28;
  }
  else
  {
    *p_min_time = *p_last_time;
    p_max_time = &self->mTiming.max_time;
  }
  *p_max_time = *p_last_time;
LABEL_28:
  count = v15 + 1;
  self->mTiming.count = v15 + 1;
LABEL_29:
  v23 = (double)count;
  v24 = self->mTiming.total_time.tv_usec;
  v26.tv_sec = 0;
  v25 = modf((double)tv_sec / (double)count, (long double *)&v26.tv_sec);
  self->mPassed = vabdd_f64(1.0, ((double)(int)((int)(v25 * 1000000.0) + vcvtmd_s64_f64((double)v24 / v23)) / 1000000.0+ (double)(int)*(double *)&v26.tv_sec)/ self->mGoalTime) <= self->mPrecision;
  if (!self->mQuiet)
    -[OITSUPerformanceTest report](self, "report");

  self->mTarget = 0;
}

- (void)report
{
  unint64_t count;
  __darwin_suseconds_t tv_usec;
  __darwin_time_t tv_sec;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  NSString *mName;
  _BOOL4 mPassed;
  double mGoalTime;
  double mPrecision;
  long double v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double __y;

  count = self->mTiming.count;
  tv_usec = self->mTiming.total_time.tv_usec;
  tv_sec = self->mTiming.total_time.tv_sec;
  __y = 0.0;
  v6 = (double)tv_sec;
  v7 = (double)tv_sec / (double)count;
  v8 = modf(v7, &__y);
  v9 = __y;
  v10 = (double)tv_usec;
  v11 = vcvtmd_s64_f64((double)tv_usec / (double)count);
  mName = self->mName;
  mPassed = self->mPassed;
  mGoalTime = self->mGoalTime;
  mPrecision = self->mPrecision;
  if (count < 2)
  {
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("elapsed time %f"), (double)self->mTiming.last_time.tv_usec / 1000000.0 + (double)self->mTiming.last_time.tv_sec, v20, v21, v22, v23, v24);
  }
  else
  {
    __y = 0.0;
    v16 = modf(v7, &__y);
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d iterations, avg %f last %f min %f max %f total %f"), count, (double)(int)((int)(v16 * 1000000.0) + v11) / 1000000.0 + (double)(int)__y, (double)self->mTiming.last_time.tv_usec / 1000000.0 + (double)self->mTiming.last_time.tv_sec, (double)self->mTiming.min_time.tv_usec / 1000000.0 + (double)self->mTiming.min_time.tv_sec, (double)self->mTiming.max_time.tv_usec / 1000000.0 + (double)self->mTiming.max_time.tv_sec, v10 / 1000000.0 + v6);
  }
  v18 = (uint64_t)rint(mPrecision * 100.0);
  v19 = "passed";
  if (!mPassed)
    v19 = "FAILED";
  NSLog((NSString *)CFSTR("test '%@' %s: %.06fs, %02.02f%% of goal %.06fs (precision %ld%%) [opstat: %@]"), mName, v19, (double)(int)((int)(v8 * 1000000.0) + v11) / 1000000.0 + (double)(int)v9, ((double)(int)((int)(v8 * 1000000.0) + v11) / 1000000.0 + (double)(int)v9) / mGoalTime * 100.0, *(_QWORD *)&mGoalTime, v18, v17);
}

+ (id)csvHeader
{
  return CFSTR("Name,Total Time (s),Iterations,Goal (s),Precision,Successful");
}

- (id)csvString
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const __CFString *v7;

  v3 = +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  v4 = objc_msgSend(v3, "listSeparator");
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = -[NSString tsu_stringByAddingCSVEscapesForLocale:](self->mName, "tsu_stringByAddingCSVEscapesForLocale:", v3);
  if (self->mPassed)
    v7 = CFSTR("TRUE");
  else
    v7 = CFSTR("FALSE");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%.06f%@%qi%@%.06f%@%f%@%@"), v6, v4, (double)self->mTiming.total_time.tv_usec / 1000000.0 + (double)self->mTiming.total_time.tv_sec, v4, self->mTiming.count, v4, *(_QWORD *)&self->mGoalTime, v4, *(_QWORD *)&self->mPrecision, v4, v7);
}

- (NSString)name
{
  return self->mName;
}

- (TSUOpstat_s)timing
{
  timeval v3;
  timeval v4;

  v3 = *(timeval *)&self->last_time.tv_usec;
  v4 = *(timeval *)&self[1].min_time.tv_usec;
  retstr->max_time = *(timeval *)&self[1].count;
  retstr->total_time = v4;
  retstr->last_time = *(timeval *)&self[1].max_time.tv_usec;
  *(_OWORD *)&retstr->running = *(_OWORD *)&self->total_time.tv_usec;
  retstr->min_time = v3;
  return self;
}

- (void)setTiming:(TSUOpstat_s *)a3
{
  timeval min_time;
  timeval max_time;
  timeval total_time;

  *(_OWORD *)&self->mTiming.running = *(_OWORD *)&a3->running;
  min_time = a3->min_time;
  max_time = a3->max_time;
  total_time = a3->total_time;
  self->mTiming.last_time = a3->last_time;
  self->mTiming.total_time = total_time;
  self->mTiming.max_time = max_time;
  self->mTiming.min_time = min_time;
}

- (double)goalTime
{
  return self->mGoalTime;
}

- (void)setGoalTime:(double)a3
{
  self->mGoalTime = a3;
}

- (double)precision
{
  return self->mPrecision;
}

- (void)setPrecision:(double)a3
{
  self->mPrecision = a3;
}

- (BOOL)quiet
{
  return self->mQuiet;
}

- (void)setQuiet:(BOOL)a3
{
  self->mQuiet = a3;
}

- (BOOL)passed
{
  return self->mPassed;
}

@end
