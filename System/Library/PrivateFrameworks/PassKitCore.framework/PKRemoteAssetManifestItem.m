@implementation PKRemoteAssetManifestItem

- (PKRemoteAssetManifestItem)initWithLocalURL:(id)a3 passURL:(id)a4 dictionary:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  PKRemoteAssetManifestItem *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSDictionary *manifest;
  uint64_t v45;
  NSString *seid;
  uint64_t v47;
  NSString *ephemeralPublicKey;
  uint64_t v49;
  NSString *publicKeyHash;
  uint64_t v51;
  NSString *encryptionScheme;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSString *v60;
  void *v61;
  int v62;
  uint64_t v63;
  NSURL *localURL;
  PKRemoteAssetManifestItem *v65;
  __CFString *v67;
  uint64_t v68;
  id v69;
  objc_super v70;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v70.receiver = self;
  v70.super_class = (Class)PKRemoteAssetManifestItem;
  v14 = -[PKRemoteAssetManifestItem init](&v70, sel_init);
  if (!v14)
    goto LABEL_29;
  objc_msgSend(v13, "objectForKey:", CFSTR("url"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v12;
  if (v22
    && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22), (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v24 = (void *)v23;
  }
  else
  {
    if (a6)
    {
      PKValidationErrorWithReason(CFSTR("Remote Asset %@ is missing or invalid url value"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v24 = 0;
    v14 = 0;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("sha1"));
  v25 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v25;
  if (v14 && !v25)
  {
    if (a6)
    {
      PKValidationErrorWithReason(CFSTR("Remote Asset %@ is missing sha1 value"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v14 = 0;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("size"));
  v34 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v34;
  if (v14 && !v34)
  {
    if (a6)
    {
      PKValidationErrorWithReason(CFSTR("Remote Asset %@ is missing size value"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v14 = 0;
    goto LABEL_28;
  }
  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteURL, v24);
    objc_storeStrong((id *)&v14->_sha1Hex, v33);
    objc_storeStrong((id *)&v14->_size, v42);
    objc_storeStrong((id *)&v14->_localURL, a3);
    objc_storeStrong((id *)&v14->_passURL, a4);
    objc_msgSend(v13, "objectForKey:", CFSTR("manifest"));
    v43 = objc_claimAutoreleasedReturnValue();
    manifest = v14->_manifest;
    v14->_manifest = (NSDictionary *)v43;

    v14->_required = objc_msgSend(v13, "PKBoolForKey:", CFSTR("required"));
    objc_msgSend(v13, "PKStringForKey:", CFSTR("seid"));
    v45 = objc_claimAutoreleasedReturnValue();
    seid = v14->_seid;
    v14->_seid = (NSString *)v45;

    objc_msgSend(v13, "PKStringForKey:", CFSTR("ephemeralPublicKey"));
    v47 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKey = v14->_ephemeralPublicKey;
    v14->_ephemeralPublicKey = (NSString *)v47;

    objc_msgSend(v13, "PKStringForKey:", CFSTR("publicKeyHash"));
    v49 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v14->_publicKeyHash;
    v14->_publicKeyHash = (NSString *)v49;

    objc_msgSend(v13, "PKStringForKey:", CFSTR("version"));
    v51 = objc_claimAutoreleasedReturnValue();
    encryptionScheme = v14->_encryptionScheme;
    v14->_encryptionScheme = (NSString *)v51;

    v60 = v14->_publicKeyHash;
    if ((v14->_ephemeralPublicKey == 0) == (v60 != 0) || (v60 != 0) == (v14->_encryptionScheme == 0))
    {
      if (a6)
      {
        v68 = (uint64_t)v14->_ephemeralPublicKey;
        v67 = CFSTR("Missing required encryption keys (%@ %@ %@)");
LABEL_33:
        PKValidationErrorWithReason(v67, v53, v54, v55, v56, v57, v58, v59, v68);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[NSURL pathExtension](v14->_localURL, "pathExtension");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("encrypted"));

      if (v62)
      {
        objc_storeStrong((id *)&v14->_encryptedContentsLocalURL, v14->_localURL);
        -[NSURL URLByDeletingPathExtension](v14->_localURL, "URLByDeletingPathExtension");
        v63 = objc_claimAutoreleasedReturnValue();
        localURL = v14->_localURL;
        v14->_localURL = (NSURL *)v63;

        v14->_encryptionSource = 3;
      }
      if (!v14->_ephemeralPublicKey || !v14->_publicKeyHash || !v14->_encryptionScheme)
        goto LABEL_28;
      if ((v62 & 1) != 0)
      {
        v14->_encryptionSource = encryptionSourceFromManifestItemDictionary(v13);
        goto LABEL_28;
      }
      if (a6)
      {
        v67 = CFSTR("Encrypted asset with invalid filename.");
        goto LABEL_33;
      }
    }

    v65 = 0;
    v12 = v69;
    goto LABEL_30;
  }
LABEL_28:

  v12 = v69;
LABEL_29:
  v14 = v14;
  v65 = v14;
LABEL_30:

  return v65;
}

- (PKRemoteAssetManifestItem)initWithCoder:(id)a3
{
  id v4;
  PKRemoteAssetManifestItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = -[PKRemoteAssetManifestItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setLocalURL:](v5, "setLocalURL:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setRemoteURL:](v5, "setRemoteURL:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setPassURL:](v5, "setPassURL:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sha1Hex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setSha1Hex:](v5, "setSha1Hex:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setSize:](v5, "setSize:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("manifest"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setManifest:](v5, "setManifest:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setSeid:](v5, "setSeid:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setEphemeralPublicKey:](v5, "setEphemeralPublicKey:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyHash"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setPublicKeyHash:](v5, "setPublicKeyHash:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionScheme"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setEncryptionScheme:](v5, "setEncryptionScheme:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setEncryptionSource:](v5, "setEncryptionSource:", objc_msgSend(v19, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedContentsLocalURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAssetManifestItem setEncryptedContentsLocalURL:](v5, "setEncryptedContentsLocalURL:", v20);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[PKRemoteAssetManifestItem localURL](self, "localURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localURL"));

  -[PKRemoteAssetManifestItem remoteURL](self, "remoteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("remoteURL"));

  -[PKRemoteAssetManifestItem passURL](self, "passURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("passURL"));

  -[PKRemoteAssetManifestItem sha1Hex](self, "sha1Hex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sha1Hex"));

  -[PKRemoteAssetManifestItem size](self, "size");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("size"));

  -[PKRemoteAssetManifestItem manifest](self, "manifest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("manifest"));

  -[PKRemoteAssetManifestItem seid](self, "seid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("seid"));

  -[PKRemoteAssetManifestItem ephemeralPublicKey](self, "ephemeralPublicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ephemeralPublicKey"));

  -[PKRemoteAssetManifestItem publicKeyHash](self, "publicKeyHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("publicKeyHash"));

  -[PKRemoteAssetManifestItem encryptionScheme](self, "encryptionScheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("encryptionScheme"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKRemoteAssetManifestItem encryptionSource](self, "encryptionSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("encryptionSource"));

  -[PKRemoteAssetManifestItem encryptedContentsLocalURL](self, "encryptedContentsLocalURL");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("encryptedContentsLocalURL"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)itemWithLocalURL:(id)a3 passURL:(id)a4 dictionary:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalURL:passURL:dictionary:error:", v11, v10, v9, a6);

  return v12;
}

- (NSString)relativeLocalPath
{
  return (NSString *)PKRelativePathAfterResolvingSymlinks(self->_passURL, self->_localURL);
}

- (NSString)relativeEncryptedContentsLocalPath
{
  NSURL *encryptedContentsLocalURL;
  void *v3;

  encryptedContentsLocalURL = self->_encryptedContentsLocalURL;
  if (encryptedContentsLocalURL)
  {
    PKRelativePathAfterResolvingSymlinks(self->_passURL, encryptedContentsLocalURL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isZipFile
{
  void *v2;
  void *v3;
  char v4;

  -[PKRemoteAssetManifestItem localURL](self, "localURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("zip"));

  return v4;
}

- (unint64_t)itemType
{
  return 0;
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4
{
  -[PKRemoteAssetManifestItem downloadAssetWithCloudStoreCoordinatorDelegate:tryCount:completion:](self, "downloadAssetWithCloudStoreCoordinatorDelegate:tryCount:completion:", a3, 1, a4);
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 tryCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSURL *remoteURL;
  NSURL *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  PKRemoteAssetManifestItem *v19;
  id v20;
  id v21;
  unint64_t v22;
  uint8_t buf[4];
  NSURL *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "sharedURLSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      remoteURL = self->_remoteURL;
      *(_DWORD *)buf = 138412290;
      v24 = remoteURL;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Downloading %@", buf, 0xCu);
    }

    v13 = self->_remoteURL;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __96__PKRemoteAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke;
    v18 = &unk_1E2ADB2A0;
    v19 = self;
    v22 = a4;
    v20 = v8;
    v21 = v9;
    objc_msgSend(v10, "dataTaskWithURL:completionHandler:", v13, &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume", v15, v16, v17, v18, v19);

  }
}

void __96__PKRemoteAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138413058;
    v42 = v11;
    v43 = 2048;
    v44 = objc_msgSend(v7, "length");
    v45 = 2112;
    v46 = v8;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Downloaded %@ with data size:%lu, URLResponse:%@ error:%@", buf, 0x2Au);
  }

  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = objc_msgSend(v8, "statusCode");
    objc_msgSend(v9, "localizedDescription");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKValidationErrorWithReason(CFSTR("Couldn't download remote asset. HTTP Status: %ld, Error: %@ URL: %@"), v17, v18, v19, v20, v21, v22, v23, v14);
  }
  else
  {
    v12 = v8;
    if (objc_msgSend(v12, "statusCode") == 200)
    {
      if (v7)
      {

        v13 = 0;
LABEL_13:
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_14;
      }
      v33 = objc_msgSend(v12, "statusCode");
      objc_msgSend(v12, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKValidationErrorWithReason(CFSTR("Empty data received. HTTP Status: %ld URL: %@"), v34, v35, v36, v37, v38, v39, v40, v33);
    }
    else
    {
      v25 = objc_msgSend(v12, "statusCode");
      objc_msgSend(v12, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKValidationErrorWithReason(CFSTR("Couldn't download remote asset. HTTP Status: %ld URL: %@"), v26, v27, v28, v29, v30, v31, v32, v25);
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_13;
  if (!objc_msgSend(*(id *)(a1 + 32), "isRequired"))
    goto LABEL_13;
  v24 = *(_QWORD *)(a1 + 56);
  if (v24 > 2)
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 32), "downloadAssetWithCloudStoreCoordinatorDelegate:tryCount:completion:", *(_QWORD *)(a1 + 40), v24 + 1, *(_QWORD *)(a1 + 48));
LABEL_14:

}

+ (id)sharedURLSession
{
  if (qword_1ECF22B48 != -1)
    dispatch_once(&qword_1ECF22B48, &__block_literal_global_205);
  return (id)_MergedGlobals_280;
}

void __45__PKRemoteAssetManifestItem_sharedURLSession__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeoutIntervalForRequest:", 120.0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", v1);
  objc_msgSend(v5, "set_appleIDContext:", v2);
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_280;
  _MergedGlobals_280 = v3;

}

- (NSURL)localURL
{
  return self->_localURL;
}

- (void)setLocalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sha1Hex
{
  return self->_sha1Hex;
}

- (void)setSha1Hex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)encryptedContentsLocalURL
{
  return self->_encryptedContentsLocalURL;
}

- (void)setEncryptedContentsLocalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)encryptionScheme
{
  return self->_encryptionScheme;
}

- (void)setEncryptionScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)encryptionSource
{
  return self->_encryptionSource;
}

- (void)setEncryptionSource:(int64_t)a3
{
  self->_encryptionSource = a3;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptedContentsLocalURL, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_sha1Hex, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
}

- (void)downloadAssetWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKRemoteAssetManifestItem_PKDeprecated__downloadAssetWithCompletion___block_invoke;
  v6[3] = &unk_1E2ADB2F0;
  v7 = v4;
  v5 = v4;
  -[PKRemoteAssetManifestItem downloadAssetWithCloudStoreCoordinatorDelegate:completion:](self, "downloadAssetWithCloudStoreCoordinatorDelegate:completion:", 0, v6);

}

uint64_t __71__PKRemoteAssetManifestItem_PKDeprecated__downloadAssetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

@end
