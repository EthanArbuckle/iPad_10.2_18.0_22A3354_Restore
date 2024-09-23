@implementation SXVideoProvider

- (SXVideoProvider)initWithURL:(id)a3
{
  id v5;
  SXVideoProvider *v6;
  SXVideoProvider *v7;
  SVTimeline *v8;
  SVTimeline *timeline;
  SXVideoMediaIdentifierGenerator *v10;
  uint64_t v11;
  NSString *mediaIdentifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXVideoProvider;
  v6 = -[SXVideoProvider init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = (SVTimeline *)objc_alloc_init(MEMORY[0x24BE90758]);
    timeline = v7->_timeline;
    v7->_timeline = v8;

    v10 = objc_alloc_init(SXVideoMediaIdentifierGenerator);
    -[SXVideoMediaIdentifierGenerator identifierForURL:](v10, "identifierForURL:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    mediaIdentifier = v7->_mediaIdentifier;
    v7->_mediaIdentifier = (NSString *)v11;

  }
  return v7;
}

- (id)loadWithCompletionBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[SXVideoProvider URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXVideoProvider setMetadata:](self, "setMetadata:", v7);
  return &__block_literal_global_58;
}

- (void)playbackInitiatedWithButtonTapped:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  SXMediaEngageEvent *v7;

  if (a3)
    v4 = 1;
  else
    v4 = 2;
  -[SXVideoProvider setPlayMethod:](self, "setPlayMethod:", v4);
  v7 = objc_alloc_init(SXMediaEngageEvent);
  -[SXMediaEvent setMediaType:](v7, "setMediaType:", 2);
  -[SXMediaEngageEvent setUserAction:](v7, "setUserAction:", 4);
  -[SXMediaEvent setVideoType:](v7, "setVideoType:", 1);
  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v7, "setMediaId:", v5);

  -[SXMediaEngageEvent setMediaPlayMethod:](v7, "setMediaPlayMethod:", -[SXVideoProvider playMethod](self, "playMethod"));
  -[SXAnalyticsEvent determineEndDate](v7, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportEvent:", v7);

}

- (void)playbackStarted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXMediaEngageEvent *v9;

  v9 = objc_alloc_init(SXMediaEngageEvent);
  -[SXMediaEvent setMediaType:](v9, "setMediaType:", 2);
  -[SXVideoProvider metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  -[SXMediaEngageEvent setMediaDuration:](v9, "setMediaDuration:");

  -[SXVideoProvider metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "framerate");
  -[SXMediaEngageEvent setMediaFrameRate:](v9, "setMediaFrameRate:");

  -[SXMediaEngageEvent setUserAction:](v9, "setUserAction:", 1);
  -[SXMediaEvent setVideoType:](v9, "setVideoType:", 1);
  -[SXVideoProvider metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEngageEvent setMuted:](v9, "setMuted:", objc_msgSend(v5, "muted"));

  -[SXVideoProvider metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "volume");
  -[SXMediaEngageEvent setVolume:](v9, "setVolume:");

  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v9, "setMediaId:", v7);

  -[SXMediaEngageEvent setMediaPlayMethod:](v9, "setMediaPlayMethod:", -[SXVideoProvider playMethod](self, "playMethod"));
  -[SXAnalyticsEvent determineEndDate](v9, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportEvent:", v9);

}

- (void)playbackPaused
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXMediaEngageEvent *v12;

  v12 = objc_alloc_init(SXMediaEngageEvent);
  -[SXMediaEvent setMediaType:](v12, "setMediaType:", 2);
  -[SXVideoProvider metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  -[SXMediaEngageEvent setMediaDuration:](v12, "setMediaDuration:");

  -[SXVideoProvider metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "framerate");
  -[SXMediaEngageEvent setMediaFrameRate:](v12, "setMediaFrameRate:");

  -[SXMediaEngageEvent setUserAction:](v12, "setUserAction:", 2);
  -[SXVideoProvider metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "time");
  -[SXMediaEngageEvent setMediaPausePosition:](v12, "setMediaPausePosition:", (unint64_t)v6);

  -[SXVideoProvider metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timePlayed");
  -[SXMediaEngageEvent setMediaTimePlayed:](v12, "setMediaTimePlayed:");

  -[SXMediaEvent setVideoType:](v12, "setVideoType:", 1);
  -[SXVideoProvider metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEngageEvent setMuted:](v12, "setMuted:", objc_msgSend(v8, "muted"));

  -[SXVideoProvider metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "volume");
  -[SXMediaEngageEvent setVolume:](v12, "setVolume:");

  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v12, "setMediaId:", v10);

  -[SXAnalyticsEvent determineEndDate](v12, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportEvent:", v12);

}

- (void)playbackResumed
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXMediaEngageEvent *v12;

  v12 = objc_alloc_init(SXMediaEngageEvent);
  -[SXMediaEvent setMediaType:](v12, "setMediaType:", 2);
  -[SXVideoProvider metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  -[SXMediaEngageEvent setMediaDuration:](v12, "setMediaDuration:");

  -[SXVideoProvider metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "framerate");
  -[SXMediaEngageEvent setMediaFrameRate:](v12, "setMediaFrameRate:");

  -[SXMediaEngageEvent setUserAction:](v12, "setUserAction:", 3);
  -[SXVideoProvider metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "time");
  -[SXMediaEngageEvent setMediaResumePosition:](v12, "setMediaResumePosition:", (unint64_t)v6);

  -[SXVideoProvider metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timePlayed");
  -[SXMediaEngageEvent setMediaTimePlayed:](v12, "setMediaTimePlayed:");

  -[SXMediaEvent setVideoType:](v12, "setVideoType:", 1);
  -[SXVideoProvider metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEngageEvent setMuted:](v12, "setMuted:", objc_msgSend(v8, "muted"));

  -[SXVideoProvider metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "volume");
  -[SXMediaEngageEvent setVolume:](v12, "setVolume:");

  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v12, "setMediaId:", v10);

  -[SXAnalyticsEvent determineEndDate](v12, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportEvent:", v12);

}

- (void)playbackFinished
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SXMediaEngageCompleteEvent *v8;

  v8 = objc_alloc_init(SXMediaEngageCompleteEvent);
  -[SXMediaEvent setMediaType:](v8, "setMediaType:", 2);
  -[SXVideoProvider metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timePlayed");
  -[SXMediaEngageCompleteEvent setMediaTimePlayed:](v8, "setMediaTimePlayed:");

  -[SXVideoProvider metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  -[SXMediaEngageCompleteEvent setMediaDuration:](v8, "setMediaDuration:");

  -[SXVideoProvider metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "framerate");
  -[SXMediaEngageCompleteEvent setMediaFrameRate:](v8, "setMediaFrameRate:");

  -[SXMediaEvent setVideoType:](v8, "setVideoType:", 1);
  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v8, "setMediaId:", v6);

  -[SXAnalyticsEvent determineEndDate](v8, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportEvent:", v8);

}

- (void)playbackFailedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SXMediaEngageEvent *v7;

  v4 = a3;
  v7 = objc_alloc_init(SXMediaEngageEvent);
  -[SXMediaEvent setMediaType:](v7, "setMediaType:", 2);
  -[SXMediaEngageEvent setUserAction:](v7, "setUserAction:", 6);
  -[SXMediaEvent setVideoType:](v7, "setVideoType:", 1);
  -[SXMediaEngageEvent setError:](v7, "setError:", v4);

  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v7, "setMediaId:", v5);

  -[SXAnalyticsEvent determineEndDate](v7, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportEvent:", v7);

}

- (void)muteStateChanged:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SXMediaEngageEvent *v10;

  v10 = objc_alloc_init(SXMediaEngageEvent);
  -[SXMediaEvent setMediaType:](v10, "setMediaType:", 2);
  -[SXVideoProvider metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  -[SXMediaEngageEvent setMediaDuration:](v10, "setMediaDuration:");

  -[SXMediaEngageEvent setUserAction:](v10, "setUserAction:", 5);
  -[SXVideoProvider metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timePlayed");
  -[SXMediaEngageEvent setMediaTimePlayed:](v10, "setMediaTimePlayed:");

  -[SXMediaEvent setVideoType:](v10, "setVideoType:", 1);
  -[SXVideoProvider metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEngageEvent setMuted:](v10, "setMuted:", objc_msgSend(v6, "muted"));

  -[SXVideoProvider metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volume");
  -[SXMediaEngageEvent setVolume:](v10, "setVolume:");

  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v10, "setMediaId:", v8);

  -[SXAnalyticsEvent determineEndDate](v10, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportEvent:", v10);

}

- (void)playbackPassedQuartile:(unint64_t)a3
{
  void *v4;
  void *v5;
  SXVideoQuartileEvent *v6;

  v6 = -[SXVideoQuartileEvent initWithQuartile:]([SXVideoQuartileEvent alloc], "initWithQuartile:", a3);
  -[SXMediaEvent setVideoType:](v6, "setVideoType:", 1);
  -[SXVideoProvider mediaIdentifier](self, "mediaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMediaEvent setMediaId:](v6, "setMediaId:", v4);

  -[SXAnalyticsEvent determineEndDate](v6, "determineEndDate");
  -[SXVideoProvider analyticsReporter](self, "analyticsReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:", v6);

}

- (NSURL)URL
{
  return self->_URL;
}

- (SXAnalyticsReporting)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReporter, a3);
}

- (SVVideoMetadata)metadata
{
  return (SVVideoMetadata *)objc_loadWeakRetained((id *)&self->_metadata);
}

- (void)setMetadata:(id)a3
{
  objc_storeWeak((id *)&self->_metadata, a3);
}

- (SVTimeline)timeline
{
  return self->_timeline;
}

- (double)pausedAtTime
{
  return self->_pausedAtTime;
}

- (void)setPausedAtTime:(double)a3
{
  self->_pausedAtTime = a3;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (unint64_t)playMethod
{
  return self->_playMethod;
}

- (void)setPlayMethod:(unint64_t)a3
{
  self->_playMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_destroyWeak((id *)&self->_metadata);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
