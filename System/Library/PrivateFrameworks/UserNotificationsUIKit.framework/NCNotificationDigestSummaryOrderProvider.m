@implementation NCNotificationDigestSummaryOrderProvider

- (id)atxUUID
{
  void *v2;
  void *v3;

  -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)atxLogSummaryPlatterShownIsUpcoming:(BOOL)a3
{
  id v3;

  -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logCollapsedPreview");

}

- (void)atxLogSummaryPlatterExpandedIsUpcoming:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "logUpcomingView");
  else
    objc_msgSend(v4, "logScheduledView");

}

- (void)generateDigestForATXUserNotificationArrays:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationSummaryOrderProvider summaryHeading](self, "summaryHeading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Generating new notification digest for \"%{public}@\", buf, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "atxDigestGeneratorClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke;
  v13[3] = &unk_1E8D1CC50;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "generateDigestForNotificationArrays:reply:", v6, v13);

}

void __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(a1, v8);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2;
    block[3] = &unk_1E8D1CC28;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

void __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setUserNotificationDigest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "viewFlattenedGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (ATXUserNotificationDigest)userNotificationDigest
{
  return self->_userNotificationDigest;
}

- (void)setUserNotificationDigest:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationDigest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationDigest, 0);
}

void __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_7(a1, a2);
  objc_msgSend(v2, "summaryHeading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1CFC3D000, v5, v6, "Error creating new notification digest for \"%{public}@\"! [error=%@]", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

@end
