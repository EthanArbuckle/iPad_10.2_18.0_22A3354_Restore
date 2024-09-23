@implementation PLChangeNotification

+ (id)notificationWithName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLChangeNotification.m"), 24, CFSTR("Cannot create a PLChangeNotification via %s"), "+[PLChangeNotification notificationWithName:object:userInfo:]");

  return objc_alloc_init((Class)a1);
}

- (PLChangeNotificationCenter)changeNotificationCenter
{
  return (PLChangeNotificationCenter *)+[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
}

@end
