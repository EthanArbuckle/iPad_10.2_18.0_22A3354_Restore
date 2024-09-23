@implementation _PXVideoPlaybackCPAnalyticsEndpoint

- (void)playbackRequested
{
  self->_signpost = objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
}

- (void)sendPayload:(_PXVideoPlaybackReporterPayload *)a3
{
  int64_t signpost;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3->var3 == 1)
  {
    signpost = self->_signpost;
    if (signpost)
    {
      v5 = (void *)MEMORY[0x1E0D09910];
      v6 = *MEMORY[0x1E0D09708];
      v8 = *MEMORY[0x1E0D09850];
      v9[0] = CFSTR("com.apple.photos.CPAnalytics.videoSessionPlaybackLatency");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endSignpost:forEventName:withPayload:", signpost, v6, v7);

      self->_signpost = 0;
    }
  }
}

- (NSString)loggingIdentifier
{
  return self->loggingIdentifier;
}

- (void)setLoggingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->loggingIdentifier, 0);
}

@end
