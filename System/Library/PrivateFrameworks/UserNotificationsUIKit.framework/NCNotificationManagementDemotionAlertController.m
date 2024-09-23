@implementation NCNotificationManagementDemotionAlertController

- (NCNotificationManagementDemotionAlertController)initWithRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5 includeExplanation:(BOOL)a6
{
  _BOOL8 v6;
  NCNotificationManagementDemotionAlertController *v7;
  NCNotificationManagementDemotionAlertController *v8;
  objc_super v10;

  v6 = a6;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationManagementDemotionAlertController;
  v7 = -[NCNotificationManagementAlertController initWithRequest:withPresentingView:settingsDelegate:](&v10, sel_initWithRequest_withPresentingView_settingsDelegate_, a3, a4, a5);
  v8 = v7;
  if (v7)
    -[NCNotificationManagementDemotionAlertController setIncludeExplanation:](v7, "setIncludeExplanation:", v6);
  return v8;
}

- (void)_configureView
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, v5, v7, "Error localizing title for format %{public}@, %{public}@", (uint8_t *)&v8);

}

uint64_t __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCriticalAlert");

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = objc_msgSend(v5, "criticalAlertsEnabled") ^ 1;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notificationManagementController:setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", v7, v6, v8, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v9 = objc_msgSend(v5, "notificationsEnabled") ^ 1;
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notificationManagementController:setAllowsNotifications:forNotificationRequest:withSectionIdentifier:", v10, v9, v8, *(_QWORD *)(a1 + 48));
  }

  return 1;
}

uint64_t __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  id v6;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_3;
  v5[3] = &unk_1E8D1B3A0;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  dispatch_async(v2, v5);

  return 1;
}

void __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A68]), "initWithNotification:", v3);
  v5 = (void *)MEMORY[0x1E0D23158];
  v6 = *MEMORY[0x1E0D22D88];
  v15[0] = *MEMORY[0x1E0D22DA8];
  v15[1] = v6;
  v16[0] = MEMORY[0x1E0C9AAB0];
  v16[1] = MEMORY[0x1E0C9AAB0];
  v15[2] = *MEMORY[0x1E0D22CE0];
  v14 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optionsWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4;
  v12[3] = &unk_1E8D1DBE0;
  v13 = v11;
  objc_msgSend(v10, "openApplication:withOptions:completion:", v13, v9, v12);

}

void __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4_cold_1(a1, (uint64_t)v6, v7);
  }

}

- (BOOL)includeExplanation
{
  return self->_includeExplanation;
}

- (void)setIncludeExplanation:(BOOL)a3
{
  self->_includeExplanation = a3;
}

void __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, a3, (uint64_t)a3, "Error opening Application settings for %{public}@, %{public}@", (uint8_t *)&v4);
}

@end
