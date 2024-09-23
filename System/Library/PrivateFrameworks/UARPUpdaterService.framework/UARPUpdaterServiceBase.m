@implementation UARPUpdaterServiceBase

- (UARPUpdaterServiceBase)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPUpdaterServiceBase;
  return -[UARPUpdaterServiceBase init](&v3, sel_init);
}

- (void)getMatchingServicesListWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[UARPUpdaterServiceBase getMatchingServicesListWithReply:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x24BDBD1A8]);

}

- (void)ioKitRuleMatched:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase ioKitRuleMatched:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)getBSDNotificationsListWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[UARPUpdaterServiceBase getBSDNotificationsListWithReply:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x24BDBD1A8]);

}

- (void)bsdNotificationReceived:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase bsdNotificationReceived:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)getDASActivityListWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[UARPUpdaterServiceBase getDASActivityListWithReply:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x24BDBD1A8]);

}

- (void)dasActivityReceived:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase dasActivityReceived:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)consentReceived:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase consentReceived:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase consentReceivedPostLogoutMode:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)disabledProductIdentifiers:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase disabledProductIdentifiers:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)getIsBusyStatusWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[UARPUpdaterServiceBase getIsBusyStatusWithReply:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, 0);

}

- (void)eaRuleMatched:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase eaRuleMatched:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)standaloneDynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5 reply:(id)a6
{
  void (**v6)(id, _QWORD);
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[UARPUpdaterServiceBase standaloneDynamicAssetSolicitation:modelNumber:notifyService:reply:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v7, 0xCu);
  }
  v6[2](v6, 0);

}

- (void)standaloneDynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5 reply:(id)a6
{
  void (**v6)(id, _QWORD);
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[UARPUpdaterServiceBase standaloneDynamicAssetSolicitation:modelNumbers:notifyService:reply:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v7, 0xCu);
  }
  v6[2](v6, 0);

}

- (void)queryPendingTssRequests:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[UARPUpdaterServiceBase queryPendingTssRequests:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x24BDBD1A8]);

}

- (void)tssResponse:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[UARPUpdaterServiceBase tssResponse:]";
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

@end
