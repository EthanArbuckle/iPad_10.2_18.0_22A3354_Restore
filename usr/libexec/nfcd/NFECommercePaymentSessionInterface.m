@implementation NFECommercePaymentSessionInterface

+ (id)interface
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = objc_alloc((Class)NSSet);
  v3 = objc_opt_class(NSArray);
  v4 = objc_opt_class(NSMutableArray);
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(NFApplet), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFECommercePaymentSessionInterface));
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v5, "getAppletsWithCompletion:", 0, 1);

  return v6;
}

@end
