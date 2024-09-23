@implementation NFSecureElementReaderSessionCallbacks

+ (id)interface
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFSecureElementReaderSessionCallbacks));
  v3 = objc_alloc((Class)NSSet);
  v4 = objc_opt_class(NSArray);
  v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(NFTagInternal), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, "didDetectTags:", 0, 0);

  v6 = objc_alloc((Class)NSSet);
  v7 = objc_opt_class(NSDictionary);
  v8 = objc_opt_class(NSArray);
  v9 = objc_opt_class(NSNumber);
  v10 = objc_opt_class(NSString);
  v11 = objc_opt_class(NSData);
  v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(NSError), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, "didStartSecureElementReader:", 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, "didEndSecureElementReader:", 0, 0);

  return v2;
}

@end
