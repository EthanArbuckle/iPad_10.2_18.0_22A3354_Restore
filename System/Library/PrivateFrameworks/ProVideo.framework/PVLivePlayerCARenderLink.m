@implementation PVLivePlayerCARenderLink

- (PVLivePlayerCARenderLink)initWithCADisplayLinkFPS:(int64_t)a3
{
  PVLivePlayerCARenderLink *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PVLivePlayerCARenderLink;
  result = -[PVLivePlayerRenderLink init](&v5, sel_init);
  if (result)
    result->_prefferedCADisplayFPS = a3;
  return result;
}

- (void)setPrefferedCADisplayFPS:(int64_t)a3
{
  HGSynchronizable *lock;
  char v6;
  CAFrameRateRange v7;

  lock = self->super._lock;
  v6 = 0;
  HGSynchronizable::Lock(lock);
  self->_prefferedCADisplayFPS = a3;
  v7 = CAFrameRateRangeMake((float)a3, (float)a3, (float)a3);
  -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
  HGSynchronizer::~HGSynchronizer(&lock);
}

- (int64_t)prefferedCADisplayFPS
{
  int64_t prefferedCADisplayFPS;
  HGSynchronizable *lock;
  char v6;

  lock = self->super._lock;
  v6 = 0;
  HGSynchronizable::Lock(lock);
  prefferedCADisplayFPS = self->_prefferedCADisplayFPS;
  HGSynchronizer::~HGSynchronizer(&lock);
  return prefferedCADisplayFPS;
}

- (void)teardown
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)rebuild
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;
  CAFrameRateRange v7;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

    v7 = CAFrameRateRangeMake((float)self->_prefferedCADisplayFPS, (float)self->_prefferedCADisplayFPS, (float)self->_prefferedCADisplayFPS);
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
  }
}

- (void)displayLinkFired:(id)a3
{
  Float64 v4;
  CMTime v5;
  CMTime v6;

  memset(&v6, 0, sizeof(v6));
  -[CADisplayLink timestamp](self->_displayLink, "timestamp", a3);
  CMTimeMakeWithSeconds(&v6, v4, -[PVLivePlayerCARenderLink prefferedCADisplayFPS](self, "prefferedCADisplayFPS"));
  v5 = v6;
  -[PVLivePlayerRenderLink signalPlayer:](self, "signalPlayer:", &v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
