@implementation PKPaymentIssuerProvisioningExtensionCredential

- (PKPaymentIssuerProvisioningExtensionCredential)initWithExtension:(id)a3 entry:(id)a4
{
  id v7;
  id v8;
  PKPaymentIssuerProvisioningExtensionCredential *v9;
  PKPaymentIssuerProvisioningExtensionCredential *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPaymentCredential init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeStrong((id *)&v10->_entry, a4);
    -[PKIssuerProvisioningExtensionPassEntry title](v10->_entry, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setLongDescription:](v10, "setLongDescription:", v11);

  }
  return v10;
}

- (id)metadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKIssuerProvisioningExtensionPaymentPassEntry addRequestConfiguration](self->_entry, "addRequestConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v22[0] = CFSTR("text");
        v21[0] = CFSTR("valueType");
        v21[1] = CFSTR("value");
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v10;
        v21[2] = CFSTR("localizedDisplayName");
        objc_msgSend(v9, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:](PKPaymentCredentialMetadata, "paymentCredentialMetadataWithConfiguration:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v16, "addObject:", v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  return v16;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentIssuerProvisioningExtensionCredential entry](self, "entry", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addRequestConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryAccountSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    PKMaskedPaymentPAN((uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_entry);
  -[PKPaymentIssuerProvisioningExtensionCredential metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash(17, v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentIssuerProvisioningExtensionCredential *v4;
  BOOL v5;

  v4 = (PKPaymentIssuerProvisioningExtensionCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKPaymentIssuerProvisioningExtensionCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  _QWORD *v4;
  PKIssuerProvisioningExtensionPaymentPassEntry *entry;
  PKIssuerProvisioningExtensionPaymentPassEntry *v6;
  BOOL v7;
  char v8;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  entry = self->_entry;
  v6 = (PKIssuerProvisioningExtensionPaymentPassEntry *)v4[14];
  if (entry)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PKIssuerProvisioningExtensionPassEntry isEqual:](entry, "isEqual:"))
      goto LABEL_10;
LABEL_8:
    v8 = 0;
    goto LABEL_15;
  }
  if (entry != v6)
    goto LABEL_8;
LABEL_10:
  -[PKPaymentIssuerProvisioningExtensionCredential metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
    v8 = objc_msgSend(v10, "isEqual:", v11);
  else
    v8 = v10 == (void *)v11;

LABEL_15:
  return v8;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (PKIssuerProvisioningExtensionPaymentPassEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
