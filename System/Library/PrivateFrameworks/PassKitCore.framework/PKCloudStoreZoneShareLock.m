@implementation PKCloudStoreZoneShareLock

- (PKCloudStoreZoneShareLock)initWithZoneName:(id)a3 creationDate:(id)a4 originDeviceIdentifier:(id)a5 originDeviceName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKCloudStoreZoneShareLock *v15;
  PKCloudStoreZoneShareLock *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKCloudStoreZoneShareLock;
  v15 = -[PKCloudStoreZoneShareLock init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_zoneName, a3);
    objc_storeStrong((id *)&v16->_creationDate, a4);
    objc_storeStrong((id *)&v16->_originDeviceIdentifier, a5);
    objc_storeStrong((id *)&v16->_originDeviceName, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneShareLock)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreZoneShareLock *v5;
  uint64_t v6;
  NSString *zoneName;
  uint64_t v8;
  NSDate *creationDate;
  uint64_t v10;
  NSString *originDeviceIdentifier;
  uint64_t v12;
  NSString *originDeviceName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCloudStoreZoneShareLock;
  v5 = -[PKCloudStoreZoneShareLock init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v6 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockCreationDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originDeviceIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    originDeviceIdentifier = v5->_originDeviceIdentifier;
    v5->_originDeviceIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originDeviceName"));
    v12 = objc_claimAutoreleasedReturnValue();
    originDeviceName = v5->_originDeviceName;
    v5->_originDeviceName = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *zoneName;
  id v5;

  zoneName = self->_zoneName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("lockCreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originDeviceIdentifier, CFSTR("originDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originDeviceName, CFSTR("originDeviceName"));

}

- (PKCloudStoreZoneShareLock)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKCloudStoreZoneShareLock *v5;
  PKCloudStoreZoneShareLock *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKCloudStoreZoneShareLock;
  v5 = -[PKCloudStoreZoneShareLock init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKCloudStoreZoneShareLock applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *zoneName;
  NSDate *v7;
  NSDate *creationDate;
  NSString *v9;
  NSString *originDeviceIdentifier;
  NSString *v11;
  NSString *originDeviceName;
  id v13;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("ShareCreationLock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "pk_encryptedStringForKey:", CFSTR("zoneName"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    zoneName = self->_zoneName;
    self->_zoneName = v5;

    objc_msgSend(v13, "pk_encryptedDateForKey:", CFSTR("lockCreationDate"));
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    creationDate = self->_creationDate;
    self->_creationDate = v7;

    objc_msgSend(v13, "pk_encryptedStringForKey:", CFSTR("originDeviceIdentifier"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    originDeviceIdentifier = self->_originDeviceIdentifier;
    self->_originDeviceIdentifier = v9;

    objc_msgSend(v13, "pk_encryptedStringForKey:", CFSTR("originDeviceName"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    originDeviceName = self->_originDeviceName;
    self->_originDeviceName = v11;

  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    -[PKCloudStoreZoneShareLock _encodeDeviceDataForCloudStoreCoder:](self, "_encodeDeviceDataForCloudStoreCoder:", a3);
}

- (void)_encodeDeviceDataForCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("ShareCreationLock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self->_zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "setObject:forKey:", self->_creationDate, CFSTR("lockCreationDate"));
  objc_msgSend(v5, "setObject:forKey:", self->_originDeviceIdentifier, CFSTR("originDeviceIdentifier"));
  objc_msgSend(v5, "setObject:forKey:", self->_originDeviceName, CFSTR("originDeviceName"));

}

+ (void)deleteFromCloudStoreRecord:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    objc_msgSend(a1, "_deleteDeviceDataFromCloudStoreRecord:", a3);
}

+ (void)_deleteDeviceDataFromCloudStoreRecord:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("ShareCreationLock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("zoneName"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("lockCreationDate"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("originDeviceIdentifier"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("originDeviceName"));

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_zoneName, "length", a3))
    return 0;
  v8 = CFSTR("ShareCreationLock");
  objc_msgSend((id)objc_opt_class(), "recordNameForZoneName:", self->_zoneName, CFSTR("ShareCreationLock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)primaryIdentifier
{
  return self->_zoneName;
}

- (unint64_t)itemType
{
  return 8;
}

+ (id)recordNamePrefix
{
  return CFSTR("shareLock-");
}

+ (id)recordNameForZoneName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "recordNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)zoneNameFromRecordName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "recordNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  if (v6)
  {
    objc_msgSend(a1, "recordNamePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKCloudStoreZoneShareLock *v4;
  PKCloudStoreZoneShareLock *v5;
  BOOL v6;

  v4 = (PKCloudStoreZoneShareLock *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCloudStoreZoneShareLock isEqualToCloudStoreZoneShareLock:](self, "isEqualToCloudStoreZoneShareLock:", v5);

  return v6;
}

- (BOOL)isEqualToCloudStoreZoneShareLock:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  NSDate *creationDate;
  NSDate *v12;
  void *v13;
  NSString *v14;
  NSString *originDeviceName;
  void *v17;
  NSString *v18;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_zoneName;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
  v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

  if (v10)
  {
LABEL_11:
    creationDate = self->_creationDate;
    v12 = (NSDate *)v4[2];
    if (creationDate && v12)
    {
      if ((-[NSDate isEqual:](creationDate, "isEqual:") & 1) != 0)
      {
LABEL_14:
        v13 = (void *)v4[3];
        v6 = self->_originDeviceIdentifier;
        v14 = v13;
        if (v6 == v14)
        {

LABEL_23:
          originDeviceName = self->_originDeviceName;
          v17 = (void *)v4[4];
          v6 = originDeviceName;
          v18 = v17;
          if (v6 == v18)
          {
            LOBYTE(v10) = 1;
            v8 = v6;
          }
          else
          {
            v8 = v18;
            LOBYTE(v10) = 0;
            if (v6 && v18)
              LOBYTE(v10) = -[NSString isEqualToString:](v6, "isEqualToString:", v18);
          }
          goto LABEL_8;
        }
        v8 = v14;
        LOBYTE(v10) = 0;
        if (v6 && v14)
        {
          v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v14);

          if (!v10)
            goto LABEL_21;
          goto LABEL_23;
        }
LABEL_8:

        goto LABEL_21;
      }
    }
    else if (creationDate == v12)
    {
      goto LABEL_14;
    }
    LOBYTE(v10) = 0;
  }
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_zoneName);
  objc_msgSend(v3, "safelyAddObject:", self->_creationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_originDeviceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_originDeviceName);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("zoneName: '%@'; "), self->_zoneName);
  objc_msgSend(v3, "appendFormat:", CFSTR("creationDate: '%@'; "), self->_creationDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("originDeviceIdentifier: '%@'; "), self->_originDeviceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("originDeviceName: '%@'; "), self->_originDeviceName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)originDeviceIdentifier
{
  return self->_originDeviceIdentifier;
}

- (NSString)originDeviceName
{
  return self->_originDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originDeviceName, 0);
  objc_storeStrong((id *)&self->_originDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
