@implementation UNSNotificationRecord

- (UNSNotificationRecord)init
{
  return -[UNSNotificationRecord initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", MEMORY[0x24BDBD1B8]);
}

- (UNSNotificationRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  UNSNotificationRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(uint64_t, void *);
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  objc_super v146;

  v4 = a3;
  v146.receiver = self;
  v146.super_class = (Class)UNSNotificationRecord;
  v5 = -[UNSNotificationRecord init](&v146, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("NotificationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setContentType:](v5, "setContentType:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextIdentifier:](v5, "setCommunicationContextIdentifier:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextBundleIdentifier:](v5, "setCommunicationContextBundleIdentifier:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextAssociatedObjectUri"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextAssociatedObjectUri:](v5, "setCommunicationContextAssociatedObjectUri:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextDisplayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextDisplayName:](v5, "setCommunicationContextDisplayName:", v10);

    objc_msgSend(v4, "unc_nonNilArrayForKey:", CFSTR("CommunicationContextRecipients"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bs_map:", UNCDictionaryToContactRecord);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextRecipients:](v5, "setCommunicationContextRecipients:", v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextSender"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void (**)(uint64_t, void *))UNCDictionaryToContactRecord;
      objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextSender"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2]((uint64_t)v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationRecord setCommunicationContextSender:](v5, "setCommunicationContextSender:", v16);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextContentURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextContentURL:](v5, "setCommunicationContextContentURL:", v17);

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextImageName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextImageName:](v5, "setCommunicationContextImageName:", v18);

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextSystemImage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextSystemImage:](v5, "setCommunicationContextSystemImage:", objc_msgSend(v19, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextMentionsCurrentUser"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextMentionsCurrentUser:](v5, "setCommunicationContextMentionsCurrentUser:", objc_msgSend(v20, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextNotifyRecipientAnyway"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextNotifyRecipientAnyway:](v5, "setCommunicationContextNotifyRecipientAnyway:", objc_msgSend(v21, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextReplyToCurrentUser"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextReplyToCurrentUser:](v5, "setCommunicationContextReplyToCurrentUser:", objc_msgSend(v22, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextRecipientCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextRecipientCount:](v5, "setCommunicationContextRecipientCount:", objc_msgSend(v23, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextCapabilities"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextCapabilities:](v5, "setCommunicationContextCapabilities:", objc_msgSend(v24, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CommunicationContextBusinessCorrespondence"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCommunicationContextBusinessCorrespondence:](v5, "setCommunicationContextBusinessCorrespondence:", objc_msgSend(v25, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("AccessoryImageName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAccessoryImageName:](v5, "setAccessoryImageName:", v26);

    objc_msgSend(v4, "unc_nonNilArrayForKey:", CFSTR("AppNotificationAttachments"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bs_map:", UNSDictionaryToAttachmentRecord);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAttachments:](v5, "setAttachments:", v28);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationBadgeNumber"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setBadge:](v5, "setBadge:", v29);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationMessage"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setBody:](v5, "setBody:", v30);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationMessageLocalizationArguments"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setBodyLocalizationArguments:](v5, "setBodyLocalizationArguments:", v31);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationMessageLocazationKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setBodyLocalizationKey:](v5, "setBodyLocalizationKey:", v32);

    v33 = (void *)MEMORY[0x24BDD1458];
    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationAttributedMessage"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_un_attributedStringWithRTFDData:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAttributedBody:](v5, "setAttributedBody:", v35);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationSummaryArgument"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setSummaryArgument:](v5, "setSummaryArgument:", v36);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationSummaryArgumentCount"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setSummaryArgumentCount:](v5, "setSummaryArgumentCount:", objc_msgSend(v37, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("TargetContentIdentifier"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTargetContentIdentifier:](v5, "setTargetContentIdentifier:", v38);

    objc_msgSend(v4, "unc_safeCastNonNilStringForKey:", CFSTR("SBSPushStoreNotificationCategoryKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setCategoryIdentifier:](v5, "setCategoryIdentifier:", v39);

    objc_msgSend(v4, "objectForKey:", CFSTR("ContentDate"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setContentDate:](v5, "setContentDate:", v40);

    objc_msgSend(v4, "unc_safeCastNonNilStringForKey:", CFSTR("SBSPushStoreNotificationThreadKey"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setThreadIdentifier:](v5, "setThreadIdentifier:", v41);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationContentAvailable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setContentAvailable:](v5, "setContentAvailable:", v42);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationMutableContent"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setMutableContent:](v5, "setMutableContent:", v43);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationCreationDate"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setDate:](v5, "setDate:", v44);

    objc_msgSend(v4, "objectForKey:", CFSTR("ExpirationDate"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setExpirationDate:](v5, "setExpirationDate:", v45);

    objc_msgSend(v4, "objectForKey:", CFSTR("InterruptionLevel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("InterruptionLevel"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "unsignedIntValue");

    }
    else
    {
      v48 = *MEMORY[0x24BDF8A80];
    }

    -[UNSNotificationRecord setInterruptionLevel:](v5, "setInterruptionLevel:", v48);
    objc_msgSend(v4, "objectForKey:", CFSTR("HasDefaultActionKey"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setHasDefaultAction:](v5, "setHasDefaultAction:", objc_msgSend(v49, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationActionText"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setDefaultActionTitle:](v5, "setDefaultActionTitle:", v50);

    -[UNSNotificationRecord setDefaultActionTitleLocalizationKey:](v5, "setDefaultActionTitleLocalizationKey:", 0);
    objc_msgSend(v4, "objectForKey:", CFSTR("DefaultActionURL"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v4, "objectForKey:", CFSTR("DefaultActionURL"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "URLWithString:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationRecord setDefaultActionURL:](v5, "setDefaultActionURL:", v54);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("DefaultActionBundleIdentifier"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setDefaultActionBundleIdentifier:](v5, "setDefaultActionBundleIdentifier:", v55);

    objc_msgSend(v4, "objectForKey:", CFSTR("CriticalAlertSound"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setHasCriticalAlertSound:](v5, "setHasCriticalAlertSound:", objc_msgSend(v56, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Header"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setHeader:](v5, "setHeader:", v57);

    objc_msgSend(v4, "objectForKey:", CFSTR("HeaderLocalizationArguments"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setHeaderLocalizationArguments:](v5, "setHeaderLocalizationArguments:", v58);

    objc_msgSend(v4, "objectForKey:", CFSTR("HeaderLocalizationKey"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setHeaderLocalizationKey:](v5, "setHeaderLocalizationKey:", v59);

    objc_msgSend(v4, "objectForKey:", CFSTR("Footer"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setFooter:](v5, "setFooter:", v60);

    objc_msgSend(v4, "objectForKey:", CFSTR("FooterLocalizationArguments"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setFooterLocalizationArguments:](v5, "setFooterLocalizationArguments:", v61);

    objc_msgSend(v4, "objectForKey:", CFSTR("FooterLocalizationKey"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setFooterLocalizationKey:](v5, "setFooterLocalizationKey:", v62);

    objc_msgSend(v4, "objectForKey:", CFSTR("IconApplicationIdentifier"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setIconApplicationIdentifier:](v5, "setIconApplicationIdentifier:", v63);

    objc_msgSend(v4, "objectForKey:", CFSTR("IconName"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setIconName:](v5, "setIconName:", v64);

    objc_msgSend(v4, "objectForKey:", CFSTR("IconPath"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setIconPath:](v5, "setIconPath:", v65);

    objc_msgSend(v4, "objectForKey:", CFSTR("IconSystemImageName"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setIconSystemImageName:](v5, "setIconSystemImageName:", v66);

    objc_msgSend(v4, "objectForKey:", CFSTR("IconShouldSuppressMask"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setIconShouldSuppressMask:](v5, "setIconShouldSuppressMask:", objc_msgSend(v67, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationIdentifier"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setIdentifier:](v5, "setIdentifier:", v68);

    objc_msgSend(v4, "unc_safeCastNonNilStringForKey:", CFSTR("AppNotificationLaunchImage"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setLaunchImageName:](v5, "setLaunchImageName:", v69);

    objc_msgSend(v4, "objectForKey:", CFSTR("RequestDate"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setRequestDate:](v5, "setRequestDate:", v70);

    objc_msgSend(v4, "objectForKey:", CFSTR("BadgeApplicationIcon"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldBadgeApplicationIcon:](v5, "setShouldBadgeApplicationIcon:", objc_msgSend(v71, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldHideDate"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldHideDate:](v5, "setShouldHideDate:", objc_msgSend(v72, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldHideTime"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldHideTime:](v5, "setShouldHideTime:", objc_msgSend(v73, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldIgnoreAccessibilityDisabledVibrationSetting"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldIgnoreAccessibilityDisabledVibrationSetting:](v5, "setShouldIgnoreAccessibilityDisabledVibrationSetting:", objc_msgSend(v74, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldIgnoreDoNotDisturb"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldIgnoreDoNotDisturb:](v5, "setShouldIgnoreDoNotDisturb:", objc_msgSend(v75, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldIgnoreDowntime"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldIgnoreDowntime:](v5, "setShouldIgnoreDowntime:", objc_msgSend(v76, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SoundShouldIgnoreRingerSwitch"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldIgnoreRingerSwitch:](v5, "setShouldIgnoreRingerSwitch:", objc_msgSend(v77, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldSuppressScreenLightUp"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldSuppressScreenLightUp:](v5, "setShouldSuppressScreenLightUp:", objc_msgSend(v78, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SoundShouldRepeat"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldSoundRepeat:](v5, "setShouldSoundRepeat:", objc_msgSend(v79, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SoundMaximumDuration"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "doubleValue");
    -[UNSNotificationRecord setSoundMaximumDuration:](v5, "setSoundMaximumDuration:");

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldPlaySound"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldPlaySound:](v5, "setShouldPlaySound:", objc_msgSend(v81, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldPresentAlert"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldPresentAlert:](v5, "setShouldPresentAlert:", objc_msgSend(v82, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("PresentationOptions"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setPresentationOptions:](v5, "setPresentationOptions:", objc_msgSend(v83, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldAuthenticateDefaultAction"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldAuthenticateDefaultAction:](v5, "setShouldAuthenticateDefaultAction:", objc_msgSend(v84, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldBackgroundDefaultAction"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldBackgroundDefaultAction:](v5, "setShouldBackgroundDefaultAction:", objc_msgSend(v85, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldPreventNotificationDismissalAfterDefaultAction"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldPreventNotificationDismissalAfterDefaultAction:](v5, "setShouldPreventNotificationDismissalAfterDefaultAction:", objc_msgSend(v86, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationShouldShowSubordinateIcon"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldShowSubordinateIcon:](v5, "setShouldShowSubordinateIcon:", objc_msgSend(v87, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldSuppressSyncDismissalWhenRemoved"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldSuppressSyncDismissalWhenRemoved:](v5, "setShouldSuppressSyncDismissalWhenRemoved:", objc_msgSend(v88, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldUseRequestIdentifierForDismissalSync"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldUseRequestIdentifierForDismissalSync:](v5, "setShouldUseRequestIdentifierForDismissalSync:", objc_msgSend(v89, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldPreemptPresentedNotification"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldPreemptPresentedNotification:](v5, "setShouldPreemptPresentedNotification:", objc_msgSend(v90, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldDisplayActionsInline"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setShouldDisplayActionsInline:](v5, "setShouldDisplayActionsInline:", objc_msgSend(v91, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("AudioCategory"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAudioCategory:](v5, "setAudioCategory:", v92);

    objc_msgSend(v4, "objectForKey:", CFSTR("AudioVolume"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAudioVolume:](v5, "setAudioVolume:", v93);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationSubtitle"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setSubtitle:](v5, "setSubtitle:", v94);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationSubtitleLocalizationArguments"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setSubtitleLocalizationArguments:](v5, "setSubtitleLocalizationArguments:", v95);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationSubtitleLocalizationKey"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setSubtitleLocalizationKey:](v5, "setSubtitleLocalizationKey:", v96);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationTitle"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTitle:](v5, "setTitle:", v97);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationTitleLocalizationArguments"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTitleLocalizationArguments:](v5, "setTitleLocalizationArguments:", v98);

    objc_msgSend(v4, "objectForKey:", CFSTR("AppNotificationTitleLocalizationKey"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTitleLocalizationKey:](v5, "setTitleLocalizationKey:", v99);

    objc_msgSend(v4, "objectForKey:", CFSTR("ToneAlertTopic"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setToneAlertTopic:](v5, "setToneAlertTopic:", v100);

    objc_msgSend(v4, "objectForKey:", CFSTR("ToneAlertType"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setToneAlertType:](v5, "setToneAlertType:", objc_msgSend(v101, "integerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ToneFileName"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setToneFileName:](v5, "setToneFileName:", v102);

    objc_msgSend(v4, "objectForKey:", CFSTR("ToneFileURL"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      v104 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v4, "objectForKey:", CFSTR("ToneFileURL"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "URLWithString:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationRecord setToneFileURL:](v5, "setToneFileURL:", v106);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("ToneIdentifier"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setToneIdentifier:](v5, "setToneIdentifier:", v107);

    objc_msgSend(v4, "objectForKey:", CFSTR("ToneMediaLibraryItemIdentifier"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setToneMediaLibraryItemIdentifier:](v5, "setToneMediaLibraryItemIdentifier:", objc_msgSend(v108, "unsignedLongLongValue"));

    objc_msgSend(v4, "unc_nonNilSetForKey:", CFSTR("Topics"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTopicIdentifiers:](v5, "setTopicIdentifiers:", v109);

    objc_msgSend(v4, "objectForKey:", CFSTR("RealertCount"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setRealertCount:](v5, "setRealertCount:", objc_msgSend(v110, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationDefaultDestinations"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAllowsDefaultDestinations:](v5, "setAllowsDefaultDestinations:", objc_msgSend(v111, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationLockScreenDestination"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAllowsLockScreenDestination:](v5, "setAllowsLockScreenDestination:", objc_msgSend(v112, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationNotificationCenterDestination"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAllowsNotificationCenterDestination:](v5, "setAllowsNotificationCenterDestination:", objc_msgSend(v113, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationAlertDestination"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAllowsAlertDestination:](v5, "setAllowsAlertDestination:", objc_msgSend(v114, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationCarPlayDestination"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setAllowsCarPlayDestination:](v5, "setAllowsCarPlayDestination:", objc_msgSend(v115, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerDate"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTriggerDate:](v5, "setTriggerDate:", v116);

    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerDateComponents"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTriggerDateComponents:](v5, "setTriggerDateComponents:", v117);

    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerRegion"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
    {
      v119 = (void *)MEMORY[0x24BDBFAD0];
      objc_msgSend(v4, "objectForKey:", CFSTR("TriggerRegion"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "bs_secureDecodedFromData:", v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationRecord setTriggerRegion:](v5, "setTriggerRegion:", v121);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerRepeatCalendar"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTriggerRepeatCalendarIdentifier:](v5, "setTriggerRepeatCalendarIdentifier:", v122);

    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerRepeatInterval"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTriggerRepeatInterval:](v5, "setTriggerRepeatInterval:", objc_msgSend(v123, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerRepeats"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTriggerRepeats:](v5, "setTriggerRepeats:", objc_msgSend(v124, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerTimeInterval"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "doubleValue");
    -[UNSNotificationRecord setTriggerTimeInterval:](v5, "setTriggerTimeInterval:");

    objc_msgSend(v4, "objectForKey:", CFSTR("TriggerTimeZone"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (v126)
    {
      v127 = (void *)MEMORY[0x24BDBCF38];
      objc_msgSend(v4, "objectForKey:", CFSTR("TriggerTimeZone"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "timeZoneWithName:", v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationRecord setTriggerTimeZone:](v5, "setTriggerTimeZone:", v129);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationTriggerType"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setTriggerType:](v5, "setTriggerType:", v130);

    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationUserInfo"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setUserInfo:](v5, "setUserInfo:", v131);

    objc_msgSend(v4, "objectForKey:", CFSTR("VibrationIdentifier"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setVibrationIdentifier:](v5, "setVibrationIdentifier:", v132);

    objc_msgSend(v4, "objectForKey:", CFSTR("VibrationPatternFileURL"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (v133)
    {
      v134 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v4, "objectForKey:", CFSTR("VibrationPatternFileURL"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "URLWithString:", v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationRecord setVibrationPatternFileURL:](v5, "setVibrationPatternFileURL:", v136);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationRelevanceScore"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "doubleValue");
    -[UNSNotificationRecord setRelevanceScore:](v5, "setRelevanceScore:");

    objc_msgSend(v4, "objectForKey:", CFSTR("FilterCriteria"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setFilterCriteria:](v5, "setFilterCriteria:", v138);

    objc_msgSend(v4, "objectForKey:", CFSTR("ScreenCaptureProhibited"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setScreenCaptureProhibited:](v5, "setScreenCaptureProhibited:", objc_msgSend(v139, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SpeechLanguage"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setSpeechLanguage:](v5, "setSpeechLanguage:", v140);

    objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("RevisionNumber"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setRevisionNumber:](v5, "setRevisionNumber:", objc_msgSend(v141, "integerValue"));

    objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("PipelineState"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setPipelineState:](v5, "setPipelineState:", objc_msgSend(v142, "integerValue"));

    -[UNSNotificationRecord setIsHighlight:](v5, "setIsHighlight:", objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("IsHighlight")));
    objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("Summary"), objc_opt_class());
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setSummary:](v5, "setSummary:", v143);

    objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("EventBehavior"), objc_opt_class());
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord setEventBehavior:](v5, "setEventBehavior:", v144);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return -[UNSNotificationRecord dictionaryRepresentationWithTruncation:](self, "dictionaryRepresentationWithTruncation:", 0);
}

- (id)dictionaryRepresentationWithTruncation:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(uint64_t, void *);
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;

  if (a3)
    v4 = 256;
  else
    v4 = -1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSNotificationRecord contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v6, CFSTR("NotificationType"));

  -[UNSNotificationRecord communicationContextIdentifier](self, "communicationContextIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v7, CFSTR("CommunicationContextIdentifier"));

  -[UNSNotificationRecord communicationContextBundleIdentifier](self, "communicationContextBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v8, CFSTR("CommunicationContextBundleIdentifier"));

  -[UNSNotificationRecord communicationContextAssociatedObjectUri](self, "communicationContextAssociatedObjectUri");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v9, CFSTR("CommunicationContextAssociatedObjectUri"));

  -[UNSNotificationRecord communicationContextDisplayName](self, "communicationContextDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v10, CFSTR("CommunicationContextDisplayName"));

  v11 = (void (**)(uint64_t, void *))UNCContactRecordToDictionary;
  -[UNSNotificationRecord communicationContextSender](self, "communicationContextSender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2]((uint64_t)v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v13, CFSTR("CommunicationContextSender"));

  -[UNSNotificationRecord communicationContextRecipients](self, "communicationContextRecipients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_map:", UNCContactRecordToDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetNonEmptyArray:forKey:", v15, CFSTR("CommunicationContextRecipients"));

  -[UNSNotificationRecord communicationContextContentURL](self, "communicationContextContentURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v16, CFSTR("CommunicationContextContentURL"));

  -[UNSNotificationRecord communicationContextImageName](self, "communicationContextImageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v17, CFSTR("CommunicationContextImageName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord communicationContextSystemImage](self, "communicationContextSystemImage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v18, CFSTR("CommunicationContextSystemImage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord communicationContextMentionsCurrentUser](self, "communicationContextMentionsCurrentUser"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v19, CFSTR("CommunicationContextMentionsCurrentUser"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord communicationContextNotifyRecipientAnyway](self, "communicationContextNotifyRecipientAnyway"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v20, CFSTR("CommunicationContextNotifyRecipientAnyway"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord communicationContextReplyToCurrentUser](self, "communicationContextReplyToCurrentUser"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v21, CFSTR("CommunicationContextReplyToCurrentUser"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNSNotificationRecord communicationContextRecipientCount](self, "communicationContextRecipientCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v22, CFSTR("CommunicationContextRecipientCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNSNotificationRecord communicationContextCapabilities](self, "communicationContextCapabilities"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v23, CFSTR("CommunicationContextCapabilities"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord communicationContextBusinessCorrespondence](self, "communicationContextBusinessCorrespondence"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v24, CFSTR("CommunicationContextBusinessCorrespondence"));

  -[UNSNotificationRecord accessoryImageName](self, "accessoryImageName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v25, CFSTR("AccessoryImageName"));

  -[UNSNotificationRecord attachments](self, "attachments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bs_map:", UNCAttachmentRecordToDictionary);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetNonEmptyArray:forKey:", v27, CFSTR("AppNotificationAttachments"));

  -[UNSNotificationRecord badge](self, "badge");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v28, CFSTR("AppNotificationBadgeNumber"));

  -[UNSNotificationRecord body](self, "body");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetNonEmptyString:withLimit:forKey:", v29, v4, CFSTR("AppNotificationMessage"));

  -[UNSNotificationRecord bodyLocalizationArguments](self, "bodyLocalizationArguments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v30, CFSTR("AppNotificationMessageLocalizationArguments"));

  -[UNSNotificationRecord bodyLocalizationKey](self, "bodyLocalizationKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v31, CFSTR("AppNotificationMessageLocazationKey"));

  -[UNSNotificationRecord attributedBody](self, "attributedBody");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_un_truncatedAttributedStringToMaxLength:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_un_RTFDData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v34, CFSTR("AppNotificationAttributedMessage"));

  -[UNSNotificationRecord summaryArgument](self, "summaryArgument");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v35, CFSTR("AppNotificationSummaryArgument"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNSNotificationRecord summaryArgumentCount](self, "summaryArgumentCount"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v36, CFSTR("AppNotificationSummaryArgumentCount"));

  -[UNSNotificationRecord targetContentIdentifier](self, "targetContentIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v37, CFSTR("TargetContentIdentifier"));

  -[UNSNotificationRecord categoryIdentifier](self, "categoryIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetNonEmptyString:forKey:", v38, CFSTR("SBSPushStoreNotificationCategoryKey"));

  -[UNSNotificationRecord threadIdentifier](self, "threadIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetNonEmptyString:forKey:", v39, CFSTR("SBSPushStoreNotificationThreadKey"));

  -[UNSNotificationRecord contentDate](self, "contentDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v40, CFSTR("ContentDate"));

  -[UNSNotificationRecord contentAvailable](self, "contentAvailable");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v41, CFSTR("AppNotificationContentAvailable"));

  -[UNSNotificationRecord mutableContent](self, "mutableContent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v42, CFSTR("AppNotificationMutableContent"));

  -[UNSNotificationRecord date](self, "date");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v43, CFSTR("AppNotificationCreationDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNSNotificationRecord interruptionLevel](self, "interruptionLevel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v44, CFSTR("InterruptionLevel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord hasDefaultAction](self, "hasDefaultAction"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v45, CFSTR("HasDefaultActionKey"));

  -[UNSNotificationRecord defaultActionTitle](self, "defaultActionTitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v46, CFSTR("AppNotificationActionText"));

  -[UNSNotificationRecord defaultActionTitleLocalizationKey](self, "defaultActionTitleLocalizationKey");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v47, CFSTR("AppNotificationActionTextLocalizationKeyKey"));

  -[UNSNotificationRecord defaultActionURL](self, "defaultActionURL");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "absoluteString");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v49, CFSTR("DefaultActionURL"));

  -[UNSNotificationRecord defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v50, CFSTR("DefaultActionBundleIdentifier"));

  -[UNSNotificationRecord expirationDate](self, "expirationDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v51, CFSTR("ExpirationDate"));

  -[UNSNotificationRecord header](self, "header");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v52, CFSTR("Header"));

  -[UNSNotificationRecord headerLocalizationArguments](self, "headerLocalizationArguments");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v53, CFSTR("HeaderLocalizationArguments"));

  -[UNSNotificationRecord headerLocalizationKey](self, "headerLocalizationKey");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v54, CFSTR("HeaderLocalizationKey"));

  -[UNSNotificationRecord footer](self, "footer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v55, CFSTR("Footer"));

  -[UNSNotificationRecord footerLocalizationArguments](self, "footerLocalizationArguments");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v56, CFSTR("FooterLocalizationArguments"));

  -[UNSNotificationRecord footerLocalizationKey](self, "footerLocalizationKey");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v57, CFSTR("FooterLocalizationKey"));

  -[UNSNotificationRecord identifier](self, "identifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v58, CFSTR("AppNotificationIdentifier"));

  -[UNSNotificationRecord iconApplicationIdentifier](self, "iconApplicationIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v59, CFSTR("IconApplicationIdentifier"));

  -[UNSNotificationRecord iconName](self, "iconName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v60, CFSTR("IconName"));

  -[UNSNotificationRecord iconPath](self, "iconPath");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v61, CFSTR("IconPath"));

  -[UNSNotificationRecord iconSystemImageName](self, "iconSystemImageName");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v62, CFSTR("IconSystemImageName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord iconShouldSuppressMask](self, "iconShouldSuppressMask"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v63, CFSTR("IconShouldSuppressMask"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord hasCriticalAlertSound](self, "hasCriticalAlertSound"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v64, CFSTR("CriticalAlertSound"));

  -[UNSNotificationRecord launchImageName](self, "launchImageName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetNonEmptyString:forKey:", v65, CFSTR("AppNotificationLaunchImage"));

  -[UNSNotificationRecord requestDate](self, "requestDate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v66, CFSTR("RequestDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 11);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v67, CFSTR("SchemaVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldBadgeApplicationIcon](self, "shouldBadgeApplicationIcon"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v68, CFSTR("BadgeApplicationIcon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldHideDate](self, "shouldHideDate"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v69, CFSTR("ShouldHideDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldHideTime](self, "shouldHideTime"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v70, CFSTR("ShouldHideTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v71, CFSTR("ShouldIgnoreAccessibilityDisabledVibrationSetting"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v72, CFSTR("ShouldIgnoreDoNotDisturb"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldIgnoreDowntime](self, "shouldIgnoreDowntime"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v73, CFSTR("ShouldIgnoreDowntime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v74, CFSTR("SoundShouldIgnoreRingerSwitch"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v75, CFSTR("ShouldSuppressScreenLightUp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldPlaySound](self, "shouldPlaySound"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v76, CFSTR("ShouldPlaySound"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v77, CFSTR("ShouldPresentAlert"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNSNotificationRecord presentationOptions](self, "presentationOptions"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v78, CFSTR("PresentationOptions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v79, CFSTR("ShouldAuthenticateDefaultAction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v80, CFSTR("ShouldBackgroundDefaultAction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v81, CFSTR("ShouldPreventNotificationDismissalAfterDefaultAction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v82, CFSTR("ShouldPreemptPresentedNotification"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldDisplayActionsInline](self, "shouldDisplayActionsInline"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v83, CFSTR("ShouldDisplayActionsInline"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v84, CFSTR("UNNotificationShouldShowSubordinateIcon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldSoundRepeat](self, "shouldSoundRepeat"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v85, CFSTR("SoundShouldRepeat"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v86, CFSTR("ShouldSuppressSyncDismissalWhenRemoved"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v87, CFSTR("ShouldUseRequestIdentifierForDismissalSync"));

  -[UNSNotificationRecord audioCategory](self, "audioCategory");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v88, CFSTR("AudioCategory"));

  -[UNSNotificationRecord audioVolume](self, "audioVolume");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v89, CFSTR("AudioVolume"));

  v90 = (void *)MEMORY[0x24BDD16E0];
  -[UNSNotificationRecord soundMaximumDuration](self, "soundMaximumDuration");
  objc_msgSend(v90, "numberWithDouble:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v91, CFSTR("SoundMaximumDuration"));

  -[UNSNotificationRecord subtitle](self, "subtitle");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v92, CFSTR("AppNotificationSubtitle"));

  -[UNSNotificationRecord subtitleLocalizationArguments](self, "subtitleLocalizationArguments");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v93, CFSTR("AppNotificationSubtitleLocalizationArguments"));

  -[UNSNotificationRecord subtitleLocalizationKey](self, "subtitleLocalizationKey");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v94, CFSTR("AppNotificationSubtitleLocalizationKey"));

  -[UNSNotificationRecord title](self, "title");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v95, CFSTR("AppNotificationTitle"));

  -[UNSNotificationRecord titleLocalizationArguments](self, "titleLocalizationArguments");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v96, CFSTR("AppNotificationTitleLocalizationArguments"));

  -[UNSNotificationRecord titleLocalizationKey](self, "titleLocalizationKey");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v97, CFSTR("AppNotificationTitleLocalizationKey"));

  -[UNSNotificationRecord toneAlertTopic](self, "toneAlertTopic");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v98, CFSTR("ToneAlertTopic"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UNSNotificationRecord toneAlertType](self, "toneAlertType"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v99, CFSTR("ToneAlertType"));

  -[UNSNotificationRecord toneFileName](self, "toneFileName");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v100, CFSTR("ToneFileName"));

  -[UNSNotificationRecord toneFileURL](self, "toneFileURL");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "absoluteString");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v102, CFSTR("ToneFileURL"));

  -[UNSNotificationRecord toneIdentifier](self, "toneIdentifier");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v103, CFSTR("ToneIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[UNSNotificationRecord toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v104, CFSTR("ToneMediaLibraryItemIdentifier"));

  -[UNSNotificationRecord topicIdentifiers](self, "topicIdentifiers");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetNonEmptySet:forKey:", v105, CFSTR("Topics"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNSNotificationRecord realertCount](self, "realertCount"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v106, CFSTR("RealertCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord allowsDefaultDestinations](self, "allowsDefaultDestinations"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v107, CFSTR("UNNotificationDefaultDestinations"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord allowsLockScreenDestination](self, "allowsLockScreenDestination"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v108, CFSTR("UNNotificationLockScreenDestination"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord allowsNotificationCenterDestination](self, "allowsNotificationCenterDestination"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v109, CFSTR("UNNotificationNotificationCenterDestination"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord allowsAlertDestination](self, "allowsAlertDestination"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v110, CFSTR("UNNotificationAlertDestination"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord allowsCarPlayDestination](self, "allowsCarPlayDestination"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v111, CFSTR("UNNotificationCarPlayDestination"));

  -[UNSNotificationRecord triggerDate](self, "triggerDate");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v112, CFSTR("TriggerDate"));

  -[UNSNotificationRecord triggerDateComponents](self, "triggerDateComponents");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v113, CFSTR("TriggerDateComponents"));

  -[UNSNotificationRecord triggerRegion](self, "triggerRegion");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    v115 = (void *)MEMORY[0x24BDD1618];
    -[UNSNotificationRecord triggerRegion](self, "triggerRegion");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "archivedDataWithRootObject:requiringSecureCoding:error:", v116, 1, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unc_safeSetObject:forKey:", v117, CFSTR("TriggerRegion"));

  }
  -[UNSNotificationRecord triggerRepeatCalendarIdentifier](self, "triggerRepeatCalendarIdentifier");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v118, CFSTR("TriggerRepeatCalendar"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNSNotificationRecord triggerRepeatInterval](self, "triggerRepeatInterval"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v119, CFSTR("TriggerRepeatInterval"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord triggerRepeats](self, "triggerRepeats"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v120, CFSTR("TriggerRepeats"));

  v121 = (void *)MEMORY[0x24BDD16E0];
  -[UNSNotificationRecord triggerTimeInterval](self, "triggerTimeInterval");
  objc_msgSend(v121, "numberWithDouble:");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v122, CFSTR("TriggerTimeInterval"));

  -[UNSNotificationRecord triggerTimeZone](self, "triggerTimeZone");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "name");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v124, CFSTR("TriggerTimeZone"));

  -[UNSNotificationRecord triggerType](self, "triggerType");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v125, CFSTR("UNNotificationTriggerType"));

  -[UNSNotificationRecord userInfo](self, "userInfo");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v126, CFSTR("UNNotificationUserInfo"));

  -[UNSNotificationRecord vibrationIdentifier](self, "vibrationIdentifier");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v127, CFSTR("VibrationIdentifier"));

  -[UNSNotificationRecord vibrationPatternFileURL](self, "vibrationPatternFileURL");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "absoluteString");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v129, CFSTR("VibrationPatternFileURL"));

  v130 = (void *)MEMORY[0x24BDD16E0];
  -[UNSNotificationRecord relevanceScore](self, "relevanceScore");
  objc_msgSend(v130, "numberWithDouble:");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v131, CFSTR("UNNotificationRelevanceScore"));

  -[UNSNotificationRecord filterCriteria](self, "filterCriteria");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v132, CFSTR("FilterCriteria"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord screenCaptureProhibited](self, "screenCaptureProhibited"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v133, CFSTR("ScreenCaptureProhibited"));

  -[UNSNotificationRecord speechLanguage](self, "speechLanguage");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v134, CFSTR("SpeechLanguage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UNSNotificationRecord revisionNumber](self, "revisionNumber"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v135, CFSTR("RevisionNumber"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UNSNotificationRecord pipelineState](self, "pipelineState"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v136, CFSTR("PipelineState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNSNotificationRecord isHighlight](self, "isHighlight"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v137, CFSTR("IsHighlight"));

  -[UNSNotificationRecord summary](self, "summary");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v138, CFSTR("Summary"));

  -[UNSNotificationRecord eventBehavior](self, "eventBehavior");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v139, CFSTR("EventBehavior"));

  return v5;
}

- (NSString)description
{
  return (NSString *)-[UNSNotificationRecord descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[UNSNotificationRecord descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isSimilar:(id)a3
{
  UNSNotificationRecord *v4;
  UNSNotificationRecord *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  unint64_t v38;
  int64_t v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  unint64_t v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  int v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  int v111;
  _BOOL4 v112;
  _BOOL4 v113;
  _BOOL4 v114;
  _BOOL4 v115;
  _BOOL4 v116;
  _BOOL4 v117;
  _BOOL4 v118;
  _BOOL4 v119;
  _BOOL4 v120;
  _BOOL4 v121;
  _BOOL4 v122;
  _BOOL4 v123;
  _BOOL4 v124;
  _BOOL4 v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  void *v154;
  int v155;
  unint64_t v156;
  void *v157;
  void *v158;
  int v159;
  unint64_t v160;
  _BOOL4 v161;
  _BOOL4 v162;
  _BOOL4 v163;
  _BOOL4 v164;
  _BOOL4 v165;
  void *v166;
  void *v167;
  int v168;
  void *v169;
  void *v170;
  int v171;
  void *v172;
  void *v173;
  int v174;
  void *v175;
  void *v176;
  int v177;
  unint64_t v178;
  _BOOL4 v179;
  void *v180;
  void *v181;
  int v182;
  void *v183;
  void *v184;
  int v185;
  void *v186;
  void *v187;
  int v188;
  void *v189;
  void *v190;
  int v191;
  void *v192;
  void *v193;
  int v194;
  double v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  int v200;
  _BOOL4 v201;
  void *v202;
  void *v203;
  int v204;
  int64_t v205;
  int64_t v206;
  _BOOL4 v207;
  void *v208;
  void *v209;
  int v210;
  void *v211;
  void *v212;
  char v213;

  v4 = (UNSNotificationRecord *)a3;
  v5 = v4;
  if (self == v4)
  {
    v213 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_102;
    v6 = objc_opt_class();
    if (v6 != objc_opt_class())
      goto LABEL_102;
    -[UNSNotificationRecord contentType](self, "contentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord contentType](v5, "contentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = UNEqualObjects();

    if (!v9)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextIdentifier](self, "communicationContextIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextIdentifier](v5, "communicationContextIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = UNEqualObjects();

    if (!v12)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextBundleIdentifier](self, "communicationContextBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextBundleIdentifier](v5, "communicationContextBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = UNEqualObjects();

    if (!v15)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextAssociatedObjectUri](self, "communicationContextAssociatedObjectUri");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextAssociatedObjectUri](v5, "communicationContextAssociatedObjectUri");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = UNEqualObjects();

    if (!v18)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextDisplayName](self, "communicationContextDisplayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextDisplayName](v5, "communicationContextDisplayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = UNEqualObjects();

    if (!v21)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextSender](self, "communicationContextSender");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextSender](v5, "communicationContextSender");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = UNEqualObjects();

    if (!v24)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextRecipients](self, "communicationContextRecipients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextRecipients](v5, "communicationContextRecipients");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = UNSimilarArrays();

    if (!v27)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextContentURL](self, "communicationContextContentURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextContentURL](v5, "communicationContextContentURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = UNEqualObjects();

    if (!v30)
      goto LABEL_102;
    -[UNSNotificationRecord communicationContextImageName](self, "communicationContextImageName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord communicationContextImageName](v5, "communicationContextImageName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = UNEqualObjects();

    if (!v33)
      goto LABEL_102;
    v34 = -[UNSNotificationRecord communicationContextSystemImage](self, "communicationContextSystemImage");
    if (v34 != -[UNSNotificationRecord communicationContextSystemImage](v5, "communicationContextSystemImage"))
      goto LABEL_102;
    v35 = -[UNSNotificationRecord communicationContextMentionsCurrentUser](self, "communicationContextMentionsCurrentUser");
    if (v35 != -[UNSNotificationRecord communicationContextMentionsCurrentUser](v5, "communicationContextMentionsCurrentUser"))goto LABEL_102;
    v36 = -[UNSNotificationRecord communicationContextNotifyRecipientAnyway](self, "communicationContextNotifyRecipientAnyway");
    if (v36 != -[UNSNotificationRecord communicationContextNotifyRecipientAnyway](v5, "communicationContextNotifyRecipientAnyway"))goto LABEL_102;
    v37 = -[UNSNotificationRecord communicationContextReplyToCurrentUser](self, "communicationContextReplyToCurrentUser");
    if (v37 != -[UNSNotificationRecord communicationContextReplyToCurrentUser](v5, "communicationContextReplyToCurrentUser"))goto LABEL_102;
    v38 = -[UNSNotificationRecord communicationContextRecipientCount](self, "communicationContextRecipientCount");
    if (v38 != -[UNSNotificationRecord communicationContextRecipientCount](v5, "communicationContextRecipientCount"))
      goto LABEL_102;
    v39 = -[UNSNotificationRecord communicationContextCapabilities](self, "communicationContextCapabilities");
    if (v39 != -[UNSNotificationRecord communicationContextCapabilities](v5, "communicationContextCapabilities"))
      goto LABEL_102;
    v40 = -[UNSNotificationRecord communicationContextBusinessCorrespondence](self, "communicationContextBusinessCorrespondence");
    if (v40 != -[UNSNotificationRecord communicationContextBusinessCorrespondence](v5, "communicationContextBusinessCorrespondence"))goto LABEL_102;
    -[UNSNotificationRecord accessoryImageName](self, "accessoryImageName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord accessoryImageName](v5, "accessoryImageName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = UNEqualObjects();

    if (!v43)
      goto LABEL_102;
    -[UNSNotificationRecord attachments](self, "attachments");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord attachments](v5, "attachments");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = UNEqualObjects();

    if (!v46)
      goto LABEL_102;
    -[UNSNotificationRecord badge](self, "badge");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "integerValue");
    -[UNSNotificationRecord badge](v5, "badge");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "integerValue");
    v49 = UNEqualIntegers();

    if (!v49)
      goto LABEL_102;
    -[UNSNotificationRecord bodyLocalizationKey](self, "bodyLocalizationKey");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord bodyLocalizationKey](v5, "bodyLocalizationKey");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = UNSimilarStrings();

    if (!v52)
      goto LABEL_102;
    -[UNSNotificationRecord bodyLocalizationArguments](self, "bodyLocalizationArguments");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord bodyLocalizationArguments](v5, "bodyLocalizationArguments");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = UNEqualObjects();

    if (!v55)
      goto LABEL_102;
    -[UNSNotificationRecord categoryIdentifier](self, "categoryIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord categoryIdentifier](v5, "categoryIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = UNEqualObjects();

    if (!v58)
      goto LABEL_102;
    -[UNSNotificationRecord threadIdentifier](self, "threadIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord threadIdentifier](v5, "threadIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = UNEqualObjects();

    if (!v61)
      goto LABEL_102;
    -[UNSNotificationRecord targetContentIdentifier](self, "targetContentIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord targetContentIdentifier](v5, "targetContentIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = UNEqualObjects();

    if (!v64)
      goto LABEL_102;
    -[UNSNotificationRecord contentAvailable](self, "contentAvailable");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord contentAvailable](v5, "contentAvailable");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = UNEqualObjects();

    if (!v67)
      goto LABEL_102;
    -[UNSNotificationRecord contentDate](self, "contentDate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord contentDate](v5, "contentDate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = UNEqualObjects();

    if (!v70)
      goto LABEL_102;
    v71 = -[UNSNotificationRecord interruptionLevel](self, "interruptionLevel");
    if (v71 != -[UNSNotificationRecord interruptionLevel](v5, "interruptionLevel"))
      goto LABEL_102;
    -[UNSNotificationRecord mutableContent](self, "mutableContent");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord mutableContent](v5, "mutableContent");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = UNEqualObjects();

    if (!v74)
      goto LABEL_102;
    -[UNSNotificationRecord defaultActionURL](self, "defaultActionURL");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord defaultActionURL](v5, "defaultActionURL");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = UNEqualObjects();

    if (!v77)
      goto LABEL_102;
    -[UNSNotificationRecord defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord defaultActionBundleIdentifier](v5, "defaultActionBundleIdentifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = UNEqualObjects();

    if (!v80)
      goto LABEL_102;
    -[UNSNotificationRecord expirationDate](self, "expirationDate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord expirationDate](v5, "expirationDate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = UNEqualObjects();

    if (!v83)
      goto LABEL_102;
    v84 = -[UNSNotificationRecord hasCriticalAlertSound](self, "hasCriticalAlertSound");
    if (v84 != -[UNSNotificationRecord hasCriticalAlertSound](v5, "hasCriticalAlertSound"))
      goto LABEL_102;
    -[UNSNotificationRecord headerLocalizationKey](self, "headerLocalizationKey");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord headerLocalizationKey](v5, "headerLocalizationKey");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = UNSimilarStrings();

    if (!v87)
      goto LABEL_102;
    -[UNSNotificationRecord headerLocalizationArguments](self, "headerLocalizationArguments");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord headerLocalizationArguments](v5, "headerLocalizationArguments");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = UNEqualObjects();

    if (!v90)
      goto LABEL_102;
    -[UNSNotificationRecord footerLocalizationKey](self, "footerLocalizationKey");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord footerLocalizationKey](v5, "footerLocalizationKey");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = UNSimilarStrings();

    if (!v93)
      goto LABEL_102;
    -[UNSNotificationRecord footerLocalizationArguments](self, "footerLocalizationArguments");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord footerLocalizationArguments](v5, "footerLocalizationArguments");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = UNEqualObjects();

    if (!v96)
      goto LABEL_102;
    -[UNSNotificationRecord iconApplicationIdentifier](self, "iconApplicationIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord iconApplicationIdentifier](v5, "iconApplicationIdentifier");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = UNEqualObjects();

    if (!v99)
      goto LABEL_102;
    -[UNSNotificationRecord iconName](self, "iconName");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord iconName](v5, "iconName");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = UNEqualObjects();

    if (!v102)
      goto LABEL_102;
    -[UNSNotificationRecord iconPath](self, "iconPath");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord iconPath](v5, "iconPath");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = UNEqualObjects();

    if (!v105)
      goto LABEL_102;
    -[UNSNotificationRecord iconSystemImageName](self, "iconSystemImageName");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord iconSystemImageName](v5, "iconSystemImageName");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = UNEqualObjects();

    if (!v108)
      goto LABEL_102;
    -[UNSNotificationRecord launchImageName](self, "launchImageName");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord launchImageName](v5, "launchImageName");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = UNEqualObjects();

    if (!v111)
      goto LABEL_102;
    v112 = -[UNSNotificationRecord shouldHideDate](self, "shouldHideDate");
    if (v112 != -[UNSNotificationRecord shouldHideDate](v5, "shouldHideDate"))
      goto LABEL_102;
    v113 = -[UNSNotificationRecord shouldHideTime](self, "shouldHideTime");
    if (v113 != -[UNSNotificationRecord shouldHideTime](v5, "shouldHideTime"))
      goto LABEL_102;
    v114 = -[UNSNotificationRecord shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting");
    if (v114 != -[UNSNotificationRecord shouldIgnoreAccessibilityDisabledVibrationSetting](v5, "shouldIgnoreAccessibilityDisabledVibrationSetting"))goto LABEL_102;
    v115 = -[UNSNotificationRecord shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb");
    if (v115 != -[UNSNotificationRecord shouldIgnoreDoNotDisturb](v5, "shouldIgnoreDoNotDisturb"))
      goto LABEL_102;
    v116 = -[UNSNotificationRecord shouldIgnoreDowntime](self, "shouldIgnoreDowntime");
    if (v116 != -[UNSNotificationRecord shouldIgnoreDowntime](v5, "shouldIgnoreDowntime"))
      goto LABEL_102;
    -[UNSNotificationRecord shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch");
    -[UNSNotificationRecord shouldIgnoreRingerSwitch](v5, "shouldIgnoreRingerSwitch");
    if (!UNEqualBools())
      goto LABEL_102;
    v117 = -[UNSNotificationRecord shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction");
    if (v117 != -[UNSNotificationRecord shouldAuthenticateDefaultAction](v5, "shouldAuthenticateDefaultAction"))
      goto LABEL_102;
    v118 = -[UNSNotificationRecord shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction");
    if (v118 != -[UNSNotificationRecord shouldBackgroundDefaultAction](v5, "shouldBackgroundDefaultAction"))
      goto LABEL_102;
    v119 = -[UNSNotificationRecord shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction");
    if (v119 != -[UNSNotificationRecord shouldPreventNotificationDismissalAfterDefaultAction](v5, "shouldPreventNotificationDismissalAfterDefaultAction"))goto LABEL_102;
    -[UNSNotificationRecord shouldSoundRepeat](self, "shouldSoundRepeat");
    -[UNSNotificationRecord shouldSoundRepeat](v5, "shouldSoundRepeat");
    if (!UNEqualBools())
      goto LABEL_102;
    v120 = -[UNSNotificationRecord shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp");
    if (v120 != -[UNSNotificationRecord shouldSuppressScreenLightUp](v5, "shouldSuppressScreenLightUp"))
      goto LABEL_102;
    v121 = -[UNSNotificationRecord shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
    if (v121 != -[UNSNotificationRecord shouldSuppressSyncDismissalWhenRemoved](v5, "shouldSuppressSyncDismissalWhenRemoved"))goto LABEL_102;
    v122 = -[UNSNotificationRecord shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync");
    if (v122 != -[UNSNotificationRecord shouldUseRequestIdentifierForDismissalSync](v5, "shouldUseRequestIdentifierForDismissalSync"))goto LABEL_102;
    v123 = -[UNSNotificationRecord shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification");
    if (v123 != -[UNSNotificationRecord shouldPreemptPresentedNotification](v5, "shouldPreemptPresentedNotification"))
      goto LABEL_102;
    v124 = -[UNSNotificationRecord shouldDisplayActionsInline](self, "shouldDisplayActionsInline");
    if (v124 != -[UNSNotificationRecord shouldDisplayActionsInline](v5, "shouldDisplayActionsInline"))
      goto LABEL_102;
    v125 = -[UNSNotificationRecord shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon");
    if (v125 != -[UNSNotificationRecord shouldShowSubordinateIcon](v5, "shouldShowSubordinateIcon"))
      goto LABEL_102;
    -[UNSNotificationRecord audioCategory](self, "audioCategory");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord audioCategory](v5, "audioCategory");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = UNEqualObjects();

    if (!v128)
      goto LABEL_102;
    -[UNSNotificationRecord audioVolume](self, "audioVolume");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord audioVolume](v5, "audioVolume");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = UNEqualObjects();

    if (!v131)
      goto LABEL_102;
    -[UNSNotificationRecord soundMaximumDuration](self, "soundMaximumDuration");
    -[UNSNotificationRecord soundMaximumDuration](v5, "soundMaximumDuration");
    if (!UNEqualDoubles())
      goto LABEL_102;
    -[UNSNotificationRecord subtitleLocalizationKey](self, "subtitleLocalizationKey");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord subtitleLocalizationKey](v5, "subtitleLocalizationKey");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = UNSimilarStrings();

    if (!v134)
      goto LABEL_102;
    -[UNSNotificationRecord subtitleLocalizationArguments](self, "subtitleLocalizationArguments");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord subtitleLocalizationArguments](v5, "subtitleLocalizationArguments");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = UNEqualObjects();

    if (!v137)
      goto LABEL_102;
    -[UNSNotificationRecord titleLocalizationKey](self, "titleLocalizationKey");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord titleLocalizationKey](v5, "titleLocalizationKey");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = UNSimilarStrings();

    if (!v140)
      goto LABEL_102;
    -[UNSNotificationRecord titleLocalizationArguments](self, "titleLocalizationArguments");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord titleLocalizationArguments](v5, "titleLocalizationArguments");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = UNEqualObjects();

    if (!v143)
      goto LABEL_102;
    -[UNSNotificationRecord toneAlertTopic](self, "toneAlertTopic");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord toneAlertTopic](v5, "toneAlertTopic");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = UNEqualObjects();

    if (!v146)
      goto LABEL_102;
    -[UNSNotificationRecord toneAlertType](self, "toneAlertType");
    -[UNSNotificationRecord toneAlertType](v5, "toneAlertType");
    if (!UNEqualDoubles())
      goto LABEL_102;
    -[UNSNotificationRecord toneFileName](self, "toneFileName");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord toneFileName](v5, "toneFileName");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = UNEqualObjects();

    if (!v149)
      goto LABEL_102;
    -[UNSNotificationRecord toneFileURL](self, "toneFileURL");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord toneFileURL](v5, "toneFileURL");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = UNEqualObjects();

    if (!v152)
      goto LABEL_102;
    -[UNSNotificationRecord toneIdentifier](self, "toneIdentifier");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord toneIdentifier](v5, "toneIdentifier");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = UNEqualObjects();

    if (!v155)
      goto LABEL_102;
    v156 = -[UNSNotificationRecord toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier");
    if (v156 != -[UNSNotificationRecord toneMediaLibraryItemIdentifier](v5, "toneMediaLibraryItemIdentifier"))
      goto LABEL_102;
    -[UNSNotificationRecord topicIdentifiers](self, "topicIdentifiers");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord topicIdentifiers](v5, "topicIdentifiers");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = UNSimilarSets();

    if (!v159)
      goto LABEL_102;
    v160 = -[UNSNotificationRecord realertCount](self, "realertCount");
    if (v160 != -[UNSNotificationRecord realertCount](v5, "realertCount"))
      goto LABEL_102;
    v161 = -[UNSNotificationRecord allowsDefaultDestinations](self, "allowsDefaultDestinations");
    if (v161 != -[UNSNotificationRecord allowsDefaultDestinations](v5, "allowsDefaultDestinations"))
      goto LABEL_102;
    v162 = -[UNSNotificationRecord allowsLockScreenDestination](self, "allowsLockScreenDestination");
    if (v162 != -[UNSNotificationRecord allowsLockScreenDestination](v5, "allowsLockScreenDestination"))
      goto LABEL_102;
    v163 = -[UNSNotificationRecord allowsNotificationCenterDestination](self, "allowsNotificationCenterDestination");
    if (v163 != -[UNSNotificationRecord allowsNotificationCenterDestination](v5, "allowsNotificationCenterDestination"))
      goto LABEL_102;
    v164 = -[UNSNotificationRecord allowsAlertDestination](self, "allowsAlertDestination");
    if (v164 != -[UNSNotificationRecord allowsAlertDestination](v5, "allowsAlertDestination"))
      goto LABEL_102;
    v165 = -[UNSNotificationRecord allowsCarPlayDestination](self, "allowsCarPlayDestination");
    if (v165 != -[UNSNotificationRecord allowsCarPlayDestination](v5, "allowsCarPlayDestination"))
      goto LABEL_102;
    -[UNSNotificationRecord triggerDate](self, "triggerDate");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord triggerDate](v5, "triggerDate");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = UNEqualObjects();

    if (!v168)
      goto LABEL_102;
    -[UNSNotificationRecord triggerDateComponents](self, "triggerDateComponents");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord triggerDateComponents](v5, "triggerDateComponents");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = UNEqualObjects();

    if (!v171)
      goto LABEL_102;
    -[UNSNotificationRecord triggerRegion](self, "triggerRegion");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord triggerRegion](v5, "triggerRegion");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = UNEqualObjects();

    if (!v174)
      goto LABEL_102;
    -[UNSNotificationRecord triggerRepeatCalendarIdentifier](self, "triggerRepeatCalendarIdentifier");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord triggerRepeatCalendarIdentifier](v5, "triggerRepeatCalendarIdentifier");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = UNEqualObjects();

    if (!v177)
      goto LABEL_102;
    v178 = -[UNSNotificationRecord triggerRepeatInterval](self, "triggerRepeatInterval");
    if (v178 != -[UNSNotificationRecord triggerRepeatInterval](v5, "triggerRepeatInterval"))
      goto LABEL_102;
    v179 = -[UNSNotificationRecord triggerRepeats](self, "triggerRepeats");
    if (v179 != -[UNSNotificationRecord triggerRepeats](v5, "triggerRepeats"))
      goto LABEL_102;
    -[UNSNotificationRecord triggerTimeInterval](self, "triggerTimeInterval");
    -[UNSNotificationRecord triggerTimeInterval](v5, "triggerTimeInterval");
    if (!UNEqualDoubles())
      goto LABEL_102;
    -[UNSNotificationRecord triggerTimeZone](self, "triggerTimeZone");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord triggerTimeZone](v5, "triggerTimeZone");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = UNEqualObjects();

    if (!v182)
      goto LABEL_102;
    -[UNSNotificationRecord triggerType](self, "triggerType");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord triggerType](v5, "triggerType");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = UNEqualObjects();

    if (!v185)
      goto LABEL_102;
    -[UNSNotificationRecord userInfo](self, "userInfo");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord userInfo](v5, "userInfo");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = UNEqualObjects();

    if (!v188)
      goto LABEL_102;
    -[UNSNotificationRecord vibrationIdentifier](self, "vibrationIdentifier");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord vibrationIdentifier](v5, "vibrationIdentifier");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = UNEqualObjects();

    if (!v191)
      goto LABEL_102;
    -[UNSNotificationRecord vibrationPatternFileURL](self, "vibrationPatternFileURL");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord vibrationPatternFileURL](v5, "vibrationPatternFileURL");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = UNEqualObjects();

    if (!v194)
      goto LABEL_102;
    -[UNSNotificationRecord relevanceScore](self, "relevanceScore");
    v196 = v195;
    -[UNSNotificationRecord relevanceScore](v5, "relevanceScore");
    if (v196 != v197)
      goto LABEL_102;
    -[UNSNotificationRecord filterCriteria](self, "filterCriteria");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord filterCriteria](v5, "filterCriteria");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = UNEqualObjects();

    if (!v200)
      goto LABEL_102;
    v201 = -[UNSNotificationRecord screenCaptureProhibited](self, "screenCaptureProhibited");
    if (v201 != -[UNSNotificationRecord screenCaptureProhibited](v5, "screenCaptureProhibited"))
      goto LABEL_102;
    -[UNSNotificationRecord speechLanguage](self, "speechLanguage");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord speechLanguage](v5, "speechLanguage");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = UNEqualObjects();

    if (!v204)
      goto LABEL_102;
    v205 = -[UNSNotificationRecord revisionNumber](self, "revisionNumber");
    if (v205 != -[UNSNotificationRecord revisionNumber](v5, "revisionNumber"))
      goto LABEL_102;
    v206 = -[UNSNotificationRecord pipelineState](self, "pipelineState");
    if (v206 != -[UNSNotificationRecord pipelineState](v5, "pipelineState"))
      goto LABEL_102;
    v207 = -[UNSNotificationRecord isHighlight](self, "isHighlight");
    if (v207 != -[UNSNotificationRecord isHighlight](v5, "isHighlight"))
      goto LABEL_102;
    -[UNSNotificationRecord summary](self, "summary");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationRecord summary](v5, "summary");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = UNEqualObjects();

    if (v210)
    {
      -[UNSNotificationRecord eventBehavior](self, "eventBehavior");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSNotificationRecord eventBehavior](v5, "eventBehavior");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = UNEqualObjects();

    }
    else
    {
LABEL_102:
      v213 = 0;
    }
  }

  return v213;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  unint64_t v44;
  double v45;
  double v46;
  double v47;
  int v48;
  char v49;
  void *v51;
  void *v52;

  v4 = a3;
  if (!v4)
    goto LABEL_23;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_23;
  if (!-[UNSNotificationRecord isSimilar:](self, "isSimilar:", v4))
    goto LABEL_23;
  v6 = -[UNSNotificationRecord shouldBadgeApplicationIcon](self, "shouldBadgeApplicationIcon");
  if (v6 != objc_msgSend(v4, "shouldBadgeApplicationIcon"))
    goto LABEL_23;
  v7 = -[UNSNotificationRecord shouldPlaySound](self, "shouldPlaySound");
  if (v7 != objc_msgSend(v4, "shouldPlaySound"))
    goto LABEL_23;
  v8 = -[UNSNotificationRecord shouldPresentAlert](self, "shouldPresentAlert");
  if (v8 != objc_msgSend(v4, "shouldPresentAlert"))
    goto LABEL_23;
  v9 = -[UNSNotificationRecord presentationOptions](self, "presentationOptions");
  if (v9 != objc_msgSend(v4, "presentationOptions"))
    goto LABEL_23;
  -[UNSNotificationRecord date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = UNEqualObjects();

  if (!v12)
    goto LABEL_23;
  v13 = -[UNSNotificationRecord interruptionLevel](self, "interruptionLevel");
  if (v13 != objc_msgSend(v4, "interruptionLevel"))
    goto LABEL_23;
  -[UNSNotificationRecord identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = UNEqualObjects();

  if (!v16)
    goto LABEL_23;
  -[UNSNotificationRecord requestDate](self, "requestDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = UNEqualObjects();

  if (!v19)
    goto LABEL_23;
  -[UNSNotificationRecord header](self, "header");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "header");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = UNEqualObjects();

  if (!v22)
    goto LABEL_23;
  -[UNSNotificationRecord footer](self, "footer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = UNEqualObjects();

  if (!v25)
    goto LABEL_23;
  -[UNSNotificationRecord body](self, "body");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = UNEqualObjects();

  if (!v28)
    goto LABEL_23;
  -[UNSNotificationRecord attributedBody](self, "attributedBody");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedBody");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = UNEqualObjects();

  if (!v31)
    goto LABEL_23;
  -[UNSNotificationRecord subtitle](self, "subtitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = UNEqualObjects();

  if (!v34)
    goto LABEL_23;
  -[UNSNotificationRecord title](self, "title");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = UNEqualObjects();

  if (!v37)
    goto LABEL_23;
  -[UNSNotificationRecord defaultActionTitle](self, "defaultActionTitle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultActionTitle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = UNEqualObjects();

  if (!v40)
    goto LABEL_23;
  -[UNSNotificationRecord summaryArgument](self, "summaryArgument");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryArgument");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = UNEqualObjects();

  if (!v43)
    goto LABEL_23;
  v44 = -[UNSNotificationRecord summaryArgumentCount](self, "summaryArgumentCount");
  if (v44 == objc_msgSend(v4, "summaryArgumentCount")
    && (-[UNSNotificationRecord relevanceScore](self, "relevanceScore"),
        v46 = v45,
        objc_msgSend(v4, "relevanceScore"),
        v46 == v47)
    && (v48 = -[UNSNotificationRecord hasDefaultAction](self, "hasDefaultAction"),
        v48 == objc_msgSend(v4, "hasDefaultAction")))
  {
    -[UNSNotificationRecord defaultActionTitleLocalizationKey](self, "defaultActionTitleLocalizationKey");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultActionTitleLocalizationKey");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = UNEqualObjects();

  }
  else
  {
LABEL_23:
    v49 = 0;
  }

  return v49;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  id v164;
  id v165;
  void *v166;
  id v167;
  void *v168;
  id v169;
  void *v170;
  id v171;
  void *v172;
  id v173;
  void *v174;
  id v175;
  id v176;
  void *v177;
  id v178;
  id v179;
  void *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  unint64_t v189;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSNotificationRecord contentType](self, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[UNSNotificationRecord communicationContextIdentifier](self, "communicationContextIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[UNSNotificationRecord communicationContextBundleIdentifier](self, "communicationContextBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[UNSNotificationRecord communicationContextAssociatedObjectUri](self, "communicationContextAssociatedObjectUri");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  -[UNSNotificationRecord communicationContextDisplayName](self, "communicationContextDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:", v12);

  -[UNSNotificationRecord communicationContextSender](self, "communicationContextSender");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:", v14);

  -[UNSNotificationRecord communicationContextRecipients](self, "communicationContextRecipients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:", v16);

  -[UNSNotificationRecord communicationContextContentURL](self, "communicationContextContentURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:", v18);

  -[UNSNotificationRecord communicationContextImageName](self, "communicationContextImageName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "appendObject:", v20);

  v22 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextSystemImage](self, "communicationContextSystemImage"));
  v23 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextMentionsCurrentUser](self, "communicationContextMentionsCurrentUser"));
  v24 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextNotifyRecipientAnyway](self, "communicationContextNotifyRecipientAnyway"));
  v25 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextReplyToCurrentUser](self, "communicationContextReplyToCurrentUser"));
  v26 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord communicationContextRecipientCount](self, "communicationContextRecipientCount"));
  v27 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord communicationContextCapabilities](self, "communicationContextCapabilities"));
  v28 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextBusinessCorrespondence](self, "communicationContextBusinessCorrespondence"));
  -[UNSNotificationRecord accessoryImageName](self, "accessoryImageName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendObject:", v29);

  -[UNSNotificationRecord attachments](self, "attachments");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v3, "appendObject:", v31);

  -[UNSNotificationRecord badge](self, "badge");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v3, "appendObject:", v33);

  -[UNSNotificationRecord bodyLocalizationKey](self, "bodyLocalizationKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v3, "appendObject:", v35);

  -[UNSNotificationRecord body](self, "body");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v3, "appendObject:", v37);

  -[UNSNotificationRecord bodyLocalizationArguments](self, "bodyLocalizationArguments");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v3, "appendObject:", v39);

  -[UNSNotificationRecord attributedBody](self, "attributedBody");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v3, "appendObject:", v41);

  -[UNSNotificationRecord summaryArgument](self, "summaryArgument");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (id)objc_msgSend(v3, "appendObject:", v43);

  v45 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord summaryArgumentCount](self, "summaryArgumentCount"));
  -[UNSNotificationRecord targetContentIdentifier](self, "targetContentIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (id)objc_msgSend(v3, "appendObject:", v46);

  -[UNSNotificationRecord categoryIdentifier](self, "categoryIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (id)objc_msgSend(v3, "appendObject:", v48);

  -[UNSNotificationRecord threadIdentifier](self, "threadIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v3, "appendObject:", v50);

  -[UNSNotificationRecord contentAvailable](self, "contentAvailable");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (id)objc_msgSend(v3, "appendObject:", v52);

  -[UNSNotificationRecord contentDate](self, "contentDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (id)objc_msgSend(v3, "appendObject:", v54);

  -[UNSNotificationRecord mutableContent](self, "mutableContent");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (id)objc_msgSend(v3, "appendObject:", v56);

  -[UNSNotificationRecord date](self, "date");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (id)objc_msgSend(v3, "appendObject:", v58);

  v60 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord interruptionLevel](self, "interruptionLevel"));
  v61 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord hasDefaultAction](self, "hasDefaultAction"));
  -[UNSNotificationRecord defaultActionTitle](self, "defaultActionTitle");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (id)objc_msgSend(v3, "appendObject:", v62);

  -[UNSNotificationRecord defaultActionTitleLocalizationKey](self, "defaultActionTitleLocalizationKey");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (id)objc_msgSend(v3, "appendObject:", v64);

  -[UNSNotificationRecord defaultActionURL](self, "defaultActionURL");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (id)objc_msgSend(v3, "appendObject:", v66);

  -[UNSNotificationRecord defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (id)objc_msgSend(v3, "appendObject:", v68);

  -[UNSNotificationRecord expirationDate](self, "expirationDate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (id)objc_msgSend(v3, "appendObject:", v70);

  v72 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord hasCriticalAlertSound](self, "hasCriticalAlertSound"));
  -[UNSNotificationRecord header](self, "header");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (id)objc_msgSend(v3, "appendObject:", v73);

  -[UNSNotificationRecord headerLocalizationKey](self, "headerLocalizationKey");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (id)objc_msgSend(v3, "appendObject:", v75);

  -[UNSNotificationRecord headerLocalizationArguments](self, "headerLocalizationArguments");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (id)objc_msgSend(v3, "appendObject:", v77);

  -[UNSNotificationRecord footer](self, "footer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (id)objc_msgSend(v3, "appendObject:", v79);

  -[UNSNotificationRecord footerLocalizationKey](self, "footerLocalizationKey");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (id)objc_msgSend(v3, "appendObject:", v81);

  -[UNSNotificationRecord footerLocalizationArguments](self, "footerLocalizationArguments");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (id)objc_msgSend(v3, "appendObject:", v83);

  -[UNSNotificationRecord iconApplicationIdentifier](self, "iconApplicationIdentifier");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (id)objc_msgSend(v3, "appendObject:", v85);

  -[UNSNotificationRecord iconName](self, "iconName");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (id)objc_msgSend(v3, "appendObject:", v87);

  -[UNSNotificationRecord iconPath](self, "iconPath");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (id)objc_msgSend(v3, "appendObject:", v89);

  -[UNSNotificationRecord iconSystemImageName](self, "iconSystemImageName");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (id)objc_msgSend(v3, "appendObject:", v91);

  -[UNSNotificationRecord identifier](self, "identifier");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (id)objc_msgSend(v3, "appendObject:", v93);

  -[UNSNotificationRecord launchImageName](self, "launchImageName");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (id)objc_msgSend(v3, "appendObject:", v95);

  -[UNSNotificationRecord requestDate](self, "requestDate");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (id)objc_msgSend(v3, "appendObject:", v97);

  v99 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldBadgeApplicationIcon](self, "shouldBadgeApplicationIcon"));
  v100 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldHideDate](self, "shouldHideDate"));
  v101 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldHideTime](self, "shouldHideTime"));
  v102 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"));
  v103 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb"));
  v104 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreDowntime](self, "shouldIgnoreDowntime"));
  v105 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"));
  v106 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp"));
  v107 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification"));
  v108 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldDisplayActionsInline](self, "shouldDisplayActionsInline"));
  v109 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPlaySound](self, "shouldPlaySound"));
  v110 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"));
  v111 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord presentationOptions](self, "presentationOptions"));
  v112 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction"));
  v113 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction"));
  v114 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction"));
  v115 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon"));
  v116 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldSoundRepeat](self, "shouldSoundRepeat"));
  v117 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"));
  v118 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync"));
  -[UNSNotificationRecord audioCategory](self, "audioCategory");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (id)objc_msgSend(v3, "appendObject:", v119);

  -[UNSNotificationRecord audioVolume](self, "audioVolume");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (id)objc_msgSend(v3, "appendObject:", v121);

  -[UNSNotificationRecord soundMaximumDuration](self, "soundMaximumDuration");
  v123 = (id)objc_msgSend(v3, "appendDouble:");
  -[UNSNotificationRecord subtitle](self, "subtitle");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (id)objc_msgSend(v3, "appendObject:", v124);

  -[UNSNotificationRecord subtitleLocalizationKey](self, "subtitleLocalizationKey");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (id)objc_msgSend(v3, "appendObject:", v126);

  -[UNSNotificationRecord subtitleLocalizationArguments](self, "subtitleLocalizationArguments");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = (id)objc_msgSend(v3, "appendObject:", v128);

  -[UNSNotificationRecord title](self, "title");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (id)objc_msgSend(v3, "appendObject:", v130);

  -[UNSNotificationRecord titleLocalizationKey](self, "titleLocalizationKey");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (id)objc_msgSend(v3, "appendObject:", v132);

  -[UNSNotificationRecord titleLocalizationArguments](self, "titleLocalizationArguments");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = (id)objc_msgSend(v3, "appendObject:", v134);

  -[UNSNotificationRecord toneAlertTopic](self, "toneAlertTopic");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (id)objc_msgSend(v3, "appendObject:", v136);

  v138 = (id)objc_msgSend(v3, "appendInteger:", -[UNSNotificationRecord toneAlertType](self, "toneAlertType"));
  -[UNSNotificationRecord toneFileName](self, "toneFileName");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = (id)objc_msgSend(v3, "appendObject:", v139);

  -[UNSNotificationRecord toneFileURL](self, "toneFileURL");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = (id)objc_msgSend(v3, "appendObject:", v141);

  -[UNSNotificationRecord toneIdentifier](self, "toneIdentifier");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (id)objc_msgSend(v3, "appendObject:", v143);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[UNSNotificationRecord toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = (id)objc_msgSend(v3, "appendObject:", v145);

  -[UNSNotificationRecord topicIdentifiers](self, "topicIdentifiers");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = (id)objc_msgSend(v3, "appendObject:", v147);

  v149 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord realertCount](self, "realertCount"));
  v150 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsDefaultDestinations](self, "allowsDefaultDestinations"));
  v151 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsLockScreenDestination](self, "allowsLockScreenDestination"));
  v152 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsNotificationCenterDestination](self, "allowsNotificationCenterDestination"));
  v153 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsAlertDestination](self, "allowsAlertDestination"));
  v154 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsCarPlayDestination](self, "allowsCarPlayDestination"));
  -[UNSNotificationRecord triggerDate](self, "triggerDate");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = (id)objc_msgSend(v3, "appendObject:", v155);

  -[UNSNotificationRecord triggerDateComponents](self, "triggerDateComponents");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = (id)objc_msgSend(v3, "appendObject:", v157);

  -[UNSNotificationRecord triggerRegion](self, "triggerRegion");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = (id)objc_msgSend(v3, "appendObject:", v159);

  -[UNSNotificationRecord triggerRepeatCalendarIdentifier](self, "triggerRepeatCalendarIdentifier");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = (id)objc_msgSend(v3, "appendObject:", v161);

  v163 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord triggerRepeatInterval](self, "triggerRepeatInterval"));
  v164 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord triggerRepeats](self, "triggerRepeats"));
  -[UNSNotificationRecord triggerTimeInterval](self, "triggerTimeInterval");
  v165 = (id)objc_msgSend(v3, "appendDouble:");
  -[UNSNotificationRecord triggerTimeZone](self, "triggerTimeZone");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = (id)objc_msgSend(v3, "appendObject:", v166);

  -[UNSNotificationRecord triggerType](self, "triggerType");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = (id)objc_msgSend(v3, "appendObject:", v168);

  -[UNSNotificationRecord userInfo](self, "userInfo");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = (id)objc_msgSend(v3, "appendObject:", v170);

  -[UNSNotificationRecord vibrationIdentifier](self, "vibrationIdentifier");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = (id)objc_msgSend(v3, "appendObject:", v172);

  -[UNSNotificationRecord vibrationPatternFileURL](self, "vibrationPatternFileURL");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = (id)objc_msgSend(v3, "appendObject:", v174);

  -[UNSNotificationRecord relevanceScore](self, "relevanceScore");
  v176 = (id)objc_msgSend(v3, "appendDouble:");
  -[UNSNotificationRecord filterCriteria](self, "filterCriteria");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = (id)objc_msgSend(v3, "appendObject:", v177);

  v179 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord screenCaptureProhibited](self, "screenCaptureProhibited"));
  -[UNSNotificationRecord speechLanguage](self, "speechLanguage");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = (id)objc_msgSend(v3, "appendObject:", v180);

  v182 = (id)objc_msgSend(v3, "appendInteger:", -[UNSNotificationRecord revisionNumber](self, "revisionNumber"));
  v183 = (id)objc_msgSend(v3, "appendInteger:", -[UNSNotificationRecord pipelineState](self, "pipelineState"));
  v184 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord isHighlight](self, "isHighlight"));
  -[UNSNotificationRecord summary](self, "summary");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = (id)objc_msgSend(v3, "appendObject:", v185);

  -[UNSNotificationRecord eventBehavior](self, "eventBehavior");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = (id)objc_msgSend(v3, "appendObject:", v187);

  v189 = objc_msgSend(v3, "hash");
  return v189;
}

- (BOOL)willNotifyUser
{
  return -[UNSNotificationRecord hasAlertContent](self, "hasAlertContent")
      || -[UNSNotificationRecord hasSound](self, "hasSound");
}

- (BOOL)hasCommunicationContext
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[UNSNotificationRecord communicationContextIdentifier](self, "communicationContextIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[UNSNotificationRecord communicationContextAssociatedObjectUri](self, "communicationContextAssociatedObjectUri");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[UNSNotificationRecord communicationContextBundleIdentifier](self, "communicationContextBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[UNSNotificationRecord communicationContextDisplayName](self, "communicationContextDisplayName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          -[UNSNotificationRecord communicationContextRecipients](self, "communicationContextRecipients");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "count"))
          {
            v4 = 1;
          }
          else
          {
            -[UNSNotificationRecord communicationContextSender](self, "communicationContextSender");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v4 = 1;
            }
            else
            {
              -[UNSNotificationRecord communicationContextContentURL](self, "communicationContextContentURL");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                v4 = 1;
              }
              else
              {
                -[UNSNotificationRecord communicationContextImageName](self, "communicationContextImageName");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v4 = v11
                  || -[UNSNotificationRecord communicationContextSystemImage](self, "communicationContextSystemImage")
                  || -[UNSNotificationRecord communicationContextMentionsCurrentUser](self, "communicationContextMentionsCurrentUser")|| -[UNSNotificationRecord communicationContextNotifyRecipientAnyway](self, "communicationContextNotifyRecipientAnyway")|| -[UNSNotificationRecord communicationContextReplyToCurrentUser](self, "communicationContextReplyToCurrentUser")|| -[UNSNotificationRecord communicationContextRecipientCount](self, "communicationContextRecipientCount")|| -[UNSNotificationRecord communicationContextCapabilities](self, "communicationContextCapabilities")|| -[UNSNotificationRecord communicationContextBusinessCorrespondence](self, "communicationContextBusinessCorrespondence");

              }
            }

          }
        }

      }
    }

  }
  return v4;
}

- (BOOL)hasAlertContent
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UNSNotificationRecord body](self, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[UNSNotificationRecord bodyLocalizationKey](self, "bodyLocalizationKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v4 = 1;
    }
    else
    {
      -[UNSNotificationRecord subtitle](self, "subtitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        v4 = 1;
      }
      else
      {
        -[UNSNotificationRecord subtitleLocalizationKey](self, "subtitleLocalizationKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length"))
        {
          v4 = 1;
        }
        else
        {
          -[UNSNotificationRecord title](self, "title");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "length"))
          {
            v4 = 1;
          }
          else
          {
            -[UNSNotificationRecord titleLocalizationKey](self, "titleLocalizationKey");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = objc_msgSend(v9, "length") != 0;

          }
        }

      }
    }

  }
  return v4;
}

- (BOOL)hasBadge
{
  void *v2;
  BOOL v3;

  -[UNSNotificationRecord badge](self, "badge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasSound
{
  return -[UNSNotificationRecord toneAlertType](self, "toneAlertType") != 0;
}

- (BOOL)hasPendingTrigger
{
  void *v3;
  BOOL v4;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;

  -[UNSNotificationRecord triggerType](self, "triggerType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Calendar")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Location")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("TimeInterval")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Local")))
  {
    v6 = -[UNSNotificationRecord triggerRepeatInterval](self, "triggerRepeatInterval");
    -[UNSNotificationRecord triggerDate](self, "triggerDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v4 = 1;
    if (!v6)
    {
      if (!v7 || (objc_msgSend(v7, "timeIntervalSinceNow"), v9 <= 0.0))
        v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UNSNotificationRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  UNSNotificationRecord *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__UNSNotificationRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_251AE01A0;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __63__UNSNotificationRecord_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  double v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  id v145;
  void *v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  id v168;
  id v169;
  double v170;
  id v171;
  id v172;
  id v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  void *v189;
  id v190;
  id v191;
  void *v192;
  id v193;
  id v194;
  id v195;
  id v196;
  void *v197;
  id v198;
  id v199;
  id v200;
  id v201;

  v1 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v4, CFSTR("ContentType"), 1);

  v5 = objc_msgSend(*v3, "hasCommunicationContext");
  v6 = (id)objc_msgSend(*v1, "appendBool:withName:", v5, CFSTR("HasCommunicationContext"));
  if ((_DWORD)v5)
  {
    v7 = *v1;
    objc_msgSend(*v3, "communicationContextIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:withName:", v8, CFSTR("CommunicationContextIdentifier"));

    v9 = *v1;
    objc_msgSend(*v3, "communicationContextBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:withName:", v10, CFSTR("CommunicationContextBundleIdentifier"));

    v11 = *v1;
    objc_msgSend(*v3, "communicationContextAssociatedObjectUri");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:withName:", v12, CFSTR("CommunicationContextAssociatedObjectUri"));

    v13 = *v1;
    objc_msgSend(*v3, "communicationContextDisplayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:withName:", v14, CFSTR("CommunicationContextDisplayName"));

    v15 = *v1;
    objc_msgSend(*v3, "communicationContextSender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "appendObject:withName:", v16, CFSTR("CommunicationContextSender"));

    v18 = *v1;
    objc_msgSend(*v3, "communicationContextRecipients");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v18, "appendObject:withName:", v19, CFSTR("CommunicationContextRecipients"));

    v21 = *v1;
    objc_msgSend(*v3, "communicationContextContentURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v21, "appendObject:withName:", v22, CFSTR("CommunicationContextContentURL"));

    v24 = *v1;
    objc_msgSend(*v3, "communicationContextImageName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v24, "appendObject:withName:", v25, CFSTR("CommunicationContextImageName"));

    v27 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextSystemImage"), CFSTR("CommunicationContextSystemImage"));
    v28 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextMentionsCurrentUser"), CFSTR("CommunicationContextMentionsCurrentUser"));
    v29 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextNotifyRecipientAnyway"), CFSTR("CommunicationContextNotifyRecipientAnyway"));
    v30 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextReplyToCurrentUser"), CFSTR("CommunicationContextReplyToCurrentUser"));
    v31 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "communicationContextRecipientCount"), CFSTR("CommunicationContextRecipientCount"));
    v32 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "communicationContextCapabilities"), CFSTR("CommunicationContextCapabilities"));
    v33 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextBusinessCorrespondence"), CFSTR("CommunicationContextBusinessCorrespondence"));
  }
  v34 = *v1;
  objc_msgSend(*v3, "accessoryImageName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "appendString:withName:skipIfEmpty:", v35, CFSTR("AccessoryImageName"), 1);

  v36 = *v1;
  objc_msgSend(*v3, "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v36, "appendObject:withName:skipIfNil:", v37, CFSTR("Date"), 1);

  v39 = *v1;
  objc_msgSend(*v3, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "appendString:withName:skipIfEmpty:", v40, CFSTR("Identifier"), 1);

  v41 = *v1;
  objc_msgSend(*v3, "threadIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:withName:skipIfEmpty:", v42, CFSTR("ThreadIdentifier"), 1);

  v43 = *v1;
  objc_msgSend(*v3, "categoryIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "appendString:withName:skipIfEmpty:", v44, CFSTR("CategoryIdentifier"), 1);

  v45 = *v1;
  objc_msgSend(*v3, "attachments");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "appendArraySection:withName:skipIfEmpty:", v46, CFSTR("Attachments"), 1);

  v47 = *v1;
  objc_msgSend(*v3, "badge");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (id)objc_msgSend(v47, "appendObject:withName:skipIfNil:", v48, CFSTR("Badge"), 1);

  v50 = *v1;
  objc_msgSend(*v3, "body");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "appendString:withName:skipIfEmpty:", v51, CFSTR("Body"), 1);

  v52 = *v1;
  objc_msgSend(*v3, "bodyLocalizationKey");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "appendString:withName:skipIfEmpty:", v53, CFSTR("BodyLocalizationKey"), 1);

  v54 = *v1;
  objc_msgSend(*v3, "bodyLocalizationArguments");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "appendArraySection:withName:skipIfEmpty:", v55, CFSTR("BodyLocalizationArguments"), 1);

  v56 = *v1;
  objc_msgSend(*v3, "attributedBody");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (id)objc_msgSend(v56, "appendObject:withName:skipIfNil:", v57, CFSTR("AttributedBody"), 1);

  v59 = *v1;
  objc_msgSend(*v3, "summaryArgument");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "appendString:withName:", v60, CFSTR("SummaryArgument"));

  v61 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "summaryArgumentCount"), CFSTR("SummaryArgumentCount"));
  v62 = *v1;
  objc_msgSend(*v3, "targetContentIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "appendString:withName:", v63, CFSTR("TargetContentIdentifier"));

  v64 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "hasCriticalAlertSound"), CFSTR("CriticalAlertSound"), 1);
  v65 = *v1;
  objc_msgSend(*v3, "header");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "appendString:withName:skipIfEmpty:", v66, CFSTR("Header"), 1);

  v67 = *v1;
  objc_msgSend(*v3, "headerLocalizationKey");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "appendString:withName:skipIfEmpty:", v68, CFSTR("HeaderLocalizationKey"), 1);

  v69 = *v1;
  objc_msgSend(*v3, "headerLocalizationArguments");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendArraySection:withName:skipIfEmpty:", v70, CFSTR("HeaderLocalizationArguments"), 1);

  v71 = *v1;
  objc_msgSend(*v3, "footer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "appendString:withName:skipIfEmpty:", v72, CFSTR("Footer"), 1);

  v73 = *v1;
  objc_msgSend(*v3, "footerLocalizationKey");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "appendString:withName:skipIfEmpty:", v74, CFSTR("FooterLocalizationKey"), 1);

  v75 = *v1;
  objc_msgSend(*v3, "footerLocalizationArguments");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "appendArraySection:withName:skipIfEmpty:", v76, CFSTR("FooterLocalizationArguments"), 1);

  v77 = *v1;
  objc_msgSend(*v3, "iconApplicationIdentifier");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "appendString:withName:skipIfEmpty:", v78, CFSTR("IconApplicationIdentifier"), 1);

  v79 = *v1;
  objc_msgSend(*v3, "iconName");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "appendString:withName:skipIfEmpty:", v80, CFSTR("IconName"), 1);

  v81 = *v1;
  objc_msgSend(*v3, "iconPath");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "appendString:withName:skipIfEmpty:", v82, CFSTR("IconPath"), 1);

  v83 = *v1;
  objc_msgSend(*v3, "iconSystemImageName");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "appendString:withName:skipIfEmpty:", v84, CFSTR("IconSystemImageName"), 1);

  v85 = *v1;
  objc_msgSend(*v3, "contentAvailable");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (id)objc_msgSend(v85, "appendObject:withName:skipIfNil:", v86, CFSTR("ContentAvailable"), 1);

  v88 = *v1;
  objc_msgSend(*v3, "mutableContent");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (id)objc_msgSend(v88, "appendObject:withName:skipIfNil:", v89, CFSTR("MutableContent"), 1);

  v91 = *v1;
  objc_msgSend(*v3, "contentDate");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (id)objc_msgSend(v91, "appendObject:withName:skipIfNil:", v92, CFSTR("ContentDate"), 1);

  v94 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "interruptionLevel"), CFSTR("InterruptionLevel"));
  v95 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "hasDefaultAction"), CFSTR("hasDefaultAction"), 0);
  v96 = *v1;
  objc_msgSend(*v3, "defaultActionTitle");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "appendString:withName:skipIfEmpty:", v97, CFSTR("DefaultActionTitle"), 1);

  v98 = *v1;
  objc_msgSend(*v3, "defaultActionTitleLocalizationKey");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "appendString:withName:skipIfEmpty:", v99, CFSTR("DefaultActionTitleLocalizationKey"), 1);

  v100 = *v1;
  objc_msgSend(*v3, "defaultActionURL");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (id)objc_msgSend(v100, "appendObject:withName:skipIfNil:", v101, CFSTR("DefaultActionURL"), 1);

  v103 = *v1;
  objc_msgSend(*v3, "defaultActionBundleIdentifier");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "appendString:withName:skipIfEmpty:", v104, CFSTR("DefaultActionBundleIdentifier"), 1);

  v105 = *v1;
  objc_msgSend(*v3, "expirationDate");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (id)objc_msgSend(v105, "appendObject:withName:skipIfNil:", v106, CFSTR("ExpirationDate"), 1);

  v108 = *v1;
  objc_msgSend(*v3, "launchImageName");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "appendString:withName:skipIfEmpty:", v109, CFSTR("LaunchImageName"), 1);

  v110 = *v1;
  objc_msgSend(*v3, "requestDate");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (id)objc_msgSend(v110, "appendObject:withName:skipIfNil:", v111, CFSTR("RequestDate"), 1);

  v113 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldBadgeApplicationIcon"), CFSTR("ShouldBadgeApplicationIcon"), 0);
  v114 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldIgnoreRingerSwitch"), CFSTR("ShouldIgnoreRingerSwitch"), 1);
  v115 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldPlaySound"), CFSTR("ShouldPlaySound"), 0);
  v116 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldPresentAlert"), CFSTR("ShouldPresentAlert"), 0);
  v117 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "presentationOptions"), CFSTR("PresentationOptions"));
  v118 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldShowSubordinateIcon"), CFSTR("ShouldShowSubordinateIcon"), 1);
  v119 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldSoundRepeat"), CFSTR("ShouldSoundRepeat"), 1);
  v120 = *v1;
  objc_msgSend(*v3, "audioCategory");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "appendString:withName:skipIfEmpty:", v121, CFSTR("SoundAudioCategory"), 1);

  v122 = *v1;
  objc_msgSend(*v3, "audioVolume");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (id)objc_msgSend(v122, "appendObject:withName:skipIfNil:", v123, CFSTR("SoundAudioVolume"), 1);

  objc_msgSend(*v3, "soundMaximumDuration");
  if (v125 != 0.0)
  {
    v126 = *v1;
    objc_msgSend(*v3, "soundMaximumDuration");
    v127 = (id)objc_msgSend(v126, "appendDouble:withName:decimalPrecision:", CFSTR("SoundMaximumDuration"), 1);
  }
  v128 = *v1;
  objc_msgSend(*v3, "subtitle");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "appendString:withName:skipIfEmpty:", v129, CFSTR("Subtitle"), 1);

  v130 = *v1;
  objc_msgSend(*v3, "title");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "appendString:withName:skipIfEmpty:", v131, CFSTR("Title"), 1);

  v132 = *v1;
  objc_msgSend(*v3, "titleLocalizationKey");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "appendString:withName:skipIfEmpty:", v133, CFSTR("TitleLocalizationKey"), 1);

  v134 = *v1;
  objc_msgSend(*v3, "titleLocalizationArguments");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "appendArraySection:withName:skipIfEmpty:", v135, CFSTR("TitleLocalizationArguments"), 1);

  v136 = *v1;
  objc_msgSend(*v3, "toneAlertTopic");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "appendString:withName:skipIfEmpty:", v137, CFSTR("ToneAlertTopic"), 1);

  v138 = *v1;
  objc_msgSend(*v3, "toneAlertType");
  NSStringFromTLAlertType();
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "appendString:withName:skipIfEmpty:", v139, CFSTR("ToneAlertType"), 1);

  v140 = *v1;
  objc_msgSend(*v3, "toneFileName");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "appendString:withName:skipIfEmpty:", v141, CFSTR("ToneFileName"), 1);

  v142 = *v1;
  objc_msgSend(*v3, "toneFileURL");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (id)objc_msgSend(v142, "appendObject:withName:skipIfNil:", v143, CFSTR("ToneFileURL"), 1);

  v145 = *v1;
  objc_msgSend(*v3, "toneIdentifier");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "appendString:withName:skipIfEmpty:", v146, CFSTR("ToneIdentifier"), 1);

  if (objc_msgSend(*v3, "toneMediaLibraryItemIdentifier"))
    v147 = (id)objc_msgSend(*v1, "appendUInt64:withName:", objc_msgSend(*v3, "toneMediaLibraryItemIdentifier"), CFSTR("ToneMediaLibraryItemIdentifier"));
  v148 = *v1;
  objc_msgSend(*v3, "topicIdentifiers");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "allObjects");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "appendArraySection:withName:skipIfEmpty:", v150, CFSTR("TopicIdentifiers"), 1);

  if (objc_msgSend(*v3, "realertCount"))
    v151 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "realertCount"), CFSTR("RealertCount"));
  v152 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsDefaultDestinations"), CFSTR("DefaultDestinations"), 1);
  v153 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsLockScreenDestination"), CFSTR("LockScreenDestination"), 1);
  v154 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsNotificationCenterDestination"), CFSTR("NotificationCenterDestination"), 1);
  v155 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsAlertDestination"), CFSTR("AlertDestination"), 1);
  v156 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsCarPlayDestination"), CFSTR("CarPlayDestination"), 1);
  v157 = *v1;
  objc_msgSend(*v3, "triggerDate");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = (id)objc_msgSend(v157, "appendObject:withName:skipIfNil:", v158, CFSTR("TriggerDate"), 1);

  v160 = *v1;
  objc_msgSend(*v3, "triggerDateComponents");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = (id)objc_msgSend(v160, "appendObject:withName:skipIfNil:", v161, CFSTR("TriggerDateComponents"), 1);

  v163 = *v1;
  objc_msgSend(*v3, "triggerRegion");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = (id)objc_msgSend(v163, "appendObject:withName:skipIfNil:", v164, CFSTR("TriggerRegion"), 1);

  v166 = *v1;
  objc_msgSend(*v3, "triggerRepeatCalendarIdentifier");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "appendString:withName:skipIfEmpty:", v167, CFSTR("TriggerRepeatCalendar"), 1);

  if (objc_msgSend(*v3, "triggerRepeatInterval"))
    v168 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "triggerRepeatInterval"), CFSTR("TriggerRepeatInterval"));
  v169 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "triggerRepeats"), CFSTR("TriggerRepeats"), 1);
  objc_msgSend(*v3, "triggerTimeInterval");
  if (v170 != 0.0)
  {
    v171 = *v1;
    objc_msgSend(*v3, "triggerTimeInterval");
    v172 = (id)objc_msgSend(v171, "appendDouble:withName:decimalPrecision:", CFSTR("TriggerTimeInterval"), 1);
  }
  v173 = *v1;
  objc_msgSend(*v3, "triggerTimeZone");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "name");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "appendString:withName:skipIfEmpty:", v175, CFSTR("TriggerTimeZone"), 1);

  v176 = *v1;
  objc_msgSend(*v3, "triggerType");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "appendString:withName:skipIfEmpty:", v177, CFSTR("TriggerType"), 1);

  v178 = *v1;
  objc_msgSend(*v3, "userInfo");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "appendDictionarySection:withName:skipIfEmpty:", v179, CFSTR("UserInfo"), 1);

  v180 = *v1;
  objc_msgSend(*v3, "vibrationIdentifier");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "appendString:withName:skipIfEmpty:", v181, CFSTR("VibrationIdentifier"), 1);

  v182 = *v1;
  objc_msgSend(*v3, "vibrationPatternFileURL");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = (id)objc_msgSend(v182, "appendObject:withName:skipIfNil:", v183, CFSTR("VibrationPatternFileURL"), 1);

  v185 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldIgnoreAccessibilityDisabledVibrationSetting"), CFSTR("ShouldIgnoreAccessibilityDisabledVibrationSetting"), 1);
  v186 = *v1;
  objc_msgSend(*v3, "relevanceScore");
  v187 = (id)objc_msgSend(v186, "appendDouble:withName:decimalPrecision:", CFSTR("RelevanceScore"), 2);
  v188 = *v1;
  objc_msgSend(*v3, "filterCriteria");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "appendString:withName:", v189, CFSTR("FilterCriteria"));

  v190 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "screenCaptureProhibited"), CFSTR("ScreenCaptureProhibited"), 1);
  v191 = *v1;
  objc_msgSend(*v3, "speechLanguage");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "appendString:withName:", v192, CFSTR("SpeechLanguage"));

  v193 = (id)objc_msgSend(*v1, "appendInteger:withName:", objc_msgSend(*v3, "revisionNumber"), CFSTR("RevisionNumber"));
  v194 = (id)objc_msgSend(*v1, "appendInteger:withName:", objc_msgSend(*v3, "pipelineState"), CFSTR("PipelineState"));
  v195 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "isHighlight"), CFSTR("IsHighlight"), 1);
  v196 = *v1;
  objc_msgSend(*v3, "summary");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = (id)objc_msgSend(v196, "appendObject:withName:", v197, CFSTR("Summary"));

  v199 = *v1;
  objc_msgSend(*v3, "eventBehavior");
  v201 = (id)objc_claimAutoreleasedReturnValue();
  v200 = (id)objc_msgSend(v199, "appendObject:withName:", v201, CFSTR("EventBehavior"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UNSNotificationRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSNotificationRecord date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("Date"), 1);

  -[UNSNotificationRecord contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("ContentType"), 1);

  -[UNSNotificationRecord identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v8, CFSTR("Identifier"), 1);

  -[UNSNotificationRecord threadIdentifier](self, "threadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v9, CFSTR("ThreadIdentifier"), 1);

  -[UNSNotificationRecord categoryIdentifier](self, "categoryIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v10, CFSTR("CategoryIdentifier"), 1);

  -[UNSNotificationRecord targetContentIdentifier](self, "targetContentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v11, CFSTR("TargetContentIdentifier"), 1);

  -[UNSNotificationRecord filterCriteria](self, "filterCriteria");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v12, CFSTR("FilterCriteria"), 1);

  return v3;
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
  -[UNSNotificationRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

- (UNSNotificationRecord)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UNSNotificationRecord *v9;
  _QWORD v11[13];

  v11[12] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  v11[9] = objc_opt_class();
  v11[10] = objc_opt_class();
  v11[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UNSNotificationRecord initWithDictionaryRepresentation:]([UNSNotificationRecord alloc], "initWithDictionaryRepresentation:", v8);
  return v9;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)communicationContextIdentifier
{
  return self->_communicationContextIdentifier;
}

- (void)setCommunicationContextIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)communicationContextBundleIdentifier
{
  return self->_communicationContextBundleIdentifier;
}

- (void)setCommunicationContextBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)communicationContextAssociatedObjectUri
{
  return self->_communicationContextAssociatedObjectUri;
}

- (void)setCommunicationContextAssociatedObjectUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)communicationContextDisplayName
{
  return self->_communicationContextDisplayName;
}

- (void)setCommunicationContextDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UNCContactRecord)communicationContextSender
{
  return self->_communicationContextSender;
}

- (void)setCommunicationContextSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)communicationContextRecipients
{
  return self->_communicationContextRecipients;
}

- (void)setCommunicationContextRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)communicationContextContentURL
{
  return self->_communicationContextContentURL;
}

- (void)setCommunicationContextContentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)communicationContextImageName
{
  return self->_communicationContextImageName;
}

- (void)setCommunicationContextImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)communicationContextSystemImage
{
  return self->_communicationContextSystemImage;
}

- (void)setCommunicationContextSystemImage:(BOOL)a3
{
  self->_communicationContextSystemImage = a3;
}

- (BOOL)communicationContextMentionsCurrentUser
{
  return self->_communicationContextMentionsCurrentUser;
}

- (void)setCommunicationContextMentionsCurrentUser:(BOOL)a3
{
  self->_communicationContextMentionsCurrentUser = a3;
}

- (BOOL)communicationContextNotifyRecipientAnyway
{
  return self->_communicationContextNotifyRecipientAnyway;
}

- (void)setCommunicationContextNotifyRecipientAnyway:(BOOL)a3
{
  self->_communicationContextNotifyRecipientAnyway = a3;
}

- (BOOL)communicationContextReplyToCurrentUser
{
  return self->_communicationContextReplyToCurrentUser;
}

- (void)setCommunicationContextReplyToCurrentUser:(BOOL)a3
{
  self->_communicationContextReplyToCurrentUser = a3;
}

- (int64_t)communicationContextCapabilities
{
  return self->_communicationContextCapabilities;
}

- (void)setCommunicationContextCapabilities:(int64_t)a3
{
  self->_communicationContextCapabilities = a3;
}

- (BOOL)communicationContextBusinessCorrespondence
{
  return self->_communicationContextBusinessCorrespondence;
}

- (void)setCommunicationContextBusinessCorrespondence:(BOOL)a3
{
  self->_communicationContextBusinessCorrespondence = a3;
}

- (unint64_t)communicationContextRecipientCount
{
  return self->_communicationContextRecipientCount;
}

- (void)setCommunicationContextRecipientCount:(unint64_t)a3
{
  self->_communicationContextRecipientCount = a3;
}

- (NSString)accessoryImageName
{
  return self->_accessoryImageName;
}

- (void)setAccessoryImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDate)contentDate
{
  return self->_contentDate;
}

- (void)setContentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)bodyLocalizationArguments
{
  return self->_bodyLocalizationArguments;
}

- (void)setBodyLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)bodyLocalizationKey
{
  return self->_bodyLocalizationKey;
}

- (void)setBodyLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSAttributedString)attributedBody
{
  return self->_attributedBody;
}

- (void)setAttributedBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)contentAvailable
{
  return self->_contentAvailable;
}

- (void)setContentAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)mutableContent
{
  return self->_mutableContent;
}

- (void)setMutableContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (BOOL)hasDefaultAction
{
  return self->_hasDefaultAction;
}

- (void)setHasDefaultAction:(BOOL)a3
{
  self->_hasDefaultAction = a3;
}

- (NSString)defaultActionTitle
{
  return self->_defaultActionTitle;
}

- (void)setDefaultActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)defaultActionTitleLocalizationKey
{
  return self->_defaultActionTitleLocalizationKey;
}

- (void)setDefaultActionTitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (void)setDefaultActionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)defaultActionBundleIdentifier
{
  return self->_defaultActionBundleIdentifier;
}

- (void)setDefaultActionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)hasCriticalAlertSound
{
  return self->_hasCriticalAlertSound;
}

- (void)setHasCriticalAlertSound:(BOOL)a3
{
  self->_hasCriticalAlertSound = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)headerLocalizationArguments
{
  return self->_headerLocalizationArguments;
}

- (void)setHeaderLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)headerLocalizationKey
{
  return self->_headerLocalizationKey;
}

- (void)setHeaderLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)footerLocalizationArguments
{
  return self->_footerLocalizationArguments;
}

- (void)setFooterLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)footerLocalizationKey
{
  return self->_footerLocalizationKey;
}

- (void)setFooterLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)iconApplicationIdentifier
{
  return self->_iconApplicationIdentifier;
}

- (void)setIconApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (void)setIconPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)iconSystemImageName
{
  return self->_iconSystemImageName;
}

- (void)setIconSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (BOOL)iconShouldSuppressMask
{
  return self->_iconShouldSuppressMask;
}

- (void)setIconShouldSuppressMask:(BOOL)a3
{
  self->_iconShouldSuppressMask = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)launchImageName
{
  return self->_launchImageName;
}

- (void)setLaunchImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (BOOL)shouldBadgeApplicationIcon
{
  return self->_shouldBadgeApplicationIcon;
}

- (void)setShouldBadgeApplicationIcon:(BOOL)a3
{
  self->_shouldBadgeApplicationIcon = a3;
}

- (BOOL)shouldHideDate
{
  return self->_shouldHideDate;
}

- (void)setShouldHideDate:(BOOL)a3
{
  self->_shouldHideDate = a3;
}

- (BOOL)shouldHideTime
{
  return self->_shouldHideTime;
}

- (void)setShouldHideTime:(BOOL)a3
{
  self->_shouldHideTime = a3;
}

- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting
{
  return self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
}

- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3
{
  self->_shouldIgnoreAccessibilityDisabledVibrationSetting = a3;
}

- (BOOL)shouldIgnoreDoNotDisturb
{
  return self->_shouldIgnoreDoNotDisturb;
}

- (void)setShouldIgnoreDoNotDisturb:(BOOL)a3
{
  self->_shouldIgnoreDoNotDisturb = a3;
}

- (BOOL)shouldIgnoreDowntime
{
  return self->_shouldIgnoreDowntime;
}

- (void)setShouldIgnoreDowntime:(BOOL)a3
{
  self->_shouldIgnoreDowntime = a3;
}

- (BOOL)shouldIgnoreRingerSwitch
{
  return self->_shouldIgnoreRingerSwitch;
}

- (void)setShouldIgnoreRingerSwitch:(BOOL)a3
{
  self->_shouldIgnoreRingerSwitch = a3;
}

- (BOOL)shouldSuppressScreenLightUp
{
  return self->_shouldSuppressScreenLightUp;
}

- (void)setShouldSuppressScreenLightUp:(BOOL)a3
{
  self->_shouldSuppressScreenLightUp = a3;
}

- (BOOL)shouldPlaySound
{
  return self->_shouldPlaySound;
}

- (void)setShouldPlaySound:(BOOL)a3
{
  self->_shouldPlaySound = a3;
}

- (BOOL)shouldPresentAlert
{
  return self->_shouldPresentAlert;
}

- (void)setShouldPresentAlert:(BOOL)a3
{
  self->_shouldPresentAlert = a3;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (void)setPresentationOptions:(unint64_t)a3
{
  self->_presentationOptions = a3;
}

- (BOOL)shouldAuthenticateDefaultAction
{
  return self->_shouldAuthenticateDefaultAction;
}

- (void)setShouldAuthenticateDefaultAction:(BOOL)a3
{
  self->_shouldAuthenticateDefaultAction = a3;
}

- (BOOL)shouldBackgroundDefaultAction
{
  return self->_shouldBackgroundDefaultAction;
}

- (void)setShouldBackgroundDefaultAction:(BOOL)a3
{
  self->_shouldBackgroundDefaultAction = a3;
}

- (BOOL)shouldPreventNotificationDismissalAfterDefaultAction
{
  return self->_shouldPreventNotificationDismissalAfterDefaultAction;
}

- (void)setShouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a3
{
  self->_shouldPreventNotificationDismissalAfterDefaultAction = a3;
}

- (BOOL)shouldShowSubordinateIcon
{
  return self->_shouldShowSubordinateIcon;
}

- (void)setShouldShowSubordinateIcon:(BOOL)a3
{
  self->_shouldShowSubordinateIcon = a3;
}

- (BOOL)shouldSoundRepeat
{
  return self->_shouldSoundRepeat;
}

- (void)setShouldSoundRepeat:(BOOL)a3
{
  self->_shouldSoundRepeat = a3;
}

- (BOOL)shouldSuppressSyncDismissalWhenRemoved
{
  return self->_shouldSuppressSyncDismissalWhenRemoved;
}

- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3
{
  self->_shouldSuppressSyncDismissalWhenRemoved = a3;
}

- (BOOL)shouldUseRequestIdentifierForDismissalSync
{
  return self->_shouldUseRequestIdentifierForDismissalSync;
}

- (void)setShouldUseRequestIdentifierForDismissalSync:(BOOL)a3
{
  self->_shouldUseRequestIdentifierForDismissalSync = a3;
}

- (BOOL)shouldPreemptPresentedNotification
{
  return self->_shouldPreemptPresentedNotification;
}

- (void)setShouldPreemptPresentedNotification:(BOOL)a3
{
  self->_shouldPreemptPresentedNotification = a3;
}

- (BOOL)shouldDisplayActionsInline
{
  return self->_shouldDisplayActionsInline;
}

- (void)setShouldDisplayActionsInline:(BOOL)a3
{
  self->_shouldDisplayActionsInline = a3;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (void)setAudioCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSNumber)audioVolume
{
  return self->_audioVolume;
}

- (void)setAudioVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (double)soundMaximumDuration
{
  return self->_soundMaximumDuration;
}

- (void)setSoundMaximumDuration:(double)a3
{
  self->_soundMaximumDuration = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSArray)subtitleLocalizationArguments
{
  return self->_subtitleLocalizationArguments;
}

- (void)setSubtitleLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSString)subtitleLocalizationKey
{
  return self->_subtitleLocalizationKey;
}

- (void)setSubtitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSArray)titleLocalizationArguments
{
  return self->_titleLocalizationArguments;
}

- (void)setTitleLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (void)setTitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (unint64_t)realertCount
{
  return self->_realertCount;
}

- (void)setRealertCount:(unint64_t)a3
{
  self->_realertCount = a3;
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (void)setSummaryArgument:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (unint64_t)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

- (void)setSummaryArgumentCount:(unint64_t)a3
{
  self->_summaryArgumentCount = a3;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (void)setTargetContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSString)toneAlertTopic
{
  return self->_toneAlertTopic;
}

- (void)setToneAlertTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (int64_t)toneAlertType
{
  return self->_toneAlertType;
}

- (void)setToneAlertType:(int64_t)a3
{
  self->_toneAlertType = a3;
}

- (NSString)toneFileName
{
  return self->_toneFileName;
}

- (void)setToneFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSURL)toneFileURL
{
  return self->_toneFileURL;
}

- (void)setToneFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (void)setToneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (unint64_t)toneMediaLibraryItemIdentifier
{
  return self->_toneMediaLibraryItemIdentifier;
}

- (void)setToneMediaLibraryItemIdentifier:(unint64_t)a3
{
  self->_toneMediaLibraryItemIdentifier = a3;
}

- (NSSet)topicIdentifiers
{
  return self->_topicIdentifiers;
}

- (void)setTopicIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (BOOL)allowsDefaultDestinations
{
  return self->_allowsDefaultDestinations;
}

- (void)setAllowsDefaultDestinations:(BOOL)a3
{
  self->_allowsDefaultDestinations = a3;
}

- (BOOL)allowsAlertDestination
{
  return self->_allowsAlertDestination;
}

- (void)setAllowsAlertDestination:(BOOL)a3
{
  self->_allowsAlertDestination = a3;
}

- (BOOL)allowsLockScreenDestination
{
  return self->_allowsLockScreenDestination;
}

- (void)setAllowsLockScreenDestination:(BOOL)a3
{
  self->_allowsLockScreenDestination = a3;
}

- (BOOL)allowsNotificationCenterDestination
{
  return self->_allowsNotificationCenterDestination;
}

- (void)setAllowsNotificationCenterDestination:(BOOL)a3
{
  self->_allowsNotificationCenterDestination = a3;
}

- (BOOL)allowsCarPlayDestination
{
  return self->_allowsCarPlayDestination;
}

- (void)setAllowsCarPlayDestination:(BOOL)a3
{
  self->_allowsCarPlayDestination = a3;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSDateComponents)triggerDateComponents
{
  return self->_triggerDateComponents;
}

- (void)setTriggerDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (NSString)triggerRepeatCalendarIdentifier
{
  return self->_triggerRepeatCalendarIdentifier;
}

- (void)setTriggerRepeatCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (unint64_t)triggerRepeatInterval
{
  return self->_triggerRepeatInterval;
}

- (void)setTriggerRepeatInterval:(unint64_t)a3
{
  self->_triggerRepeatInterval = a3;
}

- (BOOL)triggerRepeats
{
  return self->_triggerRepeats;
}

- (void)setTriggerRepeats:(BOOL)a3
{
  self->_triggerRepeats = a3;
}

- (CLRegion)triggerRegion
{
  return self->_triggerRegion;
}

- (void)setTriggerRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (double)triggerTimeInterval
{
  return self->_triggerTimeInterval;
}

- (void)setTriggerTimeInterval:(double)a3
{
  self->_triggerTimeInterval = a3;
}

- (NSTimeZone)triggerTimeZone
{
  return self->_triggerTimeZone;
}

- (void)setTriggerTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void)setVibrationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (NSURL)vibrationPatternFileURL
{
  return self->_vibrationPatternFileURL;
}

- (void)setVibrationPatternFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->_screenCaptureProhibited = a3;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (void)setSpeechLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (int64_t)revisionNumber
{
  return self->_revisionNumber;
}

- (void)setRevisionNumber:(int64_t)a3
{
  self->_revisionNumber = a3;
}

- (int64_t)pipelineState
{
  return self->_pipelineState;
}

- (void)setPipelineState:(int64_t)a3
{
  self->_pipelineState = a3;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_vibrationPatternFileURL, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_triggerTimeZone, 0);
  objc_storeStrong((id *)&self->_triggerRegion, 0);
  objc_storeStrong((id *)&self->_triggerRepeatCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerDateComponents, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_topicIdentifiers, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_toneFileURL, 0);
  objc_storeStrong((id *)&self->_toneFileName, 0);
  objc_storeStrong((id *)&self->_toneAlertTopic, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_audioVolume, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_launchImageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconSystemImageName, 0);
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_iconApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_footerLocalizationKey, 0);
  objc_storeStrong((id *)&self->_footerLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_headerLocalizationKey, 0);
  objc_storeStrong((id *)&self->_headerLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultActionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_defaultActionTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_defaultActionTitle, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mutableContent, 0);
  objc_storeStrong((id *)&self->_contentAvailable, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_attributedBody, 0);
  objc_storeStrong((id *)&self->_bodyLocalizationKey, 0);
  objc_storeStrong((id *)&self->_bodyLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_contentDate, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accessoryImageName, 0);
  objc_storeStrong((id *)&self->_communicationContextImageName, 0);
  objc_storeStrong((id *)&self->_communicationContextContentURL, 0);
  objc_storeStrong((id *)&self->_communicationContextRecipients, 0);
  objc_storeStrong((id *)&self->_communicationContextSender, 0);
  objc_storeStrong((id *)&self->_communicationContextDisplayName, 0);
  objc_storeStrong((id *)&self->_communicationContextAssociatedObjectUri, 0);
  objc_storeStrong((id *)&self->_communicationContextBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_communicationContextIdentifier, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end
