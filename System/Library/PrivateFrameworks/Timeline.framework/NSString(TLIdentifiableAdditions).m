@implementation NSString(TLIdentifiableAdditions)

- (uint64_t)tl_isEqualToIdentifiable:()TLIdentifiableAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(a1, "isEqual:", v4);
  else
    v5 = 0;

  return v5;
}

@end
