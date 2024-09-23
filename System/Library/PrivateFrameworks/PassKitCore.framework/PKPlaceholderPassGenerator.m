@implementation PKPlaceholderPassGenerator

+ (id)manifestForDirectory:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id *v29;
  void *v30;
  id v31;
  char v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URLByStandardizingPath");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v5;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v9)
  {

    goto LABEL_22;
  }
  v10 = v9;
  v29 = a4;
  v30 = v6;
  v11 = 0;
  v12 = *(_QWORD *)v43;
  v13 = *MEMORY[0x1E0C99A18];
  v33 = *MEMORY[0x1E0C99A18];
  v34 = v8;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(v8);
      if (!v11)
      {
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v40 = 0;
        v41 = 0;
        v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v41, v13, &v40);
        v17 = v41;
        v11 = v40;
        if (v16 && objc_msgSend(v17, "BOOLValue"))
        {
          objc_msgSend(v15, "URLByStandardizingPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v18);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "SHA1Hash");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hexEncoding");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "pathComponents");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pathComponents");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v20;
          v22 = objc_msgSend(v20, "count");
          objc_msgSend(v21, "subarrayWithRange:", v22, objc_msgSend(v21, "count") - v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(CFSTR("manifest"), "stringByAppendingPathExtension:", CFSTR("json"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "isEqualToString:", v25))
            {

            }
            else
            {
              v32 = objc_msgSend(v24, "isEqualToString:", CFSTR("signature"));

              if ((v32 & 1) == 0)
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, v24);
            }
          }

          v13 = v33;
          v8 = v34;
        }

      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v10);

  a4 = v29;
  v6 = v30;
  if (!v11)
  {
LABEL_22:
    v39 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v31, 1, &v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v39;
    if (!a4)
      goto LABEL_24;
    goto LABEL_23;
  }
  v26 = 0;
  if (v29)
LABEL_23:
    *a4 = objc_retainAutorelease(v11);
LABEL_24:
  if (v11)
    v27 = 0;
  else
    v27 = v26;

  return v27;
}

+ (id)addManifestIfNecessaryToPass:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "dataAccessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "dataAccessor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("signature"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if (v11)
    {
      PKLogFacilityTypeGetObject(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Pass with unique ID %@ already has a signature; we will not attempt to add a manifest.",
          buf,
          0xCu);

      }
      v14 = 0;
      goto LABEL_19;
    }
    objc_msgSend(CFSTR("manifest"), "stringByAppendingPathExtension:", CFSTR("json"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v15, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject path](v12, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "fileExistsAtPath:", v16);

    if ((v17 & 1) != 0)
    {
      PKLogFacilityTypeGetObject(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        v22 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v3, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Pass with unique ID %@ already has a manifest; we will not generate a new one.",
        buf,
        0xCu);
    }
    else
    {
      v25 = 0;
      +[PKPlaceholderPassGenerator manifestForDirectory:error:](PKPlaceholderPassGenerator, "manifestForDirectory:error:", v7, &v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v20 = v25;
      if (v20)
      {
        v14 = v20;

LABEL_18:
LABEL_19:

        goto LABEL_20;
      }
      v24 = 0;
      -[NSObject writeToURL:options:error:](v18, "writeToURL:options:error:", v12, 0, &v24);
      v21 = v24;
      if (v21)
      {
        v22 = v21;
LABEL_17:

        v14 = v22;
        goto LABEL_18;
      }
      PKManifestHash(v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setManifestHash:", v19);
    }

    goto LABEL_16;
  }
  ErrorWithCodeAndDescription(0, CFSTR("Pass must have file data accessory"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v14;
}

+ (id)manifestSignatureForDirectory:(id)a3 passCertificate:(id)a4 appleWWDRCertificate:(id)a5 certificatePassword:(id)a6 error:(id *)a7
{
  id v11;
  const __CFData *v12;
  const __CFData *v13;
  id v14;
  const __CFAllocator *v15;
  SecCertificateRef v16;
  const __CFDictionary *v17;
  void *v18;
  OSStatus v19;
  BOOL v20;
  const __CFDictionary *ValueAtIndex;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  CFMutableDataRef Mutable;
  int v27;
  uint64_t v28;
  CFArrayRef items;
  SecCertificateRef v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (const __CFData *)a4;
  v13 = (const __CFData *)a5;
  v14 = a6;
  if (v12 && v13)
  {
    v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v16 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13);
    items = 0;
    if (v14)
    {
      v34 = *MEMORY[0x1E0CD6D58];
      v35[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (const __CFDictionary *)MEMORY[0x1E0C9AA70];
    }
    v19 = SecPKCS12Import(v12, v17, &items);
    if (v16)
      v20 = v19 == 0;
    else
      v20 = 0;
    if (!v20 || CFArrayGetCount(items) != 1)
    {
      if (a7)
      {
        ErrorWithCodeAndDescription(0, CFSTR("Error importing certificates."));
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = 0;
      v18 = 0;
      if (!v16)
        goto LABEL_27;
      goto LABEL_26;
    }
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
    CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0CD6D60]);
    v22 = *MEMORY[0x1E0CD6C58];
    v33[0] = *MEMORY[0x1E0C9AE50];
    v23 = *MEMORY[0x1E0CD6C40];
    v32[0] = v22;
    v32[1] = v23;
    v31 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    Mutable = CFDataCreateMutable(v15, 0);
    v27 = SecCMSCreateSignedData();
    if (v27)
    {
      if (a7)
      {
        ErrorWithCodeAndDescription(v27, CFSTR("Error signing manifest."));
        v28 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        if (!Mutable)
          goto LABEL_25;
      }
      else
      {
        v28 = 0;
        if (!Mutable)
          goto LABEL_25;
      }
    }
    else
    {
      v28 = -[__CFData copy](Mutable, "copy");
      if (!Mutable)
      {
LABEL_25:

LABEL_26:
        CFRelease(v16);
        v18 = (void *)v28;
LABEL_27:

        goto LABEL_28;
      }
    }
    CFRelease(Mutable);
    goto LABEL_25;
  }
  if (a7)
  {
    ErrorWithCodeAndDescription(0, CFSTR("No certificates provided."));
    v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_28:

  return v18;
}

- (PKPlaceholderPassGenerator)initWithPassTemplate:(id)a3 error:(id *)a4
{
  id v7;
  PKPlaceholderPassGenerator *v8;
  PKPlaceholderPassGenerator *v9;
  PKFileDataAccessor *v10;
  id v11;
  PKPass *v12;
  PKPass *templatePass;
  PKPlaceholderPassGenerator *v14;
  id v16;

  v7 = a3;
  v8 = -[PKPlaceholderPassGenerator init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_templateDirectory, a3);
    v16 = 0;
    v10 = -[PKFileDataAccessor initWithFileURL:error:]([PKFileDataAccessor alloc], "initWithFileURL:error:", v7, &v16);
    v11 = v16;
    v12 = +[PKObject createWithValidatedFileDataAccessor:](PKPass, "createWithValidatedFileDataAccessor:", v10);
    templatePass = v9->_templatePass;
    v9->_templatePass = v12;

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v11);
LABEL_4:
  if (v11)
    v14 = 0;
  else
    v14 = v9;

  return v14;
}

- (NSMutableDictionary)passContent
{
  NSMutableDictionary *passContent;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;

  passContent = self->_passContent;
  if (!passContent)
  {
    -[PKObject dataAccessor](self->_templatePass, "dataAccessor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
    v7 = self->_passContent;
    self->_passContent = v6;

    passContent = self->_passContent;
  }
  return passContent;
}

- (id)passTypeIdentifier
{
  void *v2;
  void *v3;

  -[PKPlaceholderPassGenerator passContent](self, "passContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("passTypeIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPassTypeIdentifier:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("passTypeIdentifier"));

  }
}

- (NSString)serialNumber
{
  void *v2;
  void *v3;

  -[PKPlaceholderPassGenerator passContent](self, "passContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("serialNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSerialNumber:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("serialNumber"));

  }
}

- (NSString)primaryAccountIdentifier
{
  void *v2;
  void *v3;

  -[PKPlaceholderPassGenerator passContent](self, "passContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("primaryAccountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("primaryAccountIdentifier"));
    if ((unint64_t)objc_msgSend(v8, "length") < 5)
    {
      v6 = v8;
    }
    else
    {
      objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("primaryAccountSuffix"));

    v4 = v8;
  }

}

- (NSArray)associatedApplicationIdentifiers
{
  void *v2;
  void *v3;

  -[PKPlaceholderPassGenerator passContent](self, "passContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("associatedApplicationIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("associatedApplicationIdentifiers"));

  }
}

- (void)insertPassField:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = objc_msgSend(&unk_1E2C3E3E0, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v28;
      while (2)
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(&unk_1E2C3E3E0);
          v8 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v10);

          objc_msgSend(v5, "objectForKey:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          if (v13)
          {
            v14 = objc_msgSend(v4, "type");
            _PKEnumValueToString(v14, CFSTR("PKPassFieldType"), CFSTR("PKPassFieldTypeHeader, PKPassFieldTypePrimary, PKPassFieldTypeSecondary, PKPassFieldTypeAuxiliary, PKPassFieldTypeBack"), v15, v16, v17, v18, v19, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              objc_msgSend(v13, "objectForKey:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)objc_msgSend(v21, "mutableCopy");
              v23 = v22;
              if (v22)
                v24 = v22;
              else
                v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v25 = v24;

              objc_msgSend(v4, "asDictionary");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v26);

              objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, v20);
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v8);

            }
            v8 = v13;
            goto LABEL_17;
          }
          ++v10;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend(&unk_1E2C3E3E0, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v7)
          continue;
        break;
      }
LABEL_17:

    }
  }

}

- (void)insertPaymentApplication:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v15, "isAuxiliary");
    v7 = (id *)&PKPassKeyAuxiliaryPaymentApplications;
    if (!v6)
      v7 = (id *)&PKPassKeyPaymentApplications;
    v8 = *v7;
    objc_msgSend(v5, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = v12;

    objc_msgSend(v15, "asDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v8);
    v4 = v15;
  }

}

- (int64_t)updatePaymentApplicationsWithBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(void *, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  _QWORD aBlock[4];
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PKPlaceholderPassGenerator_updatePaymentApplicationsWithBlock___block_invoke;
    aBlock[3] = &unk_1E2AD8BF0;
    v16 = v4;
    v6 = (uint64_t (**)(void *, void *, _QWORD))_Block_copy(aBlock);
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("paymentApplications"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v7, "objectForKey:", CFSTR("auxiliaryPaymentApplications"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v12 = v6[2](v6, v9, 0);
    v13 = v6[2](v6, v11, 1) + v12;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("paymentApplications"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("auxiliaryPaymentApplications"));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __65__PKPlaceholderPassGenerator_updatePaymentApplicationsWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  PKPaymentApplication *v9;
  void *v10;
  PKPaymentApplication *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  PKPaymentApplication *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = 0;
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      v27 = 0;
      v9 = [PKPaymentApplication alloc];
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKPaymentApplication initWithPaymentApplicationDictionary:auxiliaryApplication:](v9, "initWithPaymentApplicationDictionary:auxiliaryApplication:", v10, a3);

      if (v11)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = 0;
        else
          v14 = v27 == 0;
        if (!v14)
          ++v7;
        if (v12)
          v15 = (PKPaymentApplication *)v12;
        else
          v15 = v11;
        objc_msgSend(v6, "addObject:", v15);

      }
      ++v8;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }
  objc_msgSend(v5, "removeAllObjects");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "asDictionary", (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

  return v7;
}

- (int64_t)updatePassUpgradeRequestsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  if (v4)
  {
    -[PKPlaceholderPassGenerator passContent](self, "passContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("passUpgrades"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = 0;
    if (objc_msgSend(v7, "count"))
    {
      v10 = 0;
      do
      {
        v28 = 0;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPassUpgradeRequest passUpgradeRequestFromDictionary:](PKPassUpgradeRequest, "passUpgradeRequestFromDictionary:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v4[2](v4, v12, &v28);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v13)
            v15 = 0;
          else
            v15 = v28 == 0;
          if (!v15)
            ++v9;
          if (!v28)
          {
            if (v13)
              v16 = (void *)v13;
            else
              v16 = v12;
            objc_msgSend(v8, "addObject:", v16);
          }

        }
        ++v10;
      }
      while (v10 < objc_msgSend(v7, "count"));
    }
    objc_msgSend(v7, "removeAllObjects");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "asDictionary", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v19);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("passUpgrades"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setUpdatePassRemoteAssetConfigrationsWithBlock:(id)a3
{
  void *v4;
  id updateUrlsBlock;

  v4 = _Block_copy(a3);
  updateUrlsBlock = self->_updateUrlsBlock;
  self->_updateUrlsBlock = v4;

}

- (void)_updatePassURLsConfigrationPassUrl:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[6];

  v50[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_updateUrlsBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C999D0];
    v50[0] = *MEMORY[0x1E0C99998];
    v50[1] = v6;
    v50[2] = *MEMORY[0x1E0C99A28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v4;
    objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v45;
      v13 = 0x1E0C99000uLL;
      v34 = *(_QWORD *)v45;
      v35 = v9;
      do
      {
        v14 = 0;
        v36 = v11;
        do
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
          objc_msgSend(v15, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("urls"));

          if (v17)
          {
            v18 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 3408)), "initWithContentsOfURL:", v15);
            if (v18)
            {
              objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v18, 0, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v39 = v18;
                v37 = v15;
                v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v40 = 0u;
                v41 = 0u;
                v42 = 0u;
                v43 = 0u;
                v38 = v19;
                v21 = v19;
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = *(_QWORD *)v41;
                  do
                  {
                    for (i = 0; i != v23; ++i)
                    {
                      if (*(_QWORD *)v41 != v24)
                        objc_enumerationMutation(v21);
                      v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
                      objc_msgSend(v21, "objectForKeyedSubscript:", v26);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      (*((void (**)(void))self->_updateUrlsBlock + 2))();
                      v28 = objc_claimAutoreleasedReturnValue();
                      v29 = (void *)v28;
                      if (v28)
                        v30 = (void *)v28;
                      else
                        v30 = v27;
                      objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, v26);

                    }
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                  }
                  while (v23);
                }

                objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v20, 1, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v31;
                if (v31)
                  objc_msgSend(v31, "writeToURL:atomically:", v37, 1);

                v12 = v34;
                v9 = v35;
                v11 = v36;
                v13 = 0x1E0C99000;
                v19 = v38;
                v18 = v39;
              }

            }
          }
          ++v14;
        }
        while (v14 != v11);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v11);
    }

    v4 = v33;
  }

}

- (id)generatePass
{
  return -[PKPlaceholderPassGenerator generateAndSignPassWithPassCertificate:appleWWDRCertificate:certificatePassword:error:](self, "generateAndSignPassWithPassCertificate:appleWWDRCertificate:certificatePassword:error:", 0, 0, 0, 0);
}

- (id)generateAndSignPassWithPassCertificate:(id)a3 appleWWDRCertificate:(id)a4 certificatePassword:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSURL *templateDirectory;
  int v21;
  id v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  PKFileDataAccessor *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKTemporaryItemURLWithExtension(CFSTR("pkpass"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKTemporaryItemPrepareDirectory();
  if (!v14)
  {
    ErrorWithCodeAndDescription(0, CFSTR("Invalid temporary directory"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v50 = 0;
  v15 = objc_msgSend(v13, "removeItemAtURL:error:", v14, &v50);
  v16 = v50;
  v17 = v16;
  if ((v15 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v16, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) == 0)
  {

LABEL_15:
    v26 = 0;
    if (!v17)
      goto LABEL_35;
    goto LABEL_16;
  }
  v19 = objc_msgSend(v17, "code");

  if (v19 != 4)
    goto LABEL_15;
LABEL_5:

  templateDirectory = self->_templateDirectory;
  v49 = 0;
  v21 = objc_msgSend(v13, "copyItemAtURL:toURL:error:", templateDirectory, v14, &v49);
  v22 = v49;
  if (v21)
    v23 = v22 == 0;
  else
    v23 = 0;
  if (!v23)
  {
    v17 = v22;
    goto LABEL_34;
  }
  -[PKPlaceholderPassGenerator passContent](self, "passContent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v29 = ErrorWithCodeAndDescription(0, CFSTR("Missing pass.json"));
    v25 = 0;
LABEL_22:
    PKPassDictionaryURLWithPassURL(v14);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v25;
    v32 = (void *)v30;
    v47 = 0;
    v41 = v31;
    objc_msgSend(v31, "writeToURL:options:error:", v30, 0, &v47);
    v17 = v47;

    if (!v17)
    {
      -[PKPlaceholderPassGenerator _updatePassURLsConfigrationPassUrl:](self, "_updatePassURLsConfigrationPassUrl:", v14);
      v46 = 0;
      objc_msgSend((id)objc_opt_class(), "manifestForDirectory:error:", v14, &v46);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v46;
      v17 = v34;
      if (v33)
      {
        if (!v34)
        {
          objc_msgSend(CFSTR("manifest"), "stringByAppendingPathExtension:", CFSTR("json"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v39, 0);
          v40 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          objc_msgSend(v40, "writeToURL:options:error:", v35, 0, &v45);
          v17 = v45;

          v33 = v40;
          if (!v17 && v10 && v11)
          {
            v44 = 0;
            objc_msgSend((id)objc_opt_class(), "manifestSignatureForDirectory:passCertificate:appleWWDRCertificate:certificatePassword:error:", v40, v10, v11, v12, &v44);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v44;
            if (!v17)
            {
              objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("signature"), 0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = 0;
              objc_msgSend(v36, "writeToURL:options:error:", v37, 0, &v43);
              v17 = v43;

              v33 = v40;
            }

          }
        }
      }

    }
    v25 = v41;
    goto LABEL_33;
  }
  v48 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v24, 1, &v48);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v48;
  if (!v17)
    goto LABEL_22;
LABEL_33:

LABEL_34:
  v26 = 1;
  if (!v17)
  {
LABEL_35:
    v42 = 0;
    v38 = -[PKFileDataAccessor initWithFileURL:error:]([PKFileDataAccessor alloc], "initWithFileURL:error:", v14, &v42);
    v17 = v42;
    -[PKFileDataAccessor setOwnsFileURL:](v38, "setOwnsFileURL:", 1);
    v27 = +[PKObject createWithValidatedFileDataAccessor:](PKPass, "createWithValidatedFileDataAccessor:", v38);

    if (!a6)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_16:
  if (v26)
    objc_msgSend(v13, "removeItemAtURL:error:", v14, 0);
  v27 = 0;
  if (a6)
LABEL_19:
    *a6 = objc_retainAutorelease(v17);
LABEL_20:

  return v27;
}

- (void)setPassContent:(id)a3
{
  objc_storeStrong((id *)&self->_passContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passContent, 0);
  objc_storeStrong(&self->_updateUrlsBlock, 0);
  objc_storeStrong((id *)&self->_templatePass, 0);
  objc_storeStrong((id *)&self->_templateDirectory, 0);
}

@end
