@implementation PFDeviceLockScreenFocusAreaRectNormalized

void __PFDeviceLockScreenFocusAreaRectNormalized_block_invoke()
{
  dispatch_block_t v0;
  id v1;
  id v2;
  dispatch_time_t v3;
  uint8_t v4[8];
  _QWORD v5[4];
  id v6;

  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_0 = 0;
  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_1 = 0;
  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_2 = 0x3FF0000000000000;
  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_3 = 0x3FF0000000000000;
  v0 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_1_4262);
  v1 = objc_alloc_init((Class)getSBSWallpaperServiceClass());
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PFDeviceLockScreenFocusAreaRectNormalized_block_invoke_3;
  v5[3] = &unk_1E45A2CE8;
  v2 = v0;
  v6 = v2;
  objc_msgSend(v1, "fetchContentCutoutBoundsForVariant:orientation:completionHandler:", 0, 1, v5);
  v3 = dispatch_time(0, 3000000000);
  if (dispatch_block_wait(v2, v3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFDeviceLockScreenFocusAreaRectNormalized] timeout while requesting lockscreen focus area", v4, 2u);
  }
  objc_msgSend(v1, "invalidate");

}

uint64_t __PFDeviceLockScreenFocusAreaRectNormalized_block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_0 = *(_QWORD *)&a2;
  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_1 = *(_QWORD *)&a3;
  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_2 = *(_QWORD *)&a4;
  PFDeviceLockScreenFocusAreaRectNormalized_sDeviceLockScreenFocusAreaRect_3 = *(_QWORD *)&a5;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
