@implementation _UIFeedbackCoreHapticsHapticsOnlyEngine

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___UIFeedbackCoreHapticsHapticsOnlyEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7A9E0 != -1)
    dispatch_once(&qword_1ECD7A9E0, block);
  return (id)qword_1ECD7A9E8;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  id v4;
  int v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "_supportsPlayingIndividualFeedback:allowsIgnoreCapture:", v4, 0);
  v6 = 0;
  if (v5)
    v6 = objc_msgSend(v4, "_effectiveFeedbackTypes") == 2;

  return v6;
}

- (id)_internal_createCoreHapticsEngine
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackCoreHapticsHapticsOnlyEngine;
  -[_UIFeedbackCoreHapticsEngine _internal_createCoreHapticsEngine](&v6, sel__internal_createCoreHapticsEngine);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlaysHapticsOnly:", 1);

  }
  return v3;
}

@end
