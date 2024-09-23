@implementation PKPendingStatefulTransferProvisioning

- (PKPendingStatefulTransferProvisioning)init
{

  return 0;
}

- (id)initForDatabase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingStatefulTransferProvisioning;
  return -[PKPendingStatefulTransferProvisioning init](&v3, sel_init);
}

- (PKPendingStatefulTransferProvisioning)initWithTransportIdentifier:(id)a3 invitation:(id)a4 share:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PKPendingStatefulTransferProvisioning *v13;
  PKSharingMessage *invitation;
  id v15;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)PKPendingStatefulTransferProvisioning;
  v13 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v18, sel_initWithUniqueIdentifier_status_, v12, 1);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_transportIdentifier, a3);
    objc_storeStrong((id *)&v13->_invitation, a4);
    invitation = v13->_invitation;
    v15 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessage setIdentifier:](invitation, "setIdentifier:", v16);

    objc_storeStrong((id *)&v13->_share, a5);
  }

  return v13;
}

- (id)type
{
  return CFSTR("StatefulTransfer");
}

- (BOOL)representsCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *transportIdentifier;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  _BOOL4 v26;
  void *v27;
  NSString *originalShareURL;
  NSString *v29;
  NSString *v30;
  void *v31;
  NSString *accountAttestationAnonymizationSalt;
  NSString *v33;
  NSString *v34;
  void *v36;
  NSString *v37;
  void *v38;
  NSString *v39;
  void *v40;

  v4 = a3;
  if (objc_msgSend(v4, "isStatefulTransferCredential"))
  {
    objc_msgSend(v4, "statefulTransferCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transportIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    transportIdentifier = self->_transportIdentifier;
    v9 = v7;
    v10 = transportIdentifier;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      LOBYTE(v12) = 0;
      if (!v9 || !v10)
      {
        v14 = v9;
LABEL_42:

        goto LABEL_43;
      }
      v13 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

      if (!v13)
      {
        LOBYTE(v12) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    v40 = v6;
    objc_msgSend(v5, "invitation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessage identifier](self->_invitation, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v17 = v16;
    v18 = v17;
    if (v11 == v17)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v17;
      v20 = v11;
      if (!v11 || !v17)
        goto LABEL_40;
      v21 = -[NSString isEqualToString:](v11, "isEqualToString:", v17);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_41:

        v6 = v40;
        goto LABEL_42;
      }
    }
    objc_msgSend(v5, "share");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShare identifier](self->_share, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v22;
    v24 = v23;
    v39 = v24;
    if (v19 != v24)
    {
      LOBYTE(v12) = 0;
      if (v19)
      {
        v25 = v24;
        v37 = v19;
        if (v24)
        {
          v26 = -[NSString isEqualToString:](v19, "isEqualToString:", v24);

          if (!v26)
          {
            LOBYTE(v12) = 0;
LABEL_39:
            v20 = (NSString *)v38;

LABEL_40:
            goto LABEL_41;
          }
LABEL_22:
          v36 = v14;
          objc_msgSend(v5, "originalShareURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          originalShareURL = self->_originalShareURL;
          v25 = v27;
          v29 = originalShareURL;
          if (v25 == v29)
          {

          }
          else
          {
            v30 = v29;
            LOBYTE(v12) = 0;
            if (!v25 || !v29)
            {
              v37 = v25;
LABEL_36:

              v14 = v36;
              goto LABEL_37;
            }
            v12 = -[NSString isEqualToString:](v25, "isEqualToString:", v29);

            if (!v12)
            {
              v14 = v36;
LABEL_38:

              goto LABEL_39;
            }
          }
          v37 = v25;
          objc_msgSend(v5, "accountAttestationAnonymizationSalt");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          accountAttestationAnonymizationSalt = self->_accountAttestationAnonymizationSalt;
          v30 = v31;
          v33 = accountAttestationAnonymizationSalt;
          v34 = v33;
          if (v30 == v33)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v30 && v33)
              LOBYTE(v12) = -[NSString isEqualToString:](v30, "isEqualToString:", v33);
          }

          v25 = v30;
          goto LABEL_36;
        }
      }
      else
      {
        v25 = v24;
        v37 = 0;
      }
LABEL_37:

      v25 = v37;
      goto LABEL_38;
    }

    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_44:

  return v12;
}

- (BOOL)representsPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  id v16;
  void *v17;
  char v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKSharingMessage readerIdentifier](self->_invitation, "readerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v4, "devicePaymentApplications");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v22)
      {
        v7 = *(_QWORD *)v29;
        v23 = v6;
        v21 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v29 != v7)
              objc_enumerationMutation(v6);
            v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            objc_msgSend(v9, "subcredentials");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v25;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v25 != v13)
                    objc_enumerationMutation(v10);
                  objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "pairedReaderIdentifier");
                  v15 = (id)objc_claimAutoreleasedReturnValue();
                  v16 = v5;
                  v17 = v16;
                  if (v15 == v16)
                  {

LABEL_26:
                    v19 = 1;
                    v6 = v23;
                    goto LABEL_28;
                  }
                  if (v15)
                  {
                    v18 = objc_msgSend(v15, "isEqualToString:", v16);

                    if ((v18 & 1) != 0)
                      goto LABEL_26;
                  }
                  else
                  {

                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                v6 = v23;
                v7 = v21;
                if (v12)
                  continue;
                break;
              }
            }

          }
          v19 = 0;
          v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v22);
      }
      else
      {
        v19 = 0;
      }
LABEL_28:

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)credential
{
  id v3;
  id v4;
  void *v5;

  v3 = +[PKSharingExistingChannelDescriptor existingForTransportIdentifier:](PKSharingExistingChannelDescriptor, "existingForTransportIdentifier:", self->_transportIdentifier);
  v4 = +[PKSharingChannelHandle createHandleForDescriptor:queue:](PKSharingChannelHandle, "createHandleForDescriptor:queue:", v3, MEMORY[0x1E0C80D38]);
  if (v4)
  {
    -[PKPendingStatefulTransferProvisioning credentialWithHandle:](self, "credentialWithHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)credentialWithHandle:(id)a3
{
  id v4;
  PKStatefulTransferCredential *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PKStatefulTransferCredential initWithSharingChannelHandle:invitation:share:]([PKStatefulTransferCredential alloc], "initWithSharingChannelHandle:invitation:share:", v4, self->_invitation, self->_share);

  -[PKStatefulTransferCredential setOriginalShareURL:](v5, "setOriginalShareURL:", self->_originalShareURL);
  -[PKStatefulTransferCredential setAccountAttestationAnonymizationSalt:](v5, "setAccountAttestationAnonymizationSalt:", self->_accountAttestationAnonymizationSalt);
  -[PKPendingProvisioning provisioningState](self, "provisioningState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKPendingProvisioning provisioningState](self, "provisioningState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setState:](v5, "setState:", v7);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingStatefulTransferProvisioning)initWithCoder:(id)a3
{
  id v4;
  PKPendingStatefulTransferProvisioning *v5;
  uint64_t v6;
  NSString *transportIdentifier;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  PKSharingMessage *invitation;
  uint64_t v13;
  PKPassShare *share;
  uint64_t v15;
  NSString *originalShareURL;
  uint64_t v17;
  NSString *accountAttestationAnonymizationSalt;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPendingStatefulTransferProvisioning;
  v5 = -[PKPendingProvisioning initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transportIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transportIdentifier = v5->_transportIdentifier;
    v5->_transportIdentifier = (NSString *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("invitation"));
    v11 = objc_claimAutoreleasedReturnValue();
    invitation = v5->_invitation;
    v5->_invitation = (PKSharingMessage *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share"));
    v13 = objc_claimAutoreleasedReturnValue();
    share = v5->_share;
    v5->_share = (PKPassShare *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalShareURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    originalShareURL = v5->_originalShareURL;
    v5->_originalShareURL = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountAttestationAnonymizationSalt"));
    v17 = objc_claimAutoreleasedReturnValue();
    accountAttestationAnonymizationSalt = v5->_accountAttestationAnonymizationSalt;
    v5->_accountAttestationAnonymizationSalt = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPendingStatefulTransferProvisioning;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transportIdentifier, CFSTR("transportIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_invitation, CFSTR("invitation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_share, CFSTR("share"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalShareURL, CFSTR("originalShareURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountAttestationAnonymizationSalt, CFSTR("accountAttestationAnonymizationSalt"));

}

- (void)_copyIntoPendingProvision:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPendingStatefulTransferProvisioning;
  v4 = a3;
  -[PKPendingProvisioning _copyIntoPendingProvision:](&v13, sel__copyIntoPendingProvision_, v4);
  v5 = -[NSString copy](self->_transportIdentifier, "copy", v13.receiver, v13.super_class);
  v6 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v5;

  objc_storeStrong((id *)v4 + 8, self->_invitation);
  v7 = -[PKPassShare copy](self->_share, "copy");
  v8 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v7;

  v9 = -[NSString copy](self->_originalShareURL, "copy");
  v10 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v9;

  v11 = -[NSString copy](self->_accountAttestationAnonymizationSalt, "copy");
  v12 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v11;

}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transportIdentifier, a3);
}

- (PKSharingMessage)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (PKPassShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (NSString)originalShareURL
{
  return self->_originalShareURL;
}

- (void)setOriginalShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalShareURL, a3);
}

- (NSString)accountAttestationAnonymizationSalt
{
  return self->_accountAttestationAnonymizationSalt;
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3
{
  objc_storeStrong((id *)&self->_accountAttestationAnonymizationSalt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAttestationAnonymizationSalt, 0);
  objc_storeStrong((id *)&self->_originalShareURL, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
}

@end
