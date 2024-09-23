@implementation NSObject

+ (id)headlineNotificationFromHeadline:(id)a3
{
  id v3;
  FRHeadlineNotificationWrapper *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[FRHeadlineNotificationWrapper initWithHeadline:]([FRHeadlineNotificationWrapper alloc], "initWithHeadline:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)headlineNotificationFromDictionary:(id)a3
{
  id v3;
  FRHeadlineNotificationWrapper *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[FRHeadlineNotificationWrapper initWithDictionary:]([FRHeadlineNotificationWrapper alloc], "initWithDictionary:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
