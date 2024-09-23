@implementation QLPreviewConverterURLProtocol

+ (void)initialize
{
  NSObject **v3;
  NSObject *v4;
  uint8_t v5[16];

  if ((id)objc_opt_class() == a1)
  {
    v3 = (NSObject **)MEMORY[0x1E0D83678];
    v4 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D936E000, v4, OS_LOG_TYPE_DEFAULT, " #Conversion", v5, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB39D0], "registerClass:", a1);
  }
}

+ (void)registerPreview:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "previewURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerPreview:forPreviewURL:", v4, v5);

}

+ (id)_errorForNoPreview
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99D80]);
  QLLocalizedStringFromTable(CFSTR("This file cannot be previewed"), CFSTR("Errors"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB2D50];
  QLLocalizedStringFromTable(CFSTR("It might be corrupted or of an unknown file format."), CFSTR("Errors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, v4, v5, *MEMORY[0x1E0CB2D80], 0);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("QuickLookErrorDomain"), 912, v6);
  return v7;
}

+ (void)unregisterURLs:(id)a3 andPreview:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "previewURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unregisterURLs:andPreviewURL:", v6, v7);

}

+ (id)protocolScheme
{
  return CFSTR("x-apple-ql-id");
}

@end
