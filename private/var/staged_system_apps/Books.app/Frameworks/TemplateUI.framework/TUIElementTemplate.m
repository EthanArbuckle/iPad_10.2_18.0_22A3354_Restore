@implementation TUIElementTemplate

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIRootBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIBoxBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7;
  id v8;

  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "entry"));
  objc_msgSend(v7, "setEntry:", v8);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5;

  v5 = objc_msgSend(a4, "finalizeModelsWithParent:box:context:", a3, a3, a5);
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 builder:(id)a5 context:(id)a6 block:(id)a7
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
  v12 = objc_msgSend(v9, "updateWithEntry:withBuilder:environmentContainer:", v13, v10, v11);

  objc_msgSend(v11, "setDirectEnvironmentUseMask:", v12);
}

@end
