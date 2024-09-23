@implementation TPSAssetFileInfo

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSAssetFileInfo;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSAssetFileInfo scale](self, "scale", v7.receiver, v7.super_class), CFSTR("scale"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSAssetFileInfo userInterface](self, "userInterface"), CFSTR("userInterface"));
  -[TPSAssetFileInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileId"));

  -[TPSAssetFileInfo size](self, "size");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("size"));

}

- (int64_t)userInterface
{
  return self->_userInterface;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TPSSize)size
{
  return self->_size;
}

- (int64_t)scale
{
  return self->_scale;
}

- (TPSAssetFileInfo)initWithCoder:(id)a3
{
  id v4;
  TPSAssetFileInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  TPSSize *size;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSAssetFileInfo;
  v5 = -[TPSSerializableObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_scale = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scale"));
    v5->_userInterface = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userInterface"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileId"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v8 = objc_claimAutoreleasedReturnValue();
    size = v5->_size;
    v5->_size = (TPSSize *)v8;

  }
  return v5;
}

- (TPSAssetFileInfo)initWithDictionary:(id)a3
{
  id v4;
  TPSAssetFileInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  TPSSize *v11;
  TPSSize *size;
  TPSAssetFileInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAssetFileInfo;
  v5 = -[TPSSerializableObject initWithDictionary:](&v15, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("fileId"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (!-[NSString length](v5->_identifier, "length"))
    {
      v13 = 0;
      goto LABEL_8;
    }
    v8 = objc_msgSend(v4, "TPSSafeIntegerForKey:", CFSTR("scale"));
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8)
      v9 = v8;
    v5->_scale = v9;
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("userInterface"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_userInterface = objc_msgSend(v10, "isEqualToString:", CFSTR("dark"));
    v11 = -[TPSSize initWithDictionary:]([TPSSize alloc], "initWithDictionary:", v4);
    size = v5->_size;
    v5->_size = v11;

  }
  v13 = v5;
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSAssetFileInfo;
  v4 = -[TPSSerializableObject copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setScale:", -[TPSAssetFileInfo scale](self, "scale"));
  objc_msgSend(v4, "setUserInterface:", -[TPSAssetFileInfo userInterface](self, "userInterface"));
  -[TPSAssetFileInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[TPSAssetFileInfo size](self, "size");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSize:", v6);

  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v11.receiver = self;
  v11.super_class = (Class)TPSAssetFileInfo;
  -[TPSSerializableObject debugDescription](&v11, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSAssetFileInfo identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("fileId"), v6);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %ld"), CFSTR("userInterface"), -[TPSAssetFileInfo userInterface](self, "userInterface"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %ld"), CFSTR("scale"), -[TPSAssetFileInfo scale](self, "scale"));
  -[TPSAssetFileInfo size](self, "size");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPSAssetFileInfo size](self, "size");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("size"), v9);

  }
  return v5;
}

id __31__TPSAssetFileInfo_na_identity__block_invoke()
{
  if (TPSAssetFileSizeKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSAssetFileSizeKey_block_invoke_na_once_token_0, &__block_literal_global_23);
  return (id)TPSAssetFileSizeKey_block_invoke_na_once_object_0;
}

void __31__TPSAssetFileInfo_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __31__TPSAssetFileInfo_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSAssetFileSizeKey_block_invoke_na_once_object_0;
  TPSAssetFileSizeKey_block_invoke_na_once_object_0 = v0;

}

id __31__TPSAssetFileInfo_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_28);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_30_1);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_32);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_34);
  objc_msgSend(v0, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "scale"));
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "userInterface"));
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "size");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (void)setScale:(int64_t)a3
{
  self->_scale = a3;
}

- (void)setUserInterface:(int64_t)a3
{
  self->_userInterface = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
