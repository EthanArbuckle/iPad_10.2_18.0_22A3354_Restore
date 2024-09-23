@implementation XBLaunchImageProviderClient

void __57__XBLaunchImageProviderClient_preheatServiceWithTimeout___block_invoke(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "message", 1);
}

+ (void)preheatServiceWithTimeout:(double)a3
{
  NSObject *v4;
  XBLaunchImageProviderClient *v5;
  id v6;
  dispatch_time_t v7;
  NSObject *v8;
  XBLaunchImageProviderClient *v9;
  void *v12;
  _QWORD block[4];
  XBLaunchImageProviderClient *v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBLaunchImageProviderClient.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeout > 0.0"));

  }
  XBLogDaemonLifecycle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = a3;
    _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_DEFAULT, "Warming up splashboardd (timeout %.1fs)", buf, 0xCu);
  }

  v5 = -[BSBaseXPCClient initWithServiceName:]([XBLaunchImageProviderClient alloc], "initWithServiceName:", CFSTR("com.apple.splashboard.launchimage"));
  -[BSBaseXPCClient _sendMessage:](v5, "_sendMessage:", &__block_literal_global_39);
  v6 = -[BSBaseXPCClient _connection](v5, "_connection");
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__XBLaunchImageProviderClient_preheatServiceWithTimeout___block_invoke_2;
  block[3] = &unk_24D7F4328;
  v14 = v5;
  v9 = v5;
  dispatch_after(v7, v8, block);

}

uint64_t __57__XBLaunchImageProviderClient_preheatServiceWithTimeout___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfo, 0);
}

- (XBLaunchImageProviderClient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProviderClient.m"), 35, CFSTR("use initWithDefaultService"));

  return 0;
}

- (XBLaunchImageProviderClient)initWithApplicationInfo:(id)a3
{
  id v5;
  XBLaunchImageProviderClient *v6;
  XBLaunchImageProviderClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XBLaunchImageProviderClient;
  v6 = -[BSBaseXPCClient initWithServiceName:endpoint:](&v9, sel_initWithServiceName_endpoint_, CFSTR("com.apple.splashboard.launchimage"), 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appInfo, a3);

  return v7;
}

- (unsigned)generateImageWithContext:(id)a3 captureInfo:(id *)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  XBLaunchImageError *v14;
  id v15;
  uint64_t v16;
  char v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id *v26;
  int v27;
  XBLaunchImageError *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id *v35;
  id v36;
  double v37;
  uint64_t v38;
  dispatch_time_t v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  void *v43;
  unsigned int v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v55;
  id v56;
  id v57;
  _QWORD v59[4];
  id v60;
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  uint8_t *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  BOOL v68;
  _QWORD block[4];
  id v70;
  id v71;
  XBLaunchImageProviderClient *v72;
  uint64_t *v73;
  id obj;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  id *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  uint8_t buf[8];
  uint8_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  objc_msgSend(v57, "launchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applicationCompatibilityInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  v82 = (id *)&v81;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__4;
  v85 = __Block_byref_object_dispose__4;
  v86 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = -1;
  if (!v57)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProviderClient.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProviderClient.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launchRequest != nil"));

  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProviderClient.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appInfo != nil"));

  }
  if (!self->_appInfo)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProviderClient.m"), 58, CFSTR("This API cannot be used if the client was not initialized with an app info"));

  }
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = BSEqualStrings();

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProviderClient.m"), 59, CFSTR("app info bundle ID: %@ doesn't match ivar app info bundle ID: %@"), v51, v52);

  }
  objc_msgSend(v7, "launchInterfaceIdentifierForRequest:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLaunchInterfaceIdentifier:", v11);

  v12 = (void *)MEMORY[0x24BDC1558];
  objc_msgSend(v7, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  objc_msgSend(v12, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v13, 0, &v76);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v76;

  if (v56)
  {
    v14 = [XBLaunchImageError alloc];
    objc_msgSend(v7, "bundleIdentifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:](v14, "initWithCode:bundleID:reason:fatal:", 4, v15, CFSTR("Failed to get LSBundleRecord"), 0);
    v17 = 0;
    v18 = v82[5];
    v82[5] = (id)v16;
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_15;
  }
  v15 = v55;
  v27 = objc_msgSend(v15, "isDeletableSystemApplication");
  v17 = v27;
  if (v27)
  {
    XBLogCapture();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217702000, v18, OS_LOG_TYPE_DEFAULT, "Skipping validation", buf, 2u);
    }
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  v19 = v82[5];
  if (v19 || (v17 & 1) != 0)
    goto LABEL_35;
  -[BSBaseXPCClient _sendMessage:](self, "_sendMessage:", &__block_literal_global_8);
  v20 = -[BSBaseXPCClient _connection](self, "_connection");
  objc_msgSend(v6, "launchInterfaceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "launchInterfaceWithIdentifier:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundlePath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (objc_msgSend(v22, "isStoryboard"))
    {
      objc_msgSend(v22, "name");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v82;
      v75 = v82[5];
      XBValidateStoryboard(v25, v24, &v75);
      objc_storeStrong(v26 + 5, v75);
    }
    else if (objc_msgSend(v22, "isXIB"))
    {
      objc_msgSend(v22, "name");
      v25 = objc_claimAutoreleasedReturnValue();
      v35 = v82;
      obj = v82[5];
      XBValidateNib(v25, v24, &obj);
      objc_storeStrong(v35 + 5, obj);
    }
    else
    {
      XBLogCapture();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217702000, v25, OS_LOG_TYPE_DEFAULT, "Nothing to validate", buf, 2u);
      }
    }

    if (v82[5])
      goto LABEL_34;
    XBLogCapture();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217702000, v29, OS_LOG_TYPE_DEFAULT, "Validated OK", buf, 2u);
    }
  }
  else
  {
    v28 = [XBLaunchImageError alloc];
    -[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "launchInterfaceIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Validation failed to construct NSBundle for %@ at %@."), v31, v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:](v28, "initWithCode:bundleID:reason:fatal:", 4, v29, v32, 0);
    v34 = v82[5];
    v82[5] = (id)v33;

  }
LABEL_34:

  v19 = v82[5];
LABEL_35:
  if (v19)
    goto LABEL_49;
  v36 = objc_alloc_init(MEMORY[0x24BE38358]);
  objc_msgSend(v57, "timeout");
  v38 = MEMORY[0x24BDAC760];
  if (v37 > 0.0)
  {
    v39 = dispatch_time(0, (uint64_t)(v37 * 1000000000.0));
    dispatch_get_global_queue(21, 0);
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = v38;
    block[1] = 3221225472;
    block[2] = __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_28;
    block[3] = &unk_24D7F50B8;
    v70 = v36;
    v73 = &v81;
    v71 = v7;
    v72 = self;
    dispatch_after(v39, v40, block);

  }
  *(_QWORD *)buf = 0;
  v88 = buf;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__4;
  v91 = __Block_byref_object_dispose__4;
  v92 = 0;
  v65[0] = v38;
  v65[1] = 3221225472;
  v65[2] = __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_32;
  v65[3] = &unk_24D7F50E0;
  v66 = v7;
  v67 = v6;
  v68 = a4 != 0;
  v59[0] = v38;
  v59[1] = 3221225472;
  v59[2] = __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_2;
  v59[3] = &unk_24D7F5108;
  v41 = v36;
  v60 = v41;
  v62 = &v77;
  v63 = &v81;
  v64 = buf;
  v61 = v66;
  -[BSBaseXPCClient _sendMessage:withReplyHandler:waitForReply:waitDuration:](self, "_sendMessage:withReplyHandler:waitForReply:waitDuration:", v65, v59, 1, -1);
  if (a4)
    *a4 = objc_retainAutorelease(*((id *)v88 + 5));

  _Block_object_dispose(buf, 8);
  v19 = v82[5];
  if (v19)
  {
LABEL_49:
    if (objc_msgSend(v19, "isFatal"))
    {
      -[BSBaseXPCClient invalidate](self, "invalidate");
      XBLogCapture();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "bundleIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[XBLaunchImageProviderClient generateImageWithContext:captureInfo:error:].cold.1(v43, (uint64_t)buf, v42);
      }

    }
    *a5 = objc_retainAutorelease(v82[5]);
  }
  v44 = *((_DWORD *)v78 + 6);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  return v44;
}

void __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "message", 1);
}

uint64_t __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_28(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  XBLaunchImageError *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  result = objc_msgSend(*(id *)(a1 + 32), "setFlag:", 1);
  if ((_DWORD)result)
  {
    XBLogCapture();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_28_cold_1(a1, v3);

    v4 = [XBLaunchImageError alloc];
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:](v4, "initWithCode:bundleID:reason:fatal:", 8, v5, CFSTR("The request timed out"), 0);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    return objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }
  return result;
}

void __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_32(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, "message", 0);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "createCaptureInfo", *(_BYTE *)(a1 + 48));

}

void __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  XBLaunchImageError *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  xpc_object_t xdict;

  xdict = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "setFlag:", 1);
  v4 = xdict;
  if (v3)
  {
    if (xdict && MEMORY[0x219A11034](xdict, xdict) == MEMORY[0x24BDACFA0])
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_int64(xdict, "contextID");
      BSDeserializeDataFromXPCDictionaryWithKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[XBLaunchImageError bs_secureDecodedFromData:](XBLaunchImageError, "bs_secureDecodedFromData:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      BSDeserializeDataFromXPCDictionaryWithKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[XBLaunchCaptureInformation bs_secureDecodedFromData:](XBLaunchCaptureInformation, "bs_secureDecodedFromData:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 64);
    }
    else
    {
      v5 = [XBLaunchImageError alloc];
      objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:](v5, "initWithCode:bundleID:reason:fatal:", 9, v6, CFSTR("The request failed"), 0);
      v8 = *(_QWORD *)(a1 + 56);
    }
    v13 = *(_QWORD *)(v8 + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v7;

    v4 = xdict;
  }

}

- (void)generateImageWithContext:(void *)a1 captureInfo:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_217702000, a3, (uint64_t)a3, "Fatal error generating snapshot for %@.", (uint8_t *)a2);

}

void __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_28_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_217702000, a2, v4, "Request to splashboardd has timed out -- invalidating the connection for %@.", (uint8_t *)&v5);

}

@end
