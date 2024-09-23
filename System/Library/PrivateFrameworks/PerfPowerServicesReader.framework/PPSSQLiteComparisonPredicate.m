@implementation PPSSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7;
  id v8;
  PPSSQLiteComparisonPredicate *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[PPSSQLiteComparisonPredicate initWithProperty:value:comparisonType:]([PPSSQLiteComparisonPredicate alloc], "initWithProperty:value:comparisonType:", v7, v8, a5);

  return v9;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4 escapeCharacter:(id)a5
{
  id v7;
  id v8;
  id v9;
  _PPSSQLiteComparisonPredicateLikeWithEscape *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[_PPSSQLiteComparisonPredicateLikeWithEscape initWithProperty:value:escapeCharacter:]([_PPSSQLiteComparisonPredicateLikeWithEscape alloc], "initWithProperty:value:escapeCharacter:", v7, v8, v9);

  return v10;
}

+ (id)predicateWithProperty:(id)a3 likePattern:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v8 = objc_msgSend(v6, "length");
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = ___ZL43_stringEscapingGlobPatternsForLikePredicateP8NSString_block_invoke;
  v15 = &unk_25142CD70;
  v17 = v18;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, &v12);

  _Block_object_dispose(v18, 8);
  +[PPSSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](PPSSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v5, v9, CFSTR("~"), v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateWithProperty:(id)a3 beginsWithString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  _stringEscapingSpecialCharactersForLikePredicate((NSString *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%%"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](PPSSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v5, v8, CFSTR("~"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateWithProperty:(id)a3 endsWithString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  _stringEscapingSpecialCharactersForLikePredicate((NSString *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%%%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](PPSSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v5, v8, CFSTR("~"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateWithProperty:(id)a3 containsString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  _stringEscapingSpecialCharactersForLikePredicate((NSString *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%%%@%%"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](PPSSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v5, v8, CFSTR("~"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PPSSQLitePropertyPredicate property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PPSSQLiteComparisonPredicate value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSSQLiteComparisonPredicate;
  if (-[PPSSQLitePropertyPredicate isEqual:](&v12, sel_isEqual_, v4)
    && (v5 = -[PPSSQLiteComparisonPredicate comparisonType](self, "comparisonType"),
        v5 == objc_msgSend(v4, "comparisonType")))
  {
    -[PPSSQLiteComparisonPredicate value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[PPSSQLiteComparisonPredicate value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  void *v7;
  char isKindOfClass;
  int v9;
  id v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  int v19;
  char v20;
  int v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  int v25;
  double v26;
  void *v27;
  char v28;
  int v29;
  double v30;
  void *v31;

  -[PPSSQLiteComparisonPredicate value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = *a4;
    -[PPSSQLiteComparisonPredicate value](self, "value");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    if (v11)
      v12 = (const char *)v11;
    else
      v12 = "";
    sqlite3_bind_text(a3, v9, v12, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_18;
  }
  -[PPSSQLiteComparisonPredicate value](self, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  -[PPSSQLiteComparisonPredicate value](self, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    v17 = objc_retainAutorelease(v15);
    v18 = (const char *)objc_msgSend(v17, "objCType");

    if (!strcmp(v18, "d") || !strcmp(v18, "f"))
    {
      v25 = *a4;
      -[PPSSQLiteComparisonPredicate value](self, "value");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      sqlite3_bind_double(a3, v25, v26);
    }
    else
    {
      v19 = *a4;
      -[PPSSQLiteComparisonPredicate value](self, "value");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      sqlite3_bind_int64(a3, v19, objc_msgSend(v10, "longLongValue"));
    }
    goto LABEL_18;
  }
  objc_opt_class();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0)
  {
    v21 = *a4;
    -[PPSSQLiteComparisonPredicate value](self, "value");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v10, "bytes");
    if (v22)
      v23 = (const char *)v22;
    else
      v23 = "";
    -[PPSSQLiteComparisonPredicate value](self, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(a3, v21, v23, objc_msgSend(v24, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_18;
  }
  -[PPSSQLiteComparisonPredicate value](self, "value");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = objc_opt_isKindOfClass();

  if ((v28 & 1) != 0)
  {
    v29 = *a4;
    -[PPSSQLiteComparisonPredicate value](self, "value");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a3, v29, v30);
LABEL_18:

    goto LABEL_19;
  }
  -[PPSSQLiteComparisonPredicate value](self, "value");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
    sqlite3_bind_null(a3, *a4);
LABEL_19:
  ++*a4;
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
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@ %@ ?)"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PPSSQLitePropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteComparisonPredicate _comparisonTypeString](self, "_comparisonTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("'%@' %@ %@"), v4, v5, self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PPSSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8;
  id v9;
  PPSSQLiteComparisonPredicate *v10;
  PPSSQLiteComparisonPredicate *v11;
  uint64_t v12;
  NSString *property;
  id v14;
  id value;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PPSSQLiteComparisonPredicate;
  v10 = -[PPSSQLiteComparisonPredicate init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_comparisonType = a5;
    v12 = objc_msgSend(v8, "copy");
    property = v11->super._property;
    v11->super._property = (NSString *)v12;

    if (objc_msgSend(v9, "conformsToProtocol:", &unk_2572DE960))
      v14 = (id)objc_msgSend(v9, "copy");
    else
      v14 = v9;
    value = v11->_value;
    v11->_value = v14;

  }
  return v11;
}

- (id)_comparisonTypeString
{
  int64_t v2;

  v2 = -[PPSSQLiteComparisonPredicate comparisonType](self, "comparisonType");
  if ((unint64_t)(v2 - 1) > 6)
    return 0;
  else
    return off_25142CD90[v2 - 1];
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
