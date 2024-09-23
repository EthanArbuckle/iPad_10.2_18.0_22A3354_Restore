@implementation SFNotificationError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[SFNotificationError errorDescription](self, "errorDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setErrorDescription:", v6);

  }
  return v4;
}

- (SFNotificationError)initWithCoder:(id)a3
{
  id v4;
  SFNotificationError *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFNotificationError;
  v5 = -[SFNotificationError init](&v8, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *errorDescription;

  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(a3, "encodeObject:forKey:", errorDescription, CFSTR("ed"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SFNotificationError <D=\"%@\">"), self->_errorDescription);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end
