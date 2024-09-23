@implementation UIDragFeedbackGeneratorConfiguration

void __61___UIDragFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteractionStartedFeedback:", v2);

  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapticParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1058642330;
  objc_msgSend(v4, "setVolume:", v5);

  objc_msgSend(v9, "setInteractionEndedFeedback:", v3);
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1061997773;
  objc_msgSend(v7, "setVolume:", v8);

  objc_msgSend(v9, "setTargetUpdatedFeedback:", v6);
  objc_msgSend(v9, "setHidTargetUpdatedFeedbackPatternName:", 0x1E1720820);

}

@end
