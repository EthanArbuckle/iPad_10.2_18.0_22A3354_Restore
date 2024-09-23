@implementation PGGraphPersonChange

- (PGGraphPersonChange)initWithPersonLocalIdentifier:(id)a3 propertyNames:(id)a4
{
  id v7;
  id v8;
  PGGraphPersonChange *v9;
  PGGraphPersonChange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPersonChange;
  v9 = -[PGGraphPersonChange init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v10->_propertyNames, a4);
  }

  return v10;
}

- (PGGraphPersonChange)initWithPersonLocalIdentifier:(id)a3 contactIdentifier:(id)a4 propertyNames:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGGraphPersonChange *v12;
  PGGraphPersonChange *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphPersonChange;
  v12 = -[PGGraphPersonChange init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v13->_contactIdentifier, a4);
    objc_storeStrong((id *)&v13->_propertyNames, a5);
  }

  return v13;
}

- (unint64_t)type
{
  return 6;
}

- (void)mergeChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *propertyNames;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "personLocalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    objc_msgSend(v5, "length");
  v6 = (void *)-[NSSet mutableCopy](self->_propertyNames, "mutableCopy");
  objc_msgSend(v10, "propertyNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  propertyNames = self->_propertyNames;
  self->_propertyNames = v8;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PGGraphPersonChange;
  -[PGGraphChange description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonChange personLocalIdentifier](self, "personLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonChange contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonChange propertyNames](self, "propertyNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ person local identifier: %@, contact identifier: %@, propertyNames: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSSet)propertyNames
{
  return self->_propertyNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNames, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

@end
