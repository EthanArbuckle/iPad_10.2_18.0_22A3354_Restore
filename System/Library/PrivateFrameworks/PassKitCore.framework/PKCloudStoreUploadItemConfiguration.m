@implementation PKCloudStoreUploadItemConfiguration

- (PKCloudStoreUploadItemConfiguration)initWithItem:(id)a3
{
  return -[PKCloudStoreUploadItemConfiguration initWithItem:recordSpecificKeys:](self, "initWithItem:recordSpecificKeys:", a3, 0);
}

- (PKCloudStoreUploadItemConfiguration)initWithItem:(id)a3 recordSpecificKeys:(id)a4
{
  id v7;
  id v8;
  PKCloudStoreUploadItemConfiguration *v9;
  PKCloudStoreUploadItemConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKCloudStoreUploadItemConfiguration;
  v9 = -[PKCloudStoreUploadItemConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_storeStrong((id *)&v10->_recordSpecificKeys, a4);
    v10->_itemType = objc_msgSend(v7, "itemType");
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKCloudStoreUploadItemConfiguration *v4;
  PKCloudStoreUploadItemConfiguration *v5;
  BOOL v6;

  v4 = (PKCloudStoreUploadItemConfiguration *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCloudStoreUploadItemConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  _QWORD *v4;
  PKCloudStoreCoding *item;
  PKCloudStoreCoding *v6;
  BOOL v7;
  NSDictionary *recordSpecificKeys;
  NSDictionary *v9;
  NSSet *cloudStoreZones;
  NSSet *v11;
  char v12;

  v4 = a3;
  if (!v4)
    goto LABEL_21;
  item = self->_item;
  v6 = (PKCloudStoreCoding *)v4[3];
  if (item)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (item != v6)
      goto LABEL_21;
  }
  else if ((-[PKCloudStoreCoding isEqual:](item, "isEqual:") & 1) == 0)
  {
    goto LABEL_21;
  }
  recordSpecificKeys = self->_recordSpecificKeys;
  v9 = (NSDictionary *)v4[5];
  if (!recordSpecificKeys || !v9)
  {
    if (recordSpecificKeys == v9)
      goto LABEL_15;
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  if ((-[NSDictionary isEqual:](recordSpecificKeys, "isEqual:") & 1) == 0)
    goto LABEL_21;
LABEL_15:
  if (self->_codingType != v4[6]
    || self->_detectConflicts != *((unsigned __int8 *)v4 + 16)
    || self->_returnRecords != *((unsigned __int8 *)v4 + 17))
  {
    goto LABEL_21;
  }
  cloudStoreZones = self->_cloudStoreZones;
  v11 = (NSSet *)v4[4];
  if (cloudStoreZones && v11)
    v12 = -[NSSet isEqual:](cloudStoreZones, "isEqual:");
  else
    v12 = cloudStoreZones == v11;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_item);
  objc_msgSend(v3, "safelyAddObject:", self->_recordSpecificKeys);
  objc_msgSend(v3, "safelyAddObject:", self->_cloudStoreZones);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_codingType - v4 + 32 * v4;
  v6 = self->_detectConflicts - v5 + 32 * v5;
  v7 = self->_returnRecords - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("item: '%@'; "), self->_item);
  objc_msgSend(v3, "appendFormat:", CFSTR("accessLevel: '%@'; "), self->_item);
  objc_msgSend(v3, "appendFormat:", CFSTR("recordSpecificKeys: '%@'; "), self->_recordSpecificKeys);
  objc_msgSend(v3, "appendFormat:", CFSTR("cloudStoreZones: '%@'; "), self->_cloudStoreZones);
  if (self->_detectConflicts)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("detectConflicts: '%@'; "), v4);
  if (self->_returnRecords)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("returnRecords: '%@'; "), v5);
  PKCloudStoreCodingTypeToString(self->_codingType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("codingType: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreUploadItemConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreUploadItemConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *recordSpecificKeys;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *cloudStoreZones;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  PKCloudStoreCoding *item;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKCloudStoreUploadItemConfiguration;
  v5 = -[PKCloudStoreUploadItemConfiguration init](&v22, sel_init);
  if (v5)
  {
    v5->_itemType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemType"));
    v5->_codingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingType"));
    v5->_detectConflicts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectConflicts"));
    v5->_returnRecords = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("returnRecords"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("recordSpecificKeys"));
    v10 = objc_claimAutoreleasedReturnValue();
    recordSpecificKeys = v5->_recordSpecificKeys;
    v5->_recordSpecificKeys = (NSDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("cloudStoreZones"));
    v15 = objc_claimAutoreleasedReturnValue();
    cloudStoreZones = v5->_cloudStoreZones;
    v5->_cloudStoreZones = (NSSet *)v15;

    switch(v5->_itemType)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 5uLL:
      case 9uLL:
      case 0xAuLL:
        v17 = objc_opt_class();
        v18 = CFSTR("item");
        goto LABEL_5;
      case 8uLL:
        v17 = objc_opt_class();
        v18 = CFSTR("shareLock");
LABEL_5:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
        v19 = objc_claimAutoreleasedReturnValue();
        item = v5->_item;
        v5->_item = (PKCloudStoreCoding *)v19;

        break;
      default:
        break;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t itemType;
  id v5;

  itemType = self->_itemType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", itemType, CFSTR("itemType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudStoreZones, CFSTR("cloudStoreZones"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_codingType, CFSTR("codingType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_detectConflicts, CFSTR("detectConflicts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_returnRecords, CFSTR("returnRecords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordSpecificKeys, CFSTR("recordSpecificKeys"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_item, CFSTR("item"));

}

- (PKCloudStoreCoding)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSSet)cloudStoreZones
{
  return self->_cloudStoreZones;
}

- (void)setCloudStoreZones:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStoreZones, a3);
}

- (NSDictionary)recordSpecificKeys
{
  return self->_recordSpecificKeys;
}

- (void)setRecordSpecificKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)codingType
{
  return self->_codingType;
}

- (void)setCodingType:(unint64_t)a3
{
  self->_codingType = a3;
}

- (BOOL)detectConflicts
{
  return self->_detectConflicts;
}

- (void)setDetectConflicts:(BOOL)a3
{
  self->_detectConflicts = a3;
}

- (BOOL)returnRecords
{
  return self->_returnRecords;
}

- (void)setReturnRecords:(BOOL)a3
{
  self->_returnRecords = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSpecificKeys, 0);
  objc_storeStrong((id *)&self->_cloudStoreZones, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
