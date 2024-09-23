@implementation UNCNotificationCategoryRecord

- (UNCNotificationCategoryRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  UNCNotificationCategoryRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)UNCNotificationCategoryRecord;
  v5 = -[UNCNotificationCategoryRecord init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Actions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_map:", UNSDictionaryToNotificationActionRecord);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setActions:](v5, "setActions:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("BackgroundStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setBackgroundStyle:](v5, "setBackgroundStyle:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("HasCustomDismissAction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setHasCustomDismissAction:](v5, "setHasCustomDismissAction:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("HasFollowActivityAction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setHasFollowActivityAction:](v5, "setHasFollowActivityAction:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("HasCustomSilenceAction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setHasCustomSilenceAction:](v5, "setHasCustomSilenceAction:", objc_msgSend(v11, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setIdentifier:](v5, "setIdentifier:", v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("IntentIdentifiers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setIntentIdentifiers:](v5, "setIntentIdentifiers:", v13);

    objc_msgSend(v4, "objectForKey:", CFSTR("ListPriority"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setListPriority:](v5, "setListPriority:", v14);

    objc_msgSend(v4, "objectForKey:", CFSTR("MinimalActions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_map:", UNSDictionaryToNotificationActionRecord);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setMinimalActions:](v5, "setMinimalActions:", v16);

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldAllowInCarPlay"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setShouldAllowInCarPlay:](v5, "setShouldAllowInCarPlay:", objc_msgSend(v17, "BOOLValue"));

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "objectForKey:", CFSTR("PrivateBody"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_secureDecodedFromData:withAdditionalClasses:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPrivateBody:](v5, "setPrivateBody:", v21);

    objc_msgSend(v4, "objectForKey:", CFSTR("PrivacyOptionShowTitle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPrivacyOptionShowTitle:](v5, "setPrivacyOptionShowTitle:", objc_msgSend(v22, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PrivacyOptionShowSubtitle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPrivacyOptionShowSubtitle:](v5, "setPrivacyOptionShowSubtitle:", objc_msgSend(v23, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PreventAutomaticRemovalFromRecent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPreventAutomaticRemovalFromRecent:](v5, "setPreventAutomaticRemovalFromRecent:", objc_msgSend(v24, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("RevealAdditionalContentOnPresentation"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setRevealAdditionalContentWhenPresented:](v5, "setRevealAdditionalContentWhenPresented:", objc_msgSend(v25, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PreventAutomaticLock"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPreventAutomaticLock:](v5, "setPreventAutomaticLock:", objc_msgSend(v26, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PreventDismissWhenClosed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPreventDismissWhenClosed:](v5, "setPreventDismissWhenClosed:", objc_msgSend(v27, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PresentFullScreenAlertOverList"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPresentFullScreenAlertOverList:](v5, "setPresentFullScreenAlertOverList:", objc_msgSend(v28, "BOOLValue"));

    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "objectForKey:", CFSTR("SummaryFormat"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bs_secureDecodedFromData:withAdditionalClasses:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setSummaryFormat:](v5, "setSummaryFormat:", v32);

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldAllowActionsInCarPlay"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setShouldAllowActionsInCarPlay:](v5, "setShouldAllowActionsInCarPlay:", objc_msgSend(v33, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldAllowPersistentBannersInCarPlay"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setShouldAllowPersistentBannersInCarPlay:](v5, "setShouldAllowPersistentBannersInCarPlay:", objc_msgSend(v34, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PlayMediaWhenRaised"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPlayMediaWhenRaised:](v5, "setPlayMediaWhenRaised:", objc_msgSend(v35, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PreventClearFromList"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setPreventClearFromList:](v5, "setPreventClearFromList:", objc_msgSend(v36, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("AlwaysDisplayNotificationsIndicator"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setAlwaysDisplayNotificationsIndicator:](v5, "setAlwaysDisplayNotificationsIndicator:", objc_msgSend(v37, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SuppressDelayForForwardedNotifications"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setSuppressDelayForForwardedNotifications:](v5, "setSuppressDelayForForwardedNotifications:", objc_msgSend(v38, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SuppressDismissActionInCarPlay"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setSuppressDismissActionInCarPlay:](v5, "setSuppressDismissActionInCarPlay:", objc_msgSend(v39, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SuppressPresentationInAmbient"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationCategoryRecord setSuppressPresentationInAmbient:](v5, "setSuppressPresentationInAmbient:", objc_msgSend(v40, "BOOLValue"));

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationCategoryRecord actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", UNCNotificationActionRecordToDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v5, CFSTR("Actions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord hasCustomDismissAction](self, "hasCustomDismissAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v6, CFSTR("HasCustomDismissAction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord hasFollowActivityAction](self, "hasFollowActivityAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v7, CFSTR("HasFollowActivityAction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord hasCustomSilenceAction](self, "hasCustomSilenceAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v8, CFSTR("HasCustomSilenceAction"));

  -[UNCNotificationCategoryRecord identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v9, CFSTR("Identifier"));

  -[UNCNotificationCategoryRecord intentIdentifiers](self, "intentIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v10, CFSTR("IntentIdentifiers"));

  -[UNCNotificationCategoryRecord minimalActions](self, "minimalActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bs_map:", UNCNotificationActionRecordToDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v12, CFSTR("MinimalActions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord shouldAllowInCarPlay](self, "shouldAllowInCarPlay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v13, CFSTR("ShouldAllowInCarPlay"));

  -[UNCNotificationCategoryRecord privateBody](self, "privateBody");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_secureEncoded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v15, CFSTR("PrivateBody"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord privacyOptionShowTitle](self, "privacyOptionShowTitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v16, CFSTR("PrivacyOptionShowTitle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord privacyOptionShowSubtitle](self, "privacyOptionShowSubtitle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v17, CFSTR("PrivacyOptionShowSubtitle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord preventAutomaticRemovalFromRecent](self, "preventAutomaticRemovalFromRecent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v18, CFSTR("PreventAutomaticRemovalFromRecent"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord revealAdditionalContentWhenPresented](self, "revealAdditionalContentWhenPresented"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v19, CFSTR("RevealAdditionalContentOnPresentation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord preventAutomaticLock](self, "preventAutomaticLock"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v20, CFSTR("PreventAutomaticLock"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord preventDismissWhenClosed](self, "preventDismissWhenClosed"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v21, CFSTR("PreventDismissWhenClosed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord presentFullScreenAlertOverList](self, "presentFullScreenAlertOverList"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v22, CFSTR("PresentFullScreenAlertOverList"));

  -[UNCNotificationCategoryRecord summaryFormat](self, "summaryFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bs_secureEncoded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v24, CFSTR("SummaryFormat"));

  -[UNCNotificationCategoryRecord backgroundStyle](self, "backgroundStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v25, CFSTR("BackgroundStyle"));

  -[UNCNotificationCategoryRecord listPriority](self, "listPriority");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v26, CFSTR("ListPriority"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord shouldAllowActionsInCarPlay](self, "shouldAllowActionsInCarPlay"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v27, CFSTR("ShouldAllowActionsInCarPlay"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v28, CFSTR("ShouldAllowPersistentBannersInCarPlay"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v29, CFSTR("PlayMediaWhenRaised"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v30, CFSTR("PreventClearFromList"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v31, CFSTR("AlwaysDisplayNotificationsIndicator"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v32, CFSTR("SuppressDelayForForwardedNotifications"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v33, CFSTR("SuppressDismissActionInCarPlay"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationCategoryRecord suppressPresentationInAmbient](self, "suppressPresentationInAmbient"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v34, CFSTR("SuppressPresentationInAmbient"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationCategoryRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Identifier"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord hasCustomDismissAction](self, "hasCustomDismissAction"), CFSTR("HasCustomDismissAction"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord hasFollowActivityAction](self, "hasFollowActivityAction"), CFSTR("HasFollowActivityAction"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord hasCustomSilenceAction](self, "hasCustomSilenceAction"), CFSTR("HasCustomSilenceAction"));
  -[UNCNotificationCategoryRecord actions](self, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("Actions"));

  -[UNCNotificationCategoryRecord listPriority](self, "listPriority");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("ListPriority"));

  -[UNCNotificationCategoryRecord minimalActions](self, "minimalActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("MinimalActions"));

  -[UNCNotificationCategoryRecord intentIdentifiers](self, "intentIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("IntentIdentifiers"));

  v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord shouldAllowInCarPlay](self, "shouldAllowInCarPlay"), CFSTR("ShouldAllowInCarPlay"));
  -[UNCNotificationCategoryRecord privateBody](self, "privateBody");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("PrivateBody"));

  v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord privacyOptionShowTitle](self, "privacyOptionShowTitle"), CFSTR("PrivacyOptionShowTitle"));
  v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord privacyOptionShowSubtitle](self, "privacyOptionShowSubtitle"), CFSTR("PrivacyOptionShowSubtitle"));
  v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventAutomaticRemovalFromRecent](self, "preventAutomaticRemovalFromRecent"), CFSTR("PreventAutomaticRemovalFromRecent"));
  v23 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord revealAdditionalContentWhenPresented](self, "revealAdditionalContentWhenPresented"), CFSTR("RevealAdditionalContentOnPresentation"));
  v24 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventAutomaticLock](self, "preventAutomaticLock"), CFSTR("PreventAutomaticLock"));
  v25 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord presentFullScreenAlertOverList](self, "presentFullScreenAlertOverList"), CFSTR("PresentFullScreenAlertOverList"));
  v26 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventDismissWhenClosed](self, "preventDismissWhenClosed"), CFSTR("PreventDismissWhenClosed"));
  -[UNCNotificationCategoryRecord summaryFormat](self, "summaryFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v3, "appendObject:withName:", v27, CFSTR("SummaryFormat"));

  -[UNCNotificationCategoryRecord backgroundStyle](self, "backgroundStyle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendObject:withName:", v29, CFSTR("BackgroundStyle"));

  v31 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord shouldAllowActionsInCarPlay](self, "shouldAllowActionsInCarPlay"), CFSTR("ShouldAllowActionsInCarPlay"));
  v32 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"), CFSTR("ShouldAllowPersistentBannersInCarPlay"));
  v33 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"), CFSTR("PlayMediaWhenRaised"));
  v34 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"), CFSTR("PreventClearFromList"));
  v35 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"), CFSTR("AlwaysDisplayNotificationsIndicator"));
  v36 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"), CFSTR("SuppressDelayForForwardedNotifications"));
  v37 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"), CFSTR("SuppressDismissActionInCarPlay"));
  v38 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord suppressPresentationInAmbient](self, "suppressPresentationInAmbient"), CFSTR("SuppressPresentationInAmbient"));
  objc_msgSend(v3, "build");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  _BOOL4 v48;

  v4 = a3;
  if (!v4)
    goto LABEL_27;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_27;
  -[UNCNotificationCategoryRecord actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNEqualObjects();

  if (!v8)
    goto LABEL_27;
  v9 = -[UNCNotificationCategoryRecord hasCustomDismissAction](self, "hasCustomDismissAction");
  if (v9 != objc_msgSend(v4, "hasCustomDismissAction"))
    goto LABEL_27;
  v10 = -[UNCNotificationCategoryRecord hasFollowActivityAction](self, "hasFollowActivityAction");
  if (v10 != objc_msgSend(v4, "hasFollowActivityAction"))
    goto LABEL_27;
  v11 = -[UNCNotificationCategoryRecord hasCustomSilenceAction](self, "hasCustomSilenceAction");
  if (v11 != objc_msgSend(v4, "hasCustomSilenceAction"))
    goto LABEL_27;
  -[UNCNotificationCategoryRecord identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = UNEqualObjects();

  if (!v14)
    goto LABEL_27;
  -[UNCNotificationCategoryRecord intentIdentifiers](self, "intentIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = UNEqualObjects();

  if (!v17)
    goto LABEL_27;
  -[UNCNotificationCategoryRecord listPriority](self, "listPriority");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listPriority");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = UNEqualObjects();

  if (!v20)
    goto LABEL_27;
  -[UNCNotificationCategoryRecord minimalActions](self, "minimalActions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimalActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = UNEqualObjects();

  if (!v23)
    goto LABEL_27;
  v24 = -[UNCNotificationCategoryRecord shouldAllowInCarPlay](self, "shouldAllowInCarPlay");
  if (v24 != objc_msgSend(v4, "shouldAllowInCarPlay"))
    goto LABEL_27;
  -[UNCNotificationCategoryRecord privateBody](self, "privateBody");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateBody");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = UNEqualObjects();

  if (!v27)
    goto LABEL_27;
  v28 = -[UNCNotificationCategoryRecord privacyOptionShowTitle](self, "privacyOptionShowTitle");
  if (v28 != objc_msgSend(v4, "privacyOptionShowTitle"))
    goto LABEL_27;
  v29 = -[UNCNotificationCategoryRecord privacyOptionShowSubtitle](self, "privacyOptionShowSubtitle");
  if (v29 != objc_msgSend(v4, "privacyOptionShowSubtitle"))
    goto LABEL_27;
  v30 = -[UNCNotificationCategoryRecord preventAutomaticRemovalFromRecent](self, "preventAutomaticRemovalFromRecent");
  if (v30 != objc_msgSend(v4, "preventAutomaticRemovalFromRecent"))
    goto LABEL_27;
  v31 = -[UNCNotificationCategoryRecord revealAdditionalContentWhenPresented](self, "revealAdditionalContentWhenPresented");
  if (v31 != objc_msgSend(v4, "revealAdditionalContentWhenPresented"))
    goto LABEL_27;
  v32 = -[UNCNotificationCategoryRecord preventDismissWhenClosed](self, "preventDismissWhenClosed");
  if (v32 != objc_msgSend(v4, "preventDismissWhenClosed"))
    goto LABEL_27;
  -[UNCNotificationCategoryRecord summaryFormat](self, "summaryFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = UNEqualObjects();

  if (!v35)
    goto LABEL_27;
  -[UNCNotificationCategoryRecord backgroundStyle](self, "backgroundStyle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundStyle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = UNEqualObjects();

  if (!v38)
    goto LABEL_27;
  v39 = -[UNCNotificationCategoryRecord shouldAllowActionsInCarPlay](self, "shouldAllowActionsInCarPlay");
  if (v39 == objc_msgSend(v4, "shouldAllowActionsInCarPlay")
    && (v40 = -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"), v40 == objc_msgSend(v4, "shouldAllowPersistentBannersInCarPlay"))&& (v41 = -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"), v41 == objc_msgSend(v4, "playMediaWhenRaised"))&& (v42 = -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"), v42 == objc_msgSend(v4, "preventClearFromList"))&& (v43 = -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"), v43 == objc_msgSend(v4, "alwaysDisplayNotificationsIndicator"))&& (v44 = -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"), v44 == objc_msgSend(v4, "suppressDelayForForwardedNotifications"))&& (v45 = -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"), v45 == objc_msgSend(v4, "suppressDismissActionInCarPlay")))
  {
    v48 = -[UNCNotificationCategoryRecord suppressPresentationInAmbient](self, "suppressPresentationInAmbient");
    v46 = v48 ^ objc_msgSend(v4, "suppressPresentationInAmbient") ^ 1;
  }
  else
  {
LABEL_27:
    LOBYTE(v46) = 0;
  }

  return v46;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord hasCustomDismissAction](self, "hasCustomDismissAction"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord hasFollowActivityAction](self, "hasFollowActivityAction"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord hasCustomSilenceAction](self, "hasCustomSilenceAction"));
  v7 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord shouldAllowInCarPlay](self, "shouldAllowInCarPlay"));
  v8 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord privacyOptionShowTitle](self, "privacyOptionShowTitle"));
  v9 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord privacyOptionShowSubtitle](self, "privacyOptionShowSubtitle"));
  -[UNCNotificationCategoryRecord listPriority](self, "listPriority");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventAutomaticRemovalFromRecent](self, "preventAutomaticRemovalFromRecent"));
  v13 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord revealAdditionalContentWhenPresented](self, "revealAdditionalContentWhenPresented"));
  v14 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventAutomaticLock](self, "preventAutomaticLock"));
  v15 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventDismissWhenClosed](self, "preventDismissWhenClosed"));
  v16 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord presentFullScreenAlertOverList](self, "presentFullScreenAlertOverList"));
  v17 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord shouldAllowActionsInCarPlay](self, "shouldAllowActionsInCarPlay"));
  v18 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"));
  -[UNCNotificationCategoryRecord actions](self, "actions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendObject:", v19);

  -[UNCNotificationCategoryRecord identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendObject:", v21);

  -[UNCNotificationCategoryRecord intentIdentifiers](self, "intentIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v3, "appendObject:", v23);

  -[UNCNotificationCategoryRecord minimalActions](self, "minimalActions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v3, "appendObject:", v25);

  -[UNCNotificationCategoryRecord privateBody](self, "privateBody");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v3, "appendObject:", v27);

  -[UNCNotificationCategoryRecord summaryFormat](self, "summaryFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendObject:", v29);

  -[UNCNotificationCategoryRecord backgroundStyle](self, "backgroundStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v3, "appendObject:", v31);

  v33 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"));
  v34 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"));
  v35 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"));
  v36 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"));
  v37 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"));
  v38 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord suppressPresentationInAmbient](self, "suppressPresentationInAmbient"));
  v39 = objc_msgSend(v3, "hash");

  return v39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCNotificationCategoryRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

- (UNCNotificationCategoryRecord)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UNCNotificationCategoryRecord *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UNCNotificationCategoryRecord initWithDictionaryRepresentation:]([UNCNotificationCategoryRecord alloc], "initWithDictionaryRepresentation:", v8);
  return v9;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasCustomDismissAction
{
  return self->_hasCustomDismissAction;
}

- (void)setHasCustomDismissAction:(BOOL)a3
{
  self->_hasCustomDismissAction = a3;
}

- (BOOL)hasFollowActivityAction
{
  return self->_hasFollowActivityAction;
}

- (void)setHasFollowActivityAction:(BOOL)a3
{
  self->_hasFollowActivityAction = a3;
}

- (BOOL)hasCustomSilenceAction
{
  return self->_hasCustomSilenceAction;
}

- (void)setHasCustomSilenceAction:(BOOL)a3
{
  self->_hasCustomSilenceAction = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (void)setIntentIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)minimalActions
{
  return self->_minimalActions;
}

- (void)setMinimalActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldAllowInCarPlay
{
  return self->_shouldAllowInCarPlay;
}

- (void)setShouldAllowInCarPlay:(BOOL)a3
{
  self->_shouldAllowInCarPlay = a3;
}

- (BOOL)privacyOptionShowTitle
{
  return self->_privacyOptionShowTitle;
}

- (void)setPrivacyOptionShowTitle:(BOOL)a3
{
  self->_privacyOptionShowTitle = a3;
}

- (BOOL)privacyOptionShowSubtitle
{
  return self->_privacyOptionShowSubtitle;
}

- (void)setPrivacyOptionShowSubtitle:(BOOL)a3
{
  self->_privacyOptionShowSubtitle = a3;
}

- (BOOL)preventAutomaticRemovalFromRecent
{
  return self->_preventAutomaticRemovalFromRecent;
}

- (void)setPreventAutomaticRemovalFromRecent:(BOOL)a3
{
  self->_preventAutomaticRemovalFromRecent = a3;
}

- (BOOL)revealAdditionalContentWhenPresented
{
  return self->_revealAdditionalContentWhenPresented;
}

- (void)setRevealAdditionalContentWhenPresented:(BOOL)a3
{
  self->_revealAdditionalContentWhenPresented = a3;
}

- (BOOL)preventAutomaticLock
{
  return self->_preventAutomaticLock;
}

- (void)setPreventAutomaticLock:(BOOL)a3
{
  self->_preventAutomaticLock = a3;
}

- (BOOL)preventDismissWhenClosed
{
  return self->_preventDismissWhenClosed;
}

- (void)setPreventDismissWhenClosed:(BOOL)a3
{
  self->_preventDismissWhenClosed = a3;
}

- (BOOL)presentFullScreenAlertOverList
{
  return self->_presentFullScreenAlertOverList;
}

- (void)setPresentFullScreenAlertOverList:(BOOL)a3
{
  self->_presentFullScreenAlertOverList = a3;
}

- (BOOL)shouldAllowActionsInCarPlay
{
  return self->_shouldAllowActionsInCarPlay;
}

- (void)setShouldAllowActionsInCarPlay:(BOOL)a3
{
  self->_shouldAllowActionsInCarPlay = a3;
}

- (BOOL)shouldAllowPersistentBannersInCarPlay
{
  return self->_shouldAllowPersistentBannersInCarPlay;
}

- (void)setShouldAllowPersistentBannersInCarPlay:(BOOL)a3
{
  self->_shouldAllowPersistentBannersInCarPlay = a3;
}

- (BOOL)playMediaWhenRaised
{
  return self->_playMediaWhenRaised;
}

- (void)setPlayMediaWhenRaised:(BOOL)a3
{
  self->_playMediaWhenRaised = a3;
}

- (BOOL)preventClearFromList
{
  return self->_preventClearFromList;
}

- (void)setPreventClearFromList:(BOOL)a3
{
  self->_preventClearFromList = a3;
}

- (BOOL)alwaysDisplayNotificationsIndicator
{
  return self->_alwaysDisplayNotificationsIndicator;
}

- (void)setAlwaysDisplayNotificationsIndicator:(BOOL)a3
{
  self->_alwaysDisplayNotificationsIndicator = a3;
}

- (BOOL)suppressDelayForForwardedNotifications
{
  return self->_suppressDelayForForwardedNotifications;
}

- (void)setSuppressDelayForForwardedNotifications:(BOOL)a3
{
  self->_suppressDelayForForwardedNotifications = a3;
}

- (BOOL)suppressDismissActionInCarPlay
{
  return self->_suppressDismissActionInCarPlay;
}

- (void)setSuppressDismissActionInCarPlay:(BOOL)a3
{
  self->_suppressDismissActionInCarPlay = a3;
}

- (BOOL)suppressPresentationInAmbient
{
  return self->_suppressPresentationInAmbient;
}

- (void)setSuppressPresentationInAmbient:(BOOL)a3
{
  self->_suppressPresentationInAmbient = a3;
}

- (NSString)privateBody
{
  return self->_privateBody;
}

- (void)setPrivateBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)summaryFormat
{
  return self->_summaryFormat;
}

- (void)setSummaryFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)listPriority
{
  return self->_listPriority;
}

- (void)setListPriority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listPriority, 0);
  objc_storeStrong((id *)&self->_backgroundStyle, 0);
  objc_storeStrong((id *)&self->_summaryFormat, 0);
  objc_storeStrong((id *)&self->_privateBody, 0);
  objc_storeStrong((id *)&self->_minimalActions, 0);
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
