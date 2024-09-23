@implementation APContentDataTransient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInt32:forKey:", -[APContentDataTransient lastStatusCode](self, "lastStatusCode"), CFSTR("lastStatusCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataTransient sentStatusCodes](self, "sentStatusCodes"));
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("sentStatusCodes"));

  -[APContentDataTransient accumulatedVisibilityTime](self, "accumulatedVisibilityTime");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("accumulatedVisibilityTime"));
  -[APContentDataTransient accumulated50PercentVisibilityTime](self, "accumulated50PercentVisibilityTime");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("accumulated50PercentVisibilityTime"));
  -[APContentDataTransient carouselVisibleTime](self, "carouselVisibleTime");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("carouselVisibleTime"));
  -[APContentDataTransient carousel50PercentVisibleTime](self, "carousel50PercentVisibleTime");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("carousel50PercentVisibleTime"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient carouselFinishedSent](self, "carouselFinishedSent"), CFSTR("carouselFinishedSent"));
  -[APContentDataTransient lastSentEventTime](self, "lastSentEventTime");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("lastSentEventTime"));
  -[APContentDataTransient accumulatedPlaybackTime](self, "accumulatedPlaybackTime");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("accumulatedPlaybackTime"));
  -[APContentDataTransient lastPlaybackTimestamp](self, "lastPlaybackTimestamp");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("lastPlaybackTimestamp"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient playbackInProgress](self, "playbackInProgress"), CFSTR("playbackInProgress"));
  -[APContentDataTransient duration](self, "duration");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("duration"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient hasBeenOnScreen](self, "hasBeenOnScreen"), CFSTR("hasBeenOnScreen"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient interfaceReady](self, "interfaceReady"), CFSTR("interfaceReady"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient wasFullyVisible](self, "wasFullyVisible"), CFSTR("wasFullyVisible"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient interfaceReplaced](self, "interfaceReplaced"), CFSTR("interfaceReplaced"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient discarded](self, "discarded"), CFSTR("discarded"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient hasConfirmedImpression](self, "hasConfirmedImpression"), CFSTR("hasConfirmedImpression"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient hasConfirmed50PercentImpression](self, "hasConfirmed50PercentImpression"), CFSTR("hasConfirmed50PercentImpression"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient hasConfirmedClick](self, "hasConfirmedClick"), CFSTR("hasConfirmedClick"));
  -[APContentDataTransient lastPosition](self, "lastPosition");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("lastPosition"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[APContentDataTransient clickedCarouselElement](self, "clickedCarouselElement"), CFSTR("clickedCarouselElement"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[APContentDataTransient clickCount](self, "clickCount"), CFSTR("clickCount"));
  -[APContentDataTransient clickLocation](self, "clickLocation");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clickLocationX"));
  -[APContentDataTransient clickLocation](self, "clickLocation");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clickLocationY"), v5);
  -[APContentDataTransient clickTime](self, "clickTime");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clickTime"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[APContentDataTransient impressionSequenceNumber](self, "impressionSequenceNumber"), CFSTR("impressionSequenceNumber"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[APContentDataTransient videoEventSequence](self, "videoEventSequence"), CFSTR("videoEventSequence"));
  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient videoUnloadedSent](self, "videoUnloadedSent"), CFSTR("videoUnloadedSent"));
  -[APContentDataTransient volume](self, "volume");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("volume"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataTransient carouselElementsVisible](self, "carouselElementsVisible"));
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("carouselElementsVisible"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataTransient carouselElementsPartiallyVisible](self, "carouselElementsPartiallyVisible"));
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("carouselElementsPartiallyVisible"));

  objc_msgSend(v8, "encodeBool:forKey:", -[APContentDataTransient pendingConfirmedClick](self, "pendingConfirmedClick"), CFSTR("pendingConfirmedClick"));
  -[APContentDataTransient timeSpent](self, "timeSpent");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("timeSpent"));

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)clickLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_copyStruct(v4, &self->_clickLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)wasFullyVisible
{
  return self->_wasFullyVisible;
}

- (double)volume
{
  return self->_volume;
}

- (BOOL)videoUnloadedSent
{
  return self->_videoUnloadedSent;
}

- (int)videoEventSequence
{
  return self->_videoEventSequence;
}

- (NSMutableOrderedSet)sentStatusCodes
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)playbackInProgress
{
  return self->_playbackInProgress;
}

- (BOOL)pendingConfirmedClick
{
  return self->_pendingConfirmedClick;
}

- (int)lastStatusCode
{
  return self->_lastStatusCode;
}

- (double)lastSentEventTime
{
  return self->_lastSentEventTime;
}

- (double)lastPosition
{
  return self->_lastPosition;
}

- (double)lastPlaybackTimestamp
{
  return self->_lastPlaybackTimestamp;
}

- (BOOL)interfaceReplaced
{
  return self->_interfaceReplaced;
}

- (BOOL)interfaceReady
{
  return self->_interfaceReady;
}

- (int)impressionSequenceNumber
{
  return self->_impressionSequenceNumber;
}

- (BOOL)hasConfirmedImpression
{
  return self->_hasConfirmedImpression;
}

- (BOOL)hasConfirmedClick
{
  return self->_hasConfirmedClick;
}

- (BOOL)hasConfirmed50PercentImpression
{
  return self->_hasConfirmed50PercentImpression;
}

- (BOOL)hasBeenOnScreen
{
  return self->_hasBeenOnScreen;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (int)clickedCarouselElement
{
  return self->_clickedCarouselElement;
}

- (double)clickTime
{
  return self->_clickTime;
}

- (int)clickCount
{
  return self->_clickCount;
}

- (double)carouselVisibleTime
{
  return self->_carouselVisibleTime;
}

- (BOOL)carouselFinishedSent
{
  return self->_carouselFinishedSent;
}

- (NSArray)carouselElementsVisible
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)carouselElementsPartiallyVisible
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (double)carousel50PercentVisibleTime
{
  return self->_carousel50PercentVisibleTime;
}

- (double)accumulatedVisibilityTime
{
  return self->_accumulatedVisibilityTime;
}

- (double)accumulatedPlaybackTime
{
  return self->_accumulatedPlaybackTime;
}

- (double)accumulated50PercentVisibilityTime
{
  return self->_accumulated50PercentVisibilityTime;
}

- (APContentDataTransient)init
{
  APContentDataTransient *v2;
  APContentDataTransient *v3;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *sentStatusCodes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APContentDataTransient;
  v2 = -[APContentDataTransient init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lastStatusCode = -1337;
    v2->_interfaceReady = 0;
    v2->_volume = -1.0;
    v2->_videoEventSequence = -1;
    v4 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    sentStatusCodes = v3->_sentStatusCodes;
    v3->_sentStatusCodes = v4;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentStatusCodes, 0);
  objc_storeStrong((id *)&self->_carouselElementsPartiallyVisible, 0);
  objc_storeStrong((id *)&self->_carouselElementsVisible, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (APContentDataTransient)initWithCoder:(id)a3
{
  id v4;
  APContentDataTransient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSMutableOrderedSet *sentStatusCodes;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  NSArray *carouselElementsVisible;
  uint64_t v28;
  NSArray *carouselElementsPartiallyVisible;
  double v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)APContentDataTransient;
  v5 = -[APContentDataTransient init](&v32, "init");
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    v5->_lastStatusCode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lastStatusCode"));
    v7 = objc_opt_class(NSMutableOrderedSet);
    v8 = objc_opt_class(NSNumber);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(NSArray), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("sentStatusCodes")));
    sentStatusCodes = v5->_sentStatusCodes;
    v5->_sentStatusCodes = (NSMutableOrderedSet *)v11;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accumulatedVisibilityTime"));
    v5->_accumulatedVisibilityTime = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accumulated50PercentVisibilityTime"));
    v5->_accumulated50PercentVisibilityTime = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("carouselVisibleTime"));
    v5->_carouselVisibleTime = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("carousel50PercentVisibleTime"));
    v5->_carousel50PercentVisibleTime = v16;
    v5->_carouselFinishedSent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("carouselFinishedSent"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastSentEventTime"));
    v5->_lastSentEventTime = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accumulatedPlaybackTime"));
    v5->_accumulatedPlaybackTime = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastPlaybackTimestamp"));
    v5->_lastPlaybackTimestamp = v19;
    v5->_playbackInProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("playbackInProgress"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v20;
    v5->_hasBeenOnScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBeenOnScreen"));
    v5->_interfaceReady = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("interfaceReady"));
    v5->_interfaceReplaced = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("interfaceReplaced"));
    v5->_wasFullyVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasFullyVisible"));
    v5->_discarded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("discarded"));
    v5->_hasConfirmedImpression = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConfirmedImpression"));
    v5->_hasConfirmed50PercentImpression = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConfirmed50PercentImpression"));
    v5->_hasConfirmedClick = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConfirmedClick"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastPosition"));
    v5->_lastPosition = v21;
    v5->_clickedCarouselElement = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("clickedCarouselElement"));
    v5->_clickCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("clickCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("clickLocationX"));
    v5->_clickLocation.x = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("clickLocationY"));
    v5->_clickLocation.y = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("clickTime"));
    v5->_clickTime = v24;
    v5->_impressionSequenceNumber = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("impressionSequenceNumber"));
    v5->_videoEventSequence = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("videoEventSequence"));
    v5->_videoUnloadedSent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("videoUnloadedSent"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("volume"));
    v5->_volume = v25;
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("carouselElementsVisible")));
    carouselElementsVisible = v5->_carouselElementsVisible;
    v5->_carouselElementsVisible = (NSArray *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("carouselElementsPartiallyVisible")));
    carouselElementsPartiallyVisible = v5->_carouselElementsPartiallyVisible;
    v5->_carouselElementsPartiallyVisible = (NSArray *)v28;

    v5->_pendingConfirmedClick = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pendingConfirmedClick"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeSpent"));
    v5->_timeSpent = v30;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)hasDuration
{
  double v2;

  -[APContentDataTransient duration](self, "duration");
  return v2 > 0.01;
}

- (void)save
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataTransient delegate](self, "delegate"));
  objc_msgSend(v2, "transientDataDidChange");

}

- (APContentDataTransientDelegate)delegate
{
  return (APContentDataTransientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setLastStatusCode:(int)a3
{
  self->_lastStatusCode = a3;
}

- (void)setCarouselElementsVisible:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setCarouselElementsPartiallyVisible:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setClickedCarouselElement:(int)a3
{
  self->_clickedCarouselElement = a3;
}

- (void)setCarouselFinishedSent:(BOOL)a3
{
  self->_carouselFinishedSent = a3;
}

- (void)setHasBeenOnScreen:(BOOL)a3
{
  self->_hasBeenOnScreen = a3;
}

- (void)setInterfaceReady:(BOOL)a3
{
  self->_interfaceReady = a3;
}

- (void)setInterfaceReplaced:(BOOL)a3
{
  self->_interfaceReplaced = a3;
}

- (void)setWasFullyVisible:(BOOL)a3
{
  self->_wasFullyVisible = a3;
}

- (void)setClickTime:(double)a3
{
  self->_clickTime = a3;
}

- (void)setAccumulatedVisibilityTime:(double)a3
{
  self->_accumulatedVisibilityTime = a3;
}

- (void)setAccumulated50PercentVisibilityTime:(double)a3
{
  self->_accumulated50PercentVisibilityTime = a3;
}

- (void)setCarouselVisibleTime:(double)a3
{
  self->_carouselVisibleTime = a3;
}

- (void)setCarousel50PercentVisibleTime:(double)a3
{
  self->_carousel50PercentVisibleTime = a3;
}

- (void)setLastSentEventTime:(double)a3
{
  self->_lastSentEventTime = a3;
}

- (void)setLastPlaybackTimestamp:(double)a3
{
  self->_lastPlaybackTimestamp = a3;
}

- (double)timeSpent
{
  return self->_timeSpent;
}

- (void)setTimeSpent:(double)a3
{
  self->_timeSpent = a3;
}

- (void)setAccumulatedPlaybackTime:(double)a3
{
  self->_accumulatedPlaybackTime = a3;
}

- (void)setPlaybackInProgress:(BOOL)a3
{
  self->_playbackInProgress = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setLastPosition:(double)a3
{
  self->_lastPosition = a3;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (void)setVideoEventSequence:(int)a3
{
  self->_videoEventSequence = a3;
}

- (void)setVideoUnloadedSent:(BOOL)a3
{
  self->_videoUnloadedSent = a3;
}

- (void)setHasConfirmedImpression:(BOOL)a3
{
  self->_hasConfirmedImpression = a3;
}

- (void)setHasConfirmed50PercentImpression:(BOOL)a3
{
  self->_hasConfirmed50PercentImpression = a3;
}

- (void)setHasConfirmedClick:(BOOL)a3
{
  self->_hasConfirmedClick = a3;
}

- (void)setClickCount:(int)a3
{
  self->_clickCount = a3;
}

- (void)setClickLocation:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3;

  v3 = a3;
  objc_copyStruct(&self->_clickLocation, &v3, 16, 1, 0);
}

- (void)setDiscarded:(BOOL)a3
{
  self->_discarded = a3;
}

- (void)setPendingConfirmedClick:(BOOL)a3
{
  self->_pendingConfirmedClick = a3;
}

- (void)setSentStatusCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

@end
