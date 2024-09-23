@implementation PKCloudStoreZoneQueryConfiguration

- (PKCloudStoreZoneQueryConfiguration)initWithItemType:(unint64_t)a3 recordName:(id)a4
{
  id v7;
  PKCloudStoreZoneQueryConfiguration *v8;
  PKCloudStoreZoneQueryConfiguration *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudStoreZoneQueryConfiguration;
  v8 = -[PKCloudStoreZoneQueryConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_itemType = a3;
    objc_storeStrong((id *)&v8->_recordName, a4);
  }

  return v9;
}

- (PKCloudStoreZoneQueryConfiguration)initWithTransactionSourceIdentifier:(id)a3 accountIdentifier:(id)a4 accountType:(int64_t)a5 serviceIdentifier:(id)a6 altDSID:(id)a7 zoneName:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKCloudStoreZoneQueryConfiguration *v18;
  PKCloudStoreZoneQueryConfiguration *v19;
  id v21;

  v21 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = -[PKCloudStoreZoneQueryConfiguration initWithItemType:recordName:](self, "initWithItemType:recordName:", 1, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_transactionSourceIdentifier, a3);
    objc_storeStrong((id *)&v19->_accountIdentifier, a4);
    v19->_accountType = a5;
    objc_storeStrong((id *)&v19->_altDSID, a7);
    objc_storeStrong((id *)&v19->_zoneName, a8);
  }

  return v19;
}

- (PKCloudStoreZoneQueryConfiguration)initWithTransactionSourceIdentifier:(id)a3 accountIdentifier:(id)a4 accountType:(int64_t)a5 accountEventIdentifier:(id)a6 altDSID:(id)a7 zoneName:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  PKCloudStoreZoneQueryConfiguration *v22;
  PKCloudStoreZoneQueryConfiguration *v23;
  id v26;
  id v27;
  id v28;

  v28 = a3;
  v27 = a4;
  v14 = a6;
  v26 = a7;
  v15 = a8;
  v16 = v14;
  +[PKAccountEvent recordNamePrefix](PKAccountEvent, "recordNamePrefix");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "hasPrefix:", v17);

  v19 = v16;
  if ((v18 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    +[PKAccountEvent recordNamePrefix](PKAccountEvent, "recordNamePrefix");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v21, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = -[PKCloudStoreZoneQueryConfiguration initWithItemType:recordName:](self, "initWithItemType:recordName:", 5, v19);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_transactionSourceIdentifier, a3);
    objc_storeStrong((id *)&v23->_accountIdentifier, a4);
    v23->_accountType = a5;
    objc_storeStrong((id *)&v23->_altDSID, a7);
    objc_storeStrong((id *)&v23->_zoneName, a8);
  }

  return v23;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_recordName);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionSourceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_zoneName);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_accountType - v4 + 32 * v4;
  v6 = self->_itemType - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKCloudStoreZoneQueryConfiguration *v4;
  PKCloudStoreZoneQueryConfiguration *v5;
  PKCloudStoreZoneQueryConfiguration *v6;
  NSString *recordName;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *transactionSourceIdentifier;
  NSString *v14;
  _BOOL4 v15;
  NSString *accountIdentifier;
  NSString *v17;
  _BOOL4 v18;
  NSString *altDSID;
  NSString *v20;
  _BOOL4 v21;
  NSString *zoneName;
  NSString *v23;
  _BOOL4 v24;

  v4 = (PKCloudStoreZoneQueryConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        recordName = v6->_recordName;
        v8 = self->_recordName;
        v9 = recordName;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_35;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_36;
        }
        transactionSourceIdentifier = v6->_transactionSourceIdentifier;
        v8 = self->_transactionSourceIdentifier;
        v14 = transactionSourceIdentifier;
        if (v8 == v14)
        {

        }
        else
        {
          v10 = v14;
          if (!v8 || !v14)
            goto LABEL_35;
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_36;
        }
        accountIdentifier = v6->_accountIdentifier;
        v8 = self->_accountIdentifier;
        v17 = accountIdentifier;
        if (v8 == v17)
        {

        }
        else
        {
          v10 = v17;
          if (!v8 || !v17)
            goto LABEL_35;
          v18 = -[NSString isEqualToString:](v8, "isEqualToString:", v17);

          if (!v18)
            goto LABEL_36;
        }
        altDSID = v6->_altDSID;
        v8 = self->_altDSID;
        v20 = altDSID;
        if (v8 == v20)
        {

        }
        else
        {
          v10 = v20;
          if (!v8 || !v20)
            goto LABEL_35;
          v21 = -[NSString isEqualToString:](v8, "isEqualToString:", v20);

          if (!v21)
            goto LABEL_36;
        }
        zoneName = v6->_zoneName;
        v8 = self->_zoneName;
        v23 = zoneName;
        if (v8 == v23)
        {

LABEL_40:
          if (self->_accountType == v6->_accountType)
          {
            v12 = self->_itemType == v6->_itemType;
            goto LABEL_37;
          }
LABEL_36:
          v12 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v10 = v23;
        if (v8 && v23)
        {
          v24 = -[NSString isEqualToString:](v8, "isEqualToString:", v23);

          if (!v24)
            goto LABEL_36;
          goto LABEL_40;
        }
LABEL_35:

        goto LABEL_36;
      }
    }
    v12 = 0;
  }
LABEL_38:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t accountType;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  PKCloudStoreItemTypeToString(self->_itemType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("itemType: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("recordName: '%@'; "), self->_recordName);
  if (self->_transactionSourceIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("_transactionSourceIdentifier: '%@'; "), self->_transactionSourceIdentifier);
  if (self->_zoneName)
    objc_msgSend(v3, "appendFormat:", CFSTR("_zoneName: '%@'; "), self->_zoneName);
  if (self->_accountIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("_accountIdentifier: '%@'; "), self->_accountIdentifier);
  if (self->_altDSID)
    objc_msgSend(v3, "appendFormat:", CFSTR("_accountIdentifier: '%@'; "), self->_altDSID);
  accountType = self->_accountType;
  if (accountType)
  {
    PKPaymentTransactionAccountTypeToString(accountType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("_accountType: '%@'; "), v6);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreZoneQueryConfiguration *v5;
  uint64_t v6;
  NSString *recordName;
  uint64_t v8;
  NSString *transactionSourceIdentifier;
  uint64_t v10;
  NSString *accountIdentifier;
  uint64_t v12;
  NSString *zoneName;
  uint64_t v14;
  NSString *altDSID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCloudStoreZoneQueryConfiguration;
  v5 = -[PKCloudStoreZoneQueryConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordName"));
    v6 = objc_claimAutoreleasedReturnValue();
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v12 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v14 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v14;

    v5->_itemType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemType"));
    v5->_accountType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t accountType;
  id v5;

  accountType = self->_accountType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", accountType, CFSTR("accountType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemType, CFSTR("itemType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordName, CFSTR("recordName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));

}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end
