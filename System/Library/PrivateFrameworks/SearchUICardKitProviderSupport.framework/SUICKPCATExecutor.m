@implementation SUICKPCATExecutor

- (void)responseProtoFromCATModel:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, id);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, id, id))a4;
  v24 = CFSTR("locale");
  v6 = (void *)MEMORY[0x24BDBCEA0];
  v7 = a3;
  objc_msgSend(v6, "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "catIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("com.apple.siri.DialogEngine");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v7, "params");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(v17, "JSONObjectWithData:options:error:", v18, 0, &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v23;

  if (v20)
  {
    v21 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SUICKPCATExecutor responseProtoFromCATModel:completion:].cold.1(v21, v20);
    v22 = objc_alloc_init(MEMORY[0x24BE2CAF0]);
    v5[2](v5, v22, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2CAD8], "execute:catId:parameters:globals:callback:options:completion:", v16, v11, v19, v10, 0, *MEMORY[0x24BE2CAD0], v5);
  }

}

- (void)responseProtoFromCATModel:(void *)a1 completion:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_21ECF4000, v3, OS_LOG_TYPE_ERROR, "Error decoding CAT Params: %@", (uint8_t *)&v5, 0xCu);

}

@end
