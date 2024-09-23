@implementation TUIElementAnimationGroup

+ (id)supportedAttributes
{
  if (qword_2CB700 != -1)
    dispatch_once(&qword_2CB700, &stru_2414E0);
  return (id)qword_2CB6F8;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationGroupBuilding;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementAnimationGroupBuilder, a2);
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementAnimationGroupBuilder, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 138, a4.var0));
  objc_msgSend(v11, "setGroupName:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupName"));
  v10 = objc_msgSend(v9, "length");

  if (!v10)
    objc_msgSend(v11, "setGroupName:", CFSTR("default"));

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalizeAnimationGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));

  objc_msgSend(v6, "addAnimationGroup:withName:", v9, v8);
}

@end
