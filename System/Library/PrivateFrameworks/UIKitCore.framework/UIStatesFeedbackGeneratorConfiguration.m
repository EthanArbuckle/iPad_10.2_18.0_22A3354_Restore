@implementation UIStatesFeedbackGeneratorConfiguration

void __59___UIStatesFeedbackGeneratorConfiguration_feedbackKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a2;
  NSStringFromSelector(sel_stateChangeConfigurations);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_thresholdFeedback);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@.%@"), v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = *(void **)(a1 + 32);
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_stateChangeConfigurations);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_approachFeedback);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@.%@"), v13, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v12);
}

void __73___UIStatesFeedbackGeneratorConfiguration_hidFeedbackPatternNameKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  NSStringFromSelector(sel_stateChangeConfigurations);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hidThresholdFeedbackPatternName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), v7, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v6);
}

void __81___UIStatesFeedbackGeneratorConfiguration__alternateFeedback_forDevice_senderID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v12 = v6;
  objc_msgSend(v6, "thresholdFeedback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(v12, "hidThresholdFeedbackPatternName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

@end
