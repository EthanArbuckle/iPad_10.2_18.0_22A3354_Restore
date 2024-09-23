@implementation NFCardSessionConfig

+ (id)configWithInitialUIText:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setInitialUIText:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCardSessionConfig)initWithCoder:(id)a3
{
  id v4;
  NFCardSessionConfig *v5;
  uint64_t v6;
  NSString *initialUIText;
  NFCardSessionConfig *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFCardSessionConfig;
  v5 = -[NFCardSessionConfig init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialUIText"));
    v6 = objc_claimAutoreleasedReturnValue();
    initialUIText = v5->_initialUIText;
    v5->_initialUIText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NFCardSessionConfig initialUIText](self, "initialUIText");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("initialUIText"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  -[NFCardSessionConfig initialUIText](self, "initialUIText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialUIText:", v5);

  return v4;
}

- (NSString)initialUIText
{
  return self->_initialUIText;
}

- (void)setInitialUIText:(id)a3
{
  objc_storeStrong((id *)&self->_initialUIText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialUIText, 0);
}

@end
