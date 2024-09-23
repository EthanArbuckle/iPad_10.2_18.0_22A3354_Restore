@implementation PVLivePlayerCameraRenderLink

- (PVLivePlayerCameraRenderLink)initWithPlayerCameraSource:(id)a3
{
  id v4;
  PVLivePlayerCameraRenderLink *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PVLivePlayerCameraRenderLink;
  v5 = -[PVLivePlayerRenderLink init](&v7, sel_init);
  if (v5)
    objc_msgSend(v4, "registerRenderLink:", v5);

  return v5;
}

- (void)cameraSourceRecievedFrameSet:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[3];

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "presentationTimeStamp");
  else
    memset(v6, 0, sizeof(v6));
  -[PVLivePlayerRenderLink signalPlayer:](self, "signalPlayer:", v6);

}

@end
