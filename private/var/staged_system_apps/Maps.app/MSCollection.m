@implementation MSCollection

- (BOOL)isLegacyFavoritesCollection
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSCollection identifier](self, "identifier"));
  v5 = objc_msgSend(v4, "isEqual:", v3);

  return v5;
}

@end
