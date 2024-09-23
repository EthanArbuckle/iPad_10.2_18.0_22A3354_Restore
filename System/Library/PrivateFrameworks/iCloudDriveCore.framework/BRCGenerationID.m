@implementation BRCGenerationID

- (NSNumber)fsGenerationID
{
  void *v2;

  if (self->_generationID)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSNumber *)v2;
}

- (NSString)generationIDString
{
  __CFString *v3;
  NSData *signature;

  if (self->_generationID)
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%u"), self->_generationID);
  }
  else
  {
    signature = self->_signature;
    if (signature)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "brc_hexadecimalStringWithBytes:length:", -[NSData bytes](signature, "bytes"), -[NSData length](self->_signature, "length"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("<undef>");
    }
  }
  return (NSString *)v3;
}

- (const)UTF8String
{
  id v2;
  const char *v3;

  -[BRCGenerationID generationIDString](self, "generationIDString");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "UTF8String");

  return v3;
}

- (BRCGenerationID)initWithSignature:(const void *)a3 length:(unint64_t)a4
{
  BRCGenerationID *v4;
  BRCGenerationID *v6;
  uint64_t v7;
  NSData *signature;
  objc_super v10;

  v4 = (BRCGenerationID *)a4;
  if (a4)
  {
    v10.receiver = self;
    v10.super_class = (Class)BRCGenerationID;
    v6 = -[BRCGenerationID init](&v10, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3, v4);
      signature = v6->_signature;
      v6->_signature = (NSData *)v7;

    }
    self = v6;
    v4 = self;
  }

  return v4;
}

- (BRCGenerationID)initWithFSGenerationID:(unsigned int)a3
{
  BRCGenerationID *v4;
  BRCGenerationID *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCGenerationID;
    v4 = -[BRCGenerationID init](&v7, sel_init);
    if (v4)
      v4->_generationID = a3;
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t generationID;
  id v5;

  generationID = self->_generationID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", generationID, CFSTR("g"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("s"));

}

- (BRCGenerationID)initWithCoder:(id)a3
{
  id v4;
  BRCGenerationID *v5;
  uint64_t v6;
  NSData *signature;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCGenerationID;
  v5 = -[BRCGenerationID init](&v9, sel_init);
  if (v5)
  {
    v5->_generationID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("g"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v6 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v6;

  }
  return v5;
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  int v5;
  id v6;
  const void *v7;

  v5 = sqlite3_value_type(a3);
  v6 = objc_alloc((Class)a1);
  if (v5 != 4)
    return (id)objc_msgSend(v6, "initWithFSGenerationID:", sqlite3_value_int64(a3));
  v7 = sqlite3_value_blob(a3);
  return (id)objc_msgSend(v6, "initWithSignature:length:", v7, sqlite3_value_bytes(a3));
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  int v7;
  id v8;
  const void *v9;

  v7 = sqlite3_column_type(a3, a4);
  v8 = objc_alloc((Class)a1);
  if (v7 != 4)
    return (id)objc_msgSend(v8, "initWithFSGenerationID:", sqlite3_column_int64(a3, a4));
  v9 = sqlite3_column_blob(a3, a4);
  return (id)objc_msgSend(v8, "initWithSignature:length:", v9, sqlite3_column_bytes(a3, a4));
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  sqlite3_int64 generationID;
  NSData *signature;

  generationID = self->_generationID;
  if ((_DWORD)generationID)
  {
    sqlite3_bind_int64(a3, a4, generationID);
  }
  else
  {
    signature = self->_signature;
    if (signature)
      sqlite3_bind_blob(a3, a4, -[NSData bytes](signature, "bytes"), -[NSData length](self->_signature, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    else
      sqlite3_bind_null(a3, a4);
  }
}

- (unint64_t)hash
{
  return self->_generationID;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[BRCGenerationID isEqualToGenerationID:orSignature:](self, "isEqualToGenerationID:orSignature:", v4, 0);

  return v5;
}

- (BOOL)isEqualToGenerationID:(id)a3 orSignature:(id)a4
{
  id *v6;
  id v7;
  unsigned int generationID;
  char v9;
  NSData *signature;

  v6 = (id *)a3;
  v7 = a4;
  generationID = self->_generationID;
  if (!generationID)
  {
    signature = self->_signature;
    if (signature)
    {
      if (v6)
      {
        if ((objc_msgSend(v6[2], "isEqualToData:") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        signature = self->_signature;
      }
      v9 = objc_msgSend(v7, "isEqualToData:", signature);
      goto LABEL_11;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  if (!v6)
    goto LABEL_8;
  v9 = generationID == *((_DWORD *)v6 + 2);
LABEL_11:

  return v9;
}

- (BOOL)isEqualToFSGenerationID:(unsigned int)a3
{
  unsigned int generationID;

  generationID = self->_generationID;
  return generationID && generationID == a3;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
