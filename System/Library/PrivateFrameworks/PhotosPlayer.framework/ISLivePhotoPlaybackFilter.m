@implementation ISLivePhotoPlaybackFilter

- (ISLivePhotoPlaybackFilter)init
{
  ISLivePhotoPlaybackFilter *v2;
  NSMutableSet *v3;
  NSMutableSet *playbackDisabledReasons;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoPlaybackFilter;
  v2 = -[ISObservable init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    playbackDisabledReasons = v2->__playbackDisabledReasons;
    v2->__playbackDisabledReasons = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playbackDisabledReasons, 0);
}

- (void)setPlaybackDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[ISLivePhotoPlaybackFilter _playbackDisabledReasons](self, "_playbackDisabledReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "addObject:", v6);
  else
    objc_msgSend(v7, "removeObject:", v6);

}

- (BOOL)isPlaybackDisabled
{
  void *v2;
  BOOL v3;

  -[ISLivePhotoPlaybackFilter _playbackDisabledReasons](self, "_playbackDisabledReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setHintProgress:(double)a3
{
  if (self->_hintProgress != a3)
  {
    self->_hintProgress = a3;
    -[ISObservable signalChange:](self, "signalChange:", 2);
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != 2 || !-[ISLivePhotoPlaybackFilter playIsSticky](self, "playIsSticky"))
    -[ISLivePhotoPlaybackFilter _setState:](self, "_setState:", a3);
}

- (void)_setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[ISObservable signalChange:](self, "signalChange:", 1);
  }
}

- (void)reset
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__ISLivePhotoPlaybackFilter_reset__block_invoke;
  v2[3] = &unk_1E9454220;
  v2[4] = self;
  -[ISObservable performChanges:](self, "performChanges:", v2);
}

- (double)hintProgress
{
  return self->_hintProgress;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)playIsSticky
{
  return self->_playIsSticky;
}

- (void)setPlayIsSticky:(BOOL)a3
{
  self->_playIsSticky = a3;
}

- (void)_setPlaybackDisabled:(BOOL)a3
{
  self->_playbackDisabled = a3;
}

- (BOOL)isPerformingInputChanges
{
  return self->_isPerformingInputChanges;
}

- (void)_setPerformingInputChanges:(BOOL)a3
{
  self->_isPerformingInputChanges = a3;
}

- (NSMutableSet)_playbackDisabledReasons
{
  return self->__playbackDisabledReasons;
}

uint64_t __34__ISLivePhotoPlaybackFilter_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setState:", 0);
}

@end
