@implementation STUserID

- (STUserID)initWithDSID:(id)a3
{
  id v3;
  STUserID *v4;
  uint64_t v5;
  NSNumber *dsid;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUserID;
  v3 = a3;
  v4 = -[STUserID init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  dsid = v4->_dsid;
  v4->_dsid = (NSNumber *)v5;

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[STUserID dsid](self, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ { DSID: %@ }>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (STUserID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STUserID *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[STUserID initWithDSID:](self, "initWithDSID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STUserID dsid](self, "dsid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dsid"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDSID:", self->_dsid);
}

- (BOOL)isEqual:(id)a3
{
  STUserID *v4;
  BOOL v5;

  v4 = (STUserID *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[STUserID isEqualToUserID:](self, "isEqualToUserID:", v4);
  }

  return v5;
}

- (BOOL)isEqualToUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3 == self)
    return 1;
  v4 = a3;
  -[STUserID dsid](self, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToNumber:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[STUserID dsid](self, "dsid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
