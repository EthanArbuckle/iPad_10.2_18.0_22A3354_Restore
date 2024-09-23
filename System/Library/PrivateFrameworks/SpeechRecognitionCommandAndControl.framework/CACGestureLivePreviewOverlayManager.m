@implementation CACGestureLivePreviewOverlayManager

- (void)showGestureLivePreviewViewer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __67__CACGestureLivePreviewOverlayManager_showGestureLivePreviewViewer__block_invoke_2;
  v2[3] = &unk_24F2AB258;
  v2[4] = self;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", &__block_literal_global_5, v2);
}

CACGestureLivePreviewViewController *__67__CACGestureLivePreviewOverlayManager_showGestureLivePreviewViewer__block_invoke()
{
  return objc_alloc_init(CACGestureLivePreviewViewController);
}

uint64_t __67__CACGestureLivePreviewOverlayManager_showGestureLivePreviewViewer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setGestureViewController:", a2);
}

- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[CACGestureLivePreviewOverlayManager gestureViewController](self, "gestureViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPointsToLiveRecordingGesturePreviewByFingerIdentifier:forces:atTime:", v9, v8, a5);

}

- (void)removeTrackingForFingerIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACGestureLivePreviewOverlayManager gestureViewController](self, "gestureViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTrackingForFingerIdentifier:", v4);

}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)isPhysiciallyInteractiveOverlay
{
  return 1;
}

- (CACGestureLivePreviewViewController)gestureViewController
{
  return self->_gestureViewController;
}

- (void)setGestureViewController:(id)a3
{
  objc_storeStrong((id *)&self->_gestureViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureViewController, 0);
}

@end
