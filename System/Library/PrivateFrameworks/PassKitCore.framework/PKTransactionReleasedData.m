@implementation PKTransactionReleasedData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReleasedData)initWithCoder:(id)a3
{
  id v4;
  PKTransactionReleasedData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *elements;
  uint64_t v11;
  PKTransactionReleasedDataApplication *application;
  uint64_t v13;
  NSURL *privacyPolicyURL;
  uint64_t v15;
  NSData *certificateData;
  uint64_t v17;
  NSString *merchantNameOverride;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKTransactionReleasedData;
  v5 = -[PKTransactionReleasedData init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("elements"));
    v9 = objc_claimAutoreleasedReturnValue();
    elements = v5->_elements;
    v5->_elements = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("application"));
    v11 = objc_claimAutoreleasedReturnValue();
    application = v5->_application;
    v5->_application = (PKTransactionReleasedDataApplication *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPolicyURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certificateData"));
    v15 = objc_claimAutoreleasedReturnValue();
    certificateData = v5->_certificateData;
    v5->_certificateData = (NSData *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantNameOverride"));
    v17 = objc_claimAutoreleasedReturnValue();
    merchantNameOverride = v5->_merchantNameOverride;
    v5->_merchantNameOverride = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *elements;
  id v5;

  elements = self->_elements;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", elements, CFSTR("elements"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_application, CFSTR("application"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyPolicyURL, CFSTR("privacyPolicyURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificateData, CFSTR("certificateData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantNameOverride, CFSTR("merchantNameOverride"));

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_elements);
  objc_msgSend(v3, "safelyAddObject:", self->_application);
  objc_msgSend(v3, "safelyAddObject:", self->_privacyPolicyURL);
  objc_msgSend(v3, "safelyAddObject:", self->_certificateData);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantNameOverride);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionReleasedData *v4;
  PKTransactionReleasedData *v5;
  BOOL v6;

  v4 = (PKTransactionReleasedData *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionReleasedData isEqualToReleasedData:](self, "isEqualToReleasedData:", v5);

  return v6;
}

- (BOOL)isEqualToReleasedData:(id)a3
{
  _QWORD *v4;
  NSSet *elements;
  NSSet *v6;
  BOOL v7;
  PKTransactionReleasedDataApplication *application;
  PKTransactionReleasedDataApplication *v9;
  NSURL *privacyPolicyURL;
  NSURL *v11;
  NSData *certificateData;
  NSData *v13;
  NSString *merchantNameOverride;
  NSString *v15;
  char v16;

  v4 = a3;
  elements = self->_elements;
  v6 = (NSSet *)v4[1];
  if (elements)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (elements != v6)
      goto LABEL_26;
  }
  else if ((-[NSSet isEqual:](elements, "isEqual:") & 1) == 0)
  {
    goto LABEL_26;
  }
  application = self->_application;
  v9 = (PKTransactionReleasedDataApplication *)v4[2];
  if (application && v9)
  {
    if (!-[PKTransactionReleasedDataApplication isEqual:](application, "isEqual:"))
      goto LABEL_26;
  }
  else if (application != v9)
  {
    goto LABEL_26;
  }
  privacyPolicyURL = self->_privacyPolicyURL;
  v11 = (NSURL *)v4[3];
  if (privacyPolicyURL && v11)
  {
    if ((-[NSURL isEqual:](privacyPolicyURL, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (privacyPolicyURL != v11)
  {
    goto LABEL_26;
  }
  certificateData = self->_certificateData;
  v13 = (NSData *)v4[4];
  if (!certificateData || !v13)
  {
    if (certificateData == v13)
      goto LABEL_22;
LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  if ((-[NSData isEqual:](certificateData, "isEqual:") & 1) == 0)
    goto LABEL_26;
LABEL_22:
  merchantNameOverride = self->_merchantNameOverride;
  v15 = (NSString *)v4[5];
  if (merchantNameOverride && v15)
    v16 = -[NSString isEqual:](merchantNameOverride, "isEqual:");
  else
    v16 = merchantNameOverride == v15;
LABEL_27:

  return v16;
}

- (id)dictionaryRepresentation
{
  id v3;
  NSSet *elements;
  void *v5;
  void *v6;
  PKTransactionReleasedDataApplication *application;
  NSURL *privacyPolicyURL;
  NSData *certificateData;
  NSString *merchantNameOverride;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  elements = self->_elements;
  if (elements)
  {
    -[NSSet pk_setByApplyingBlock:](elements, "pk_setByApplyingBlock:", &__block_literal_global_137);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("elements"));

  }
  application = self->_application;
  if (application)
    objc_msgSend(v3, "setObject:forKey:", application, CFSTR("application"));
  privacyPolicyURL = self->_privacyPolicyURL;
  if (privacyPolicyURL)
    objc_msgSend(v3, "setObject:forKey:", privacyPolicyURL, CFSTR("privacyPolicyURL"));
  certificateData = self->_certificateData;
  if (certificateData)
    objc_msgSend(v3, "setObject:forKey:", certificateData, CFSTR("certificateData"));
  merchantNameOverride = self->_merchantNameOverride;
  if (merchantNameOverride)
    objc_msgSend(v3, "setObject:forKey:", merchantNameOverride, CFSTR("merchantNameOverride"));
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

uint64_t __53__PKTransactionReleasedData_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet description](self->_elements, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("elements: '%@'; "), v4);

  -[PKTransactionReleasedDataApplication description](self->_application, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("application: '%@'; "), v5);

  -[NSURL description](self->_privacyPolicyURL, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("privacyPolicyURL: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("certificateData: %ld bytes; "),
    -[NSData length](self->_certificateData, "length"));
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantNameOverride: '%@'; "), self->_merchantNameOverride);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isAgeVerificationElement:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  char v8;
  __CFString *v9;
  __CFString *v10;
  char v11;

  v3 = a3;
  objc_msgSend(v3, "elementNamespace");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("org.iso.18013.5.1");
  if (v4 == v5)
  {

    goto LABEL_7;
  }
  v6 = v5;
  if (!v4 || !v5)
  {

    v8 = 0;
    goto LABEL_17;
  }
  v7 = -[__CFString isEqualToString:](v4, "isEqualToString:", v5);

  if (v7)
  {
LABEL_7:
    objc_msgSend(v3, "identifier");
    v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("age_in_years");
    if (v4 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v4 || !v9)
      {

LABEL_16:
        v8 = -[__CFString containsString:](v4, "containsString:", CFSTR("age_over_"));
        goto LABEL_17;
      }
      v11 = -[__CFString isEqualToString:](v4, "isEqualToString:", v9);

      if ((v11 & 1) == 0)
        goto LABEL_16;
    }
    v8 = 1;
LABEL_17:

    goto LABEL_18;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (BOOL)isPortraitElement:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;

  v3 = a3;
  objc_msgSend(v3, "elementNamespace");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("org.iso.18013.5.1");
  if (v4 == v5)
  {

LABEL_7:
    objc_msgSend(v3, "identifier");
    v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("portrait");
    if (v4 == v8)
    {
      LOBYTE(v7) = 1;
      v6 = v4;
    }
    else
    {
      v6 = v8;
      LOBYTE(v7) = 0;
      if (v4 && v8)
        LOBYTE(v7) = -[__CFString isEqualToString:](v4, "isEqualToString:", v8);
    }
    goto LABEL_12;
  }
  v6 = v5;
  LOBYTE(v7) = 0;
  if (v4 && v5)
  {
    v7 = -[__CFString isEqualToString:](v4, "isEqualToString:", v5);

    if (!v7)
      goto LABEL_13;
    goto LABEL_7;
  }
LABEL_12:

LABEL_13:
  return v7;
}

- (unint64_t)verificationType
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKTransactionReleasedData elements](self, "elements", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[PKTransactionReleasedData isAgeVerificationElement:](self, "isAgeVerificationElement:", v9))
        {
          v6 = 1;
        }
        else if (!-[PKTransactionReleasedData isPortraitElement:](self, "isPortraitElement:", v9))
        {
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);

    return v6 & 1;
  }
  else
  {
LABEL_12:

    return 0;
  }
}

- (NSSet)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

- (PKTransactionReleasedDataApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
  objc_storeStrong((id *)&self->_privacyPolicyURL, a3);
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  objc_storeStrong((id *)&self->_certificateData, a3);
}

- (NSString)merchantNameOverride
{
  return self->_merchantNameOverride;
}

- (void)setMerchantNameOverride:(id)a3
{
  objc_storeStrong((id *)&self->_merchantNameOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantNameOverride, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
