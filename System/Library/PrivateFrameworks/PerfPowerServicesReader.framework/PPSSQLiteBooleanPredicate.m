@implementation PPSSQLiteBooleanPredicate

+ (id)truePredicate
{
  _BYTE *v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[8] = 1;
  return v2;
}

+ (id)falsePredicate
{
  _BYTE *v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[8] = 0;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPSSQLiteBooleanPredicate;
  if (-[PPSSQLitePredicate isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[PPSSQLiteBooleanPredicate BOOLeanValue](self, "BOOLeanValue");
    v6 = v5 ^ objc_msgSend(v4, "BOOLeanValue") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)sqlForEntity:(id)a3
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%d)"), -[PPSSQLiteBooleanPredicate BOOLeanValue](self, "BOOLeanValue", a3));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

@end
