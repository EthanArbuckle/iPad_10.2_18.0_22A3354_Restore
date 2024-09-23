@implementation UIClickFeedbackGeneratorConfiguration

void __62___UIClickFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v2 = a2;
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 23382, 1519);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapticParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "setVolume:", v5);

  objc_msgSend(v3, "setHapticOutputMode:", 3);
  objc_msgSend(v3, "_setCategory:", 0x1E1721EC0);
  objc_msgSend(v2, "setClickDownFeedback:", v3);

  _UIClickAudioFeedback(0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClickDownAudioFeedback:", v6);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 23382, 1519);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hapticParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1.0;
  objc_msgSend(v8, "setVolume:", v9);

  objc_msgSend(v7, "setHapticOutputMode:", 3);
  objc_msgSend(v7, "_setCategory:", 0x1E1721EC0);
  objc_msgSend(v2, "setClickUpFeedback:", v7);

  _UIClickAudioFeedback(0.4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClickUpAudioFeedback:", v10);

}

@end
