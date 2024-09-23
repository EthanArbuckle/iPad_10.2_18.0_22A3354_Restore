@implementation SSSQLiteQueryDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_entityClass;
  *(_QWORD *)(v5 + 16) = self->_limitCount;
  *(_QWORD *)(v5 + 24) = self->_memoryEntityClass;
  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_orderingClause, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[NSArray copyWithZone:](self->_orderingDirections, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 48) = -[NSArray copyWithZone:](self->_orderingProperties, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 56) = -[SSSQLitePredicate copyWithZone:](self->_predicate, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 64) = self->_returnsDistinctEntities;
  return (id)v5;
}

- (SSSQLitePredicate)predicate
{
  return self->_predicate;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (id)_newSelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4 columns:(id)a5
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT "));
  v10 = v9;
  if (self->_returnsDistinctEntities)
    objc_msgSend(v9, "appendString:", CFSTR("DISTINCT "));
  objc_msgSend(v10, "appendString:", objc_msgSend(a5, "componentsJoinedByString:", CFSTR(", ")));
  objc_msgSend(v10, "appendFormat:", CFSTR(" FROM %@"), -[objc_class databaseTable](self->_entityClass, "databaseTable"));
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = -[SSSQLitePredicate SQLJoinClausesForEntityClass:](self->_predicate, "SQLJoinClausesForEntityClass:", self->_entityClass);
  if (v12)
    objc_msgSend(v11, "unionSet:", v12);
  for (; a4; --a4)
  {
    v13 = -[objc_class joinClauseForProperty:](self->_entityClass, "joinClauseForProperty:", *a3);
    if (v13)
      objc_msgSend(v11, "addObject:", v13);
    ++a3;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v11);
        v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "appendString:", CFSTR(" "));
        objc_msgSend(v10, "appendString:", v18);
      }
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v19 = -[SSSQLitePredicate SQLForEntityClass:](self->_predicate, "SQLForEntityClass:", self->_entityClass);
  if (v19)
  {
    v20 = v19;
    objc_msgSend(v10, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v10, "appendString:", v20);
  }
  v21 = -[NSArray count](self->_orderingProperties, "count");
  if (self->_orderingClause)
  {
    objc_msgSend(v10, "appendString:", CFSTR(" ORDER BY "));
    objc_msgSend(v10, "appendString:", self->_orderingClause);
  }
  else
  {
    v22 = v21;
    if (v21 >= 1)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v24 = 0;
      do
      {
        v25 = -[objc_class disambiguatedSQLForProperty:](self->_entityClass, "disambiguatedSQLForProperty:", -[NSArray objectAtIndex:](self->_orderingProperties, "objectAtIndex:", v24));
        if (objc_msgSend(v23, "length"))
          objc_msgSend(v23, "appendString:", CFSTR(", "));
        objc_msgSend(v23, "appendString:", v25);
        objc_msgSend(v23, "appendString:", CFSTR(" "));
        if (v24 >= -[NSArray count](self->_orderingDirections, "count"))
        {
          v27 = v23;
          v26 = CFSTR("ASC");
        }
        else
        {
          v26 = -[NSArray objectAtIndex:](self->_orderingDirections, "objectAtIndex:", v24);
          v27 = v23;
        }
        objc_msgSend(v27, "appendString:", v26);
        ++v24;
      }
      while (v22 != v24);
      objc_msgSend(v10, "appendString:", CFSTR(" ORDER BY "));
      objc_msgSend(v10, "appendString:", v23);

    }
  }
  if (self->_limitCount)
    objc_msgSend(v10, "appendString:", CFSTR(" LIMIT ?"));
  return v10;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)setOrderingDirections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteQueryDescriptor;
  -[SSSQLiteQueryDescriptor dealloc](&v3, sel_dealloc);
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setOrderingProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setEntityClass:(Class)a3
{
  self->_entityClass = a3;
}

- (void)setMemoryEntityClass:(Class)a3
{
  self->_memoryEntityClass = a3;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (Class)memoryEntityClass
{
  return self->_memoryEntityClass;
}

- (NSString)orderingClause
{
  return self->_orderingClause;
}

- (void)setOrderingClause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)orderingDirections
{
  return self->_orderingDirections;
}

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

@end
