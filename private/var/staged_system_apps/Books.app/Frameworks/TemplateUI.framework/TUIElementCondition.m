@implementation TUIElementCondition

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  id v10;

  var0 = a4.var0;
  v10 = a6;
  v8 = a5;
  v9 = objc_msgSend(v8, "letDefinitionWithNameAttribute:valueAttribute:node:", 137, 45, var0);
  LODWORD(var0) = objc_msgSend(v8, "closureForNode:", var0);

  objc_msgSend(v10, "defineLet:closure:", v9, var0);
}

@end
