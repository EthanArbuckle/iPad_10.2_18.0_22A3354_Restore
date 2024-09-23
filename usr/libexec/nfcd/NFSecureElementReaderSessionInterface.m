@implementation NFSecureElementReaderSessionInterface

+ (id)interface
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFSecureElementReaderSessionInterface));
  +[NFSecureElementReaderSessionInterface _configureInterface:](NFSecureElementReaderSessionInterface, "_configureInterface:", v2);
  return v2;
}

+ (void)_configureInterface:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a3;
  v14 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(NFTagInternal), 0);
  v4 = objc_alloc((Class)NSSet);
  v5 = objc_opt_class(NSArray);
  v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(NSString), 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "selectApplets:completion:", 0, 0);

  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, "connect:completion:", 0, 0);
  v7 = objc_alloc((Class)NSSet);
  v8 = objc_opt_class(NSDictionary);
  v9 = objc_opt_class(NSArray);
  v10 = objc_opt_class(NSNumber);
  v11 = objc_opt_class(NSString);
  v12 = objc_opt_class(NSURL);
  v13 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(NSData), 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v13, "performVAS:select:completion:", 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v13, "performVAS:select:completion:", 1, 1);

}

@end
