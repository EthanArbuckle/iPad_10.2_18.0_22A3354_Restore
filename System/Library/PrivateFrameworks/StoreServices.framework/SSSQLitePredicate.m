@implementation SSSQLitePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return 0;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return 0;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

@end
