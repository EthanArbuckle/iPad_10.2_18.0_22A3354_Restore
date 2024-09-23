@implementation TUIElementAXActions

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAXActionsBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementAXActionsObjectBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementAXActionsObjectBuilder, a2);
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "finalizeAXActions"));
  objc_msgSend(v6, "setAXActions:", v7);

}

@end
