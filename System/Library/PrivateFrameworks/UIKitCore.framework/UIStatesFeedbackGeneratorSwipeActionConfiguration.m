@implementation UIStatesFeedbackGeneratorSwipeActionConfiguration

void __74___UIStatesFeedbackGeneratorSwipeActionConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
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
  id v14;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = a2;
  objc_msgSend(v2, "dictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyFromState:toState:", 0, CFSTR("confirm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(_UIFeedbackStateChangeConfiguration);
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1060320051;
  objc_msgSend(v7, "setVolume:", v8);

  -[_UIFeedbackStateChangeConfiguration setThresholdFeedback:](v5, "setThresholdFeedback:", v6);
  -[_UIFeedbackStateChangeConfiguration setHidThresholdFeedbackPatternName:](v5, "setHidThresholdFeedbackPatternName:", 0x1E16F1720);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, v4);

  objc_msgSend((id)objc_opt_class(), "keyFromState:toState:", CFSTR("confirm"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(_UIFeedbackStateChangeConfiguration);
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hapticParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1057803469;
  objc_msgSend(v12, "setVolume:", v13);

  -[_UIFeedbackStateChangeConfiguration setThresholdFeedback:](v10, "setThresholdFeedback:", v11);
  -[_UIFeedbackStateChangeConfiguration setHidThresholdFeedbackPatternName:](v10, "setHidThresholdFeedbackPatternName:", 0x1E16F1720);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v9);

  objc_msgSend(v3, "setStateChangeConfigurations:", v14);
}

@end
