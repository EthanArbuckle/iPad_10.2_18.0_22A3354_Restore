@implementation PVLivePlayerCameraSource

- (PVLivePlayerCameraSource)init
{
  PVLivePlayerCameraSource *v2;
  HGSynchronizable *v3;
  PVFrameSet *mostRecentFrameSet;
  PVLivePlayerCameraRenderLink *renderLink;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVLivePlayerCameraSource;
  v2 = -[PVLivePlayerCameraSource init](&v7, sel_init);
  if (v2)
  {
    v3 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v3);
    mostRecentFrameSet = v2->_mostRecentFrameSet;
    v2->_lock = v3;
    v2->_mostRecentFrameSet = 0;

    renderLink = v2->_renderLink;
    v2->_renderLink = 0;

  }
  return v2;
}

- (void)dealloc
{
  HGSynchronizable *lock;
  objc_super v4;

  lock = self->_lock;
  if (lock)
    (*((void (**)(HGSynchronizable *, SEL))lock->var0 + 1))(lock, a2);
  v4.receiver = self;
  v4.super_class = (Class)PVLivePlayerCameraSource;
  -[PVLivePlayerCameraSource dealloc](&v4, sel_dealloc);
}

- (void)cameraFrameSetRecieved:(id)a3
{
  id v5;
  PVLivePlayerCameraRenderLink *v6;
  HGSynchronizable *lock;
  char v8;

  v5 = a3;
  lock = self->_lock;
  v8 = 0;
  HGSynchronizable::Lock(lock);
  objc_storeStrong((id *)&self->_mostRecentFrameSet, a3);
  v6 = self->_renderLink;
  HGSynchronizer::~HGSynchronizer(&lock);
  if (v6)
    -[PVLivePlayerCameraRenderLink cameraSourceRecievedFrameSet:](v6, "cameraSourceRecievedFrameSet:", v5);

}

- (void)cameraFrameSetDropped
{
  PVLivePlayerCameraRenderLink *v3;
  HGSynchronizable *lock;
  char v5;

  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  v3 = self->_renderLink;
  HGSynchronizer::~HGSynchronizer(&lock);
  if (v3)
    -[PVLivePlayerCameraRenderLink cameraSourceDroppedFrame](v3, "cameraSourceDroppedFrame");

}

- (void)registerRenderLink:(id)a3
{
  PVLivePlayerCameraRenderLink *v4;
  PVLivePlayerCameraRenderLink *renderLink;
  HGSynchronizable *lock;
  char v7;

  v4 = (PVLivePlayerCameraRenderLink *)a3;
  lock = self->_lock;
  v7 = 0;
  HGSynchronizable::Lock(lock);
  renderLink = self->_renderLink;
  self->_renderLink = v4;

  HGSynchronizer::~HGSynchronizer(&lock);
}

- (id)imageBufferForHostTime:(double)a3
{
  PVFrameSet *v4;
  HGSynchronizable *lock;
  char v7;

  lock = self->_lock;
  v7 = 0;
  HGSynchronizable::Lock(lock);
  v4 = self->_mostRecentFrameSet;
  HGSynchronizer::~HGSynchronizer(&lock);
  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderLink, 0);
  objc_storeStrong((id *)&self->_mostRecentFrameSet, 0);
}

@end
