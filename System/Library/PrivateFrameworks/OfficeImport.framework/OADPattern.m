@implementation OADPattern

- (unint64_t)hash
{
  return 0;
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

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end
