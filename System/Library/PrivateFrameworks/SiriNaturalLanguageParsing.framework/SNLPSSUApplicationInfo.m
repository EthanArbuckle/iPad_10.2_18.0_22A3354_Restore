@implementation SNLPSSUApplicationInfo

- (id)description
{
  void *v2;
  NSString *bundleIdentifier;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  bundleIdentifier = self->_bundleIdentifier;
  -[NSURL path](self->_assetURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[SNLPSSUApplicationInfo bundleIdentifier='%@' assetURL='%@']"), bundleIdentifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SNLPSSUApplicationInfo)initWithBundleIdentifier:(id)a3 assetURL:(id)a4 forLocale:(id)a5
{
  NSURL *v8;
  NSString *v9;
  id v10;
  SNLPSSUApplicationInfo *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  NSURL *assetURL;
  NSURL *v15;
  NSString *locale;
  objc_super v18;

  v8 = (NSURL *)a4;
  v9 = (NSString *)a5;
  v18.receiver = self;
  v18.super_class = (Class)SNLPSSUApplicationInfo;
  v10 = a3;
  v11 = -[SNLPSSUApplicationInfo init](&v18, sel_init);
  v12 = objc_msgSend(v10, "copy", v18.receiver, v18.super_class);

  bundleIdentifier = v11->_bundleIdentifier;
  v11->_bundleIdentifier = (NSString *)v12;

  assetURL = v11->_assetURL;
  v11->_assetURL = v8;
  v15 = v8;

  locale = v11->_locale;
  v11->_locale = v9;

  return v11;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)assetURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)applicationInfoWithBundleIdentifier:(id)a3 assetURL:(id)a4 forLocale:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v10, "isFileURL") & 1) != 0)
  {
    a6 = -[SNLPSSUApplicationInfo initWithBundleIdentifier:assetURL:forLocale:]([SNLPSSUApplicationInfo alloc], "initWithBundleIdentifier:assetURL:forLocale:", v9, v10, v11);
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The given asset directory is not a file URL: %@."), v10, *MEMORY[0x1E0CB2D50], *MEMORY[0x1E0CB2D68], CFSTR("Could not build an SNLPSSUApplicationInfo object"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 1, v13);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

@end
