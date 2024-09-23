@implementation TPSSizes

- (TPSSizes)initWithDictionary:(id)a3
{
  id v4;
  TPSSizes *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  TPSSize *v10;
  TPSSize *compact;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  TPSSize *v16;
  TPSSize *regular;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSSizes;
  v5 = -[TPSSerializableObject initWithDictionary:](&v19, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("compact"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    v9 = v8;

    v10 = -[TPSSize initWithDictionary:]([TPSSize alloc], "initWithDictionary:", v9);
    compact = v5->_compact;
    v5->_compact = v10;

    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("regular"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v4;
    v15 = v14;

    v16 = -[TPSSize initWithDictionary:]([TPSSize alloc], "initWithDictionary:", v15);
    regular = v5->_regular;
    v5->_regular = v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSSizes;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[TPSSizes compact](self, "compact", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("compact"));

  -[TPSSizes regular](self, "regular");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("regular"));

}

- (TPSSize)regular
{
  return self->_regular;
}

- (TPSSize)compact
{
  return self->_compact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regular, 0);
  objc_storeStrong((id *)&self->_compact, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSSizes)initWithCoder:(id)a3
{
  id v4;
  TPSSizes *v5;
  uint64_t v6;
  TPSSize *compact;
  uint64_t v8;
  TPSSize *regular;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSSizes;
  v5 = -[TPSSerializableObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compact"));
    v6 = objc_claimAutoreleasedReturnValue();
    compact = v5->_compact;
    v5->_compact = (TPSSize *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regular"));
    v8 = objc_claimAutoreleasedReturnValue();
    regular = v5->_regular;
    v5->_regular = (TPSSize *)v8;

  }
  return v5;
}

id __23__TPSSizes_na_identity__block_invoke()
{
  if (TPSSizesRegularKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSSizesRegularKey_block_invoke_na_once_token_0, &__block_literal_global_5_2);
  return (id)TPSSizesRegularKey_block_invoke_na_once_object_0;
}

void __23__TPSSizes_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __23__TPSSizes_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSSizesRegularKey_block_invoke_na_once_object_0;
  TPSSizesRegularKey_block_invoke_na_once_object_0 = v0;

}

id __23__TPSSizes_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10_0);
  objc_msgSend(v0, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __23__TPSSizes_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compact");
}

uint64_t __23__TPSSizes_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "regular");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSSizes;
  v4 = -[TPSSerializableObject copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[TPSSizes compact](self, "compact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompact:", v5);

  -[TPSSizes regular](self, "regular");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRegular:", v6);

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

- (double)heightToWidthRatioForViewMode:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  if (a3)
    -[TPSSizes regular](self, "regular");
  else
    -[TPSSizes compact](self, "compact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "height");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    objc_msgSend(v4, "width");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v7 / v9;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
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
  v9.super_class = (Class)TPSSizes;
  -[TPSSizes description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSSizes compact](self, "compact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@,"), CFSTR("compact"), v6);

  -[TPSSizes regular](self, "regular");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@"), CFSTR("regular"), v7);

  return v5;
}

- (void)setCompact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setRegular:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
