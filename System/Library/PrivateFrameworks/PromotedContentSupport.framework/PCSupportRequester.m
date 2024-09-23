@implementation PCSupportRequester

- (void)connectionInvalidated
{
  NSObject *v2;
  uint8_t v3[16];

  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2153EB000, v2, OS_LOG_TYPE_INFO, "Connection to PCSupport in Daemon was invalidated.", v3, 2u);
  }

}

- (void)policiesToEnforce:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    -[APXPCActionRequester remoteObjectProxy](self, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_2153ECB80;
    v6[3] = &unk_24D33A898;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    objc_msgSend(v5, "policiesToEnforce:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

- (void)fetchConfigurationForClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[APXPCActionRequester remoteObjectProxy](self, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_2153ECDAC;
  v11[3] = &unk_24D33A8C0;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "fetchConfigurationForClass:completion:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)fetchGenderAndAgeGroupData
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_2153EDB28;
  v11 = sub_2153EDB18;
  v12 = 0;
  -[APXPCActionRequester synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", &unk_24D33A820);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2153ED7C4;
  v6[3] = &unk_24D33A848;
  v6[4] = &v7;
  objc_msgSend(v3, "fetchGenderAndAgeGroupData:", v6);
  -[APXPCActionRequester finished](self, "finished");
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (PCSupportRequester)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCSupportRequester;
  return -[APXPCActionRequester init](&v3, sel_init);
}

+ (id)machService
{
  return CFSTR("com.apple.ap.promotedcontent.supportinterface");
}

+ (BOOL)canShareConnection
{
  return 1;
}

- (id)remoteObjectInterface
{
  return &unk_254DC2A48;
}

- (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (objc_msgSend(v9, "count") || v6)
  {
    -[APXPCActionRequester remoteObjectProxy](self, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addClientToSegments:replaceExisting:privateSegment:", v9, v6, v5);

  }
}

- (void)fetchGenderAndAgeGroupData:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    -[APXPCActionRequester remoteObjectProxy](self, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_2153EE034;
    v6[3] = &unk_24D33A870;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    objc_msgSend(v5, "fetchGenderAndAgeGroupData:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[APXPCActionRequester remoteObjectProxy](self, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_2153EE26C;
    v15[3] = &unk_24D33A898;
    objc_copyWeak(&v17, &location);
    v16 = v13;
    objc_msgSend(v14, "policiesForContainerType:adType:adFormatType:completion:", v10, v11, v12, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

- (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x24BDFD4B8], "isAppleInternalInstall") & 1) != 0)
  {
    -[APXPCActionRequester remoteObjectProxy](self, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_2153EE4B0;
    v12[3] = &unk_24D33A8E8;
    v13 = v10;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "invokeTestingRigHandlerForMessage:payload:completionHandler:", v8, v9, v12);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)connectionInterrupted
{
  NSObject *v2;
  uint8_t v3[16];

  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2153EB000, v2, OS_LOG_TYPE_ERROR, "Connection to PCSupport in Daemon was interrupted.", v3, 2u);
  }

}

@end
