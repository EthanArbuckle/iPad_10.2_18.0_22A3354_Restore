@implementation SKGProcessorConnection

- (SKGProcessorConnection)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKGProcessorConnection;
  return -[CSXPCConnection initWithMachServiceName:](&v3, sel_initWithMachServiceName_, CFSTR("com.apple.spotlightknowledged"));
}

- (id)initForImporter
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKGProcessorConnection;
  return -[CSXPCConnection initWithMachServiceName:](&v3, sel_initWithMachServiceName_, CFSTR("com.apple.spotlightknowledged.importer"));
}

- (void)processRecord:(id)a3 referenceIdentifier:(id)a4 protectionClass:(id)a5 includeEmbeddings:(BOOL)a6 includeKeyphrases:(BOOL)a7 includePeople:(BOOL)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t v18;
  id v19;
  id v20;
  __CFString *v21;
  id v22;
  void *v24;
  _QWORD v25[4];
  id v26;

  v14 = a4;
  v15 = a5;
  v16 = a9;
  v17 = a3;
  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v18, "command", "processRecord");
  v19 = objc_alloc_init(MEMORY[0x24BDC23B8]);
  objc_msgSend(v19, "encodeObject:", v17);

  objc_msgSend(v19, "data");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_data(v18, "record", (const void *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"));
  if (v15)
    v21 = (__CFString *)objc_retainAutorelease(v15);
  else
    v21 = CFSTR("Default");
  xpc_dictionary_set_string(v18, "protectionClass", (const char *)-[__CFString UTF8String](v21, "UTF8String", self));
  if (v14)
    xpc_dictionary_set_string(v18, "referenceIdentifier", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  xpc_dictionary_set_BOOL(v18, "includeEmbeddings", a6);
  xpc_dictionary_set_BOOL(v18, "includeKeyphrases", a7);
  xpc_dictionary_set_BOOL(v18, "includePeople", a8);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __144__SKGProcessorConnection_processRecord_referenceIdentifier_protectionClass_includeEmbeddings_includeKeyphrases_includePeople_completionHandler___block_invoke;
  v25[3] = &unk_2518FF8E0;
  v26 = v16;
  v22 = v16;
  objc_msgSend(v24, "sendMessageAsync:completion:", v18, v25);

}

void __144__SKGProcessorConnection_processRecord_referenceIdentifier_protectionClass_includeEmbeddings_includeKeyphrases_includePeople_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  csimport_xpc_dictionary_decode_status_with_error(v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKGAttributeProcessorErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDC23D0]);
    v7 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSDataForKey:fromXPCDictionary:", "attrDict", v10);
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);
    objc_msgSend(v8, "decode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v5, 0);
  }

}

- (void)updateCheckedInClientWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  const char *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "processCheckedInBundleID");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  xpc_dictionary_set_string(v8, "bundleIdentifier", v10);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__SKGProcessorConnection_updateCheckedInClientWithBundleIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_2518FF8E0;
  v13 = v6;
  v11 = v6;
  -[CSXPCConnection sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v8, v12);

}

void __86__SKGProcessorConnection_updateCheckedInClientWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  csimport_xpc_dictionary_decode_status_with_error(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKGAttributeProcessorErrorDomain"), -1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setTurboMode:(BOOL)a3
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "command", "turboMode");
  xpc_dictionary_set_BOOL(xdict, "turboState", a3);
  -[CSXPCConnection sendMessageAsync:](self, "sendMessageAsync:", xdict);

}

- (void)checkProcessingReportForBundleIdentifier:(id)a3 flags:(unint64_t)a4 timeout:(unint64_t)a5 completion:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  xpc_object_t v14;
  id v15;
  const char *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = (a4 >> 1) & 1;
  v12 = (a4 >> 2) & 1;
  v13 = a3;
  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "command", "progressReportForBundleID");
  xpc_dictionary_set_BOOL(v14, "includeEmbeddings", v11);
  xpc_dictionary_set_BOOL(v14, "includeKeyphrases", v12);
  v15 = objc_retainAutorelease(v13);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");

  xpc_dictionary_set_string(v14, "bundleIdentifier", v16);
  xpc_dictionary_set_uint64(v14, "timeout", a5);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__SKGProcessorConnection_checkProcessingReportForBundleIdentifier_flags_timeout_completion___block_invoke;
  v18[3] = &unk_2518FF8E0;
  v19 = v10;
  v17 = v10;
  -[CSXPCConnection sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v14, v18);

}

void __92__SKGProcessorConnection_checkProcessingReportForBundleIdentifier_flags_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  csimport_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_uint64(v3, "foundItemsCount");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKGAttributeProcessorErrorDomain"), -1, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getEmbeddingGenerationProgressReport:(id)a3
{
  id v4;
  xpc_object_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "embeddingGenerationProgress");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SKGProcessorConnection_getEmbeddingGenerationProgressReport___block_invoke;
  v7[3] = &unk_2518FF8E0;
  v8 = v4;
  v6 = v4;
  -[CSXPCConnection sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v5, v7);

}

void __63__SKGProcessorConnection_getEmbeddingGenerationProgressReport___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  xpc_object_t xdict;

  xdict = a2;
  csimport_xpc_dictionary_decode_status_with_error(xdict);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKGAttributeProcessorErrorDomain"), -1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  xpc_dictionary_get_value(xdict, "embeddingReport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
