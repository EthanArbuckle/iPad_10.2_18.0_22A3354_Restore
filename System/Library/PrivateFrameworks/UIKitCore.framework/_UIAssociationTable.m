@implementation _UIAssociationTable

- (BOOL)hasLeftValuesForRightValue:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_rightToLeftHashTables, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)leftValuesForRightValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSMapTable objectForKey:](self->_rightToLeftHashTables, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (BOOL)isEmpty
{
  return -[NSMapTable count](self->_leftToRightHashTables, "count") == 0;
}

- (void)unregisterAssociationWithLeftValue:(id)a3 rightValue:(id)a4
{
  NSMapTable *leftToRightHashTables;
  id v7;
  id v8;

  leftToRightHashTables = self->_leftToRightHashTables;
  v7 = a4;
  v8 = a3;
  unregisterObjectFromMapOfHashTables(leftToRightHashTables, v8, v7);
  unregisterObjectFromMapOfHashTables(self->_rightToLeftHashTables, v7, v8);

}

- (BOOL)hasRightValuesForLeftValue:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_leftToRightHashTables, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)registerAssociationWithLeftValue:(id)a3 rightValue:(id)a4
{
  NSMapTable *leftToRightHashTables;
  id v7;
  id v8;

  leftToRightHashTables = self->_leftToRightHashTables;
  v7 = a4;
  v8 = a3;
  registerObjectInMapOfHashTables(leftToRightHashTables, v8, v7);
  registerObjectInMapOfHashTables(self->_rightToLeftHashTables, v7, v8);

}

- (id)rightValueEnumerableForLeftValue:(id)a3
{
  return -[NSMapTable objectForKey:](self->_leftToRightHashTables, "objectForKey:", a3);
}

- (_UIAssociationTable)initWithLeftValueOptions:(unint64_t)a3 rightValueOptions:(unint64_t)a4
{
  _UIAssociationTable *v6;
  uint64_t v7;
  NSMapTable *leftToRightHashTables;
  uint64_t v9;
  NSMapTable *rightToLeftHashTables;
  _UIAssociationTable *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIAssociationTable;
  v6 = -[_UIAssociationTable init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", a3, 512, 16);
    leftToRightHashTables = v6->_leftToRightHashTables;
    v6->_leftToRightHashTables = (NSMapTable *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", a4, 512, 16);
    rightToLeftHashTables = v6->_rightToLeftHashTables;
    v6->_rightToLeftHashTables = (NSMapTable *)v9;

    v11 = v6;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p left->right=%@, right->left=%@>"), v5, self, self->_leftToRightHashTables, self->_rightToLeftHashTables);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)leftValues
{
  return NSAllMapTableKeys(self->_leftToRightHashTables);
}

- (id)rightValues
{
  return NSAllMapTableKeys(self->_rightToLeftHashTables);
}

- (id)leftValueEnumerable
{
  return self->_leftToRightHashTables;
}

- (id)rightValueEnumerable
{
  return self->_rightToLeftHashTables;
}

- (id)rightValuesForLeftValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSMapTable objectForKey:](self->_leftToRightHashTables, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (id)leftValueEnumerableForRightValue:(id)a3
{
  return -[NSMapTable objectForKey:](self->_rightToLeftHashTables, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightToLeftHashTables, 0);
  objc_storeStrong((id *)&self->_leftToRightHashTables, 0);
}

@end
