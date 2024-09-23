@implementation PKAccountTransactionSyncReportItem

- (PKAccountTransactionSyncReportItem)initWithTransactionServiceIdentifier:(id)a3 recordName:(id)a4 recordType:(id)a5 zoneName:(id)a6 altDSID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKAccountTransactionSyncReportItem *v17;
  PKAccountTransactionSyncReportItem *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountTransactionSyncReportItem;
  v17 = -[PKAccountTransactionSyncReportItem init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transactionServiceIdentifier, a3);
    objc_storeStrong((id *)&v18->_recordName, a4);
    objc_storeStrong((id *)&v18->_recordType, a5);
    objc_storeStrong((id *)&v18->_zoneName, a6);
    objc_storeStrong((id *)&v18->_altDSID, a7);
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "safelySetObject:forKey:", self->_transactionServiceIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_recordName, CFSTR("recordIdentifier"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_recordType, CFSTR("recordType"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_zoneName, CFSTR("zoneName"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTransactionSyncReportItem)initWithCoder:(id)a3
{
  id v4;
  PKAccountTransactionSyncReportItem *v5;
  uint64_t v6;
  NSString *transactionServiceIdentifier;
  uint64_t v8;
  NSString *recordName;
  uint64_t v10;
  NSString *recordType;
  uint64_t v12;
  NSString *zoneName;
  uint64_t v14;
  NSString *altDSID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountTransactionSyncReportItem;
  v5 = -[PKAccountTransactionSyncReportItem init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionServiceIdentifier = v5->_transactionServiceIdentifier;
    v5->_transactionServiceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordType"));
    v10 = objc_claimAutoreleasedReturnValue();
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v12 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v14 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transactionServiceIdentifier;
  id v5;

  transactionServiceIdentifier = self->_transactionServiceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transactionServiceIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordName, CFSTR("recordIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordType, CFSTR("recordType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  NSString *altDSID;
  void *v17;
  NSString *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)v4[1];
    v6 = self->_transactionServiceIdentifier;
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      LOBYTE(v9) = 0;
      if (!v6 || !v7)
        goto LABEL_32;
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (!v9)
        goto LABEL_33;
    }
    v10 = (void *)v4[2];
    v6 = self->_recordName;
    v11 = v10;
    if (v6 == v11)
    {

    }
    else
    {
      v8 = v11;
      LOBYTE(v9) = 0;
      if (!v6 || !v11)
        goto LABEL_32;
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v11);

      if (!v9)
        goto LABEL_33;
    }
    v12 = (void *)v4[3];
    v6 = self->_recordType;
    v13 = v12;
    if (v6 == v13)
    {

    }
    else
    {
      v8 = v13;
      LOBYTE(v9) = 0;
      if (!v6 || !v13)
        goto LABEL_32;
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v13);

      if (!v9)
        goto LABEL_33;
    }
    v14 = (void *)v4[4];
    v6 = self->_zoneName;
    v15 = v14;
    if (v6 == v15)
    {

LABEL_27:
      altDSID = self->_altDSID;
      v17 = (void *)v4[5];
      v6 = altDSID;
      v18 = v17;
      if (v6 == v18)
      {
        LOBYTE(v9) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v18;
        LOBYTE(v9) = 0;
        if (v6 && v18)
          LOBYTE(v9) = -[NSString isEqualToString:](v6, "isEqualToString:", v18);
      }
      goto LABEL_32;
    }
    v8 = v15;
    LOBYTE(v9) = 0;
    if (v6 && v15)
    {
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

      if (!v9)
        goto LABEL_33;
      goto LABEL_27;
    }
LABEL_32:

    goto LABEL_33;
  }
  LOBYTE(v9) = 0;
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_transactionServiceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_recordName);
  objc_msgSend(v3, "safelyAddObject:", self->_recordType);
  objc_msgSend(v3, "safelyAddObject:", self->_zoneName);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionServiceIdentifier: '%@'; "), self->_transactionServiceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("recordName: '%@'; "), self->_recordName);
  objc_msgSend(v3, "appendFormat:", CFSTR("recordType: '%@'; "), self->_recordType);
  objc_msgSend(v3, "appendFormat:", CFSTR("zoneName: '%@'; "), self->_zoneName);
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_transactionServiceIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_recordName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_recordType, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_transactionServiceIdentifier, 0);
}

@end
