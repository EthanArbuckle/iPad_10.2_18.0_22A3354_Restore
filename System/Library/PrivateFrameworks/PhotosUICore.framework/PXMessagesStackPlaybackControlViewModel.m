@implementation PXMessagesStackPlaybackControlViewModel

- (void)setSettled:(BOOL)a3
{
  if (self->_settled != a3)
  {
    self->_settled = a3;
    -[PXMessagesStackPlaybackControlViewModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setCurrentItem:(int64_t)a3
{
  if (self->_currentItem != a3)
  {
    self->_currentItem = a3;
    -[PXMessagesStackPlaybackControlViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setVideoController:(id)a3
{
  PXGDisplayAssetVideoPresentationController *v5;
  PXGDisplayAssetVideoPresentationController *v6;

  v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  if (self->_videoController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_videoController, a3);
    -[PXMessagesStackPlaybackControlViewModel signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (BOOL)isSettled
{
  return self->_settled;
}

- (int64_t)currentItem
{
  return self->_currentItem;
}

- (PXGDisplayAssetVideoPresentationController)videoController
{
  return self->_videoController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoController, 0);
}

@end
