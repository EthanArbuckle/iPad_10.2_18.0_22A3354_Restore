@implementation UIImpactFeedbackGeneratorConfiguration

void __61___UIImpactFeedbackGeneratorConfiguration_rigidConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1062417203;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v5, "setFeedback:", v2);
  objc_msgSend(v5, "setMinimumInterval:", 0.0);

}

void __61___UIImpactFeedbackGeneratorConfiguration_lightConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1060320051;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v5, "setFeedback:", v2);
  objc_msgSend(v5, "setMinimumInterval:", 0.0);

}

void __63___UIImpactFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1060320051;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v5, "setFeedback:", v2);
  objc_msgSend(v5, "setMinimumInterval:", 0.0);

}

void __62___UIImpactFeedbackGeneratorConfiguration_strongConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1061997773;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v5, "setFeedback:", v2);
  objc_msgSend(v5, "setMinimumInterval:", 0.0);

}

void __60___UIImpactFeedbackGeneratorConfiguration_softConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1061830001;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v5, "setFeedback:", v2);
  objc_msgSend(v5, "setMinimumInterval:", 0.0);

}

void __63___UIImpactFeedbackGeneratorConfiguration_refreshConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1060320051;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v5, "setFeedback:", v2);
  objc_msgSend(v5, "setHidFeedbackPatternName:", 0x1E171AC60);
  objc_msgSend(v5, "setMinimumInterval:", 0.0);

}

@end
