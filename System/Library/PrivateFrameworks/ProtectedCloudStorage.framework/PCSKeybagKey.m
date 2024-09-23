@implementation PCSKeybagKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PCSKeybagKey data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("data"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[PCSKeybagKey flags](self, "flags"), CFSTR("flags"));
}

- (PCSKeybagKey)initWithCoder:(id)a3
{
  id v4;
  PCSKeybagKey *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCSKeybagKey;
  v5 = -[PCSKeybagKey init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSKeybagKey setData:](v5, "setData:", v6);

    -[PCSKeybagKey setFlags:](v5, "setFlags:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flags")));
  }

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(int64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
