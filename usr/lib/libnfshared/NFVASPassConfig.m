@implementation NFVASPassConfig

+ (id)passConfigWithMode:(int64_t)a3 passIdentifier:(id)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  v6 = (_QWORD *)objc_opt_new();
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    v8 = (void *)v6[2];
    v6[2] = v7;

    v6[1] = a3;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passIdentifier;
  id v5;

  passIdentifier = self->_passIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passIdentifier, CFSTR("passIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vasMode, CFSTR("vasMode"));

}

- (NFVASPassConfig)initWithCoder:(id)a3
{
  id v4;
  NFVASPassConfig *v5;
  uint64_t v6;
  NSString *passIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFVASPassConfig;
  v5 = -[NFVASPassConfig init](&v9, sel_init);
  if (v5)
  {
    v5->_vasMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vasMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_passIdentifier, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v5[1] = self->_vasMode;
  }
  return v5;
}

- (int64_t)vasMode
{
  return self->_vasMode;
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

@end
