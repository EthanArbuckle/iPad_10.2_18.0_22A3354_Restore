@implementation SSSQLitePropertyPredicate

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  id result;

  result = (id)-[objc_class joinClauseForProperty:](a3, "joinClauseForProperty:", self->_property);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", result);
  return result;
}

- (NSString)property
{
  return self->_property;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSQLitePropertyPredicate;
  -[SSSQLitePropertyPredicate dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSQLitePropertyPredicate;
  v3 = -[SSSQLitePredicate hash](&v5, sel_hash);
  return (unint64_t)v3 + -[NSString hash](-[SSSQLitePropertyPredicate property](self, "property"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSSQLitePropertyPredicate;
  v5 = -[SSSQLitePredicate isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    v6 = -[SSSQLitePropertyPredicate property](self, "property");
    if (v6 == (NSString *)objc_msgSend(a3, "property"))
      LOBYTE(v5) = 1;
    else
      LOBYTE(v5) = -[NSString isEqual:](-[SSSQLitePropertyPredicate property](self, "property"), "isEqual:", objc_msgSend(a3, "property"));
  }
  return v5;
}

@end
