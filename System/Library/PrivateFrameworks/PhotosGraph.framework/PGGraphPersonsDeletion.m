@implementation PGGraphPersonsDeletion

- (PGGraphPersonsDeletion)initWithPersonLocalIdentifiers:(id)a3
{
  id v5;
  PGGraphPersonsDeletion *v6;
  PGGraphPersonsDeletion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphPersonsDeletion;
  v6 = -[PGGraphPersonsDeletion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personLocalIdentifiers, a3);

  return v7;
}

- (unint64_t)type
{
  return 5;
}

- (unint64_t)changeCount
{
  return -[NSSet count](self->_personLocalIdentifiers, "count");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPersonsDeletion;
  -[PGGraphChange description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, personLocalIdentifiers (%ld): %@"), v4, -[NSSet count](self->_personLocalIdentifiers, "count"), self->_personLocalIdentifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

@end
