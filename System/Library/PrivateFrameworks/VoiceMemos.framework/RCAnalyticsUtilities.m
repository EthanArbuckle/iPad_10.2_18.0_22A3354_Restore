@implementation RCAnalyticsUtilities

+ (void)sendDidPlaybackVoiceMemo
{
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.playback")))
    AnalyticsSendEvent();
}

+ (void)sendDidCaptureNewRecording
{
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.didCaptureNewRecording")))
    AnalyticsSendEvent();
}

+ (void)sendDidCaptureModifyExistingRecording
{
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.didCaptureModifyExistingRecording")))
    AnalyticsSendEvent();
}

+ (void)sendNewRecordingDuration:(double)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.newRecording.duration")))
  {
    v6 = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

+ (void)sendRecordingsCount:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.recordings.count")))
  {
    v6 = CFSTR("libraryCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

+ (void)sendDidTrimVoiceMemo
{
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.didTrimMemo")))
    AnalyticsSendEvent();
}

+ (void)sendDidShareRecording
{
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.didShareRecording")))
    AnalyticsSendEvent();
}

+ (void)sendReceivedSharedRecording
{
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.didReceiveSharedRecording")))
    AnalyticsSendEvent();
}

+ (void)sendDidOpenShareMemoController
{
  if (RCShouldSendAnalyticsEventForKey(CFSTR("com.apple.voicememos.lastSendEvent.didOpenShareMemoController")))
    AnalyticsSendEvent();
}

@end
