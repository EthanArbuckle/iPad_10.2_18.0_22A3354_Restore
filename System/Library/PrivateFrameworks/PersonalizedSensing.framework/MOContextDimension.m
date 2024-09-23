@implementation MOContextDimension

+ (id)fromBiome:(id)a3
{
  id v3;
  MOContextDimension *v4;
  void *v5;
  MOContextDimension *v6;

  v3 = a3;
  v4 = [MOContextDimension alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MOContextDimension initWithName:](v4, "initWithName:", v5);
  return v6;
}

- (MOContextDimension)initWithName:(id)a3
{
  id v5;
  MOContextDimension *v6;
  MOContextDimension *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextDimension;
  v6 = -[MOContextDimension init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queries, CFSTR("queries"));

}

- (MOContextDimension)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOContextDimension *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *queries;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextDimension initWithName:](self, "initWithName:", v5);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("queries"));
    v10 = objc_claimAutoreleasedReturnValue();
    queries = v6->_queries;
    v6->_queries = (NSArray *)v10;

  }
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("name, %@, queries, %@"), self->_name, self->_queries);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  char v6;
  NSString *name;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());
    name = self->_name;
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(name) = -[NSString isEqual:](name, "isEqual:", v8);
    v9 = v6 & name;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextDimension *v4;
  void *v5;
  MOContextDimension *v6;
  void *v7;

  v4 = [MOContextDimension alloc];
  -[MOContextDimension name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextDimension initWithName:](v4, "initWithName:", v5);

  -[MOContextDimension queries](self, "queries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextDimension setQueries:](v6, "setQueries:", v7);

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
