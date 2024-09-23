@implementation TUIElementAnimationFrom

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIAnimationStep, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationBuilding;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementAnimationValueBuilder, a2);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "finalizeAnimationValues"));
  objc_msgSend(v7, "setValues:", v6);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  _objc_msgSend(a4, "addFromAnimationStep:", a3);
}

@end
