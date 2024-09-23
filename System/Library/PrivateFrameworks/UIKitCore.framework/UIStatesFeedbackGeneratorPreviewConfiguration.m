@implementation UIStatesFeedbackGeneratorPreviewConfiguration

void __70___UIStatesFeedbackGeneratorPreviewConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _UIFeedbackStateChangeConfiguration *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _UIFeedbackStateChangeConfiguration *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  _UIFeedbackStateChangeConfiguration *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = a2;
  objc_msgSend(v2, "dictionary");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyFromState:toState:", 0, CFSTR("preview"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(_UIFeedbackStateChangeConfiguration);
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 20309, 1519);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1064094925;
  objc_msgSend(v7, "setVolume:", v8);

  objc_msgSend(v6, "_setCategory:", 0x1E1721EC0);
  -[_UIFeedbackStateChangeConfiguration setThresholdFeedback:](v5, "setThresholdFeedback:", v6);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v5, v4);

  objc_msgSend((id)objc_opt_class(), "keyFromState:toState:", 0, CFSTR("commit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(_UIFeedbackStateChangeConfiguration);
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 20311, 1520);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hapticParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1062417203;
  objc_msgSend(v12, "setVolume:", v13);

  objc_msgSend(v11, "_setCategory:", 0x1E1721EC0);
  -[_UIFeedbackStateChangeConfiguration setThresholdFeedback:](v10, "setThresholdFeedback:", v11);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, v9);

  objc_msgSend((id)objc_opt_class(), "keyFromState:toState:", 0, CFSTR("cancel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(_UIFeedbackStateChangeConfiguration);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_feedbackSupportLevel");

  if (v17 < 2)
  {
    +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1521);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UIFeedbackPattern feedbackPattern](_UIFeedbackPattern, "feedbackPattern");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 20309, _UISystemSoundIDNone);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addFeedback:atTime:", v19, 0.0);

    +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 20309, _UISystemSoundIDNone);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addFeedback:atTime:", v20, 0.07);

    +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 20309, _UISystemSoundIDNone);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addFeedback:atTime:", v21, 0.14);

    objc_msgSend(v18, "_setCategory:", 0x1E1721EC0);
  }
  -[_UIFeedbackStateChangeConfiguration setThresholdFeedback:](v15, "setThresholdFeedback:", v18);

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, v14);
  objc_msgSend(v3, "setStateChangeConfigurations:", v22);

}

@end
