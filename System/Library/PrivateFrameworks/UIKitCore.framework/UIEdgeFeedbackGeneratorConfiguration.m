@implementation UIEdgeFeedbackGeneratorConfiguration

void __60___UIEdgeFeedbackGeneratorConfiguration_sliderConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractingThresholdFeedback:", v2);

  objc_msgSend(v3, "setUserInteractingThresholdFeedbackUpdateBlock:", &__block_literal_global_155);
  objc_msgSend(v3, "setHidFeedbackPatternName:", 0x1E171F860);

}

void __60___UIEdgeFeedbackGeneratorConfiguration_sliderConfiguration__block_invoke_2(double a1, uint64_t a2, void *a3)
{
  float v3;
  double v4;
  id v5;

  if (a1 < 0.0)
    a1 = -a1;
  v3 = fmin(fmax(a1 * 0.0005, 0.3), 0.6);
  objc_msgSend(a3, "hapticParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setVolume:", v4);

}

void __71___UIEdgeFeedbackGeneratorConfiguration_swipePresentationConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimatingThresholdFeedback:", v2);

  objc_msgSend(v4, "setAnimatingThresholdFeedbackUpdateBlock:", &__block_literal_global_159_0);
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractingThresholdFeedback:", v3);

  objc_msgSend(v4, "setUserInteractingThresholdFeedbackUpdateBlock:", &__block_literal_global_160_0);
}

void __71___UIEdgeFeedbackGeneratorConfiguration_swipePresentationConfiguration__block_invoke_2(double a1, uint64_t a2, void *a3)
{
  float v3;
  double v4;
  id v5;

  if (a1 < 0.0)
    a1 = -a1;
  v3 = fmin(fmax(a1 * 0.00025, 0.4), 0.4);
  objc_msgSend(a3, "hapticParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setVolume:", v4);

}

void __71___UIEdgeFeedbackGeneratorConfiguration_swipePresentationConfiguration__block_invoke_3(double a1, uint64_t a2, void *a3)
{
  float v3;
  double v4;
  id v5;

  if (a1 < 0.0)
    a1 = -a1;
  v3 = fmin(fmax(a1 * 0.00025, 0.4), 0.4);
  objc_msgSend(a3, "hapticParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setVolume:", v4);

}

void __59___UIEdgeFeedbackGeneratorConfiguration__zoomConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  id v5;

  v2 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0.5;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v2, "setUserInteractingReleaseFeedback:", v5);
  objc_msgSend(v2, "setHidFeedbackPatternName:", 0x1E1720840);

}

@end
