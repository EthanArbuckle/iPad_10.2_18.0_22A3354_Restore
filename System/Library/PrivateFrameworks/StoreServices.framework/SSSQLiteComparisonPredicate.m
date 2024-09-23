@implementation SSSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  _QWORD *v8;
  id v9;

  v8 = objc_alloc_init((Class)objc_opt_class());
  v8[2] = a5;
  v8[1] = objc_msgSend(a3, "copy");
  if (objc_msgSend(a4, "conformsToProtocol:", &unk_1EE6724F0))
    v9 = (id)objc_msgSend(a4, "copy");
  else
    v9 = a4;
  v8[3] = v9;
  return v8;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  const char *v8;
  int v9;
  double v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sqlite3_bind_text(a3, *a4, (const char *)objc_msgSend(self->_value, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (const char *)objc_msgSend(self->_value, "objCType");
      if (!strcmp(v8, "d") || !strcmp(v8, "f"))
      {
        v9 = *a4;
        objc_msgSend(self->_value, "doubleValue");
        sqlite3_bind_double(a3, v9, v10);
      }
      else
      {
        sqlite3_bind_int64(a3, *a4, objc_msgSend(self->_value, "longLongValue"));
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSSQLitePredicate.m"), 145, CFSTR("Unsupported predicate value: %@"), self->_value);
    }
  }
  ++*a4;
}

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v4;

  v4 = -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", -[SSSQLitePropertyPredicate property](self, "property"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ ?"), v4, -[SSSQLiteComparisonPredicate _comparisonTypeString](self, "_comparisonTypeString"));
}

- (id)_comparisonTypeString
{
  int64_t v4;

  v4 = -[SSSQLiteComparisonPredicate comparisonType](self, "comparisonType");
  if ((unint64_t)(v4 - 1) < 7)
    return off_1E47BEB88[v4 - 1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSSQLitePredicate.m"), 182, CFSTR("Invalid comparison type: %ld"), self->_comparisonType);
  return 0;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a4);
  v7 = (void *)objc_msgSend(a1, "predicateWithProperty:equalToValue:", a3, v6);

  return v7;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteComparisonPredicate;
  -[SSSQLitePropertyPredicate dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](-[SSSQLitePropertyPredicate property](self, "property"), "hash");
  return objc_msgSend(-[SSSQLiteComparisonPredicate value](self, "value"), "hash") + v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSSQLiteComparisonPredicate;
  v5 = -[SSSQLitePropertyPredicate isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    v6 = -[SSSQLiteComparisonPredicate comparisonType](self, "comparisonType");
    if (v6 == objc_msgSend(a3, "comparisonType"))
    {
      v7 = -[SSSQLiteComparisonPredicate value](self, "value");
      if (v7 == (id)objc_msgSend(a3, "value"))
        LOBYTE(v5) = 1;
      else
        LOBYTE(v5) = objc_msgSend(-[SSSQLiteComparisonPredicate value](self, "value"), "isEqual:", objc_msgSend(a3, "value"));
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)value
{
  return self->_value;
}

@end
