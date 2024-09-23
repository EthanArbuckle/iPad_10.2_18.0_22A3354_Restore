void PVAppIdentity_GenerateDigestWithCompletion(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v7)
  {
    dispatch_get_global_queue(0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (objc_class *)MEMORY[0x24BDD1988];
  v11 = v7;
  v12 = a2;
  v13 = a1;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithServiceName:", CFSTR("com.apple.pvappidentityservice"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257408E38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRemoteObjectInterface:", v15);

  objc_msgSend(v14, "resume");
  v16 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke;
  v28[3] = &unk_2515D2CB0;
  v17 = v9;
  v29 = v17;
  v18 = v8;
  v31 = v18;
  v19 = v14;
  v30 = v19;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_2;
  v24[3] = &unk_2515D2CD8;
  v26 = v19;
  v27 = v18;
  v25 = v17;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  objc_msgSend(v20, "generateDigest:ppqAppId:withReply:", v13, v12, v24);

}

id _PVAppIdentityLogSystem()
{
  if (_PVAppIdentityLogSystem_onceToken != -1)
    dispatch_once(&_PVAppIdentityLogSystem_onceToken, &__block_literal_global);
  return (id)_PVAppIdentityLogSystem_log;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

