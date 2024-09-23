@implementation NFReaderSessionInterface

+ (id)interface
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFReaderSessionInterface));
  objc_msgSend(a1, "_configureInterface:", v3);
  return v3;
}

+ (void)_configureInterface:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a3;
  v12 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(NFTagInternal), 0);
  v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(NFNdefMessageInternal), 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, "connect:completion:", 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, "connect:completion:", 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, "transceive:completion:", 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, "ndefWrite:completion:", 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, "ndefReadWithCompletion:", 1, 1);
  v5 = objc_alloc((Class)NSSet);
  v6 = objc_opt_class(NSDictionary);
  v7 = objc_opt_class(NSArray);
  v8 = objc_opt_class(NSNumber);
  v9 = objc_opt_class(NSString);
  v10 = objc_opt_class(NSURL);
  v11 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(NSData), 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, "performVAS:completion:", 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, "performVAS:completion:", 1, 1);

}

@end
