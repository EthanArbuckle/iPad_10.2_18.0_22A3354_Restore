@implementation PGGraphPropertylessEdge

- (BOOL)hasProperties:(id)a3
{
  return objc_msgSend(a3, "count") == 0;
}

- (id)propertyDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)hasProperties
{
  return 0;
}

- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  PGMethodForbiddenException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

@end
