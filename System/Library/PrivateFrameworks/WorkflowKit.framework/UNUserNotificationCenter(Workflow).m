@implementation UNUserNotificationCenter(Workflow)

+ (id)workflowNotificationCenter
{
  if (workflowNotificationCenter_onceToken != -1)
    dispatch_once(&workflowNotificationCenter_onceToken, &__block_literal_global_44606);
  return (id)workflowNotificationCenter_notificationCenter;
}

@end
