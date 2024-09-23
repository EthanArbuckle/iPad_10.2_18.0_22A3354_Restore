@implementation NSMutableDictionary(TRIFunctions)

- (id)tri_setContextValueWithName:()TRIFunctions value:
{
  id v6;

  v6 = a4;
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, a3);
  return v6;
}

@end
