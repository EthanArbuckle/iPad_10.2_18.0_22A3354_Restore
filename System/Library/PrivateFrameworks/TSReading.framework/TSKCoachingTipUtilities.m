@implementation TSKCoachingTipUtilities

+ (void)updateCoachingTipContext
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKCoachingTipContextChangedNotification"), a1);
}

@end
