@implementation NFFieldDetectSessionInterfaceCallbacks

+ (id)interface
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFFieldDetectSessionCallbacks));
  v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(NFFieldNotification), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, "didDetectFieldNotification:", 0, 0);

  return v2;
}

@end
