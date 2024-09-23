@implementation UIDevice(IC)

+ (uint64_t)ic_isLiveTextAvailable
{
  BOOL v0;

  if (ic_isLiveTextAvailable_onceToken != -1)
    dispatch_once(&ic_isLiveTextAvailable_onceToken, &__block_literal_global_12);
  if (objc_msgSend(MEMORY[0x1E0D641E0], "isCameraAvailable"))
    v0 = ic_isLiveTextAvailable_isIPLiveTextEnabled == 0;
  else
    v0 = 1;
  if (v0 || !MGIsQuestionValid())
    return 0;
  else
    return MGGetBoolAnswer();
}

+ (BOOL)ic_isiPad
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

+ (BOOL)ic_isLargeiPad
{
  _BOOL8 v0;
  void *v1;
  double v2;
  double v3;
  void *v4;
  double v5;

  v0 = 0;
  if (MGGetSInt32Answer() == 11)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "nativeScale");
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v0 = vabdd_f64(v3, v5) < 0.00999999978;

  }
  return v0;
}

+ (BOOL)ic_isiPhone
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 0;

  return v1;
}

+ (BOOL)ic_isLocked
{
  unsigned int (*v0)(_QWORD);
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (unsigned int (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v7 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v3[3] = &unk_1E5C1DE18;
    v3[4] = &v4;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (unsigned int (*)(_QWORD))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v2 = (_Unwind_Exception *)+[UIDevice(IC) ic_isLocked].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0(0) - 1 < 2;
}

+ (uint64_t)ic_is12hrClock
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "containsString:", CFSTR("a"));
  return v3;
}

+ (BOOL)ic_isVision
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 6;

  return v1;
}

+ (uint64_t)ic_isLocked
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[ICDocCamPDFGenerator deleteAllDocCamPDFs].cold.1(v0);
}

@end
