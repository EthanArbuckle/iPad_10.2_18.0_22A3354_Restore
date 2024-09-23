@implementation SSSQLiteNullPredicate

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  _BYTE *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 0;
  *((_QWORD *)v4 + 1) = objc_msgSend(a3, "copy");
  return v4;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  _BYTE *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 1;
  *((_QWORD *)v4 + 1) = objc_msgSend(a3, "copy");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSSQLiteNullPredicate;
  v5 = -[SSSQLitePropertyPredicate isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    v6 = -[SSSQLiteNullPredicate matchesNull](self, "matchesNull");
    LOBYTE(v5) = v6 ^ objc_msgSend(a3, "matchesNull") ^ 1;
  }
  return v5;
}

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;

  v4 = -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", -[SSSQLitePropertyPredicate property](self, "property"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[SSSQLiteNullPredicate matchesNull](self, "matchesNull");
  v7 = CFSTR("IS NOT NULL");
  if (v6)
    v7 = CFSTR("IS NULL");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v4, v7);
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end
