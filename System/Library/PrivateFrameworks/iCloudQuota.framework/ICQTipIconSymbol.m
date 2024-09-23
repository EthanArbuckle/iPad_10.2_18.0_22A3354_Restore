@implementation ICQTipIconSymbol

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("id: %@, path: %@ color: %@"), self->_id, self->_path, self->_systemColorName);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQTipIconSymbol *v4;

  v4 = objc_alloc_init(ICQTipIconSymbol);
  -[ICQTipIconSymbol setId:](v4, "setId:", self->_id);
  -[ICQTipIconSymbol setPath:](v4, "setPath:", self->_path);
  -[ICQTipIconSymbol setSystemColorName:](v4, "setSystemColorName:", self->_systemColorName);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *id;
  id v5;

  id = self->_id;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", id, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_path, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemColorName, CFSTR("systemColorName"));

}

- (ICQTipIconSymbol)initWithCoder:(id)a3
{
  id v4;
  ICQTipIconSymbol *v5;
  uint64_t v6;
  NSString *id;
  uint64_t v8;
  NSString *path;
  uint64_t v10;
  NSString *systemColorName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQTipIconSymbol;
  v5 = -[ICQTipIconSymbol init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    id = v5->_id;
    v5->_id = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v8 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemColorName"));
    v10 = objc_claimAutoreleasedReturnValue();
    systemColorName = v5->_systemColorName;
    v5->_systemColorName = (NSString *)v10;

  }
  return v5;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (void)setSystemColorName:(id)a3
{
  objc_storeStrong((id *)&self->_systemColorName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemColorName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
