@implementation TPSGradientStop

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSGradientStop;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[TPSGradientStop location](self, "location", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stop"));

  -[TPSGradientStop colorString](self, "colorString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("color"));

}

- (NSString)colorString
{
  return self->_colorString;
}

- (NSNumber)location
{
  return self->_location;
}

- (TPSGradientStop)initWithDictionary:(id)a3
{
  id v4;
  TPSGradientStop *v5;
  uint64_t v6;
  NSNumber *location;
  uint64_t v8;
  NSString *colorString;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSGradientStop;
  v5 = -[TPSSerializableObject initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("stop"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (NSNumber *)v6;

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("color"));
    v8 = objc_claimAutoreleasedReturnValue();
    colorString = v5->_colorString;
    v5->_colorString = (NSString *)v8;

  }
  return v5;
}

- (TPSGradientStop)initWithColorString:(id)a3
{
  id v5;
  TPSGradientStop *v6;
  TPSGradientStop *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSGradientStop;
  v6 = -[TPSGradientStop init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_colorString, a3);

  return v7;
}

- (TPSGradientStop)initWithCoder:(id)a3
{
  id v4;
  TPSGradientStop *v5;
  uint64_t v6;
  NSNumber *location;
  uint64_t v8;
  NSString *colorString;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSGradientStop;
  v5 = -[TPSSerializableObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stop"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v8 = objc_claimAutoreleasedReturnValue();
    colorString = v5->_colorString;
    v5->_colorString = (NSString *)v8;

  }
  return v5;
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
  v8.super_class = (Class)TPSGradientStop;
  v4 = -[TPSSerializableObject copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[TPSGradientStop location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v5);

  -[TPSGradientStop colorString](self, "colorString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorString:", v6);

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
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)TPSGradientStop;
  -[TPSSerializableObject debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSGradientStop location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("stop"), v6);

  -[TPSGradientStop colorString](self, "colorString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPSGradientStop colorString](self, "colorString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("color"), v8);

  }
  return v5;
}

id __30__TPSGradientStop_na_identity__block_invoke()
{
  if (TPSGradientStopColorStringKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSGradientStopColorStringKey_block_invoke_na_once_token_0, &__block_literal_global_19);
  return (id)TPSGradientStopColorStringKey_block_invoke_na_once_object_0;
}

void __30__TPSGradientStop_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __30__TPSGradientStop_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSGradientStopColorStringKey_block_invoke_na_once_object_0;
  TPSGradientStopColorStringKey_block_invoke_na_once_object_0 = v0;

}

id __30__TPSGradientStop_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_24);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_26);
  objc_msgSend(v0, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __30__TPSGradientStop_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "location");
}

uint64_t __30__TPSGradientStop_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "colorString");
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

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setColorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorString, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
