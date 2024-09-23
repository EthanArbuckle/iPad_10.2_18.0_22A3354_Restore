@implementation TPSReminderCustomBadgeValidation

- (void)validateWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, _QWORD, id);
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0D846B0];
  v5 = (void (**)(id, _QWORD, id))a3;
  v6 = objc_alloc_init(v4);
  v11 = 0;
  v7 = objc_msgSend(v6, "containsListWithCustomBadgeForTipKitWithError:", &v11);
  v8 = v11;
  v9 = v7 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v9, v10);

  v5[2](v5, v9, v8);
}

@end
