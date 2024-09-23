@implementation UISelectionFeedbackGeneratorConfiguration

void __66___UISelectionFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
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
  LODWORD(v4) = 1053609165;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v2, "setFeedback:", v5);
  objc_msgSend(v2, "setHidFeedbackPatternName:", 0x1E17207A0);
  objc_msgSend(v2, "setMinimumInterval:", 0.04);

}

void __64___UISelectionFeedbackGeneratorConfiguration_lightConfiguration__block_invoke(uint64_t a1, void *a2)
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
  LODWORD(v4) = 1050253722;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v2, "setFeedback:", v5);
  objc_msgSend(v2, "setHidFeedbackPatternName:", 0x1E17207A0);
  objc_msgSend(v2, "setMinimumInterval:", 0.04);

}

void __65___UISelectionFeedbackGeneratorConfiguration_strongConfiguration__block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(v2, "setFeedback:", v5);
  objc_msgSend(v2, "setHidFeedbackPatternName:", 0x1E17207C0);
  objc_msgSend(v2, "setMinimumInterval:", 0.04);

}

void __65___UISelectionFeedbackGeneratorConfiguration_pickerConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  id v5;

  v2 = a2;
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 32556, 1157);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapticParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0.5;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v5, "_setCategory:", 0x1E1721EE0);
  objc_msgSend(v2, "setFeedback:", v5);
  objc_msgSend(v2, "setHidFeedbackPatternName:", 0);
  objc_msgSend(v2, "setMinimumInterval:", 0.04);
  objc_msgSend(v2, "setMaxSpeed:", 50.0);
  objc_msgSend(v2, "setSlowAudioVolume:", 0.2);
  objc_msgSend(v2, "setFastAudioVolume:", 0.3);
  objc_msgSend(v2, "setSlowHapticVolume:", 0.4);
  objc_msgSend(v2, "setFastHapticVolume:", 0.5);

}

void __70___UISelectionFeedbackGeneratorConfiguration_pageControlConfiguration__block_invoke(uint64_t a1, void *a2)
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
  LODWORD(v4) = 1053609165;
  objc_msgSend(v3, "setVolume:", v4);

  objc_msgSend(v2, "setFeedback:", v5);
  objc_msgSend(v2, "setHidFeedbackPatternName:", CFSTR("page_control_selection"));
  objc_msgSend(v2, "setMinimumInterval:", 0.04);

}

@end
