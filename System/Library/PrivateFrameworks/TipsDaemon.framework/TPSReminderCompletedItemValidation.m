@implementation TPSReminderCompletedItemValidation

- (void)validateWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, BOOL, id);
  id v6;
  unint64_t v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0D846B0];
  v5 = (void (**)(id, BOOL, id))a3;
  v6 = objc_alloc_init(v4);
  v11 = 0;
  v7 = objc_msgSend(v6, "completedRemindersCountForTipKitWithError:", &v11);
  v8 = v11;
  v9 = -[TPSTargetingValidation unsignedIntegerValue](self, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v7 >= v9, v10);

  v5[2](v5, v7 >= v9, v8);
}

@end
