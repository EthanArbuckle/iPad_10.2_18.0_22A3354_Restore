@implementation SUScanResults

- (SUScanResults)initWithPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4
{
  id v6;
  id v7;
  SUScanResults *v8;
  SUScanResults *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUScanResults;
  v8 = -[SUScanResults init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SUScanResults setPreferredDescriptor:](v8, "setPreferredDescriptor:", v6);
    -[SUScanResults setAlternateDescriptor:](v9, "setAlternateDescriptor:", v7);
  }

  return v9;
}

- (id)latestUpdate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[SUScanResults preferredDescriptor](self, "preferredDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[SUScanResults alternateDescriptor](self, "alternateDescriptor"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    -[SUScanResults preferredDescriptor](self, "preferredDescriptor");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[SUScanResults alternateDescriptor](self, "alternateDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[SUScanResults preferredDescriptor](self, "preferredDescriptor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "productBuildVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUScanResults alternateDescriptor](self, "alternateDescriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "productBuildVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "compare:options:", v10, 64) == -1)
          -[SUScanResults alternateDescriptor](self, "alternateDescriptor");
        else
          -[SUScanResults preferredDescriptor](self, "preferredDescriptor");
        v12 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v12;
      }
    }
  }
  else
  {
    -[SUScanResults alternateDescriptor](self, "alternateDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n            Preferred Descriptor: %@\n            Alternate Descriptor: %@\n"), self->_preferredDescriptor, self->_alternateDescriptor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUScanResults)initWithCoder:(id)a3
{
  id v4;
  SUScanResults *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScanResults;
  v5 = -[SUScanResults init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreferredDescriptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanResults setPreferredDescriptor:](v5, "setPreferredDescriptor:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AlternateDescriptor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanResults setAlternateDescriptor:](v5, "setAlternateDescriptor:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUScanResults preferredDescriptor](self, "preferredDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PreferredDescriptor"));

  -[SUScanResults alternateDescriptor](self, "alternateDescriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("AlternateDescriptor"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SUScanResults *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(SUScanResults);
  -[SUScanResults preferredDescriptor](self, "preferredDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanResults setPreferredDescriptor:](v4, "setPreferredDescriptor:", v5);

  -[SUScanResults alternateDescriptor](self, "alternateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanResults setAlternateDescriptor:](v4, "setAlternateDescriptor:", v6);

  return v4;
}

- (SUDescriptor)preferredDescriptor
{
  return self->_preferredDescriptor;
}

- (void)setPreferredDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_preferredDescriptor, a3);
}

- (SUDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void)setAlternateDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_alternateDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredDescriptor, 0);
}

@end
