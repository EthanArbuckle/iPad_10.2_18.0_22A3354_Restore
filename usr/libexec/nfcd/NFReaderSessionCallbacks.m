@implementation NFReaderSessionCallbacks

+ (id)interface
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NFReaderSessionCallbacks));
  v3 = objc_alloc((Class)NSSet);
  v4 = objc_opt_class(NSArray);
  v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(NFTagInternal), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, "didDetectTags:connectedTagIndex:", 0, 0);

  v6 = objc_alloc((Class)NSSet);
  v7 = objc_opt_class(NSArray);
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(NFNdefMessageInternal), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, "didDetectNDEFMessages:fromTags:connectedTagIndex:updateUICallback:", 0, 0);

  v9 = objc_alloc((Class)NSSet);
  v10 = objc_opt_class(NSArray);
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(NFTagInternal), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, "didDetectNDEFMessages:fromTags:connectedTagIndex:updateUICallback:", 1, 0);

  return v2;
}

@end
