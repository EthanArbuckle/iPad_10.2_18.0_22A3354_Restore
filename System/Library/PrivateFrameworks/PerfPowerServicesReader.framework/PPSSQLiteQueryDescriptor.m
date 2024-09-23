@implementation PPSSQLiteQueryDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setEntity:", self->_entity);
  v6 = -[PPSSQLitePredicate copyWithZone:](self->_predicate, "copyWithZone:", a3);
  objc_msgSend(v5, "setPredicate:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_groupByProperties, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupByProperties:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_orderByProperties, "copyWithZone:", a3);
  objc_msgSend(v5, "setOrderByProperties:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_orderByDirections, "copyWithZone:", a3);
  objc_msgSend(v5, "setOrderByDirections:", v9);

  objc_msgSend(v5, "setLimitCount:", self->_limitCount);
  objc_msgSend(v5, "setOffsetCount:", self->_offsetCount);
  objc_msgSend(v5, "setReturnsDistinctEntities:", self->_returnsDistinctEntities);
  return v5;
}

- (PPSSQLiteQueryDescriptor)initWithEntity:(id)a3 predicate:(id)a4
{
  return -[PPSSQLiteQueryDescriptor initWithEntity:predicate:limitCount:offsetCount:](self, "initWithEntity:predicate:limitCount:offsetCount:", a3, a4, 0, 0);
}

- (PPSSQLiteQueryDescriptor)initWithEntity:(id)a3 predicate:(id)a4 limitCount:(unint64_t)a5 offsetCount:(unint64_t)a6
{
  id v11;
  id v12;
  PPSSQLiteQueryDescriptor *v13;
  PPSSQLiteQueryDescriptor *v14;
  uint64_t v15;
  PPSSQLitePredicate *predicate;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PPSSQLiteQueryDescriptor;
  v13 = -[PPSSQLiteQueryDescriptor init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entity, a3);
    v15 = objc_msgSend(v12, "copy");
    predicate = v14->_predicate;
    v14->_predicate = (PPSSQLitePredicate *)v15;

    v14->_limitCount = a5;
    v14->_offsetCount = a6;
  }

  return v14;
}

- (id)_sqlForSelectWithProperties:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *context;
  id v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("SELECT "));
  v4 = MEMORY[0x2494FEED8]();
  if (-[PPSSQLiteQueryDescriptor returnsDistinctEntities](self, "returnsDistinctEntities"))
    objc_msgSend(v45, "appendString:", CFSTR("DISTINCT "));
  context = (void *)v4;
  v5 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v42;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9);
        -[PPSSQLiteQueryDescriptor entity](self, "entity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "disambiguatedSQLForProperty:shouldEscape:", v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "appendString:", v13);

  -[PPSSQLiteQueryDescriptor entity](self, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tableNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "appendFormat:", CFSTR(" FROM '%@'"), v16);

  -[PPSSQLiteQueryDescriptor entity](self, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "joinClause");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    objc_msgSend(v45, "appendFormat:", CFSTR(" %@"), v43, context);
  -[PPSSQLiteQueryDescriptor predicate](self, "predicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteQueryDescriptor entity](self, "entity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sqlForEntity:", v19);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    objc_msgSend(v45, "appendFormat:", CFSTR(" WHERE %@"), v44);
  -[PPSSQLiteQueryDescriptor groupByProperties](self, "groupByProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 >= 1)
  {
    v22 = (void *)objc_opt_new();
    for (i = 0; i != v21; ++i)
    {
      -[PPSSQLiteQueryDescriptor entity](self, "entity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSSQLiteQueryDescriptor groupByProperties](self, "groupByProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "disambiguatedSQLForProperty:shouldEscape:", v26, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "length"))
        objc_msgSend(v22, "appendString:", CFSTR(", "));
      objc_msgSend(v22, "appendFormat:", CFSTR("%@"), v27);

    }
    objc_msgSend(v45, "appendFormat:", CFSTR(" GROUP BY %@"), v22);

  }
  -[PPSSQLiteQueryDescriptor orderByProperties](self, "orderByProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29 >= 1)
  {
    v30 = (void *)objc_opt_new();
    for (j = 0; j != v29; ++j)
    {
      -[PPSSQLiteQueryDescriptor entity](self, "entity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSSQLiteQueryDescriptor orderByProperties](self, "orderByProperties");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", j);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "disambiguatedSQLForProperty:shouldEscape:", v34, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v30, "length"))
        objc_msgSend(v30, "appendString:", CFSTR(", "));
      objc_msgSend(v30, "appendFormat:", CFSTR("%@ "), v35);
      -[PPSSQLiteQueryDescriptor orderByDirections](self, "orderByDirections");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = j < objc_msgSend(v36, "count");

      if (v37)
      {
        -[PPSSQLiteQueryDescriptor orderByDirections](self, "orderByDirections");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", j);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "appendString:", v39);

      }
      else
      {
        objc_msgSend(v30, "appendString:", CFSTR("ASC"));
      }

    }
    objc_msgSend(v45, "appendFormat:", CFSTR(" ORDER BY %@"), v30);

  }
  if (-[PPSSQLiteQueryDescriptor limitCount](self, "limitCount"))
    objc_msgSend(v45, "appendString:", CFSTR(" LIMIT ? "));
  if (-[PPSSQLiteQueryDescriptor offsetCount](self, "offsetCount"))
    objc_msgSend(v45, "appendString:", CFSTR(" OFFSET ?"));

  objc_autoreleasePoolPop(context);
  return v45;
}

- (PPSSQLiteEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (PPSSQLitePredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)groupByProperties
{
  return self->_groupByProperties;
}

- (void)setGroupByProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)orderByProperties
{
  return self->_orderByProperties;
}

- (void)setOrderByProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)orderByDirections
{
  return self->_orderByDirections;
}

- (void)setOrderByDirections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)limitCount
{
  return self->_limitCount;
}

- (void)setLimitCount:(unint64_t)a3
{
  self->_limitCount = a3;
}

- (unint64_t)offsetCount
{
  return self->_offsetCount;
}

- (void)setOffsetCount:(unint64_t)a3
{
  self->_offsetCount = a3;
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderByDirections, 0);
  objc_storeStrong((id *)&self->_orderByProperties, 0);
  objc_storeStrong((id *)&self->_groupByProperties, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
