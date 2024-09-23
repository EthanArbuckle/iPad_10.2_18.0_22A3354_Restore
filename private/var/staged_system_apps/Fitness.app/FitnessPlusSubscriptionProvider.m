@implementation FitnessPlusSubscriptionProvider

+ (NSString)fitnessPlusSubscriptionDidChangeNotification
{
  if (qword_10081D658 != -1)
    swift_once(&qword_10081D658, sub_10019B430);
  return (NSString *)(id)qword_100869F98;
}

@end
