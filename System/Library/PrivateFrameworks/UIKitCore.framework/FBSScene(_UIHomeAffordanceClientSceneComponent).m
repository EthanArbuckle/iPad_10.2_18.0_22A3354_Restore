@implementation FBSScene(_UIHomeAffordanceClientSceneComponent)

- (id)_homeAffordanceClientSceneComponent
{
  uint64_t v2;
  void *v3;

  if (_os_feature_enabled_impl() && _UIDeviceSupportsGlobalEdgeSwipeTouches())
  {
    v2 = objc_opt_class();
    objc_msgSend(a1, "componentForExtension:ofClass:", v2, objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
