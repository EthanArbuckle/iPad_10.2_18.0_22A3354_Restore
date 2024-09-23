@implementation TUIElementAction

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIActionBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementActionObjectBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementActionObjectBuilder, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 209, var0));
  objc_msgSend(v9, "setTrigger:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 35, var0));
  objc_msgSend(v9, "setBehavior:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 164, var0));
  objc_msgSend(v9, "setRefId:", v12);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  TUIElementBehaviorArgumentsMap *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  TUIElementBehaviorArgumentsMap *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trigger"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "behavior"));

    if (v9)
    {
      v10 = [TUIElementBehaviorArgumentsMap alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "behavior"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arguments"));
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = &__NSDictionary0__struct;
      v15 = -[TUIElementBehaviorArgumentsMap initWithBehavior:arguments:](v10, "initWithBehavior:arguments:", v11, v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trigger"));
      objc_msgSend(v6, "addTrigger:withBehavior:", v16, v15);
      goto LABEL_11;
    }
  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trigger"));
  if (v17)
  {
    v15 = (TUIElementBehaviorArgumentsMap *)v17;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "refId"));
    if (!v18)
    {
LABEL_12:

      goto LABEL_13;
    }
    v19 = (void *)v18;
    v20 = objc_opt_respondsToSelector(v6, "addTrigger:withRefId:");

    if ((v20 & 1) != 0)
    {
      v15 = (TUIElementBehaviorArgumentsMap *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trigger"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "refId"));
      objc_msgSend(v6, "addTrigger:withRefId:", v15, v16);
LABEL_11:

      goto LABEL_12;
    }
  }
LABEL_13:

}

@end
