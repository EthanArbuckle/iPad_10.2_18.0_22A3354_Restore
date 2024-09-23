@implementation FBSScene(SBSUICameraOverlaySceneClientMonitor)

- (uint64_t)cameraOverlaySceneClientMonitor
{
  uint64_t v2;

  v2 = objc_opt_class();
  return objc_msgSend(a1, "componentForExtension:ofClass:", v2, objc_opt_class());
}

@end
