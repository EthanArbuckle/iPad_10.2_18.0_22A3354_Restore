@implementation NFTrustSessionInterface

+ (id)interface
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFTrustSessionInterface));
  v3 = objc_alloc((Class)NSSet);
  v4 = objc_opt_class(NSMutableArray);
  v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(NFTrustKey), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, "listKeysWithCompletion:", 0, 1);

  return v2;
}

@end
