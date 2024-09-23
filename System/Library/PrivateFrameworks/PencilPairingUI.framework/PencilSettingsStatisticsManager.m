@implementation PencilSettingsStatisticsManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  return (id)sharedInstance_sSharedStats;
}

void __49__PencilSettingsStatisticsManager_sharedInstance__block_invoke()
{
  PencilSettingsStatisticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(PencilSettingsStatisticsManager);
  v1 = (void *)sharedInstance_sSharedStats;
  sharedInstance_sSharedStats = (uint64_t)v0;

}

- (void)recordSetPencilPerferredAction:(int64_t)a3
{
  __CFString *v3;
  void *v4;

  if ((unint64_t)a3 > 4)
    v3 = 0;
  else
    v3 = off_24F4E5970[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __66__PencilSettingsStatisticsManager_recordSetPencilPerferredAction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("DoubleTap");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordOnlyUsePencilToggle:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("OnlyUsePencilToggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __61__PencilSettingsStatisticsManager_recordOnlyUsePencilToggle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("OnlyUsePencilValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordDrawPencilForTextInputToggle:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("PencilForTextInputToggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __70__PencilSettingsStatisticsManager_recordDrawPencilForTextInputToggle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("PencilForTextInputValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordEducationPanelChanged:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PencilSettingsStatisticsManager stringForElementType:](self, "stringForElementType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("PencilEducationInteraction.panelChange"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __63__PencilSettingsStatisticsManager_recordEducationPanelChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("ElementType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordEducationPencilInputInteraction:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PencilSettingsStatisticsManager stringForElementType:](self, "stringForElementType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("PencilEducationInteraction.pencilInput"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __73__PencilSettingsStatisticsManager_recordEducationPencilInputInteraction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("ElementType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordHandwritingEducationPanelChanged:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PencilSettingsStatisticsManager stringForHandwritingElementType:](self, "stringForHandwritingElementType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("PencilHandwritingEducationInteraction.panelChange"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __74__PencilSettingsStatisticsManager_recordHandwritingEducationPanelChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("HandwritingElementType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordHandwritingEducationPencilInputInteraction:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PencilSettingsStatisticsManager stringForHandwritingElementType:](self, "stringForHandwritingElementType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("PencilHandwritingEducationInteraction.pencilInput"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __84__PencilSettingsStatisticsManager_recordHandwritingEducationPencilInputInteraction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("HandwritingElementType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordEducationPencilDidShow:(double)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("PencilEducation.didShow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __64__PencilSettingsStatisticsManager_recordEducationPencilDidShow___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v5[1] = CFSTR("duration");
  v6[0] = v1;
  v5[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)recordScreenshotFromCornerToggle:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("ScreenshotFromCornerToggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __68__PencilSettingsStatisticsManager_recordScreenshotFromCornerToggle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("ScreenshotFromCornerValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordPaperFromCornerToggle:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("PaperFromCornerToggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __63__PencilSettingsStatisticsManager_recordPaperFromCornerToggle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("PaperFromCornerValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordHoverPreview:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("HoverPreviewToggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __54__PencilSettingsStatisticsManager_recordHoverPreview___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("HoverPreviewValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordHoverShadow:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("HoverShadowToggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __53__PencilSettingsStatisticsManager_recordHoverShadow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("HoverShadowValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordHoverDoubleTap:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PencilPairingAndSettings.%@"), CFSTR("HoverDoubleTapToggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __56__PencilSettingsStatisticsManager_recordHoverDoubleTap___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("HoverDoubleTapValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)stringForElementType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_24F4E5998[a3];
}

- (id)stringForHandwritingElementType:(int64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("AutoRefine");
}

@end
