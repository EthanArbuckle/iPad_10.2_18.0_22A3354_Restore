@implementation UIDragSnappingFeedbackGeneratorConfiguration

void __69___UIDragSnappingFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v12 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInteractionStartedFeedback:", v2);

  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapticParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1058642330;
  objc_msgSend(v4, "setVolume:", v5);

  objc_msgSend(v12, "setInteractionEndedFeedback:", v3);
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1061997773;
  objc_msgSend(v7, "setVolume:", v8);

  objc_msgSend(v12, "setTargetUpdatedFeedback:", v6);
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hapticParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1058642330;
  objc_msgSend(v10, "setVolume:", v11);

  objc_msgSend(v12, "setObjectSnappedFeedback:", v9);
  objc_msgSend(v12, "setHidObjectSnappedFeedbackPatternName:", 0x1E1720820);

}

@end
