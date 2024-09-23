@implementation PCSupportReceiver

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSSet *v6;
  id v7;

  v3 = a3;
  v4 = objc_opt_class(NSArray);
  v5 = objc_opt_class(NSString);
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(NSDictionary), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, "addClientToSegments:replaceExisting:privateSegment:", 0, 0);

}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___PCSupportDaemonInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)requiredEntitlements
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("com.apple.private.iad.news-client"));
}

- (void)fetchGenderAndAgeGroupData:(id)a3
{
  +[APIDAccountProvider fetchGenderAndAgeData:completionHandler:](APIDAccountProvider, "fetchGenderAndAgeData:completionHandler:", 0, a3);
  -[PCSupportReceiver finishedWithRequests](self, "finishedWithRequests");
}

- (PCSupportReceiver)initWithConnection:(id)a3
{
  id v5;
  PCSupportReceiver *v6;
  PCSupportReceiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCSupportReceiver;
  v6 = -[PCSupportReceiver init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)connectionInvalidated
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = APLogForCategory(36);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Connection to client for PromotedContentSupport was invalidated.", v5, 2u);
  }

  -[PCSupportReceiver finishedWithRequests](self, "finishedWithRequests");
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)finishedWithRequests
{
  -[PCSupportReceiver setConnection:](self, "setConnection:", 0);
}

- (void)policiesToEnforce:(id)a3
{
  void (**v3)(id, id);
  id v4;

  v3 = (void (**)(id, id))a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[APPCPolicyEngine policiesToEnforce](APPCPolicyEngine, "policiesToEnforce"));
  v3[2](v3, v4);

}

- (void)fetchConfigurationForClass:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  id v8;

  v5 = (void (**)(id, void *))a4;
  v6 = +[APConfigurationMediator configurationForClass:usingCache:](APConfigurationMediator, "configurationForClass:usingCache:", NSClassFromString((NSString *)a3), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configDictionary"));
  v5[2](v5, v7);

}

- (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  APThirdPartySegmentUpdateLegacyInterface *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  NSObject *v23;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init((Class)ADTrackingTransparency);
  v10 = objc_msgSend(v9, "personalizedAds");

  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v13 = objc_alloc_init(APThirdPartySegmentUpdateLegacyInterface);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSupportReceiver connection](self, "connection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleID"));
    -[APThirdPartySegmentUpdateLegacyInterface addClientToSegments:token:bundleID:replaceExisting:privateSegment:](v13, "addClientToSegments:token:bundleID:replaceExisting:privateSegment:", v8, v12, v15, v6, v5);

    v16 = APLogForCategory(36);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v20 = 138543619;
      v21 = v18;
      v22 = 2113;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@ Add client to segments: %{private}@.", (uint8_t *)&v20, 0x16u);

    }
  }
  else
  {
    v19 = APLogForCategory(36);
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Unable to update third-party segment data due to disabled Personalized Ads.", (uint8_t *)&v20, 2u);
    }
  }

  -[PCSupportReceiver finishedWithRequests](self, "finishedWithRequests");
}

- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6
{
  void (**v9)(id, id);
  id v10;

  v9 = (void (**)(id, id))a6;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[APPCPolicyEngine policiesForContainerType:adType:adFormatType:](APPCPolicyEngine, "policiesForContainerType:adType:adFormatType:", a3, a4, a5));
  v9[2](v9, v10);

}

- (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[APTestingRig sharedInstance](APTestingRig, "sharedInstance"));
  objc_msgSend(v10, "invokeHandlerForMessage:payload:completionHandler:", v9, v8, v7);

}

- (void)connectionInterrupted
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = APLogForCategory(36);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Connection to client for PromotedContentSupport was interrupted.", v5, 2u);
  }

  -[PCSupportReceiver finishedWithRequests](self, "finishedWithRequests");
}

- (APXPCConnection)connection
{
  return self->_connection;
}

@end
