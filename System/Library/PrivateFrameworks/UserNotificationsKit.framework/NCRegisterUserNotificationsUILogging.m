@implementation NCRegisterUserNotificationsUILogging

void __NCRegisterUserNotificationsUILogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;

  v0 = os_log_create((const char *)NCUILogSubsystem, "Dispatch");
  v1 = (void *)NCUILogDispatch;
  NCUILogDispatch = (uint64_t)v0;

  v2 = os_log_create((const char *)NCUILogSubsystem, "Client");
  v3 = (void *)NCUILogClient;
  NCUILogClient = (uint64_t)v2;

  v4 = os_log_create((const char *)NCUILogSubsystem, "Lists");
  v5 = (void *)NCUILogLists;
  NCUILogLists = (uint64_t)v4;

  v6 = os_log_create((const char *)NCUILogSubsystem, "Management");
  v7 = (void *)NCUILogManagement;
  NCUILogManagement = (uint64_t)v6;

  v8 = os_log_create((const char *)NCUILogSubsystem, "Icons");
  v9 = (void *)NCUILogIcons;
  NCUILogIcons = (uint64_t)v8;

  v10 = os_log_create((const char *)NCUILogSubsystem, "CommunicationNotifications");
  v11 = (void *)NCUILogCommunicationNotifications;
  NCUILogCommunicationNotifications = (uint64_t)v10;

  v12 = os_log_create((const char *)NCUILogSubsystem, "Onboarding");
  v13 = (void *)NCUILogOnboarding;
  NCUILogOnboarding = (uint64_t)v12;

  v14 = os_log_create((const char *)NCUILogSubsystem, "Utilities");
  v15 = (void *)NCUILogOnboarding;
  NCUILogOnboarding = (uint64_t)v14;

  v16 = os_log_create((const char *)NCUILogSubsystem, "Summarization");
  v17 = (void *)NCUILogSummarization;
  NCUILogSummarization = (uint64_t)v16;

  v18 = os_log_create((const char *)NCUILogSubsystem, "ScrollPosition");
  v19 = (void *)NCUILogScrollPosition;
  NCUILogScrollPosition = (uint64_t)v18;

}

@end
