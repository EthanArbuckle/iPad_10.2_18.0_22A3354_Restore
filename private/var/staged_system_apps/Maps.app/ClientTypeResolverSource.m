@implementation ClientTypeResolverSource

- (id)knownTypes
{
  return &__NSArray0__struct;
}

- (BOOL)hasObjectWithType:(int)a3
{
  return 0;
}

- (BOOL)typeIsValid:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverSource knownTypes](self, "knownTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

@end
