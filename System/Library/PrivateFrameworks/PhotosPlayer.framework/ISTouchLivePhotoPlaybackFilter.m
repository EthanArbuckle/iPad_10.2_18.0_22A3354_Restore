@implementation ISTouchLivePhotoPlaybackFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playbackStartDate, 0);
}

- (int64_t)_nextPlaybackRequestID
{
  int64_t v3;

  v3 = -[ISTouchLivePhotoPlaybackFilter _playbackRequestID](self, "_playbackRequestID") + 1;
  -[ISTouchLivePhotoPlaybackFilter _setPlaybackReaquestID:](self, "_setPlaybackReaquestID:", v3);
  return v3;
}

- (void)setTouchActive:(BOOL)a3
{
  void *v4;
  ISDisplayLink *v5;
  ISDisplayLink *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (self->_touchActive != a3)
  {
    self->_touchActive = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISTouchLivePhotoPlaybackFilter _setPlaybackStartDate:](self, "_setPlaybackStartDate:", v4);
      objc_initWeak(&location, self);
      v5 = [ISDisplayLink alloc];
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __49__ISTouchLivePhotoPlaybackFilter_setTouchActive___block_invoke;
      v11 = &unk_1E9453CF8;
      objc_copyWeak(&v12, &location);
      v6 = -[ISDisplayLink initWithUpdateHandler:completionHandler:](v5, "initWithUpdateHandler:completionHandler:", &v8, 0);
      -[ISDisplayLink setPreferredFramesPerSecond:](v6, "setPreferredFramesPerSecond:", 60, v8, v9, v10, v11);
      -[ISTouchLivePhotoPlaybackFilter _setDisplayLink:](self, "_setDisplayLink:", v6);
      -[ISDisplayLink start](v6, "start");

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);

    }
    else
    {
      -[ISTouchLivePhotoPlaybackFilter _displayLink](self, "_displayLink");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stop");

      -[ISTouchLivePhotoPlaybackFilter _setDisplayLink:](self, "_setDisplayLink:", 0);
    }
  }
}

- (void)didPerformChanges
{
  _BOOL4 v3;
  double v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISTouchLivePhotoPlaybackFilter;
  -[ISObservable didPerformChanges](&v6, sel_didPerformChanges);
  v3 = -[ISTouchLivePhotoPlaybackFilter isTouchActive](self, "isTouchActive");
  -[ISLivePhotoPlaybackFilter hintProgress](self, "hintProgress");
  if (v3)
  {
    if (v4 >= 1.0)
    {
      if (-[ISLivePhotoPlaybackFilter state](self, "state") == 1)
      {
        if (-[ISLivePhotoPlaybackFilter isPlaybackDisabled](self, "isPlaybackDisabled"))
          v5 = 1;
        else
          v5 = 2;
      }
      else
      {
        v5 = 2 * (-[ISLivePhotoPlaybackFilter state](self, "state") == 2);
      }
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  -[ISLivePhotoPlaybackFilter setState:](self, "setState:", v5);
}

- (void)_handleDisplayLink
{
  void *v3;
  double v4;
  double v5;
  _QWORD v6[6];

  -[ISTouchLivePhotoPlaybackFilter _playbackStartDate](self, "_playbackStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ISTouchLivePhotoPlaybackFilter__handleDisplayLink__block_invoke;
  v6[3] = &unk_1E94541D0;
  v6[4] = self;
  *(double *)&v6[5] = v5 / -0.1 + 1.0;
  -[ISObservable performChanges:](self, "performChanges:", v6);
}

- (void)reset
{
  objc_super v3;

  if (-[ISLivePhotoPlaybackFilter playIsSticky](self, "playIsSticky"))
  {
    v3.receiver = self;
    v3.super_class = (Class)ISTouchLivePhotoPlaybackFilter;
    -[ISLivePhotoPlaybackFilter reset](&v3, sel_reset);
  }
}

- (BOOL)isTouchActive
{
  return self->_touchActive;
}

- (int64_t)_playbackRequestID
{
  return self->__playbackRequestID;
}

- (void)_setPlaybackReaquestID:(int64_t)a3
{
  self->__playbackRequestID = a3;
}

- (ISDisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void)_setDisplayLink:(id)a3
{
  self->__displayLink = (ISDisplayLink *)a3;
}

- (NSDate)_playbackStartDate
{
  return self->__playbackStartDate;
}

- (void)_setPlaybackStartDate:(id)a3
{
  objc_storeStrong((id *)&self->__playbackStartDate, a3);
}

uint64_t __52__ISTouchLivePhotoPlaybackFilter__handleDisplayLink__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHintProgress:", *(double *)(a1 + 40));
}

void __49__ISTouchLivePhotoPlaybackFilter_setTouchActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDisplayLink");

}

@end
