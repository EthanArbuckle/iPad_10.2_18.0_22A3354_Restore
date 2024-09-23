@implementation MusicSubscriptionStatusHacks

+ (void)setupSubscriptionStatusHacks
{
  if (qword_1011ECAA0 != -1)
    dispatch_once(&qword_1011ECAA0, &stru_1010A8CC0);
}

@end
