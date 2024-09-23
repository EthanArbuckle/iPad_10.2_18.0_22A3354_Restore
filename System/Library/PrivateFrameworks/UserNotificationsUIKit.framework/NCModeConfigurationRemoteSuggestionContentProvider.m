@implementation NCModeConfigurationRemoteSuggestionContentProvider

- (NCModeConfigurationRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7 suggestionType:(unint64_t)a8 scope:(unint64_t)a9 modeConfiguration:(id)a10
{
  id v16;
  id v17;
  id v18;
  NCModeConfigurationRemoteSuggestionContentProvider *v19;
  NCModeConfigurationRemoteSuggestionContentProvider *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  unint64_t v34;
  objc_super v35;

  v16 = a3;
  v17 = a4;
  v18 = a10;
  v35.receiver = self;
  v35.super_class = (Class)NCModeConfigurationRemoteSuggestionContentProvider;
  v19 = -[NCRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:](&v35, sel_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_uuid_, v16, v17, a5, a6, a7);
  v20 = v19;
  if (v19)
  {
    v19->_suggestionType = a8;
    objc_storeStrong((id *)&v19->_modeConfiguration, a10);
    v20->_scope = a9;
    -[DNDModeConfiguration configuration](v20->_modeConfiguration, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v34 = a8;
    if (a9)
      v23 = objc_msgSend(v21, "senderConfigurationType");
    else
      v23 = objc_msgSend(v21, "applicationConfigurationType");
    v33 = v23;

    objc_msgSend(v18, "mode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "mode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "semanticType");

    objc_msgSend(v16, "content");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "communicationContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "preferredSenderSummary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:", v34, v33, a9, v27, v25, v17, v30, &__block_literal_global_19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationManagementSuggestionContentProvider setAuxiliaryOptionsSummaryText:](v20, "setAuxiliaryOptionsSummaryText:", v31);

  }
  return v20;
}

id __182__NCModeConfigurationRemoteSuggestionContentProvider_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_uuid_suggestionType_scope_modeConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)auxiliaryOptionActions
{
  unint64_t suggestionType;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
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
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  suggestionType = self->_suggestionType;
  if (suggestionType != 1)
  {
    if (!suggestionType)
    {
      v4 = self->_scope == 0;
      -[DNDModeConfiguration configuration](self->_modeConfiguration, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v4)
        v7 = objc_msgSend(v5, "applicationConfigurationType");
      else
        v7 = objc_msgSend(v5, "senderConfigurationType");
      v10 = v7;

      switch(v10)
      {
        case 2:
          v11 = (void *)*MEMORY[0x1E0DC5F98];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_FAULT))
            -[NCModeConfigurationRemoteSuggestionContentProvider auxiliaryOptionActions].cold.1(v11, &self->_scope);
          break;
        case 1:
          objc_msgSend(&stru_1E8D21F60, "stringByAppendingString:", CFSTR("_SILENCE"));
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        case 0:
          objc_msgSend(&stru_1E8D21F60, "stringByAppendingString:", CFSTR("_ALLOW"));
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
      }
    }
    v9 = &stru_1E8D21F60;
    goto LABEL_15;
  }
  objc_msgSend(&stru_1E8D21F60, "stringByAppendingString:", CFSTR("_REMOVE"));
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (__CFString *)v8;
LABEL_15:
  objc_initWeak(&location, self);
  objc_msgSend(CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_SUGGESTION_DONT"), "stringByAppendingString:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", v24, &stru_1E8D21F60, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v27[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, 0, CFSTR("notification-management-remote-configure-suggestion-reject"), v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_SUGGESTION"), "stringByAppendingString:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v17, &stru_1E8D21F60, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  v25[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v20, 0, CFSTR("notification-management-remote-configure-suggestion-accept"), v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v16;
  v30[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
  return v22;
}

void __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handleRejectAction:", v4);
}

void __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handleAcceptAction:", v4);
}

- (void)handleRejectAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCRemoteSuggestionContentProvider uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 1, 5, v5, v6);

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v7);

}

- (void)handleAcceptAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t scope;
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
  id v20;

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate", a3);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[DNDModeConfiguration mutableCopy](self->_modeConfiguration, "mutableCopy");
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (self->_suggestionType)
  {
    v7 = 2;
  }
  else
  {
    if (self->_scope)
      v8 = objc_msgSend(v6, "senderConfigurationType");
    else
      v8 = objc_msgSend(v6, "applicationConfigurationType");
    v7 = v8 != 0;
  }
  scope = self->_scope;
  if (scope == 2)
  {
    -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "content");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "communicationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cnContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5C0]), "initWithContactIdentifier:", v10);
    if (v7 == 2)
      objc_msgSend(v6, "removeExceptionForContact:", v11);
    else
      objc_msgSend(v6, "setExceptionForContact:", v11);
    goto LABEL_15;
  }
  if (!scope)
  {
    -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == 2)
      objc_msgSend(v6, "removeExceptionForApplication:", v11);
    else
      objc_msgSend(v6, "setExceptionForApplication:", v11);
LABEL_15:

  }
  objc_msgSend(v4, "setConfiguration:", v6);
  objc_msgSend(v20, "notificationManagementContentProvider:setModeConfiguration:", self, v4);
  objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCRemoteSuggestionContentProvider uuid](self, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 2, 5, v17, v18);

  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfiguration, 0);
}

+ (id)_localizedSummaryStringForSuggestionType:(unint64_t)a3 configurationType:(unint64_t)a4 scope:(unint64_t)a5 semanticType:(int64_t)a6 modeName:(id)a7 bundleDisplayName:(id)a8 preferredSenderSummary:(id)a9 localizedStringForKeyBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  const __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  __CFString *v25;
  int v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id *v30;
  __CFString *v31;
  id v32;
  void *v33;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = (void (**)(id, void *))a10;
  if (a3 == 1)
  {
    v20 = (void *)*MEMORY[0x1E0DC5F98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_FAULT))
      +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:].cold.4(v20, a4, a5);
    goto LABEL_9;
  }
  if (a3)
  {
LABEL_9:
    v21 = CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MODE_CONFIGURATION_SUGGESTION");
    goto LABEL_10;
  }
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      v19 = CFSTR("_SILENCE");
      goto LABEL_44;
    }
    if (!a4)
    {
      v19 = CFSTR("_ALLOW");
LABEL_44:
      objc_msgSend(CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MODE_CONFIGURATION_SUGGESTION"), "stringByAppendingString:", v19);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v35 = (void *)*MEMORY[0x1E0DC5F98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_FAULT))
    +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:].cold.3(v35, a5);
  v21 = 0;
LABEL_10:
  switch(a5)
  {
    case 0uLL:
      -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", CFSTR("_APP"));
      v24 = objc_claimAutoreleasedReturnValue();

      v25 = (__CFString *)v16;
LABEL_19:
      v23 = v25;
      v21 = (__CFString *)v24;
      goto LABEL_20;
    case 2uLL:
      -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", CFSTR("_CONTACT"));
      v24 = objc_claimAutoreleasedReturnValue();

      v25 = (__CFString *)v17;
      goto LABEL_19;
    case 1uLL:
      v22 = (void *)*MEMORY[0x1E0DC5F98];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_FAULT))
        +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:].cold.2(v22, a4);

      v21 = 0;
      break;
  }
  v23 = &stru_1E8D21F60;
LABEL_20:
  v26 = 0;
  v27 = CFSTR("_DO_NOT_DISTURB");
  switch(a6)
  {
    case 0:
      break;
    case 1:
      v26 = 0;
      v27 = CFSTR("_SLEEP");
      break;
    case 2:
      v26 = 0;
      v27 = CFSTR("_DRIVING");
      break;
    case 3:
      v26 = 0;
      v27 = CFSTR("_FITNESS");
      break;
    case 4:
      v26 = 0;
      v27 = CFSTR("_WORK");
      break;
    case 5:
      v26 = 0;
      v27 = CFSTR("_PERSONAL");
      break;
    case 6:
      v26 = 0;
      v27 = CFSTR("_READING");
      break;
    case 7:
      v26 = 0;
      v27 = CFSTR("_GAMING");
      break;
    case 8:
      v26 = 0;
      v27 = CFSTR("_MINDFULNESS");
      break;
    default:
      v26 = 1;
      v27 = CFSTR("_CUSTOM");
      break;
  }
  -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v18[2](v18, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v30 = (id *)&v38;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@%@"), &v38, v23, v15, v37, 0);
    }
    else
    {
      v30 = (id *)&v37;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), &v37, v23, v36, 0, v38);
    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = *v30;

    if (v32)
    {
      v33 = (void *)*MEMORY[0x1E0DC5F98];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_FAULT))
        +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:].cold.1((uint64_t)v28, v33, v32);

    }
  }
  else
  {
    v31 = &stru_1E8D21F60;
  }

  return v31;
}

- (void)auxiliaryOptionActions
{
  void *v2;
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];

  v5 = OUTLINED_FUNCTION_4_0(a1);
  objc_msgSend(v2, "numberWithUnsignedInteger:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 2024), "numberWithUnsignedInteger:", *a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1CFC3D000, v5, v8, "Received unexpected notification management suggestion for mode configuration with configuration type %@ for scope %@", v9);

  OUTLINED_FUNCTION_0_0();
}

@end
