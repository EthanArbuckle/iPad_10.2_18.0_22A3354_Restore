@implementation FPProcessGroup

- (BOOL)isEqual:(id)a3
{
  FPProcessGroup *v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = (FPProcessGroup *)a3;
  if (-[FPProcessGroup isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(FPProcessGroupMinimal)))
  {
    v7.receiver = self;
    v7.super_class = (Class)FPProcessGroup;
    v5 = -[FPProcessGroupMinimal isEqual:](&v7, "isEqual:", v4);
  }
  else
  {
    v5 = self == v4;
  }

  return v5;
}

- (void)addProcess:(id)a3
{
  id v3;

  v3 = a3;
  _os_crash("Attempt to add process to immutable FPProcessGroup");
  __break(1u);
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (NSDictionary)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (unsigned)categoriesRefcount
{
  return self->_categoriesRefcount;
}

- (void)setCategoriesRefcount:(unsigned int)a3
{
  self->_categoriesRefcount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
