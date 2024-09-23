@implementation SSVPlaybackLeaseConfiguration

- (SSVPlaybackLeaseConfiguration)initWithCertificateURL:(id)a3 leaseURL:(id)a4 pastisKeyServerURL:(id)a5 provisionMachineURL:(id)a6 storeFrontSuffix:(id)a7 syncMachineURL:(id)a8
{
  return -[SSVPlaybackLeaseConfiguration initWithCertificateURL:leaseType:leaseURL:pastisKeyServerURL:provisionMachineURL:storeFrontSuffix:syncMachineURL:](self, "initWithCertificateURL:leaseType:leaseURL:pastisKeyServerURL:provisionMachineURL:storeFrontSuffix:syncMachineURL:", a3, 0, a4, a5, a6, a7, a8);
}

- (SSVPlaybackLeaseConfiguration)initWithCertificateURL:(id)a3 leaseType:(int64_t)a4 leaseURL:(id)a5 pastisKeyServerURL:(id)a6 provisionMachineURL:(id)a7 storeFrontSuffix:(id)a8 syncMachineURL:(id)a9
{
  id v16;
  id v17;
  id v18;
  SSVPlaybackLeaseConfiguration *v19;
  SSVPlaybackLeaseConfiguration *v20;
  uint64_t v21;
  NSString *storeFrontSuffix;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a5;
  v24 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)SSVPlaybackLeaseConfiguration;
  v19 = -[SSVPlaybackLeaseConfiguration init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_beginLeaseURL, a5);
    objc_storeStrong((id *)&v20->_certificateURL, a3);
    objc_storeStrong((id *)&v20->_getAssetURL, a5);
    v20->_leaseType = a4;
    objc_storeStrong((id *)&v20->_pastisCertificateURL, a3);
    objc_storeStrong((id *)&v20->_pastisKeyServerURL, a6);
    objc_storeStrong((id *)&v20->_provisionMachineURL, a7);
    objc_storeStrong((id *)&v20->_refreshLeaseURL, a5);
    v21 = objc_msgSend(v17, "copy");
    storeFrontSuffix = v20->_storeFrontSuffix;
    v20->_storeFrontSuffix = (NSString *)v21;

    objc_storeStrong((id *)&v20->_syncMachineURL, a9);
  }

  return v20;
}

- (SSVPlaybackLeaseConfiguration)initWithURLBagDictionary:(id)a3
{
  return -[SSVPlaybackLeaseConfiguration initWithURLBagDictionary:leaseType:](self, "initWithURLBagDictionary:leaseType:", a3, 0);
}

- (SSVPlaybackLeaseConfiguration)initWithURLBagDictionary:(id)a3 leaseType:(int64_t)a4
{
  id v6;
  SSVPlaybackLeaseConfiguration *v7;
  void *v8;
  uint64_t v9;
  NSURL *certificateURL;
  void *v11;
  uint64_t v12;
  NSURL *provisionMachineURL;
  void *v14;
  uint64_t v15;
  NSURL *syncMachineURL;
  void *v17;
  uint64_t v18;
  NSURL *pastisCertificateURL;
  void *v20;
  uint64_t v21;
  NSURL *pastisKeyServerURL;
  __CFString **v23;
  uint64_t v24;
  NSURL *v25;
  NSURL *beginLeaseURL;
  void *v27;
  uint64_t v28;
  NSString *storeFrontSuffix;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SSVPlaybackLeaseConfiguration;
  v7 = -[SSVPlaybackLeaseConfiguration init](&v31, sel_init);
  if (!v7)
    goto LABEL_22;
  objc_msgSend(v6, "objectForKey:", CFSTR("fps-cert"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
    certificateURL = v7->_certificateURL;
    v7->_certificateURL = (NSURL *)v9;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("amd-finish-provisioning"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v11);
    provisionMachineURL = v7->_provisionMachineURL;
    v7->_provisionMachineURL = (NSURL *)v12;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("amd-sync-machine"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);
    syncMachineURL = v7->_syncMachineURL;
    v7->_syncMachineURL = (NSURL *)v15;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("fps-cert"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v17);
    pastisCertificateURL = v7->_pastisCertificateURL;
    v7->_pastisCertificateURL = (NSURL *)v18;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("fps-request"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v20);
    pastisKeyServerURL = v7->_pastisKeyServerURL;
    v7->_pastisKeyServerURL = (NSURL *)v21;

  }
  v7->_leaseType = a4;
  if (!a4)
  {
    v23 = SSVLeaseURLBagKeySubscriptionLease;
    goto LABEL_16;
  }
  if (a4 == 1)
  {
    v23 = SSVLeaseURLBagKeyKDLease;
LABEL_16:
    objc_msgSend(v6, "objectForKey:", *v23);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v24);
      objc_storeStrong((id *)&v7->_refreshLeaseURL, v25);
      objc_storeStrong((id *)&v7->_getAssetURL, v25);
      beginLeaseURL = v7->_beginLeaseURL;
      v7->_beginLeaseURL = v25;

    }
    v20 = (void *)v24;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("storefront-header-suffix"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = objc_msgSend(v27, "copy");
    storeFrontSuffix = v7->_storeFrontSuffix;
    v7->_storeFrontSuffix = (NSString *)v28;

  }
LABEL_22:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setBeginLeaseURL:", self->_beginLeaseURL);
  objc_msgSend(v4, "setCertificateURL:", self->_certificateURL);
  objc_msgSend(v4, "setGetAssetURL:", self->_getAssetURL);
  v4[3] = self->_leaseType;
  objc_msgSend(v4, "setProvisionMachineURL:", self->_provisionMachineURL);
  objc_msgSend(v4, "setRefreshLeaseURL:", self->_refreshLeaseURL);
  objc_msgSend(v4, "setStoreFrontSuffix:", self->_storeFrontSuffix);
  objc_msgSend(v4, "setSyncMachineURL:", self->_syncMachineURL);
  objc_msgSend(v4, "setPastisKeyServerURL:", self->_pastisKeyServerURL);
  objc_msgSend(v4, "setPastisCertificateURL:", self->_pastisCertificateURL);
  return v4;
}

- (NSURL)beginLeaseURL
{
  return self->_beginLeaseURL;
}

- (void)setBeginLeaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)getAssetURL
{
  return self->_getAssetURL;
}

- (void)setGetAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)leaseType
{
  return self->_leaseType;
}

- (NSURL)provisionMachineURL
{
  return self->_provisionMachineURL;
}

- (void)setProvisionMachineURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)refreshLeaseURL
{
  return self->_refreshLeaseURL;
}

- (void)setRefreshLeaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)storeFrontSuffix
{
  return self->_storeFrontSuffix;
}

- (void)setStoreFrontSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)syncMachineURL
{
  return self->_syncMachineURL;
}

- (void)setSyncMachineURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (void)setCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)pastisCertificateURL
{
  return self->_pastisCertificateURL;
}

- (void)setPastisCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)pastisKeyServerURL
{
  return self->_pastisKeyServerURL;
}

- (void)setPastisKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pastisKeyServerURL, 0);
  objc_storeStrong((id *)&self->_pastisCertificateURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_syncMachineURL, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_refreshLeaseURL, 0);
  objc_storeStrong((id *)&self->_provisionMachineURL, 0);
  objc_storeStrong((id *)&self->_getAssetURL, 0);
  objc_storeStrong((id *)&self->_beginLeaseURL, 0);
}

@end
