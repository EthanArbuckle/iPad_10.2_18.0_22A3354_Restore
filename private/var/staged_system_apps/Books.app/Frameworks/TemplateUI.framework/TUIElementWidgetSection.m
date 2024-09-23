@implementation TUIElementWidgetSection

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIWidgetBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementWidgetSectionBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementWidgetSectionBuilder, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;

  var0 = a4.var0;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 137, var0));
  objc_msgSend(v8, "setSectionName:", v9);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "finalizeWidgetWithParent:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionName"));

  if (v8 && v7)
    objc_msgSend(v9, "addWidgetData:withKey:", v7, v8);

}

@end
