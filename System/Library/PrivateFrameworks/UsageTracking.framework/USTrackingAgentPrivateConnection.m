@implementation USTrackingAgentPrivateConnection

+ (id)newConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.UsageTrackingAgent.private"), 4096);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newInterface
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D4B88);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_fetchReportsDuringInterval_partitionInterval_replyHandler_, 1, 1);
  v8 = objc_alloc(MEMORY[0x24BDBCF20]);
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_fetchReportsDuringInterval_partitionInterval_replyHandler_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_fetchReportsDuringInterval_partitionInterval_replyHandler_, 2, 1);
  v11 = objc_alloc(MEMORY[0x24BDBCF20]);
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_replyHandler_, 0, 0);

  return v2;
}

+ (BOOL)connectionHasPrivateEntitlement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.private.usage-tracking"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)connectionHasFamilyControlsEntitlement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.developer.family-controls"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

@end
