@implementation SBSUtils

+ (id)createProxyConnectionForXPCWithExportedObject:(id)a3 connection:(id *)a4
{
  void *v5;
  void *v6;

  +[SBSUtils connectionWithExportedObject:](SBSUtils, "connectionWithExportedObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    objc_storeStrong(a4, v5);
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)connectionWithExportedObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.soundboardservices.server"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25577A238);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25577C250);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v6);

    objc_msgSend(v4, "setExportedObject:", v3);
  }
  objc_msgSend(v4, "remoteObjectInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classesForSelector:argumentIndex:ofReply:", sel_getAllSyncedAlarmsAndTimers_, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);
  objc_msgSend(v4, "remoteObjectInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getAllSyncedAlarmsAndTimers_, 0, 1);

  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_509);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_157);
  objc_msgSend(v4, "resume");

  return v4;
}

+ (id)createProxyConnectionForRapportTarget:(id)a3
{
  id v3;
  SBSRemoteDeviceSender *v4;

  v3 = a3;
  v4 = -[SBSRemoteDeviceSender initWithDevice:]([SBSRemoteDeviceSender alloc], "initWithDevice:", v3);

  return v4;
}

void __41__SBSUtils_connectionWithExportedObject___block_invoke_156()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  _SBSLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "+[SBSUtils connectionWithExportedObject:]_block_invoke";
    _os_log_impl(&dword_222D7A000, v0, OS_LOG_TYPE_DEFAULT, "%s - Connection to SoundBoard server was invalidated!\n", (uint8_t *)&v1, 0xCu);
  }

}

void __41__SBSUtils_connectionWithExportedObject___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  _SBSLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "+[SBSUtils connectionWithExportedObject:]_block_invoke";
    _os_log_impl(&dword_222D7A000, v0, OS_LOG_TYPE_DEFAULT, "%s - Connection to SoundBoard server was interrupted!\n", (uint8_t *)&v1, 0xCu);
  }

}

@end
