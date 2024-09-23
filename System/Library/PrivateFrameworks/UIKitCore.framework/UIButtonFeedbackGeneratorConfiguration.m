@implementation UIButtonFeedbackGeneratorConfiguration

void __63___UIButtonFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v2 = _UISystemSoundIDNone;
  v3 = a2;
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 29526, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapticParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1057384038;
  objc_msgSend(v5, "setVolume:", v6);

  objc_msgSend(v3, "setInteractionStartedFeedback:", v4);
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 29526, _UISystemSoundIDNone);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1048995430;
  objc_msgSend(v7, "setVolume:", v8);

  objc_msgSend(v3, "setInteractionEndedFeedback:", v9);
}

void __65___UIButtonFeedbackGeneratorConfiguration_prominentConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v2 = _UISystemSoundIDNone;
  v3 = a2;
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 23382, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapticParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1054448026;
  objc_msgSend(v5, "setVolume:", v6);

  objc_msgSend(v3, "setInteractionStartedFeedback:", v4);
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 23382, _UISystemSoundIDNone);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1046059418;
  objc_msgSend(v7, "setVolume:", v8);

  objc_msgSend(v3, "setInteractionEndedFeedback:", v9);
}

@end
