@implementation SBSAutolockTimerRegisterForExternalChangeNotification

uint64_t ___SBSAutolockTimerRegisterForExternalChangeNotification_block_invoke()
{
  return notify_register_dispatch("com.apple.springboard.autolockfired", &_SBSAutolockTimerRegisterForExternalChangeNotification___token, MEMORY[0x1E0C80D38], &__block_literal_global_5_2);
}

void ___SBSAutolockTimerRegisterForExternalChangeNotification_block_invoke_2(int a1, int token)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  notify_get_state(token, &v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("SBAutoLockTimerCategoryKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("SBAutoLockTimerFiredNotification"), 0, v4);

}

@end
