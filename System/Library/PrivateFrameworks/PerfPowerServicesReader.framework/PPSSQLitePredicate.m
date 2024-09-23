@implementation PPSSQLitePredicate

- (id)sqlForEntity:(id)a3
{
  return 0;
}

- (id)sqlJoinClausesForEntity:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

@end
