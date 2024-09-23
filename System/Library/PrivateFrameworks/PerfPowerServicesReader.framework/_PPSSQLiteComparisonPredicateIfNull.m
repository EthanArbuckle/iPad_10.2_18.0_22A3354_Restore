@implementation _PPSSQLiteComparisonPredicateIfNull

- (_PPSSQLiteComparisonPredicateIfNull)initWithProperty:(id)a3 ifPropertyIsNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _PPSSQLiteComparisonPredicateIfNull *v13;
  id v14;
  id ifPropertyIsNullValue;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PPSSQLiteComparisonPredicateIfNull;
  v13 = -[PPSSQLiteComparisonPredicate initWithProperty:value:comparisonType:](&v17, sel_initWithProperty_value_comparisonType_, v10, v12, a6);
  if (v13)
  {
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_2572DE960))
      v14 = (id)objc_msgSend(v11, "copy");
    else
      v14 = v11;
    ifPropertyIsNullValue = v13->_ifPropertyIsNullValue;
    v13->_ifPropertyIsNullValue = v14;

  }
  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PPSSQLiteComparisonPredicateIfNull;
  v3 = -[PPSSQLiteComparisonPredicate hash](&v7, sel_hash);
  -[_PPSSQLiteComparisonPredicateIfNull ifPropertyIsNullValue](self, "ifPropertyIsNullValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  id ifPropertyIsNullValue;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PPSSQLiteComparisonPredicateIfNull;
  if (-[PPSSQLiteComparisonPredicate isEqual:](&v8, sel_isEqual_, v4))
  {
    ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
    if (ifPropertyIsNullValue == (id)v4[4])
      v6 = 1;
    else
      v6 = objc_msgSend(ifPropertyIsNullValue, "isEqual:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)sqlForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PPSSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disambiguatedSQLForProperty:shouldEscape:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[PPSSQLiteComparisonPredicate _comparisonTypeString](self, "_comparisonTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(IFNULL(%@, ?) %@ ?)"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id ifPropertyIsNullValue;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PPSSQLitePropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
  -[PPSSQLiteComparisonPredicate _comparisonTypeString](self, "_comparisonTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteComparisonPredicate value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("'(%@, %@)' %@ %@"), v4, ifPropertyIsNullValue, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ifPropertyIsNullValue
{
  return self->_ifPropertyIsNullValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ifPropertyIsNullValue, 0);
}

@end
