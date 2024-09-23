@implementation MFSearchScope

+ (int64_t)indexFromScopeKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("currentMailbox"));
}

+ (id)keyFromScopeIndex:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("currentMailbox");
  else
    return CFSTR("allMailboxes");
}

@end
