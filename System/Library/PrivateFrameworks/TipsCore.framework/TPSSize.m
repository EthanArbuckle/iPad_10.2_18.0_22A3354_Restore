@implementation TPSSize

- (TPSSize)initWithDictionary:(id)a3
{
  id v4;
  TPSSize *v5;
  uint64_t v6;
  NSNumber *width;
  uint64_t v8;
  NSNumber *height;
  TPSSize *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSSize;
  v5 = -[TPSSerializableObject initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("width"));
  v6 = objc_claimAutoreleasedReturnValue();
  width = v5->_width;
  v5->_width = (NSNumber *)v6;

  objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("height"));
  v8 = objc_claimAutoreleasedReturnValue();
  height = v5->_height;
  v5->_height = (NSNumber *)v8;

  if (-[NSNumber intValue](v5->_width, "intValue") < 1 || -[NSNumber intValue](v5->_height, "intValue") < 1)
    v10 = 0;
  else
LABEL_4:
    v10 = v5;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSSize;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[TPSSize width](self, "width", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("width"));

  -[TPSSize height](self, "height");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("height"));

}

- (NSNumber)width
{
  return self->_width;
}

- (NSNumber)height
{
  return self->_height;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSSize)initWithCoder:(id)a3
{
  id v4;
  TPSSize *v5;
  uint64_t v6;
  NSNumber *width;
  uint64_t v8;
  NSNumber *height;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSSize;
  v5 = -[TPSSerializableObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("width"));
    v6 = objc_claimAutoreleasedReturnValue();
    width = v5->_width;
    v5->_width = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("height"));
    v8 = objc_claimAutoreleasedReturnValue();
    height = v5->_height;
    v5->_height = (NSNumber *)v8;

  }
  return v5;
}

id __22__TPSSize_na_identity__block_invoke()
{
  if (TPSSizeHeightKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSSizeHeightKey_block_invoke_na_once_token_0, &__block_literal_global_5_3);
  return (id)TPSSizeHeightKey_block_invoke_na_once_object_0;
}

void __22__TPSSize_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __22__TPSSize_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSSizeHeightKey_block_invoke_na_once_object_0;
  TPSSizeHeightKey_block_invoke_na_once_object_0 = v0;

}

id __22__TPSSize_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10_1);
  objc_msgSend(v0, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __22__TPSSize_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "width");
}

uint64_t __22__TPSSize_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "height");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSSize;
  v4 = -[TPSSerializableObject copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[TPSSize width](self, "width");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidth:", v5);

  -[TPSSize height](self, "height");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeight:", v6);

  return v4;
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSSize;
  -[TPSSize description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSSize width](self, "width");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@,"), CFSTR("width"), v6);

  -[TPSSize height](self, "height");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@"), CFSTR("height"), v7);

  return v5;
}

- (void)setWidth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
