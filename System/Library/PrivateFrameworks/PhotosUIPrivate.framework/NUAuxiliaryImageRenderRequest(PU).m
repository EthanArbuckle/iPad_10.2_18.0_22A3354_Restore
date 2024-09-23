@implementation NUAuxiliaryImageRenderRequest(PU)

+ (uint64_t)createGainMapForComposition:()PU
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D51FF0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithComposition:", v4);

  objc_msgSend(v5, "setAuxiliaryImageType:", 7);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
  objc_msgSend(v5, "setPriority:", v6);

  objc_msgSend(v5, "setName:", CFSTR("NUAuxiliaryImageRenderRequest-createGainMap"));
  v13 = 0;
  objc_msgSend(v5, "submitSynchronous:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    objc_msgSend(v7, "auxiliaryImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cgImageRef");

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80526);
    v11 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_error_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Could not load gain image: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

@end
