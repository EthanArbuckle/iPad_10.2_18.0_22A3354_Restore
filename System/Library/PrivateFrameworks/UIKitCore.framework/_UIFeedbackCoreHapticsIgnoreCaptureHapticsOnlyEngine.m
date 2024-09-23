@implementation _UIFeedbackCoreHapticsIgnoreCaptureHapticsOnlyEngine

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___UIFeedbackCoreHapticsIgnoreCaptureHapticsOnlyEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7AA00 != -1)
    dispatch_once(&qword_1ECD7AA00, block);
  return (id)qword_1ECD7AA08;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(a1, "_supportsPlayingIndividualFeedback:allowsIgnoreCapture:", v4, 1))
    v5 = objc_msgSend(v4, "_effectiveFeedbackTypes") == 2;
  else
    v5 = 0;

  return v5;
}

- (id)_internal_createCoreHapticsEngine
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackCoreHapticsIgnoreCaptureHapticsOnlyEngine;
  -[_UIFeedbackCoreHapticsEngine _internal_createCoreHapticsEngine](&v7, sel__internal_createCoreHapticsEngine);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMuteHapticsWhileRecordingAudio:", 0);

    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaysHapticsOnly:", 1);

  }
  return v3;
}

@end
