@implementation TUCallDTMFUpdate

- (TUCallDTMFUpdate)initWithDigits:(id)a3
{
  id v4;
  TUCallDTMFUpdate *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSString *digits;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCallDTMFUpdate;
  v5 = -[TUCallDTMFUpdate init](&v11, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUCallDTMFUpdate initWithDigits:]", CFSTR("digits"));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v8 = objc_msgSend(v4, "copy");
    digits = v5->_digits;
    v5->_digits = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUCallDTMFUpdate digits](self, "digits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p digits=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TUCallDTMFUpdate UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setUUID:", v7);

  -[TUCallDTMFUpdate digits](self, "digits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setDigits:", v9);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCallDTMFUpdate)initWithCoder:(id)a3
{
  id v4;
  TUCallDTMFUpdate *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSString *digits;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCallDTMFUpdate;
  v5 = -[TUCallDTMFUpdate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("digits"));
    v8 = objc_claimAutoreleasedReturnValue();
    digits = v5->_digits;
    v5->_digits = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TUCallDTMFUpdate UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[TUCallDTMFUpdate digits](self, "digits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("digits"));

}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_digits, 0);
}

@end
