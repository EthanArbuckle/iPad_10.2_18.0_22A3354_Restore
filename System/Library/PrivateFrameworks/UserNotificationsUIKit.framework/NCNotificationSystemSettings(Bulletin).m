@implementation NCNotificationSystemSettings(Bulletin)

+ (id)notificationSystemSettingsForBBGlobalSettings:()Bulletin
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = (objc_class *)MEMORY[0x1E0DC6000];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheduledDeliveryEnabled:", objc_msgSend(v4, "globalScheduledDeliverySetting") == 2);
  objc_msgSend(v5, "setScheduledDeliveryUninitialized:", objc_msgSend(v4, "globalScheduledDeliverySetting") == -1);
  objc_msgSend(v5, "setScheduledDeliveryShowNextSummary:", objc_msgSend(v4, "globalScheduledDeliveryShowNextSummarySetting") == 2);
  objc_msgSend(v4, "globalScheduledDeliveryTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheduledDeliveryTimes:", v6);

  objc_msgSend(v5, "setListDisplayStyleSetting:", objc_msgSend(MEMORY[0x1E0DC6020], "listDisplayStyleSettingForBBNotificationListDisplayStyleSetting:", objc_msgSend(v4, "globalNotificationListDisplayStyleSetting")));
  objc_msgSend(v5, "setSummarizationEnabled:", objc_msgSend(v4, "globalSummarizationSetting") == 2);
  v7 = objc_msgSend(v4, "globalHighlightsSetting");

  objc_msgSend(v5, "setHighlightsEnabled:", v7 == 2);
  return v5;
}

+ (id)notificationSystemSettingsForScheduledDeliveryEnabled:()Bulletin scheduledDeliveryUninitialized:scheduledDeliveryShowNextSummary:scheduledDeliveryTimes:listDisplayStyleSetting:summarizationEnabled:highlightsEnabled:
{
  objc_class *v14;
  id v15;
  id v16;

  v14 = (objc_class *)MEMORY[0x1E0DC6000];
  v15 = a6;
  v16 = objc_alloc_init(v14);
  objc_msgSend(v16, "setScheduledDeliveryEnabled:", a3);
  objc_msgSend(v16, "setScheduledDeliveryUninitialized:", a4);
  objc_msgSend(v16, "setScheduledDeliveryShowNextSummary:", a5);
  objc_msgSend(v16, "setScheduledDeliveryTimes:", v15);

  objc_msgSend(v16, "setListDisplayStyleSetting:", a7);
  objc_msgSend(v16, "setSummarizationEnabled:", a8);
  objc_msgSend(v16, "setHighlightsEnabled:", a9);
  return v16;
}

+ (uint64_t)listDisplayStyleSettingForBBNotificationListDisplayStyleSetting:()Bulletin
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

+ (uint64_t)bbListDisplayStyleSettingForNCNotificationListDisplayStyleSetting:()Bulletin
{
  uint64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

@end
