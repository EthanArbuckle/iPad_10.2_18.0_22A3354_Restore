@implementation PKLaunchServicesProvider

- (id)plugInRecordForUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CA5848];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUID:error:", v4, 0);

  return v5;
}

- (BOOL)hasLSDatabaseAccess
{
  return MEMORY[0x1E0DE7D20](MEMORY[0x1E0CA5900], sel_hasDatabaseAccess);
}

- (id)defaultApplicationWorkspace
{
  +[PKApplicationWorkspaceProxy defaultWorkspace](PKApplicationWorkspaceProxy, "defaultWorkspace");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInRecordEnumeratorForExtensionPointRecord:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithExtensionPointRecord:options:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pklog_handle_for_category(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1AF275A8C((uint64_t)v3, v5);

    v4 = 0;
  }

  return v4;
}

- (id)extensionPointRecordEnumeratorForExtensionPointIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1AF45AD14]();
  objc_msgSend(MEMORY[0x1E0CA58E0], "enumeratorForExtensionPointIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (id)applicationProxyForBundleURL:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForBundleURL:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInKitProxyForURL:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForURL:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInKitProxyForUUID:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForUUID:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pluginKitProxyForIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CA58D8], "extensionPointForIdentifier:platform:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInRecordForIdentifier:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CA5848];
  v4 = a3;
  LODWORD(v3) = objc_msgSend(v3, "instancesRespondToSelector:", sel_initWithBundleIdentifier_requireValid_error_);
  v5 = objc_alloc(MEMORY[0x1E0CA5848]);
  if ((_DWORD)v3)
    v6 = objc_msgSend(v5, "initWithBundleIdentifier:requireValid:error:", v4, 1, 0);
  else
    v6 = objc_msgSend(v5, "initWithBundleIdentifier:error:", v4, 0);
  v7 = (void *)v6;

  return v7;
}

- (id)plugInRecordEnumerator
{
  objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithOptions:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInRecordEnumeratorWithExtensionPointName:(id)a3 platform:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v11 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58E0]), "initWithIdentifier:platform:error:", v5, v4, &v11);
  v7 = v11;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithExtensionPointRecord:options:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pklog_handle_for_category(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1AF275A08((uint64_t)v5, (uint64_t)v7, v9);

    v8 = 0;
  }

  return v8;
}

@end
