@implementation TUIElementLinkEntityAction

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL____TUILinkEntityActionConsuming;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  uint64_t var0;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  TUILinkEntityAction *v15;
  id v16;

  v16 = a3;
  v9 = a6;
  var0 = a4.var0;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForAttribute:node:", 138, a4.var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForAttribute:node:", 209, a4.var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForAttribute:node:", 164, var0));

  if (v12)
  {
    v15 = -[TUILinkEntityAction initWithName:trigger:refId:]([TUILinkEntityAction alloc], "initWithName:trigger:refId:", v12, v13, v14);
    objc_msgSend(v16, "addLinkEntityAction:", v15);

  }
  else
  {
    objc_msgSend(v9, "reportError:", 1016);
  }

}

@end
