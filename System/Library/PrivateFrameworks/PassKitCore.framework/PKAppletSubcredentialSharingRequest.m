@implementation PKAppletSubcredentialSharingRequest

- (PKAppletSubcredentialSharingRequest)initWithPaymentPass:(id)a3 entitlements:(id)a4
{
  id v6;
  id v7;
  PKAppletSubcredentialSharingRequest *v8;
  PKAppletSubcredentialSharingRequest *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  PKPassEntitlement *entitlement;
  PKAppletSubcredentialSharingRequest *v18;
  NSObject *v19;
  NSString *v20;
  const char *v21;
  NSString *passIdentifier;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PKAppletSubcredentialSharingRequest init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[PKAppletSubcredentialSharingRequest setPass:](v8, "setPass:", v6);
    if (v9->_credential)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (!objc_msgSend(v15, "carKeyEntitlementType", (_QWORD)v24))
            {
              objc_storeStrong((id *)&v9->_entitlement, v15);
              goto LABEL_13;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_13:

      if (v9->_entitlement)
        goto LABEL_15;
      objc_msgSend(v10, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();
      entitlement = v9->_entitlement;
      v9->_entitlement = (PKPassEntitlement *)v16;

      if (v9->_entitlement)
        goto LABEL_15;
      PKLogFacilityTypeGetObject(0x16uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        passIdentifier = v9->_passIdentifier;
        *(_DWORD *)buf = 138412290;
        v30 = passIdentifier;
        v21 = "Unable to create sharing request for pass %@ - no entitlements found";
        goto LABEL_18;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v9->_passIdentifier;
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        v21 = "Unable to create sharing request for pass %@ - no credential found";
LABEL_18:
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
    }

    v18 = 0;
    goto LABEL_20;
  }
LABEL_15:
  v18 = v9;
LABEL_20:

  return v18;
}

- (id)credentialForPass:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  objc_msgSend(a3, "devicePaymentApplications", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "subcredentials");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (id)credentialWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PKSecureElementPass devicePaymentApplications](self->_pass, "devicePaymentApplications", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "subcredentials");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if ((v13 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (void)setPass:(id)a3
{
  PKPaymentPass *v5;
  NSString *v6;
  NSString *passIdentifier;
  PKAppletSubcredential *v8;
  PKAppletSubcredential *credential;
  PKAppletSubcredential *v10;
  PKAppletSubcredential *v11;
  NSString *v12;
  PKPaymentPass *v13;

  v5 = (PKPaymentPass *)a3;
  if (self->_pass != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_pass, a3);
    -[PKObject uniqueID](v13, "uniqueID");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    passIdentifier = self->_passIdentifier;
    self->_passIdentifier = v6;

    if (self->_credentialIdentifier)
    {
      -[PKAppletSubcredentialSharingRequest credentialWithIdentifier:](self, "credentialWithIdentifier:");
      v8 = (PKAppletSubcredential *)objc_claimAutoreleasedReturnValue();
      credential = self->_credential;
      self->_credential = v8;
    }
    else
    {
      -[PKAppletSubcredentialSharingRequest credentialForPass:](self, "credentialForPass:", self->_pass);
      v10 = (PKAppletSubcredential *)objc_claimAutoreleasedReturnValue();
      v11 = self->_credential;
      self->_credential = v10;

      -[PKAppletSubcredential identifier](self->_credential, "identifier");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      credential = (PKAppletSubcredential *)self->_credentialIdentifier;
      self->_credentialIdentifier = v12;
    }

    v5 = v13;
  }

}

- (id)invitations
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *recipientName;
  void *v17;
  PKAppletSubcredentialSharingInvitation *v18;
  PKAppletSubcredentialSharingInvitation *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  PKAppletSubcredentialSharingInvitation *v25;
  void *v26;
  NSString *v27;
  const char *v28;
  NSString *v29;
  NSString *v30;
  const char *v31;
  NSString *passIdentifier;
  PKAppletSubcredentialSharingInvitation *v34;
  id v35;
  uint8_t buf[4];
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_recipientIdentifier && self->_recipientName)
  {
    if (self->_entitlement)
    {
      -[PKPass organizationName](self->_pass, "organizationName");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[PKPass localizedDescription](self->_pass, "localizedDescription");
        v4 = objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = v4;
          v6 = -[NSObject length](v4, "length");
          v7 = -[NSObject length](v3, "length");
          v8 = v7 + 1;
          if (v6 > v7 + 1)
          {
            v9 = v7;
            if (-[NSObject hasPrefix:](v5, "hasPrefix:", v3))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "characterIsMember:", -[NSObject characterAtIndex:](v5, "characterAtIndex:", v9));

              if (v11)
              {
                -[NSObject substringFromIndex:](v5, "substringFromIndex:", v8);
                v12 = objc_claimAutoreleasedReturnValue();

                v5 = v12;
              }
            }
          }
          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (!self->_forLocalDevice)
          {
            v34 = [PKAppletSubcredentialSharingInvitation alloc];
            -[PKAppletSubcredential partnerIdentifier](self->_credential, "partnerIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKAppletSubcredential brandIdentifier](self->_credential, "brandIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKAppletSubcredential pairedReaderIdentifier](self->_credential, "pairedReaderIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            recipientName = self->_recipientName;
            -[PKPassEntitlement value](self->_entitlement, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[PKAppletSubcredentialSharingInvitation initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:](v34, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v13, v14, v15, recipientName, objc_msgSend(v17, "unsignedIntegerValue"), -[PKAppletSubcredential supportedRadioTechnologies](self->_credential, "supportedRadioTechnologies"));

            if (v18)
            {
              -[PKAppletSubcredentialSharingInvitation setIssuer:](v18, "setIssuer:", v3);
              -[PKAppletSubcredentialSharingInvitation setDeviceModel:](v18, "setDeviceModel:", v5);
              objc_msgSend(v35, "addObject:", v18);
            }

          }
          v19 = [PKAppletSubcredentialSharingInvitation alloc];
          -[PKAppletSubcredential partnerIdentifier](self->_credential, "partnerIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKAppletSubcredential brandIdentifier](self->_credential, "brandIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKAppletSubcredential pairedReaderIdentifier](self->_credential, "pairedReaderIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = self->_recipientName;
          -[PKPassEntitlement value](self->_entitlement, "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[PKAppletSubcredentialSharingInvitation initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:](v19, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v20, v21, v22, v23, objc_msgSend(v24, "unsignedIntegerValue"), -[PKAppletSubcredential supportedRadioTechnologies](self->_credential, "supportedRadioTechnologies"));

          if (v25)
          {
            -[PKAppletSubcredentialSharingInvitation setForWatch:](v25, "setForWatch:", 1);
            -[PKAppletSubcredentialSharingInvitation setIssuer:](v25, "setIssuer:", v3);
            -[PKAppletSubcredentialSharingInvitation setDeviceModel:](v25, "setDeviceModel:", v5);
            objc_msgSend(v35, "addObject:", v25);
          }
          if (objc_msgSend(v35, "count"))
            v26 = (void *)objc_msgSend(v35, "copy");
          else
            v26 = 0;

          goto LABEL_32;
        }
        PKLogFacilityTypeGetObject(0x16uLL);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          passIdentifier = self->_passIdentifier;
          *(_DWORD *)buf = 138412290;
          v37 = passIdentifier;
          v31 = "Unable to create invitations for pass %@ - no device model";
          goto LABEL_28;
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_passIdentifier;
          *(_DWORD *)buf = 138412290;
          v37 = v30;
          v31 = "Unable to create invitations for pass %@ - no issuer";
LABEL_28:
          _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
        }
      }
      v26 = 0;
LABEL_32:

      goto LABEL_33;
    }
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->_passIdentifier;
      *(_DWORD *)buf = 138412290;
      v37 = v29;
      v28 = "Unable to create invitations for pass %@ - no entitlement set";
      goto LABEL_20;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_passIdentifier;
      *(_DWORD *)buf = 138412290;
      v37 = v27;
      v28 = "Unable to create invitations for pass %@ - no recipient set";
LABEL_20:
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    }
  }
  v26 = 0;
LABEL_33:

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passIdentifier;
  id v5;

  passIdentifier = self->_passIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passIdentifier, CFSTR("passIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("credentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entitlement, CFSTR("entitlement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientIdentifier, CFSTR("recipientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientName, CFSTR("recipientName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forLocalDevice, CFSTR("forLocalDevice"));

}

- (PKAppletSubcredentialSharingRequest)initWithCoder:(id)a3
{
  id v4;
  PKAppletSubcredentialSharingRequest *v5;
  uint64_t v6;
  NSString *passIdentifier;
  uint64_t v8;
  NSString *credentialIdentifier;
  uint64_t v10;
  PKPassEntitlement *entitlement;
  uint64_t v12;
  NSString *recipientIdentifier;
  uint64_t v14;
  NSString *recipientName;

  v4 = a3;
  v5 = -[PKAppletSubcredentialSharingRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlement"));
    v10 = objc_claimAutoreleasedReturnValue();
    entitlement = v5->_entitlement;
    v5->_entitlement = (PKPassEntitlement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientName"));
    v14 = objc_claimAutoreleasedReturnValue();
    recipientName = v5->_recipientName;
    v5->_recipientName = (NSString *)v14;

    v5->_forLocalDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forLocalDevice"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 48), self->_entitlement);
  objc_storeStrong((id *)(v4 + 56), self->_recipientIdentifier);
  objc_storeStrong((id *)(v4 + 64), self->_recipientName);
  *(_BYTE *)(v4 + 8) = self->_forLocalDevice;
  return (id)v4;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKAppletSubcredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (PKPassEntitlement)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
  objc_storeStrong((id *)&self->_entitlement, a3);
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (void)setRecipientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isForLocalDevice
{
  return self->_forLocalDevice;
}

- (void)setForLocalDevice:(BOOL)a3
{
  self->_forLocalDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
