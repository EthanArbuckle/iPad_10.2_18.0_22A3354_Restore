@implementation SMInitiatorAlertUtilities

+ (id)alertMessageWithState:(id)a3 addTimeMode:(BOOL)a4 isWatchNotification:(BOOL)a5 shortStrings:(BOOL)a6 watchStrings:(BOOL)a7
{
  return +[SMInitiatorAlertUtilitiesInternal alertMessageWith:addTimeMode:isWatchNotification:shortStrings:watchStrings:](SMInitiatorAlertUtilitiesInternal, "alertMessageWith:addTimeMode:isWatchNotification:shortStrings:watchStrings:", a3, a4, a5, a6, a7);
}

+ (id)alertTitleWithState:(id)a3 addTimeMode:(BOOL)a4 shortStrings:(BOOL)a5 watchStrings:(BOOL)a6
{
  return +[SMInitiatorAlertUtilitiesInternal alertTitleWith:addTimeMode:shortStrings:watchStrings:](SMInitiatorAlertUtilitiesInternal, "alertTitleWith:addTimeMode:shortStrings:watchStrings:", a3, a4, a5, a6);
}

@end
