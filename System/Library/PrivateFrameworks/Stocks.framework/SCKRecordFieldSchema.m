@implementation SCKRecordFieldSchema

- (SCKRecordFieldSchema)initWithName:(id)a3 valueClass:(Class)a4 required:(BOOL)a5 encrypted:(BOOL)a6
{
  id v11;
  SCKRecordFieldSchema *v12;
  SCKRecordFieldSchema *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCKRecordFieldSchema;
  v12 = -[SCKRecordFieldSchema init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_valueClass, a4);
    v13->_required = a5;
    v13->_encrypted = a6;
  }

  return v13;
}

- (BOOL)isValidRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  char isKindOfClass;

  v4 = a3;
  objc_msgSend(v4, "valuesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKRecordFieldSchema name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encryptedValuesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCKRecordFieldSchema name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v7 | v10)
  {
    if ((!-[SCKRecordFieldSchema isEncrypted](self, "isEncrypted") || v10)
      && ((v11 = -[SCKRecordFieldSchema isEncrypted](self, "isEncrypted"), v7) || v11))
    {
      -[SCKRecordFieldSchema valueClass](self, "valueClass");
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        isKindOfClass = 1;
      }
      else
      {
        -[SCKRecordFieldSchema valueClass](self, "valueClass");
        isKindOfClass = objc_opt_isKindOfClass();
      }
    }
    else
    {
      isKindOfClass = 0;
    }
  }
  else
  {
    isKindOfClass = !-[SCKRecordFieldSchema isRequired](self, "isRequired");
  }

  return isKindOfClass & 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (Class)valueClass
{
  return self->_valueClass;
}

- (void)setValueClass:(Class)a3
{
  objc_storeStrong((id *)&self->_valueClass, a3);
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
