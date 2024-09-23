@implementation UAPBIRPublicURLConverter

+ (void)registerConverter
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(CFSTR("PBIR"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = CFSTR("public.url");
    v7 = 2112;
    v8 = a1;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "Registering converter for type: %@ -> %@", (uint8_t *)&v5, 0x16u);
  }

  +[UASharedPasteboardIRManager sharedIRManager](UASharedPasteboardIRManager, "sharedIRManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerIRHandlerClass:forType:", a1, CFSTR("public.url"));

}

- (id)typeString
{
  return CFSTR("public.url");
}

- (id)convertPlatformDataToIR:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _uaGetLogForCategory(CFSTR("PBIR"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("public.url");
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "Converting from platform to IR for type: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)convertIRDataToPlatform:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _uaGetLogForCategory(CFSTR("PBIR"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("public.url");
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "Converting from IR to platform for type: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

@end
