@implementation PLIsCaptureSessionEnabled

void __PLIsCaptureSessionEnabled_block_invoke()
{
  void *v0;
  int v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("com.apple.photos.asssetd.CaptureSessionDisabled"));

  if (v1)
  {
    PLIsCaptureSessionEnabled_sIsCaptureSessionEnabled = 0;
    PLBackendGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_199DF7000, v2, OS_LOG_TYPE_ERROR, "Capture Session: Disabled due to com.apple.photos.asssetd.CaptureSessionDisabled user default", v3, 2u);
    }

  }
  else
  {
    PLIsCaptureSessionEnabled_sIsCaptureSessionEnabled = _os_feature_enabled_impl();
  }
}

@end
