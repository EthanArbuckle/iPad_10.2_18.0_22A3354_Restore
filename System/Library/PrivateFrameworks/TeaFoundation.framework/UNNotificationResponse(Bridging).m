@implementation UNNotificationResponse(Bridging)

+ (uint64_t)responseWithNotification:()Bridging
{
  return objc_msgSend(MEMORY[0x1E0CEC750], "responseWithNotification:actionIdentifier:", a3, &stru_1E2CF1930);
}

@end
