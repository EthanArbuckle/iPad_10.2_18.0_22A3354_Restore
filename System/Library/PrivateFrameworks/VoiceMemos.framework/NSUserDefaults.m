@implementation NSUserDefaults

void __60__NSUserDefaults_RecorderExtensions__voiceMemosUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  if ((RCRunningInSavedRecordingDaemon() & 1) != 0)
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.VoiceMemos"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)voiceMemosUserDefaults_voiceMemosUserDefaults;
  voiceMemosUserDefaults_voiceMemosUserDefaults = v0;

}

@end
