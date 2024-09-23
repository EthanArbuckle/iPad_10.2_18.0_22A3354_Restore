@implementation TUIElementLinkEntity

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUILinkEntityConsuming;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementLinkEntityBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementLinkEntityBuilder, a2);
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
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 212, var0));
  objc_msgSend(v9, "setType:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 104, var0));
  objc_msgSend(v9, "setIdentifier:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 204, var0));
  objc_msgSend(v9, "setTitle:", v12);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  void *v7;
  id v8;

  v8 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "finalizeLinkEntityWithContext:", a5));
  if (v7)
    objc_msgSend(v8, "addLinkEntity:", v7);

}

@end
