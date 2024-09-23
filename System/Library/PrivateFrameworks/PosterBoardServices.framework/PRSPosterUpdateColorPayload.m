@implementation PRSPosterUpdateColorPayload

- (PRSPosterUpdateColorPayload)initWithColor:(id)a3
{
  id v4;
  PRSPosterUpdateColorPayload *v5;
  uint64_t v6;
  BSColor *color;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateColorPayload;
  v5 = -[PRSPosterUpdatePayload _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    color = v5->_color;
    v5->_color = (BSColor *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithColor:", self->_color);
}

- (PRSPosterUpdateColorPayload)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdateColorPayload *v5;
  void *v6;
  uint64_t v7;
  BSColor *color;

  v4 = a3;
  v5 = -[PRSPosterUpdatePayload _init](self, "_init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_color"));
    v7 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (BSColor *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_color, CFSTR("_color"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return (id)-[BSColor copy](self->_color, "copy");
}

- (BSColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
