@implementation SMUpperBoundEta

- (SMUpperBoundEta)initWithMapsUpperBoundEta:(id)a3 crowFliesUpperBoundEta:(id)a4
{
  id v7;
  id v8;
  SMUpperBoundEta *v9;
  id *p_isa;
  SMUpperBoundEta *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)SMUpperBoundEta;
    v9 = -[SMUpperBoundEta init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_mapsUpperBoundEta, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMUpperBoundEta mapsUpperBoundEta](self, "mapsUpperBoundEta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMUpperBoundEta crowFliesUpperBoundEta](self, "crowFliesUpperBoundEta");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mapsUpperBoundEta, %@, crowFliesUpperBoundEta, %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SMUpperBoundEta mapsUpperBoundEta](self, "mapsUpperBoundEta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMUpperBoundEta crowFliesUpperBoundEta](self, "crowFliesUpperBoundEta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SMUpperBoundEta *v4;
  SMUpperBoundEta *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (SMUpperBoundEta *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMUpperBoundEta mapsUpperBoundEta](self, "mapsUpperBoundEta");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMUpperBoundEta mapsUpperBoundEta](v5, "mapsUpperBoundEta");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[SMUpperBoundEta mapsUpperBoundEta](self, "mapsUpperBoundEta");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMUpperBoundEta mapsUpperBoundEta](v5, "mapsUpperBoundEta");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      -[SMUpperBoundEta crowFliesUpperBoundEta](self, "crowFliesUpperBoundEta");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMUpperBoundEta crowFliesUpperBoundEta](v5, "crowFliesUpperBoundEta");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v16 = 1;
      }
      else
      {
        -[SMUpperBoundEta crowFliesUpperBoundEta](self, "crowFliesUpperBoundEta");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMUpperBoundEta crowFliesUpperBoundEta](v5, "crowFliesUpperBoundEta");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

      }
      v11 = v10 & v16;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMUpperBoundEta)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SMUpperBoundEta *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMUpperBoundEtaMapsUpperBoundEtaKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMUpperBoundEtaCrowFliesUpperBoundEtaKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SMUpperBoundEta initWithMapsUpperBoundEta:crowFliesUpperBoundEta:](self, "initWithMapsUpperBoundEta:crowFliesUpperBoundEta:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *mapsUpperBoundEta;
  id v5;

  mapsUpperBoundEta = self->_mapsUpperBoundEta;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mapsUpperBoundEta, CFSTR("__kSMUpperBoundEtaMapsUpperBoundEtaKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_crowFliesUpperBoundEta, CFSTR("__kSMUpperBoundEtaCrowFliesUpperBoundEtaKey"));

}

- (NSDate)mapsUpperBoundEta
{
  return self->_mapsUpperBoundEta;
}

- (NSDate)crowFliesUpperBoundEta
{
  return self->_crowFliesUpperBoundEta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowFliesUpperBoundEta, 0);
  objc_storeStrong((id *)&self->_mapsUpperBoundEta, 0);
}

@end
