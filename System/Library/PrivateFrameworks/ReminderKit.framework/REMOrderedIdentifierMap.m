@implementation REMOrderedIdentifierMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMOrderedIdentifierMap)init
{
  void *v3;
  REMOrderedIdentifierMap *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REMOrderedIdentifierMap initWithOrderedIdentifiers:](self, "initWithOrderedIdentifiers:", v3);

  return v4;
}

- (REMOrderedIdentifierMap)initWithOrderedIdentifiers:(id)a3
{
  id v4;
  REMOrderedIdentifierMap *v5;
  REMOrderedIdentifierMap *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMOrderedIdentifierMap;
  v5 = -[REMOrderedIdentifierMap init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[REMOrderedIdentifierMap setOrderedIdentifiers:](v5, "setOrderedIdentifiers:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMOrderedIdentifierMap orderedIdentifiers](self, "orderedIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("orderedIdentifiers"));

}

- (REMOrderedIdentifierMap)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMOrderedIdentifierMap *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("orderedIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMOrderedIdentifierMap initWithOrderedIdentifiers:](self, "initWithOrderedIdentifiers:", v5);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMOrderedIdentifierMap *v5;
  void *v6;
  void *v7;
  REMOrderedIdentifierMap *v8;

  v5 = [REMOrderedIdentifierMap alloc];
  -[REMOrderedIdentifierMap orderedIdentifiers](self, "orderedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[REMOrderedIdentifierMap initWithOrderedIdentifiers:](v5, "initWithOrderedIdentifiers:", v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  REMOrderedIdentifierMap *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (REMOrderedIdentifierMap *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMOrderedIdentifierMap orderedIdentifiers](self, "orderedIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMOrderedIdentifierMap orderedIdentifiers](v4, "orderedIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);
}

@end
