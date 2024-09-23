@implementation WFMessageTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForRecentMessages");
}

- (id)contextStorePredicate
{
  void *v2;
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

  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(a1, "selectedContents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "contentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSendersStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSendersStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSendersStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "senderHandlesKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "senderContactIDKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v2, CFSTR("SUBQUERY(SELF.%@.value, $message,                 (%@ = NULL OR $message.%K CONTAINS[cd] %@) AND                 (%@ = NULL OR %@.@count = 0 OR SUBQUERY(%@, $sender, $sender IN[cd] $message.%K OR $message.%K = $sender).@count > 0)            ).@count > 0"), v2, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setEvaluateOnEveryKeyPathUpdate:", 1);
  return v12;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
