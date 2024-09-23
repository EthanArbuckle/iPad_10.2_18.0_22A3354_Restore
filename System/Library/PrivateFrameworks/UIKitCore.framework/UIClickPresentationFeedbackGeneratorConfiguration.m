@implementation UIClickPresentationFeedbackGeneratorConfiguration

void __70___UIClickPresentationFeedbackGeneratorConfiguration_previewedPattern__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  +[_UIFeedbackPattern feedbackPattern](_UIFeedbackPattern, "feedbackPattern");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1260;
  _MergedGlobals_1260 = v0;

  objc_msgSend((id)_MergedGlobals_1260, "_setCategory:", 0x1E1721EC0);
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 23382, 1519);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hapticParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setVolume:", v3);

  objc_msgSend(v11, "setHapticOutputMode:", 3);
  objc_msgSend(v11, "_setCategory:", 0x1E1721EC0);
  if (v11)
    objc_msgSend((id)_MergedGlobals_1260, "addFeedback:atTime:", v11, 0.0);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_feedbackSupportLevel");

  if (v5 >= 2)
  {
    +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 32555, _UISystemSoundIDNone);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = *(_DWORD *)"\nף=";
    objc_msgSend(v7, "setVolume:", v8);

    objc_msgSend(v6, "audioParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1036831949;
    objc_msgSend(v9, "setTransposition:", v10);

    if (v6)
    {
      objc_msgSend((id)_MergedGlobals_1260, "addFeedback:atTime:", v6, 0.0);

    }
  }

}

void __68___UIClickPresentationFeedbackGeneratorConfiguration_draggedPattern__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  id v5;

  +[_UIFeedbackPattern feedbackPattern](_UIFeedbackPattern, "feedbackPattern");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD81BF0;
  qword_1ECD81BF0 = v0;

  objc_msgSend((id)qword_1ECD81BF0, "_setCategory:", 0x1E1721EC0);
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 8023, 1519);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapticParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1055957975;
  objc_msgSend(v2, "setVolume:", v3);

  objc_msgSend(v5, "setHapticOutputMode:", 3);
  objc_msgSend(v5, "_setCategory:", 0x1E1721EC0);
  v4 = v5;
  if (v5)
  {
    objc_msgSend((id)qword_1ECD81BF0, "addFeedback:atTime:", v5, 0.0);
    v4 = v5;
  }

}

@end
