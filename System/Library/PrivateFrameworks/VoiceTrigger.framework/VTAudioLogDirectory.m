@implementation VTAudioLogDirectory

void __VTAudioLogDirectory_block_invoke()
{
  __CFString *v0;
  uint64_t v1;
  void *v2;
  id v3;

  CPSharedResourcesDirectory();
  v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString rangeOfString:](v0, "rangeOfString:", CFSTR("root")) != 0x7FFFFFFFFFFFFFFFLL)
  {

    v0 = CFSTR("/var/mobile");
  }
  -[__CFString stringByAppendingPathComponent:](v0, "stringByAppendingPathComponent:", CFSTR("Library"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/VoiceTrigger/audio/"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)VTAudioLogDirectory_logPath;
  VTAudioLogDirectory_logPath = v1;

}

@end
