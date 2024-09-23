@implementation NFContactlessSessionInterface

+ (id)interface
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;

  v2 = objc_alloc((Class)NSSet);
  v3 = objc_opt_class(NSArray);
  v4 = objc_opt_class(NSMutableArray);
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(NFApplet), 0);
  v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(NFApplet), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFContactlessSessionInterface));
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, "setActiveApplet:completion:", 0, 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, "setActiveApplet:completion:", 0, 1);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v5, "getAppletsWithCompletion:", 0, 1);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, "getAppletsWithCompletion:", 1, 1);

  return v7;
}

@end
