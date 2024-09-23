@implementation ICQTipIcon

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type: %@"), self->_type);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQTipIcon *v4;

  v4 = objc_alloc_init(ICQTipIcon);
  -[ICQTipIcon setType:](v4, "setType:", self->_type);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_type, CFSTR("type"));
}

- (ICQTipIcon)initWithCoder:(id)a3
{
  id v4;
  ICQTipIcon *v5;
  uint64_t v6;
  NSString *type;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQTipIcon;
  v5 = -[ICQTipIcon init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

  }
  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
