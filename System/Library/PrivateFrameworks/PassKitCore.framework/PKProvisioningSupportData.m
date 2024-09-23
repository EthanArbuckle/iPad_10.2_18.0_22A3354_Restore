@implementation PKProvisioningSupportData

- (PKProvisioningSupportData)initWithEncryptedSupportDataDictionary:(id)a3 sid:(id)a4
{
  id v7;
  id v8;
  PKProvisioningSupportData *v9;
  PKProvisioningSupportData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningSupportData;
  v9 = -[PKProvisioningSupportData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptedSupportDataDictionary, a3);
    objc_storeStrong((id *)&v10->_sid, a4);
  }

  return v10;
}

- (id)archiveForKeychainWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB36F8];
  -[PKProvisioningSupportData _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)supportDataType
{
  return 0;
}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sid, CFSTR("SID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_encryptedSupportDataDictionary, CFSTR("EncryptedSupportDictionary"));
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningSupportData)initWithCoder:(id)a3
{
  id v4;
  PKProvisioningSupportData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *encryptedSupportDataDictionary;
  uint64_t v11;
  NSString *sid;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKProvisioningSupportData;
  v5 = -[PKProvisioningSupportData init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EncryptedSupportDictionary"));
    v9 = objc_claimAutoreleasedReturnValue();
    encryptedSupportDataDictionary = v5->_encryptedSupportDataDictionary;
    v5->_encryptedSupportDataDictionary = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SID"));
    v11 = objc_claimAutoreleasedReturnValue();
    sid = v5->_sid;
    v5->_sid = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *encryptedSupportDataDictionary;
  id v5;

  encryptedSupportDataDictionary = self->_encryptedSupportDataDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", encryptedSupportDataDictionary, CFSTR("EncryptedSupportDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sid, CFSTR("SID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[NSDictionary copy](self->_encryptedSupportDataDictionary, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_sid, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (NSDictionary)encryptedSupportDataDictionary
{
  return self->_encryptedSupportDataDictionary;
}

- (NSString)sid
{
  return self->_sid;
}

- (void)setSid:(id)a3
{
  objc_storeStrong((id *)&self->_sid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sid, 0);
  objc_storeStrong((id *)&self->_encryptedSupportDataDictionary, 0);
}

@end
