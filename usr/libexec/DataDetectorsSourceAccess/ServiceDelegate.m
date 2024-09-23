@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  void *v18;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DataDetectorsSourceAccessProtocol));
  v6 = objc_opt_class(NSArray);
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(NSNumber), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, "filesForSourceRead:resourceType:withReply:", 0, 0);
  v9 = objc_opt_class(NSArray);
  v10 = objc_opt_class(NSFileHandle);
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, objc_opt_class(NSNull), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v12, "filesForSourceRead:resourceType:withReply:", 0, 1);
  v13 = objc_opt_class(NSMutableArray);
  v14 = objc_opt_class(NSDictionary);
  v15 = objc_opt_class(NSString);
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, objc_opt_class(NSNumber), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v17, "writeSourceFromRawData:source:signature:withReply:", 0, 0);
  objc_msgSend(v4, "setExportedInterface:", v5);
  v18 = (void *)objc_opt_new(DataDetectorsSourceAccess);
  if (v4)
  {
    objc_msgSend(v4, "auditToken");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  v20[0] = v21;
  v20[1] = v22;
  objc_msgSend(v18, "setAuditToken:", v20);
  objc_msgSend(v18, "setProcessIdentifier:", objc_msgSend(v4, "processIdentifier"));
  objc_msgSend(v18, "setUserIdentifier:", objc_msgSend(v4, "effectiveUserIdentifier"));
  objc_msgSend(v4, "setExportedObject:", v18);
  objc_msgSend(v4, "resume");

  return 1;
}

@end
