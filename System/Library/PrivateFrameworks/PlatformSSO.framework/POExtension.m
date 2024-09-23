@implementation POExtension

- (POExtension)initWithExtensionBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  POExtension *v7;

  v4 = (void *)MEMORY[0x24BE04370];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[POExtension initWithExtensionBundleIdentifier:extensionManager:](self, "initWithExtensionBundleIdentifier:extensionManager:", v5, v6);

  return v7;
}

- (POExtension)initWithExtensionBundleIdentifier:(id)a3 extensionManager:(id)a4
{
  id v6;
  id v7;
  POExtension *v8;
  uint64_t v9;
  SOExtension *extension;
  SOExtension *v11;
  POExtension *v12;
  NSObject *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)POExtension;
  v8 = -[POExtension init](&v15, sel_init);
  if (!v8)
    goto LABEL_4;
  objc_msgSend(v7, "loadExtensionWithBundleIdentifier:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  extension = v8->_extension;
  v8->_extension = (SOExtension *)v9;

  v11 = v8->_extension;
  if (v11)
  {
    -[SOExtension saveDelegate:forRequestIdentifier:](v11, "saveDelegate:forRequestIdentifier:", v8, CFSTR("platform sso"));
LABEL_4:
    v12 = v8;
    goto LABEL_8;
  }
  PO_LOG_POExtension();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[POExtension initWithExtensionBundleIdentifier:extensionManager:].cold.1();

  v12 = 0;
LABEL_8:

  return v12;
}

- (void)dealloc
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[POExtension dealloc]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_22307D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)unload
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  POExtension *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[POExtension unload]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  -[POExtension close](self, "close");
  -[POExtension _unload](self, "_unload");
}

- (void)_unload
{
  NSObject *v3;
  SOExtension *extension;
  SORemoteExtensionViewController *extensionViewController;
  int v6;
  const char *v7;
  __int16 v8;
  POExtension *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[POExtension _unload]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  -[SOExtension unload](self->_extension, "unload");
  -[SOExtension removeDelegateForRequestIdentifier:](self->_extension, "removeDelegateForRequestIdentifier:", CFSTR("platform sso"));
  extension = self->_extension;
  self->_extension = 0;

  extensionViewController = self->_extensionViewController;
  self->_extensionViewController = 0;

}

- (void)close
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  POExtension *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[POExtension close]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_11);
}

- (NSString)containerAppBundleIdentifier
{
  return (NSString *)-[SOExtension containerAppBundleIdentifier](self->_extension, "containerAppBundleIdentifier");
}

- (NSArray)authenticationMethods
{
  return (NSArray *)-[SOExtension authenticationMethods](self->_extension, "authenticationMethods");
}

- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SOExtension *extension;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  POExtension *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  PO_LOG_POExtension();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[POExtension beginDeviceRegistrationUsingOptions:extensionData:completion:]";
    v20 = 2048;
    v21 = a3;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_22307D000, v10, OS_LOG_TYPE_DEFAULT, "%s options = %ld on %@", buf, 0x20u);
  }

  extension = self->_extension;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke;
  v14[3] = &unk_24EC035F0;
  v16 = v9;
  v17 = a3;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  v13 = v9;
  -[SOExtension requestAuthorizationViewControllerWithCompletion:](extension, "requestAuthorizationViewControllerWithCompletion:", v14);

}

void __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD block[4];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  PO_LOG_POExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_INFO, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v9 + 8);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2;
    v15[3] = &unk_24EC035C8;
    v15[4] = v9;
    v12 = *(_QWORD *)(a1 + 56);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v11, "beginDeviceRegistrationUsingOptions:extensionData:completion:", v12, v10, v15);
    v13 = v16;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_4;
    block[3] = &unk_24EC03558;
    v18 = *(id *)(a1 + 48);
    dispatch_async(v14, block);

    v13 = v18;
  }

}

uint64_t __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  PO_LOG_POExtension();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(a2);

  objc_msgSend(*(id *)(a1 + 32), "sdkVersionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", &unk_24EC10BB0);

  if (v6 == -1)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_7_0);
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_8;
  v8[3] = &unk_24EC035A0;
  v9 = *(id *)(a1 + 40);
  v10 = a2;
  dispatch_async(v7, v8);

}

uint64_t __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  SOExtension *extension;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  POExtension *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  PO_LOG_POExtension();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v27 = "-[POExtension beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:]";
    v28 = 1026;
    v29 = a4;
    v30 = 2048;
    v31 = a5;
    v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_22307D000, v15, OS_LOG_TYPE_DEFAULT, "%s authenticationMethod = %{public}d, options = %ld on %@", buf, 0x26u);
  }

  extension = self->_extension;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke;
  v20[3] = &unk_24EC03638;
  v20[4] = self;
  v21 = v12;
  v25 = a4;
  v23 = v14;
  v24 = a5;
  v22 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v14;
  -[SOExtension requestAuthorizationViewControllerWithCompletion:](extension, "requestAuthorizationViewControllerWithCompletion:", v20);

}

void __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  PO_LOG_POExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_INFO, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v9 + 8);
    v12 = *(unsigned int *)(a1 + 72);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2;
    v17[3] = &unk_24EC035C8;
    v17[4] = v9;
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 64);
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v11, "beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:", v10, v12, v14, v13, v17);
    v15 = v18;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_11;
    block[3] = &unk_24EC03558;
    v20 = *(id *)(a1 + 56);
    dispatch_async(v16, block);

    v15 = v20;
  }

}

uint64_t __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  PO_LOG_POExtension();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(a2);

  objc_msgSend(*(id *)(a1 + 32), "sdkVersionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", &unk_24EC10BB0);

  if (v6 == -1)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_13);
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_14;
  v8[3] = &unk_24EC035A0;
  v9 = *(id *)(a1 + 40);
  v10 = a2;
  dispatch_async(v7, v8);

}

uint64_t __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)registrationDidCompleteWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SOExtension *extension;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  POExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[POExtension registrationDidCompleteWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  extension = self->_extension;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__POExtension_registrationDidCompleteWithCompletion___block_invoke;
  v8[3] = &unk_24EC036A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SOExtension requestAuthorizationViewControllerWithCompletion:](extension, "requestAuthorizationViewControllerWithCompletion:", v8);

}

void __53__POExtension_registrationDidCompleteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  PO_LOG_POExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_INFO, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__POExtension_registrationDidCompleteWithCompletion___block_invoke_2;
    v11[3] = &unk_24EC03558;
    v12 = v9;
    objc_msgSend(v10, "registrationDidCompleteWithCompletion:", v11);

  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __53__POExtension_registrationDidCompleteWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_17);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registrationDidCancelWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  POExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[POExtension registrationDidCancelWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__POExtension_registrationDidCancelWithCompletion___block_invoke;
  v8[3] = &unk_24EC03240;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __51__POExtension_registrationDidCancelWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__POExtension_registrationDidCancelWithCompletion___block_invoke_2;
  v3[3] = &unk_24EC03558;
  v4 = v1;
  objc_msgSend(v2, "registrationDidCancelWithCompletion:", v3);

}

void __51__POExtension_registrationDidCancelWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_18);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__POExtension_registrationDidCancelWithCompletion___block_invoke_4;
  block[3] = &unk_24EC03558;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __51__POExtension_registrationDidCancelWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)supportedGrantTypes
{
  SOExtension *extension;
  int64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  dispatch_semaphore_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = dispatch_semaphore_create(0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__POExtension_supportedGrantTypes__block_invoke;
  v6[3] = &unk_24EC03710;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  -[SOExtension setupNonUISessionWithCompletion:](extension, "setupNonUISessionWithCompletion:", v6);
  dispatch_semaphore_wait((dispatch_semaphore_t)v12[5], 0xFFFFFFFFFFFFFFFFLL);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

intptr_t __34__POExtension_supportedGrantTypes__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  int8x16_t v5;

  if ((a2 & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__POExtension_supportedGrantTypes__block_invoke_2;
  v4[3] = &unk_24EC036E8;
  v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  return objc_msgSend(v2, "supportedGrantTypesCompletion:", v4);
}

intptr_t __34__POExtension_supportedGrantTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (int64_t)protocolVersion
{
  SOExtension *extension;
  int64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  dispatch_semaphore_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = dispatch_semaphore_create(0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__POExtension_protocolVersion__block_invoke;
  v6[3] = &unk_24EC03710;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  -[SOExtension setupNonUISessionWithCompletion:](extension, "setupNonUISessionWithCompletion:", v6);
  dispatch_semaphore_wait((dispatch_semaphore_t)v12[5], 0xFFFFFFFFFFFFFFFFLL);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

intptr_t __30__POExtension_protocolVersion__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  int8x16_t v5;

  if ((a2 & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__POExtension_protocolVersion__block_invoke_2;
  v4[3] = &unk_24EC036E8;
  v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  return objc_msgSend(v2, "protocolVersionCompletion:", v4);
}

intptr_t __30__POExtension_protocolVersion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)supportedDeviceSigningAlgorithms
{
  SOExtension *extension;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  dispatch_semaphore_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = dispatch_semaphore_create(0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke;
  v6[3] = &unk_24EC03710;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  -[SOExtension setupNonUISessionWithCompletion:](extension, "setupNonUISessionWithCompletion:", v6);
  dispatch_semaphore_wait((dispatch_semaphore_t)v14[5], 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

intptr_t __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  int8x16_t v5;

  if ((a2 & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke_2;
  v4[3] = &unk_24EC03738;
  v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  return objc_msgSend(v2, "supportedDeviceSigningAlgorithmsCompletion:", v4);
}

void __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (id)supportedDeviceEncryptionAlgorithms
{
  SOExtension *extension;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  dispatch_semaphore_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = dispatch_semaphore_create(0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke;
  v6[3] = &unk_24EC03710;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  -[SOExtension setupNonUISessionWithCompletion:](extension, "setupNonUISessionWithCompletion:", v6);
  dispatch_semaphore_wait((dispatch_semaphore_t)v14[5], 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

intptr_t __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  int8x16_t v5;

  if ((a2 & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke_2;
  v4[3] = &unk_24EC03738;
  v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  return objc_msgSend(v2, "supportedDeviceEncryptionAlgorithmsCompletion:", v4);
}

void __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (id)supportedUserSecureEnclaveKeySigningAlgorithms
{
  SOExtension *extension;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  dispatch_semaphore_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = dispatch_semaphore_create(0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke;
  v6[3] = &unk_24EC03710;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  -[SOExtension setupNonUISessionWithCompletion:](extension, "setupNonUISessionWithCompletion:", v6);
  dispatch_semaphore_wait((dispatch_semaphore_t)v14[5], 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

intptr_t __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  int8x16_t v5;

  if ((a2 & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke_2;
  v4[3] = &unk_24EC03738;
  v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  return objc_msgSend(v2, "supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:", v4);
}

void __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (BOOL)canPerformRegistration
{
  NSObject *v3;
  SOExtension *extension;
  BOOL v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  _BYTE buf[24];
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  dispatch_semaphore_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[POExtension canPerformRegistration]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = dispatch_semaphore_create(0);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  extension = self->_extension;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__POExtension_canPerformRegistration__block_invoke;
  v7[3] = &unk_24EC03710;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  -[SOExtension setupNonUISessionWithCompletion:](extension, "setupNonUISessionWithCompletion:", v7);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
  v5 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(buf, 8);

  return v5;
}

intptr_t __37__POExtension_canPerformRegistration__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  int8x16_t v5;

  if ((a2 & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__POExtension_canPerformRegistration__block_invoke_2;
  v4[3] = &unk_24EC03760;
  v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  return objc_msgSend(v2, "canPerformRegistrationCompletion:", v4);
}

intptr_t __37__POExtension_canPerformRegistration__block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)presentAuthorizationViewControllerInWindow:(id)a3 hints:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  POExtension *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  PO_LOG_POExtension();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[POExtension presentAuthorizationViewControllerInWindow:hints:completion:]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_22307D000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  if (self->_extensionViewController)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("No extension registration view controller"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v8);

  }
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  POExtension *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  PO_LOG_POExtension();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[POExtension authorization:didCompleteWithCredential:error:]";
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_22307D000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_25);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__POExtension_authorization_didCompleteWithCredential_error___block_invoke_2;
  v10[3] = &unk_24EC031A8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

}

void __61__POExtension_authorization_didCompleteWithCredential_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestDidCompleteWithError:", *(_QWORD *)(a1 + 40));

  }
}

- (void)keyWillRotateForKeyType:(int64_t)a3 newKey:(__SecKey *)a4 extensionData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  SOExtension *extension;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84F0]), "initWithKey:", a4);
  extension = self->_extension;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke;
  v17[3] = &unk_24EC037A8;
  v20 = v11;
  v21 = a3;
  v17[4] = self;
  v18 = v12;
  v19 = v10;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  -[SOExtension setupNonUISessionWithCompletion:](extension, "setupNonUISessionWithCompletion:", v17);

}

void __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_30;
    v13[3] = &unk_24EC035C8;
    v10 = &v14;
    v11 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v7, "keyWillRotateForKeyType:keyProxyEndpoint:extensionData:completion:", v8, v9, v11, v13);

  }
  else
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2;
    v16[3] = &unk_24EC025A0;
    v10 = &v17;
    v17 = v5;
    v12 = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2((uint64_t)v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

id __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to call key rotation on extension."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

uint64_t __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_30(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (POExtensionDelegate)delegate
{
  return (POExtensionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)sdkVersionString
{
  return self->_sdkVersionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sdkVersionString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtensionBundleIdentifier:extensionManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22307D000, v0, v1, "PlatformSSO extension not found (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_22307D000, v2, v3, "beginDeviceRegistrationUsingLoginManager completed, result = %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_22307D000, v2, v3, "beginUserRegistrationUsingLoginManager completed, result = %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

@end
