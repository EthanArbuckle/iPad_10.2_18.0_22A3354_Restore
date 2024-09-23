@implementation PKContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
  objc_storeStrong((id *)&self->_systemAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_auxiliaryStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeIdentifiers, 0);
  objc_storeStrong((id *)&self->_barcode, 0);
}

- (NSArray)systemAppBundleIdentifiers
{
  return self->_systemAppBundleIdentifiers;
}

- (NSArray)storeIdentifiers
{
  return self->_storeIdentifiers;
}

- (PKBarcode)barcode
{
  return self->_barcode;
}

- (void)encodeWithCoder:(id)a3
{
  PKBarcode *barcode;
  id v5;

  barcode = self->_barcode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", barcode, CFSTR("barcode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeIdentifiers, CFSTR("storeIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auxiliaryStoreIdentifiers, CFSTR("auxiliaryStoreIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemAppBundleIdentifiers, CFSTR("systemAppBundleIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appLaunchURL, CFSTR("appLaunchURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("description"));

}

- (PKContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  PKContent *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKBarcode *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKContent;
  v12 = -[PKContent init](&v24, sel_init);
  if (v12)
  {
    objc_msgSend(v9, "PKStringForKey:", CFSTR("description"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v13, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContent setLocalizedDescription:](v12, "setLocalizedDescription:", v14);

    objc_msgSend(v9, "objectForKey:", CFSTR("associatedStoreIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContent setStoreIdentifiers:](v12, "setStoreIdentifiers:", v15);

    objc_msgSend(v9, "objectForKey:", CFSTR("associatedStoreIdentifiers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContent setStoreIdentifiers:](v12, "setStoreIdentifiers:", v16);

    objc_msgSend(v9, "objectForKey:", CFSTR("auxiliaryStoreIdentifiers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContent setAuxiliaryStoreIdentifiers:](v12, "setAuxiliaryStoreIdentifiers:", v17);

    objc_msgSend(v9, "objectForKey:", CFSTR("systemAppBundleIdentifiers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContent setSystemAppBundleIdentifiers:](v12, "setSystemAppBundleIdentifiers:", v18);

    v19 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "PKStringForKey:", CFSTR("appLaunchURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContent setAppLaunchURL:](v12, "setAppLaunchURL:", v21);

    v22 = -[PKBarcode initWithPassDictionary:bundle:]([PKBarcode alloc], "initWithPassDictionary:bundle:", v9, v10);
    -[PKContent setBarcode:](v12, "setBarcode:", v22);

  }
  return v12;
}

- (void)setBarcode:(id)a3
{
  objc_storeStrong((id *)&self->_barcode, a3);
}

- (void)setSystemAppBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setStoreIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAppLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

+ (id)createWithFileURL:(id)a3 dataTypeIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    PKDataTypeIdentifier(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  PKObjectDictionary(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB34D0];
  PKPassPrivateDirectoryURLWithPassURL(v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !v8)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_22:
        v16 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = 138543362;
        v22 = v5;
        _os_log_error_impl(&dword_18FC92000, v18, OS_LOG_TYPE_ERROR, "Failed to load object dictionary from %{public}@", (uint8_t *)&v21, 0xCu);
      }

      if (v8)
        goto LABEL_22;
    }
    PKLogFacilityTypeGetObject(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      goto LABEL_22;
    }
    v21 = 138543362;
    v22 = v5;
    v19 = "Failed to load bundle from %{public}@";
LABEL_25:
    _os_log_error_impl(&dword_18FC92000, v17, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0xCu);
    goto LABEL_21;
  }
  if (!objc_msgSend(v6, "isEqual:", CFSTR("com.apple.pkpass")))
  {
    PKLogFacilityTypeGetObject(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 138543618;
      v22 = v6;
      v23 = 2114;
      v24 = v5;
      _os_log_error_impl(&dword_18FC92000, v17, OS_LOG_TYPE_ERROR, "Unexpected data type identifier '%{public}@' from %{public}@", (uint8_t *)&v21, 0x16u);
    }

    goto LABEL_20;
  }
  objc_msgSend(v7, "PKStringForKey:", CFSTR("passTypeIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PKPassTypeForPassTypeIdentifier(v13);
  v15 = (objc_class *)objc_opt_class();

  if (!v15)
  {
    PKLogFacilityTypeGetObject(0);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v21 = 138543362;
    v22 = v5;
    v19 = "Failed to instantiate content, content class unavailable for object at %{public}@";
    goto LABEL_25;
  }
  v16 = (void *)objc_msgSend([v15 alloc], "initWithDictionary:bundle:privateBundle:passType:", v7, v8, v12, v14 == 1);
LABEL_23:

  return v16;
}

- (PKContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKContent *v6;
  uint64_t v7;
  PKBarcode *barcode;
  uint64_t v9;
  NSString *localizedDescription;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *storeIdentifiers;
  uint64_t v16;
  NSArray *auxiliaryStoreIdentifiers;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *systemAppBundleIdentifiers;
  uint64_t v23;
  NSURL *appLaunchURL;
  objc_super v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x19400CFE8]();
  v26.receiver = self;
  v26.super_class = (Class)PKContent;
  v6 = -[PKContent init](&v26, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcode"));
    v7 = objc_claimAutoreleasedReturnValue();
    barcode = v6->_barcode;
    v6->_barcode = (PKBarcode *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v6->_localizedDescription;
    v6->_localizedDescription = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("storeIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    storeIdentifiers = v6->_storeIdentifiers;
    v6->_storeIdentifiers = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("auxiliaryStoreIDs"));
    v16 = objc_claimAutoreleasedReturnValue();
    auxiliaryStoreIdentifiers = v6->_auxiliaryStoreIdentifiers;
    v6->_auxiliaryStoreIdentifiers = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("systemAppBundleIdentifiers"));
    v21 = objc_claimAutoreleasedReturnValue();
    systemAppBundleIdentifiers = v6->_systemAppBundleIdentifiers;
    v6->_systemAppBundleIdentifiers = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLaunchURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    appLaunchURL = v6->_appLaunchURL;
    v6->_appLaunchURL = (NSURL *)v23;

  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)auxiliaryStoreIdentifiers
{
  return self->_auxiliaryStoreIdentifiers;
}

- (void)setAuxiliaryStoreIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

@end
