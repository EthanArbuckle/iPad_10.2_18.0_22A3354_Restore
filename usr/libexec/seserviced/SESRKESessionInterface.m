@implementation SESRKESessionInterface

+ (id)interface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SESRKESessionInterface));
  v3 = objc_opt_class(SESVehicleReport);
  v4 = objc_opt_class(NSDictionary);
  v5 = objc_opt_class(NSArray);
  v6 = objc_opt_class(NSNumber);
  v7 = objc_opt_class(NSString);
  v8 = objc_opt_class(NSError);
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(NSData), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, "getVehicleReports:", 0, 1);

  v11 = objc_opt_class(SESDataAttestation);
  v12 = objc_opt_class(NSString);
  v13 = objc_opt_class(NSError);
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, objc_opt_class(NSData), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, "sign:readerIdentifier:reply:", 0, 1);

  return v2;
}

@end
