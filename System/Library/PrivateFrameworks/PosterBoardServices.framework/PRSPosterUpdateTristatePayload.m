@implementation PRSPosterUpdateTristatePayload

- (PRSPosterUpdateTristatePayload)initWithState:(id)a3
{
  id v4;
  PRSPosterUpdateTristatePayload *v5;
  uint64_t v6;
  NSNumber *tristate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateTristatePayload;
  v5 = -[PRSPosterUpdatePayload _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tristate = v5->_tristate;
    v5->_tristate = (NSNumber *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithState:", self->_tristate);
}

- (PRSPosterUpdateTristatePayload)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdateTristatePayload *v5;
  void *v6;
  uint64_t v7;
  NSNumber *tristate;

  v4 = a3;
  v5 = -[PRSPosterUpdatePayload _init](self, "_init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_tristate"));
    v7 = objc_claimAutoreleasedReturnValue();
    tristate = v5->_tristate;
    v5->_tristate = (NSNumber *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_tristate, CFSTR("_tristate"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return (id)-[NSNumber copy](self->_tristate, "copy");
}

- (NSNumber)tristate
{
  return self->_tristate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tristate, 0);
}

@end
