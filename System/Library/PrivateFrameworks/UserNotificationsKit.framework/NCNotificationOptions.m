@implementation NCNotificationOptions

- (NCNotificationOptions)initWithNotificationOptions:(id)a3
{
  id v4;
  NCNotificationOptions *v5;
  void *v6;
  uint64_t v7;
  NSSet *alertSuppressionContexts;
  void *v9;
  uint64_t v10;
  NSString *alternateActionLabel;
  void *v12;
  uint64_t v13;
  NSString *speechLanguage;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationOptions;
  v5 = -[NCNotificationOptions init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "alertSuppressionContexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    alertSuppressionContexts = v5->_alertSuppressionContexts;
    v5->_alertSuppressionContexts = (NSSet *)v7;

    objc_msgSend(v4, "alternateActionLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    alternateActionLabel = v5->_alternateActionLabel;
    v5->_alternateActionLabel = (NSString *)v10;

    v5->_dismissAutomatically = objc_msgSend(v4, "dismissAutomatically");
    v5->_dismissAutomaticallyForCarPlay = objc_msgSend(v4, "dismissAutomaticallyForCarPlay");
    v5->_overridesQuietMode = objc_msgSend(v4, "overridesQuietMode");
    v5->_overridesDowntime = objc_msgSend(v4, "overridesDowntime");
    v5->_alertsWhenLocked = objc_msgSend(v4, "alertsWhenLocked");
    v5->_addToLockScreenWhenLocked = objc_msgSend(v4, "addToLockScreenWhenUnlocked");
    v5->_lockScreenPersistence = objc_msgSend(v4, "lockScreenPersistence");
    v5->_lockScreenPriority = objc_msgSend(v4, "lockScreenPriority");
    v5->_realertCount = objc_msgSend(v4, "realertCount");
    v5->_suppressesAlertsWhenAppIsActive = objc_msgSend(v4, "suppressesAlertsWhenAppIsActive");
    v5->_silencedByMenuButtonPress = objc_msgSend(v4, "silencedByMenuButtonPress");
    v5->_overridesPocketMode = objc_msgSend(v4, "overridesPocketMode");
    v5->_canPlaySound = objc_msgSend(v4, "canPlaySound");
    v5->_canTurnOnDisplay = objc_msgSend(v4, "canTurnOnDisplay");
    v5->_requestsFullScreenPresentation = objc_msgSend(v4, "requestsFullScreenPresentation");
    v5->_hideClearActionInList = objc_msgSend(v4, "hideClearActionInList");
    v5->_numberOfLinesInfinite = objc_msgSend(v4, "isNumberOfLinesInfinite");
    v5->_preemptsPresentedNotification = objc_msgSend(v4, "preemptsPresentedNotification");
    v5->_displaysActionsInline = objc_msgSend(v4, "displaysActionsInline");
    v5->_revealsAdditionalContentOnPresentation = objc_msgSend(v4, "revealsAdditionalContentOnPresentation");
    v5->_suppressesTitleWhenLocked = objc_msgSend(v4, "suppressesTitleWhenLocked");
    v5->_suppressesSubtitleWhenLocked = objc_msgSend(v4, "suppressesSubtitleWhenLocked");
    v5->_suppressesBodyWhenLocked = objc_msgSend(v4, "suppressesBodyWhenLocked");
    objc_msgSend(v4, "speechLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    speechLanguage = v5->_speechLanguage;
    v5->_speechLanguage = (NSString *)v13;

    v5->_contentPreviewSetting = objc_msgSend(v4, "contentPreviewSetting");
    v5->_coalescesWhenLocked = objc_msgSend(v4, "coalescesWhenLocked");
    v5->_preventsAutomaticLock = objc_msgSend(v4, "preventsAutomaticLock");
    v5->_revealsAdditionalContentIfNoDefaultAction = objc_msgSend(v4, "revealsAdditionalContentIfNoDefaultAction");
    v5->_lauchUsingSiriForCarPlayDefaultAction = objc_msgSend(v4, "lauchUsingSiriForCarPlayDefaultAction");
    v5->_allowActionsForCarPlay = objc_msgSend(v4, "allowActionsForCarPlay");
    v5->_playMediaWhenRaised = objc_msgSend(v4, "playMediaWhenRaised");
    v5->_hideCloseActionForCarPlay = objc_msgSend(v4, "hideCloseActionForCarPlay");
    v5->_shouldAnnounceForCarPlay = objc_msgSend(v4, "shouldAnnounceForCarPlay");
    v5->_suppressPresentationInAmbient = objc_msgSend(v4, "suppressPresentationInAmbient");
    v5->_screenCaptureProhibited = objc_msgSend(v4, "screenCaptureProhibited");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  unint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  _BOOL4 v48;
  int v49;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_42:
      LOBYTE(v49) = 0;
      goto LABEL_43;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_42;
  -[NCNotificationOptions alertSuppressionContexts](self, "alertSuppressionContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertSuppressionContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NCIsEqual(v6, v7);

  if (!v8)
    goto LABEL_42;
  -[NCNotificationOptions alternateActionLabel](self, "alternateActionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alternateActionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NCIsEqual(v9, v10);

  if (!v11)
    goto LABEL_42;
  v12 = -[NCNotificationOptions dismissAutomatically](self, "dismissAutomatically");
  if (v12 != objc_msgSend(v5, "dismissAutomatically"))
    goto LABEL_42;
  v13 = -[NCNotificationOptions dismissAutomaticallyForCarPlay](self, "dismissAutomaticallyForCarPlay");
  if (v13 != objc_msgSend(v5, "dismissAutomaticallyForCarPlay"))
    goto LABEL_42;
  v14 = -[NCNotificationOptions overridesQuietMode](self, "overridesQuietMode");
  if (v14 != objc_msgSend(v5, "overridesQuietMode"))
    goto LABEL_42;
  v15 = -[NCNotificationOptions overridesDowntime](self, "overridesDowntime");
  if (v15 != objc_msgSend(v5, "overridesDowntime"))
    goto LABEL_42;
  v16 = -[NCNotificationOptions alertsWhenLocked](self, "alertsWhenLocked");
  if (v16 != objc_msgSend(v5, "alertsWhenLocked"))
    goto LABEL_42;
  v17 = -[NCNotificationOptions addToLockScreenWhenUnlocked](self, "addToLockScreenWhenUnlocked");
  if (v17 != objc_msgSend(v5, "addToLockScreenWhenUnlocked"))
    goto LABEL_42;
  v18 = -[NCNotificationOptions lockScreenPersistence](self, "lockScreenPersistence");
  if (v18 != objc_msgSend(v5, "lockScreenPersistence"))
    goto LABEL_42;
  v19 = -[NCNotificationOptions lockScreenPriority](self, "lockScreenPriority");
  if (v19 != objc_msgSend(v5, "lockScreenPriority"))
    goto LABEL_42;
  v20 = -[NCNotificationOptions realertCount](self, "realertCount");
  if (v20 != objc_msgSend(v5, "realertCount"))
    goto LABEL_42;
  v21 = -[NCNotificationOptions suppressesAlertsWhenAppIsActive](self, "suppressesAlertsWhenAppIsActive");
  if (v21 != objc_msgSend(v5, "suppressesAlertsWhenAppIsActive"))
    goto LABEL_42;
  v22 = -[NCNotificationOptions silencedByMenuButtonPress](self, "silencedByMenuButtonPress");
  if (v22 != objc_msgSend(v5, "silencedByMenuButtonPress"))
    goto LABEL_42;
  v23 = -[NCNotificationOptions overridesPocketMode](self, "overridesPocketMode");
  if (v23 != objc_msgSend(v5, "overridesPocketMode"))
    goto LABEL_42;
  v24 = -[NCNotificationOptions canPlaySound](self, "canPlaySound");
  if (v24 != objc_msgSend(v5, "canPlaySound"))
    goto LABEL_42;
  v25 = -[NCNotificationOptions canTurnOnDisplay](self, "canTurnOnDisplay");
  if (v25 != objc_msgSend(v5, "canTurnOnDisplay"))
    goto LABEL_42;
  v26 = -[NCNotificationOptions requestsFullScreenPresentation](self, "requestsFullScreenPresentation");
  if (v26 != objc_msgSend(v5, "requestsFullScreenPresentation"))
    goto LABEL_42;
  v27 = -[NCNotificationOptions hideClearActionInList](self, "hideClearActionInList");
  if (v27 != objc_msgSend(v5, "hideClearActionInList"))
    goto LABEL_42;
  v28 = -[NCNotificationOptions isNumberOfLinesInfinite](self, "isNumberOfLinesInfinite");
  if (v28 != objc_msgSend(v5, "isNumberOfLinesInfinite"))
    goto LABEL_42;
  v29 = -[NCNotificationOptions preemptsPresentedNotification](self, "preemptsPresentedNotification");
  if (v29 != objc_msgSend(v5, "preemptsPresentedNotification"))
    goto LABEL_42;
  v30 = -[NCNotificationOptions displaysActionsInline](self, "displaysActionsInline");
  if (v30 != objc_msgSend(v5, "displaysActionsInline"))
    goto LABEL_42;
  v31 = -[NCNotificationOptions revealsAdditionalContentOnPresentation](self, "revealsAdditionalContentOnPresentation");
  if (v31 != objc_msgSend(v5, "revealsAdditionalContentOnPresentation"))
    goto LABEL_42;
  v32 = -[NCNotificationOptions suppressesTitleWhenLocked](self, "suppressesTitleWhenLocked");
  if (v32 != objc_msgSend(v5, "suppressesTitleWhenLocked"))
    goto LABEL_42;
  v33 = -[NCNotificationOptions suppressesSubtitleWhenLocked](self, "suppressesSubtitleWhenLocked");
  if (v33 != objc_msgSend(v5, "suppressesSubtitleWhenLocked"))
    goto LABEL_42;
  v34 = -[NCNotificationOptions suppressesBodyWhenLocked](self, "suppressesBodyWhenLocked");
  if (v34 != objc_msgSend(v5, "suppressesBodyWhenLocked"))
    goto LABEL_42;
  -[NCNotificationOptions speechLanguage](self, "speechLanguage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speechLanguage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = NCIsEqual(v35, v36);

  if (!v37)
    goto LABEL_42;
  v38 = -[NCNotificationOptions contentPreviewSetting](self, "contentPreviewSetting");
  if (v38 != objc_msgSend(v5, "contentPreviewSetting"))
    goto LABEL_42;
  v39 = -[NCNotificationOptions coalescesWhenLocked](self, "coalescesWhenLocked");
  if (v39 != objc_msgSend(v5, "coalescesWhenLocked"))
    goto LABEL_42;
  v40 = -[NCNotificationOptions preventsAutomaticLock](self, "preventsAutomaticLock");
  if (v40 != objc_msgSend(v5, "preventsAutomaticLock"))
    goto LABEL_42;
  v41 = -[NCNotificationOptions revealsAdditionalContentIfNoDefaultAction](self, "revealsAdditionalContentIfNoDefaultAction");
  if (v41 != objc_msgSend(v5, "revealsAdditionalContentIfNoDefaultAction"))
    goto LABEL_42;
  v42 = -[NCNotificationOptions lauchUsingSiriForCarPlayDefaultAction](self, "lauchUsingSiriForCarPlayDefaultAction");
  if (v42 != objc_msgSend(v5, "lauchUsingSiriForCarPlayDefaultAction"))
    goto LABEL_42;
  v43 = -[NCNotificationOptions allowActionsForCarPlay](self, "allowActionsForCarPlay");
  if (v43 != objc_msgSend(v5, "allowActionsForCarPlay"))
    goto LABEL_42;
  v44 = -[NCNotificationOptions playMediaWhenRaised](self, "playMediaWhenRaised");
  if (v44 != objc_msgSend(v5, "playMediaWhenRaised"))
    goto LABEL_42;
  v45 = -[NCNotificationOptions hideCloseActionForCarPlay](self, "hideCloseActionForCarPlay");
  if (v45 != objc_msgSend(v5, "hideCloseActionForCarPlay"))
    goto LABEL_42;
  v46 = -[NCNotificationOptions shouldAnnounceForCarPlay](self, "shouldAnnounceForCarPlay");
  if (v46 != objc_msgSend(v5, "shouldAnnounceForCarPlay"))
    goto LABEL_42;
  v47 = -[NCNotificationOptions suppressPresentationInAmbient](self, "suppressPresentationInAmbient");
  if (v47 != objc_msgSend(v5, "suppressPresentationInAmbient"))
    goto LABEL_42;
  v48 = -[NCNotificationOptions screenCaptureProhibited](self, "screenCaptureProhibited");
  v49 = v48 ^ objc_msgSend(v5, "screenCaptureProhibited") ^ 1;
LABEL_43:

  return v49;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](self->_alertSuppressionContexts, "hash");
  return -[NSString hash](self->_alternateActionLabel, "hash") + v3;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationOptions descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationOptions initWithNotificationOptions:]([NCMutableNotificationOptions alloc], "initWithNotificationOptions:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  NCNotificationOptions *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__NCNotificationOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __63__NCNotificationOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alertSuppressionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("alertSuppressionContexts"), 0);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alternateActionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("alternateActionLabel"), 1);

  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dismissAutomatically"), CFSTR("dismissAutomatically"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dismissAutomaticallyForCarPlay"), CFSTR("dismissAutomaticallyForCarPlay"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "overridesQuietMode"), CFSTR("overidesQuietMode"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "overridesDowntime"), CFSTR("overidesDowntime"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "alertsWhenLocked"), CFSTR("alertsWhenLocked"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "addToLockScreenWhenUnlocked"), CFSTR("addToLockScreenWhenUnlocked"));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "lockScreenPersistence"), CFSTR("lockScreenPersistence"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "lockScreenPriority"), CFSTR("lockScreenPriority"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesAlertsWhenAppIsActive"), CFSTR("suppressesAlertsWhenAppIsActive"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "silencedByMenuButtonPress"), CFSTR("silencedByMenuButtonPress"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "overridesPocketMode"), CFSTR("overridesPocketMode"));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "canPlaySound"), CFSTR("canPlaySound"));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "canTurnOnDisplay"), CFSTR("canTurnOnDisplay"));
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "requestsFullScreenPresentation"), CFSTR("requestsFullScreenPresentation"));
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hideClearActionInList"), CFSTR("hideClearActionInList"));
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isNumberOfLinesInfinite"), CFSTR("numberOfLinesInfinite"));
  v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "realertCount"), CFSTR("realertCount"));
  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "preemptsPresentedNotification"), CFSTR("preemptsPresentedNotification"));
  v26 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "displaysActionsInline"), CFSTR("displaysActionsInline"));
  v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "revealsAdditionalContentOnPresentation"), CFSTR("revealsAdditionalContentOnPresentation"));
  v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesTitleWhenLocked"), CFSTR("suppressesTitleWhenLocked"));
  v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesSubtitleWhenLocked"), CFSTR("suppressesSubtitleWhenLocked"));
  v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesBodyWhenLocked"), CFSTR("suppressesBodyWhenLocked"));
  v31 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "speechLanguage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendString:withName:", v32, CFSTR("speechLanguage"));

  v33 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "contentPreviewSetting"), CFSTR("contentPreviewSetting"));
  v34 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "coalescesWhenLocked"), CFSTR("coalescesWhenLocked"));
  v35 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "preventsAutomaticLock"), CFSTR("preventsAutomaticLock"));
  v36 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "revealsAdditionalContentIfNoDefaultAction"), CFSTR("revealsAdditionalContentIfNoDefaultAction"));
  v37 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "lauchUsingSiriForCarPlayDefaultAction"), CFSTR("lauchUsingSiriForCarPlayDefaultAction"));
  v38 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "allowActionsForCarPlay"), CFSTR("allowActionsForCarPlay"));
  v39 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "playMediaWhenRaised"), CFSTR("playMediaWhenRaised"));
  v40 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hideCloseActionForCarPlay"), CFSTR("hideCloseActionForCarPlay"));
  v41 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "shouldAnnounceForCarPlay"), CFSTR("shouldAnnounceForCarPlay"));
  v42 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressPresentationInAmbient"), CFSTR("suppressPresentationInAmbient"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "screenCaptureProhibited"), CFSTR("screenCaptureProhibited"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (NSSet)alertSuppressionContexts
{
  return self->_alertSuppressionContexts;
}

- (NSString)alternateActionLabel
{
  return self->_alternateActionLabel;
}

- (BOOL)dismissAutomatically
{
  return self->_dismissAutomatically;
}

- (BOOL)dismissAutomaticallyForCarPlay
{
  return self->_dismissAutomaticallyForCarPlay;
}

- (BOOL)overridesQuietMode
{
  return self->_overridesQuietMode;
}

- (BOOL)overridesDowntime
{
  return self->_overridesDowntime;
}

- (BOOL)alertsWhenLocked
{
  return self->_alertsWhenLocked;
}

- (BOOL)addToLockScreenWhenUnlocked
{
  return self->_addToLockScreenWhenLocked;
}

- (unint64_t)lockScreenPersistence
{
  return self->_lockScreenPersistence;
}

- (unint64_t)lockScreenPriority
{
  return self->_lockScreenPriority;
}

- (unint64_t)realertCount
{
  return self->_realertCount;
}

- (BOOL)suppressesAlertsWhenAppIsActive
{
  return self->_suppressesAlertsWhenAppIsActive;
}

- (BOOL)canPlaySound
{
  return self->_canPlaySound;
}

- (BOOL)canTurnOnDisplay
{
  return self->_canTurnOnDisplay;
}

- (BOOL)requestsFullScreenPresentation
{
  return self->_requestsFullScreenPresentation;
}

- (BOOL)silencedByMenuButtonPress
{
  return self->_silencedByMenuButtonPress;
}

- (BOOL)overridesPocketMode
{
  return self->_overridesPocketMode;
}

- (BOOL)hideClearActionInList
{
  return self->_hideClearActionInList;
}

- (BOOL)isNumberOfLinesInfinite
{
  return self->_numberOfLinesInfinite;
}

- (BOOL)preemptsPresentedNotification
{
  return self->_preemptsPresentedNotification;
}

- (BOOL)displaysActionsInline
{
  return self->_displaysActionsInline;
}

- (BOOL)revealsAdditionalContentOnPresentation
{
  return self->_revealsAdditionalContentOnPresentation;
}

- (BOOL)suppressesTitleWhenLocked
{
  return self->_suppressesTitleWhenLocked;
}

- (BOOL)suppressesSubtitleWhenLocked
{
  return self->_suppressesSubtitleWhenLocked;
}

- (BOOL)suppressesBodyWhenLocked
{
  return self->_suppressesBodyWhenLocked;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (unint64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (BOOL)coalescesWhenLocked
{
  return self->_coalescesWhenLocked;
}

- (BOOL)preventsAutomaticLock
{
  return self->_preventsAutomaticLock;
}

- (BOOL)revealsAdditionalContentIfNoDefaultAction
{
  return self->_revealsAdditionalContentIfNoDefaultAction;
}

- (BOOL)lauchUsingSiriForCarPlayDefaultAction
{
  return self->_lauchUsingSiriForCarPlayDefaultAction;
}

- (BOOL)allowActionsForCarPlay
{
  return self->_allowActionsForCarPlay;
}

- (BOOL)playMediaWhenRaised
{
  return self->_playMediaWhenRaised;
}

- (BOOL)hideCloseActionForCarPlay
{
  return self->_hideCloseActionForCarPlay;
}

- (BOOL)shouldAnnounceForCarPlay
{
  return self->_shouldAnnounceForCarPlay;
}

- (BOOL)suppressPresentationInAmbient
{
  return self->_suppressPresentationInAmbient;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_alternateActionLabel, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContexts, 0);
}

@end
