@implementation NavigationAudioFeedbackCollector

- (void)dealloc
{
  objc_super v3;

  free(self->_audioFeedback);
  v3.receiver = self;
  v3.super_class = (Class)NavigationAudioFeedbackCollector;
  -[NavigationAudioFeedbackCollector dealloc](&v3, "dealloc");
}

- (void)startSession
{
  void *v3;
  GEONavigationAudioFeedback *v4;

  if (!self->_audioFeedback)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v3, "registerObserver:", self);

    v4 = (GEONavigationAudioFeedback *)malloc_type_calloc(1uLL, 0x2CuLL, 0x1000040BE8001C8uLL);
    self->_audioFeedback = v4;
    *(_DWORD *)&v4->var18 |= 0x4000u;
    v4->var14 = 0;
    self->_sessionDidStart = 1;
  }
}

- (void)endSession
{
  void *v3;

  if (self->_audioFeedback)
  {
    if (self->_sessionDidStart)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      objc_msgSend(v3, "unregisterObserver:", self);

      self->_sessionDidStart = 0;
    }
  }
}

- (void)updateViewingAudioSettings:(BOOL)a3
{
  GEONavigationAudioFeedback *audioFeedback;

  self->_viewingAudioSettings = a3;
  if (a3)
  {
    audioFeedback = self->_audioFeedback;
    *(_DWORD *)&audioFeedback->var18 |= 0x4000u;
    audioFeedback->var14 = 1;
  }
}

- (GEONavigationAudioFeedback)audioFeedback
{
  return self->_audioFeedback;
}

- (void)navigationService:(id)a3 didStartSpeakingPrompt:(id)a4
{
  GEONavigationAudioFeedback *audioFeedback;
  int v5;

  audioFeedback = self->_audioFeedback;
  v5 = audioFeedback->var13 + 1;
  *(_DWORD *)&audioFeedback->var18 |= 0x2000u;
  audioFeedback->var13 = v5;
}

@end
