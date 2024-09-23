@implementation TUIElementSwitch

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)builderProtocols
{
  return 0;
}

+ (BOOL)evaluateAttributes
{
  return 0;
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  (*((void (**)(id, id, uint64_t))a7 + 2))(a7, a5, 2);
}

@end
