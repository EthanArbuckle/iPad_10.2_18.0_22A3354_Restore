@implementation TUIElementGlobalsUse

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

  var0 = a4.var0;
  v8 = a6;
  objc_msgSend(v8, "useGlobalsWithName:", objc_msgSend(a5, "globalsNameForAttribute:node:", 137, var0));

}

@end
