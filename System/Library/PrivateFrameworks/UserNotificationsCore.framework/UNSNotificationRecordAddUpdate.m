@implementation UNSNotificationRecordAddUpdate

+ (id)updateWithNotificationRecord:(id)a3 shouldSync:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNotificationRecord:shouldSync:", v6, v4);

  return v7;
}

@end
