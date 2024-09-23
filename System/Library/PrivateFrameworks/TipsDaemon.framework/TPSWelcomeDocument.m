@implementation TPSWelcomeDocument

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSWelcomeDocument;
  v4 = -[TPSDocument copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TPSWelcomeDocument majorVersion](self, "majorVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMajorVersion:", v5);

  return v4;
}

- (TPSWelcomeDocument)initWithCoder:(id)a3
{
  id v4;
  TPSWelcomeDocument *v5;
  uint64_t v6;
  NSString *majorVersion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSWelcomeDocument;
  v5 = -[TPSDocument initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("majorVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    majorVersion = v5->_majorVersion;
    v5->_majorVersion = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSWelcomeDocument;
  v4 = a3;
  -[TPSDocument encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSWelcomeDocument majorVersion](self, "majorVersion", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("majorVersion"));

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v8.receiver = self;
  v8.super_class = (Class)TPSWelcomeDocument;
  -[TPSDocument debugDescription](&v8, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSWelcomeDocument majorVersion](self, "majorVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@"), CFSTR("majorVersion"), v6);

  return v5;
}

- (NSString)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_majorVersion, 0);
}

@end
