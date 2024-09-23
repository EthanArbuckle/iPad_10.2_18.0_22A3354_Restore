@implementation PKPeerPaymentCounterpartImageData

- (PKPeerPaymentCounterpartImageData)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentCounterpartImageData *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSData *imageData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentCounterpartImageData;
  v5 = -[PKPeerPaymentCounterpartImageData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKDataForKey:", CFSTR("imageData"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v8;

  }
  return v5;
}

- (PKPeerPaymentCounterpartImageData)initWithAppearanceData:(id)a3
{
  id v4;
  void *v5;
  PKPeerPaymentCounterpartImageData *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  PKPeerPaymentCounterpartImageData *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)PKPeerPaymentCounterpartImageData;
    v6 = -[PKPeerPaymentCounterpartImageData init](&v14, sel_init);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safelyAddObject:", v8);

      objc_msgSend(v7, "safelyAddObject:", v5);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), PKCombinedHash(17, v7));
      v9 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      objc_storeStrong((id *)&v6->_imageData, v5);
    }
    self = v6;
    v11 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Error: attempted to initialize PKPeerPaymentCounterpartImageData with nil image data", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentCounterpartImageData)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentCounterpartImageData *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSData *imageData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentCounterpartImageData;
  v5 = -[PKPeerPaymentCounterpartImageData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));

}

- (PKPeerPaymentCounterpartImageData)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKPeerPaymentCounterpartImageData *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSData *imageData;
  PKPeerPaymentCounterpartImageData *v16;
  const char *v17;
  NSObject *v18;
  uint8_t v20[16];
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentCounterpartImageData;
  v5 = -[PKPeerPaymentCounterpartImageData init](&v21, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "recordsWithRecordType:", CFSTR("CounterpartImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pk_encryptedStringForKey:", CFSTR("identifier"));
  v8 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;

  if (!v5->_identifier)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      v17 = "Cannot create a PKPeerPaymentCounterpartImageData with no identifier from CloudKit.";
LABEL_11:
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v17, v20, 2u);
    }
LABEL_15:

    v16 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("imageData"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      v17 = "Cannot create a PKPeerPaymentCounterpartImageData with no asset data from CloudKit.";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[NSObject fileURL](v11, "fileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "initWithContentsOfURL:", v13);

  if (!v14)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPeerPaymentCounterpartImageData with nil data", v20, 2u);
    }

    goto LABEL_15;
  }
  imageData = v5->_imageData;
  v5->_imageData = (NSData *)v14;

LABEL_6:
  v16 = v5;
LABEL_16:

  return v16;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];

  v5 = a3;
  v6 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(v5, "recordsWithRecordType:", CFSTR("CounterpartImage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", self->_identifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeItemAtPath:error:", v11, 0);

  -[NSData writeToFile:atomically:](self->_imageData, "writeToFile:atomically:", v11, 1);
  v13 = objc_alloc(MEMORY[0x1E0C94BB8]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFileURL:", v14);

  if (v15)
  {
    objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("imageData"));
  }
  else
  {
    PKLogFacilityTypeGetObject(9uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Could not set CKAsset for the CKRecord because it is nil.", v17, 2u);
    }

  }
  objc_autoreleasePoolPop(v6);

}

- (unint64_t)itemType
{
  return 10;
}

+ (id)recordNamePrefix
{
  return CFSTR("counterpartImage-");
}

- (id)primaryIdentifier
{
  return self->_identifier;
}

+ (id)recordNameForCounterpartImageDataIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "recordNamePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@%@"), v7, v5);

  return v8;
}

+ (id)counterpartImageDataIdentifierFromRecordName:(id)a3
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

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "recordNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentCounterpartImageData primaryIdentifier](self, "primaryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@%@"), v5, v6, CFSTR("CounterpartImage"));
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_identifier == (NSString *)v4[1]
    && self->_imageData == (NSData *)v4[2];

  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("imageData: '%@'; "), self->_imageData);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_imageData);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentCounterpartImageData *v4;

  v4 = -[PKPeerPaymentCounterpartImageData init](+[PKPeerPaymentCounterpartImageData allocWithZone:](PKPeerPaymentCounterpartImageData, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  objc_storeStrong((id *)&v4->_imageData, self->_imageData);
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
