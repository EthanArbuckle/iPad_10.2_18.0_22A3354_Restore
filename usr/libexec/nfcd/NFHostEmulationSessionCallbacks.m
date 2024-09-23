@implementation NFHostEmulationSessionCallbacks

+ (id)interface
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFHostEmulationSessionCallbacks));
  v3 = objc_alloc((Class)NSSet);
  v4 = objc_opt_class(NFFieldNotification);
  v5 = objc_opt_class(NFFieldNotificationECP1_0);
  v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(NFFieldNotificationECP2_0), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, "didReceiveField:", 0, 0);

  v7 = objc_alloc((Class)NSSet);
  v8 = objc_opt_class(NFFieldNotification);
  v9 = objc_opt_class(NFFieldNotificationECP1_0);
  v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(NFFieldNotificationECP2_0), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, "suspensionStateUpdate:triggeredByField:", 1, 0);

  return v2;
}

@end
