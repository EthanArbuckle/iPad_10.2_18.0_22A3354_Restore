@implementation PRLog

void __PRLog_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *global_queue;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v1 = dispatch_queue_create("com.apple.ProofReader.loggingBackgroundQueue", v0);
  PRLog__queue = (uint64_t)v1;
  global_queue = dispatch_get_global_queue(9, 0);
  dispatch_set_target_queue(v1, global_queue);
}

void __PRLog_block_invoke_2(uint64_t a1)
{
  const char *v2;
  const char *v3;
  size_t v4;
  int v5;
  int v6;
  int tm_mday;
  int tm_hour;
  int tm_min;
  int tm_sec;
  unsigned int v11;
  pid_t v12;
  char *v13;
  size_t v14;
  _BOOL4 v15;
  int v16;
  int v17;
  void *context;
  tm v19;
  time_t v20;
  long double __y;
  char *__s;
  _QWORD v23[3];
  size_t v24;
  const char *v25;
  _BOOL8 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1DF0EACE0]();
  v2 = (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String");
  v3 = v2;
  if (v2)
    v4 = strlen(v2);
  else
    v4 = 0;
  __s = 0;
  v20 = vcvtmd_s64_f64(*(double *)(a1 + 40) + *MEMORY[0x1E0C9ADF8]);
  memset(&v19, 0, sizeof(v19));
  localtime_r(&v20, &v19);
  v5 = v19.tm_year + 1900;
  v6 = v19.tm_mon + 1;
  tm_hour = v19.tm_hour;
  tm_mday = v19.tm_mday;
  tm_sec = v19.tm_sec;
  tm_min = v19.tm_min;
  v11 = vcvtmd_s64_f64(modf(*(long double *)(a1 + 40), &__y) * 1000.0);
  v12 = getpid();
  asprintf(&__s, "%04d-%02d-%02d %02d:%02d:%02d.%03d AppleSpell[%d:%llu] ", v5, v6, tm_mday, tm_hour, tm_min, tm_sec, v11, v12, *(_QWORD *)(a1 + 48));
  v13 = __s;
  v23[0] = __s;
  if (__s)
    v14 = strlen(__s);
  else
    v14 = 0;
  v23[1] = v14;
  v23[2] = v3;
  if (v3)
  {
    v24 = strlen(v3);
    v25 = "\n";
    if (v4)
    {
      v15 = v3[v4 - 1] != 10;
      goto LABEL_12;
    }
  }
  else
  {
    v24 = 0;
    v25 = "\n";
  }
  v15 = 1;
LABEL_12:
  v26 = v15;
  if (__s)
    v16 = 2;
  else
    v16 = 1;
  v17 = v15 + v16;
  if ((PRLog_fd & 0x80000000) == 0)
  {
    writev(PRLog_fd, (const iovec *)&v23[2 * (__s == 0)], v17);
    v13 = (char *)v23[0];
  }
  writev(2, (const iovec *)&v23[2 * (v13 == 0)], v17);
  if (__s)
    free(__s);

  objc_autoreleasePoolPop(context);
}

@end
