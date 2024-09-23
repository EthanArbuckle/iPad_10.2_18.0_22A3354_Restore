@implementation UNCNotificationRecordMapper

- (UNCNotificationRecordMapper)initWithBundle:(id)a3 categoryRepository:(id)a4
{
  id v7;
  id v8;
  UNCNotificationRecordMapper *v9;
  UNCNotificationRecordMapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UNCNotificationRecordMapper;
  v9 = -[UNCNotificationRecordMapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundle, a3);
    objc_storeStrong((id *)&v10->_categoryRepository, a4);
  }

  return v10;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[UNCNotificationBundle bundleIdentifier](self->_bundle, "bundleIdentifier");
}

- (id)notificationForNotificationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UNSNotificationCategoryRepository *categoryRepository;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[UNCNotificationRecordMapper notificationRequestForNotificationRecord:](self, "notificationRequestForNotificationRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationBundle bundleIdentifier](self->_bundle, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  categoryRepository = self->_categoryRepository;
  objc_msgSend(v4, "categoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNSNotificationCategoryRepository categoryWithIdentifier:bundleIdentifier:](categoryRepository, "categoryWithIdentifier:bundleIdentifier:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "intentIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8818], "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:", v5, v6, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)notificationRequestForNotificationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRecordMapper _notificationContentForNotificationRecord:](self, "_notificationContentForNotificationRecord:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRecordMapper _notificationTriggerForNotificationRecord:](self, "_notificationTriggerForNotificationRecord:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "allowsDefaultDestinations") & 1) != 0)
  {
    v8 = 15;
  }
  else
  {
    if (objc_msgSend(v4, "allowsLockScreenDestination"))
      v9 = 2;
    else
      v9 = 0;
    if (objc_msgSend(v4, "allowsNotificationCenterDestination"))
      v9 |= 4uLL;
    v10 = v9 | objc_msgSend(v4, "allowsAlertDestination");
    if (objc_msgSend(v4, "allowsCarPlayDestination"))
      v8 = v10 | 8;
    else
      v8 = v10;
  }
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:destinations:", v5, v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_notificationContentForNotificationRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;

  v4 = a3;
  -[UNCNotificationRecordMapper _notificationSoundForNotificationRecord:](self, "_notificationSoundForNotificationRecord:", v4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRecordMapper _notificationIconForNotificationRecord:](self, "_notificationIconForNotificationRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRecordMapper _notificationCommunicationContextForNotificationRecord:](self, "_notificationCommunicationContextForNotificationRecord:", v4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v4, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentType:", v7);

  objc_msgSend(v6, "setCommunicationContext:", v62);
  objc_msgSend(v4, "accessoryImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryImageName:", v8);

  objc_msgSend(v4, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_map:", UNCAttachmentRecordToUNNotificationAttachment);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttachments:", v10);

  objc_msgSend(v4, "badge");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadge:", v11);

  v12 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "bodyLocalizationKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyLocalizationArguments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UNCNotificationBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBody:", v17);

  objc_msgSend(v4, "attributedBody");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedBody:", v18);

  objc_msgSend(v4, "categoryIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategoryIdentifier:", v19);

  objc_msgSend(v4, "contentDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", v20);

  v21 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "defaultActionTitleLocalizationKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UNCNotificationBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "defaultActionTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v22, MEMORY[0x24BDBD1A8], v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultActionTitle:", v25);

  objc_msgSend(v6, "setHasDefaultAction:", objc_msgSend(v4, "hasDefaultAction"));
  objc_msgSend(v4, "defaultActionURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultActionURL:", v26);

  objc_msgSend(v4, "defaultActionBundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultActionBundleIdentifier:", v27);

  objc_msgSend(v4, "expirationDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v28);

  objc_msgSend(v4, "launchImageName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLaunchImageName:", v29);

  v30 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "headerLocalizationKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerLocalizationArguments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[UNCNotificationBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "header");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeader:", v35);

  v36 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "footerLocalizationKey");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerLocalizationArguments");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[UNCNotificationBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "footer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFooter:", v41);

  objc_msgSend(v6, "setIcon:", v5);
  objc_msgSend(v6, "setSound:", v63);
  objc_msgSend(v6, "setShouldHideDate:", objc_msgSend(v4, "shouldHideDate"));
  objc_msgSend(v6, "setShouldHideTime:", objc_msgSend(v4, "shouldHideTime"));
  objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", objc_msgSend(v4, "shouldIgnoreDoNotDisturb"));
  objc_msgSend(v6, "setShouldIgnoreDowntime:", objc_msgSend(v4, "shouldIgnoreDowntime"));
  objc_msgSend(v6, "setShouldSuppressScreenLightUp:", objc_msgSend(v4, "shouldSuppressScreenLightUp"));
  objc_msgSend(v6, "setShouldAuthenticateDefaultAction:", objc_msgSend(v4, "shouldAuthenticateDefaultAction"));
  objc_msgSend(v6, "setShouldBackgroundDefaultAction:", objc_msgSend(v4, "shouldBackgroundDefaultAction"));
  objc_msgSend(v6, "setShouldPreventNotificationDismissalAfterDefaultAction:", objc_msgSend(v4, "shouldPreventNotificationDismissalAfterDefaultAction"));
  objc_msgSend(v6, "setShouldShowSubordinateIcon:", objc_msgSend(v4, "shouldShowSubordinateIcon"));
  objc_msgSend(v6, "setShouldSuppressSyncDismissalWhenRemoved:", objc_msgSend(v4, "shouldSuppressSyncDismissalWhenRemoved"));
  objc_msgSend(v6, "setShouldUseRequestIdentifierForDismissalSync:", objc_msgSend(v4, "shouldUseRequestIdentifierForDismissalSync"));
  objc_msgSend(v6, "setShouldPreemptPresentedNotification:", objc_msgSend(v4, "shouldPreemptPresentedNotification"));
  objc_msgSend(v6, "setShouldDisplayActionsInline:", objc_msgSend(v4, "shouldDisplayActionsInline"));
  v42 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "subtitleLocalizationKey");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleLocalizationArguments");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[UNCNotificationBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "subtitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v47);

  objc_msgSend(v4, "threadIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThreadIdentifier:", v48);

  v49 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "titleLocalizationKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLocalizationArguments");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[UNCNotificationBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "title");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v54);

  objc_msgSend(v4, "topicIdentifiers");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTopicIdentifiers:", v55);

  objc_msgSend(v6, "setRealertCount:", objc_msgSend(v4, "realertCount"));
  objc_msgSend(v4, "userInfo");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v56);

  objc_msgSend(v4, "summaryArgument");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSummaryArgument:", v57);

  objc_msgSend(v6, "setSummaryArgumentCount:", objc_msgSend(v4, "summaryArgumentCount"));
  objc_msgSend(v4, "targetContentIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTargetContentIdentifier:", v58);

  objc_msgSend(v6, "setInterruptionLevel:", -[UNCNotificationRecordMapper _notificationInterruptionLevelForNotificationRecord:](self, "_notificationInterruptionLevelForNotificationRecord:", v4));
  objc_msgSend(v4, "relevanceScore");
  objc_msgSend(v6, "setRelevanceScore:");
  objc_msgSend(v4, "filterCriteria");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilterCriteria:", v59);

  objc_msgSend(v6, "setScreenCaptureProhibited:", objc_msgSend(v4, "screenCaptureProhibited"));
  objc_msgSend(v4, "speechLanguage");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSpeechLanguage:", v60);
  return v6;
}

- (id)_notificationIconForNotificationRecord:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = objc_msgSend(v3, "iconShouldSuppressMask");
  objc_msgSend(v3, "iconApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDF8850];
    objc_msgSend(v3, "iconApplicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconForApplicationIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "iconPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDF8850];
      objc_msgSend(v3, "iconPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "iconAtPath:shouldSuppressMask:", v8, v4);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "iconName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v15 = (void *)MEMORY[0x24BDF8850];
        objc_msgSend(v3, "iconName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "iconNamed:shouldSuppressMask:", v8, v4);
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "iconSystemImageName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (!v17)
        {
          v19 = 0;
          goto LABEL_10;
        }
        v18 = (void *)MEMORY[0x24BDF8850];
        objc_msgSend(v3, "iconSystemImageName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "iconForSystemImageNamed:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v19 = (void *)v9;

LABEL_10:
  return v19;
}

- (id)_notificationCommunicationContextForNotificationRecord:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(uint64_t, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  if (objc_msgSend(v3, "hasCommunicationContext"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF88D0]);
    objc_msgSend(v3, "communicationContextIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);

    objc_msgSend(v3, "communicationContextAssociatedObjectUri");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAssociatedObjectUri:", v6);

    objc_msgSend(v3, "communicationContextBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBundleIdentifier:", v7);

    objc_msgSend(v3, "communicationContextDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayName:", v8);

    objc_msgSend(v3, "communicationContextRecipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_map:", UNCContactRecordToUNNotificationContact);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecipients:", v10);

    objc_msgSend(v3, "communicationContextSender");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void (**)(uint64_t, void *))UNCContactRecordToUNNotificationContact;
      objc_msgSend(v3, "communicationContextSender");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2]((uint64_t)v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSender:", v14);

    }
    objc_msgSend(v3, "communicationContextContentURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentURL:", v15);

    objc_msgSend(v3, "communicationContextImageName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageName:", v16);

    objc_msgSend(v4, "setSystemImage:", objc_msgSend(v3, "communicationContextSystemImage"));
    objc_msgSend(v4, "setMentionsCurrentUser:", objc_msgSend(v3, "communicationContextMentionsCurrentUser"));
    objc_msgSend(v4, "setNotifyRecipientAnyway:", objc_msgSend(v3, "communicationContextNotifyRecipientAnyway"));
    objc_msgSend(v4, "setReplyToCurrentUser:", objc_msgSend(v3, "communicationContextReplyToCurrentUser"));
    objc_msgSend(v4, "setRecipientCount:", objc_msgSend(v3, "communicationContextRecipientCount"));
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v3, "communicationContextCapabilities"));
    objc_msgSend(v4, "setBusinessCorrespondence:", objc_msgSend(v3, "communicationContextBusinessCorrespondence"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_notificationSoundForNotificationRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "hasSound"))
  {
    objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", objc_msgSend(v3, "toneAlertType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toneAlertTopic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlertTopic:", v5);

    objc_msgSend(v3, "audioCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAudioCategory:", v6);

    objc_msgSend(v3, "audioVolume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAudioVolume:", v7);

    objc_msgSend(v4, "setCritical:", objc_msgSend(v3, "hasCriticalAlertSound"));
    objc_msgSend(v3, "soundMaximumDuration");
    objc_msgSend(v4, "setMaximumDuration:");
    objc_msgSend(v4, "setShouldIgnoreAccessibilityDisabledVibrationSetting:", objc_msgSend(v3, "shouldIgnoreAccessibilityDisabledVibrationSetting"));
    objc_msgSend(v4, "setShouldIgnoreRingerSwitch:", objc_msgSend(v3, "shouldIgnoreRingerSwitch"));
    objc_msgSend(v4, "setShouldRepeat:", objc_msgSend(v3, "shouldSoundRepeat"));
    objc_msgSend(v3, "toneFileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToneFileName:", v8);

    objc_msgSend(v3, "toneFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToneFileURL:", v9);

    objc_msgSend(v3, "toneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToneIdentifier:", v10);

    objc_msgSend(v4, "setToneMediaLibraryItemIdentifier:", objc_msgSend(v3, "toneMediaLibraryItemIdentifier"));
    objc_msgSend(v3, "vibrationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVibrationIdentifier:", v11);

    objc_msgSend(v3, "vibrationPatternFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVibrationPatternFileURL:", v12);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_notificationTriggerForNotificationRecord:(id)a3
{
  return (*((id (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, a3);
}

- (unint64_t)_notificationInterruptionLevelForNotificationRecord:(id)a3
{
  return objc_msgSend(a3, "interruptionLevel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
