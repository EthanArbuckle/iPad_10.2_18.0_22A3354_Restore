@implementation NFContactlessSessionCallbacks

+ (id)interface
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFContactlessSessionCallbacks));
  v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(NFFieldNotification), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, "didDetectFieldNotification:", 0, 0);

  v16 = objc_alloc((Class)NSSet);
  v15 = objc_opt_class(NSString);
  v4 = objc_opt_class(NSMutableString);
  v5 = objc_opt_class(NSNumber);
  v6 = objc_opt_class(NSDate);
  v7 = objc_opt_class(NSDateComponents);
  v8 = objc_opt_class(NSData);
  v9 = objc_opt_class(NSMutableData);
  v10 = objc_opt_class(NSArray);
  v11 = objc_opt_class(NSMutableArray);
  v12 = objc_opt_class(NSDictionary);
  v13 = objc_msgSend(v16, "initWithObjects:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(NSMutableDictionary), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, "didFelicaStateChange:", 0, 0);

  return v2;
}

@end
