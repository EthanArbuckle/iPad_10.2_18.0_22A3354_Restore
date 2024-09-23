@implementation UNUserNotificationCenter

void __64__UNUserNotificationCenter_Workflow__workflowNotificationCenter__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0CEC7A0]);
  v1 = objc_msgSend(v0, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
  v2 = (void *)workflowNotificationCenter_notificationCenter;
  workflowNotificationCenter_notificationCenter = v1;

}

@end
