@implementation PXStoryPacingAutoIncrementingTimeSource

- (PXStoryPacingAutoIncrementingTimeSource)initWithLayoutQueue:(id)a3
{
  id v5;
  PXStoryPacingAutoIncrementingTimeSource *v6;
  PXStoryPacingAutoIncrementingTimeSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPacingAutoIncrementingTimeSource;
  v6 = -[PXStoryPacingAutoIncrementingTimeSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layoutQueue, a3);

  return v7;
}

- (PXStoryPacingAutoIncrementingTimeSource)init
{
  return -[PXStoryPacingAutoIncrementingTimeSource initWithLayoutQueue:](self, "initWithLayoutQueue:", MEMORY[0x1E0C80D38]);
}

- (BOOL)isRealTime
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      -[PXStoryPacingAutoIncrementingTimeSource layoutQueue](self, "layoutQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0C80D38];

      if (v4 == v5)
      {
        v8 = (id)objc_msgSend(objc_alloc((Class)off_1E50B2330), "initWithWeakTarget:selector:", self, sel__handlePlayLink_);
      }
      else
      {
        v6 = objc_alloc((Class)off_1E50B1780);
        -[PXStoryPacingAutoIncrementingTimeSource layoutQueue](self, "layoutQueue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v6, "initWithWeakTarget:selector:queue:", self, sel__handlePlayLink_, v7);

      }
      -[PXStoryPacingAutoIncrementingTimeSource setPlayLink:](self, "setPlayLink:", v8);

    }
    else
    {
      -[PXStoryPacingAutoIncrementingTimeSource setPlayLink:](self, "setPlayLink:", 0);
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v7;
  void *v8;

  -[PXStoryPacingAutoIncrementingTimeSource pacingClock](self, "pacingClock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXStoryPacingAutoIncrementingTimeSource pacingClock](self, "pacingClock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "currentTime");
      v7 = v8;
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }

  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return result;
}

- (void)setPlayLink:(id)a3
{
  PXDisplayLinkProtocol *v5;
  PXDisplayLinkProtocol *v6;
  PXDisplayLinkProtocol **p_playLink;
  PXDisplayLinkProtocol *playLink;
  PXDisplayLinkProtocol *v9;

  v5 = (PXDisplayLinkProtocol *)a3;
  playLink = self->_playLink;
  p_playLink = &self->_playLink;
  v6 = playLink;
  if (playLink != v5)
  {
    v9 = v5;
    -[PXDisplayLinkProtocol invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_playLink, a3);
    v5 = v9;
  }

}

- (void)_handlePlayLink:(id)a3
{
  id v4;
  Float64 v5;
  void *v6;
  CMTime v7;
  CMTime v8;

  v4 = a3;
  if (-[PXStoryPacingAutoIncrementingTimeSource isActive](self, "isActive"))
  {
    memset(&v8, 0, sizeof(v8));
    objc_msgSend(v4, "resolvedDuration");
    CMTimeMakeWithSeconds(&v8, v5, 600);
    -[PXStoryPacingAutoIncrementingTimeSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    objc_msgSend(v6, "timeSource:didIncrementByTime:", self, &v7);

  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (PXStoryPacingTimeSourceDelegate)delegate
{
  return (PXStoryPacingTimeSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (PXStoryPacingClock)pacingClock
{
  return (PXStoryPacingClock *)objc_loadWeakRetained((id *)&self->_pacingClock);
}

- (void)setPacingClock:(id)a3
{
  objc_storeWeak((id *)&self->_pacingClock, a3);
}

- (PXDisplayLinkProtocol)playLink
{
  return self->_playLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playLink, 0);
  objc_destroyWeak((id *)&self->_pacingClock);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
