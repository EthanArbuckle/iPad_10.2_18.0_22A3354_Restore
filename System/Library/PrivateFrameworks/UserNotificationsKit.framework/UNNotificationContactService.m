@implementation UNNotificationContactService

void __47___UNNotificationContactService_sharedInstance__block_invoke()
{
  _UNNotificationContactService *v0;
  uint64_t v1;
  void *v2;
  _UNCNContactResolver *v3;

  v0 = [_UNNotificationContactService alloc];
  v3 = objc_alloc_init(_UNCNContactResolver);
  v1 = -[_UNNotificationContactService initWithResolver:](v0, "initWithResolver:", v3);
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v1;

}

@end
