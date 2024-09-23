@implementation PlaybackDelayTimeIntervalOverride

void __PlaybackDelayTimeIntervalOverride_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleForKey:", CFSTR("mediaControllerPlaybackDelay"));
  PlaybackDelayTimeIntervalOverride_playbackDelayInterval = v0;

}

void __PlaybackDelayTimeIntervalOverride_block_invoke_0()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleForKey:", CFSTR("mediaControllerPlaybackDelay"));
  PlaybackDelayTimeIntervalOverride_playbackDelayInterval_0 = v0;

}

@end
