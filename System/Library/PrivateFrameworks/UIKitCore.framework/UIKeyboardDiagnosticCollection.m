@implementation UIKeyboardDiagnosticCollection

double __57___UIKeyboardDiagnosticCollection__matDurationToSeconds___block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 * 0.000000001;
  qword_1ECD7C968 = *(_QWORD *)&result;
  return result;
}

void __76___UIKeyboardDiagnosticCollection__processIsEntitledForDiagnosticCollection__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;
  CFTypeID v3;
  BOOL v4;
  CFErrorRef error;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.diagnosticpipeline.request"), &error);
    if (error)
      CFRelease(error);
    if (v2)
    {
      v3 = CFGetTypeID(v2);
      v4 = v3 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v2) != 0;
      _MergedGlobals_927 = v4;
      CFRelease(v2);
    }
    CFRelease(v1);
  }
}

void __51___UIKeyboardDiagnosticCollection__diagnosticQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UIKit.KeyboardDiagnosticQueue", v2);
  v1 = (void *)qword_1ECD7C978;
  qword_1ECD7C978 = (uint64_t)v0;

}

void __105___UIKeyboardDiagnosticCollection__requestTailspinWithDescription_startMAT_endMAT_ifExceedsThresholdSec___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40) * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, CFSTR("durationms"), v4, CFSTR("starttime"), v5, CFSTR("endtime"), CFSTR("239"), CFSTR("bugtype"), v6, CFSTR("workflow"), &unk_1E1A92978, CFSTR("exceededThresholds"), v8, CFSTR("IncidentUUID"), 0);

  v17 = 0;
  LODWORD(v5) = DRTailspinRequest();
  v10 = 0;
  _UIKeyboardLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String", &v17);
      *(_DWORD *)buf = 136315138;
      v19 = v13;
      _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "%s DiagnosticPipeline tailspin request successful.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String", &v17);
    objc_msgSend(v10, "localizedDescription");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    *(_DWORD *)buf = 136315394;
    v19 = v14;
    v20 = 2080;
    v21 = v16;
    _os_log_error_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%s DiagnosticPipeline tailspin request failed with error: %s.", buf, 0x16u);

  }
}

@end
