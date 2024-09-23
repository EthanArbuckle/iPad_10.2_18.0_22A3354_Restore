@implementation AmbientPhotoFramePlayergroundViewController.AmbientPlaygroundRenderer

- (UIView)backgroundView
{
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AAC92C14();

  return (UIView *)v3;
}

- (UIView)foregroundView
{
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AAC92C50();

  return (UIView *)v3;
}

- (UIView)floatingView
{
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AAC92C8C();

  return (UIView *)v3;
}

- (void)px_noteContentSignificantlyChanged
{
  CGSizeMake(self);
}

- (id)px_extendRenderSessionForReason:(id)a3
{
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer *v4;
  id v5;

  sub_1AB08D498();
  v4 = self;
  v5 = sub_1AAC92D08();

  swift_bridgeObjectRelease();
  return v5;
}

- (void)px_updatePreferences:(id)a3
{
  void *v4;
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1AAC92D8C((uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer)init
{
  sub_1AAC92EB8();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
