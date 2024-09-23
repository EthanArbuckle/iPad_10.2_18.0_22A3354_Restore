@implementation TUIElementHostedAnchor

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUISingleContentBoxBuilder, a2);
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIHostedAnchorBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  TUIHostingProperties *v21;
  TUIHostingIdentifier *v22;
  id v23;

  v23 = a6;
  var0 = a4.var0;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 212, a4.var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 104, a4.var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 155, var0));
  v15 = +[TUIHostedBox presentationFromString:](TUIHostedBox, "presentationFromString:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 12, var0));
  v17 = +[TUIHostedBox arrowDirectionFromString:](TUIHostedBox, "arrowDirectionFromString:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 67, var0));
  if (v15 <= 1)
    v15 = 1;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 94, var0));
  v20 = objc_msgSend(v10, "unsignedIntegerForAttribute:withDefault:node:", 95, 0, var0);

  v21 = -[TUIHostingProperties initWithPresentation:flags:arrowDirection:groupIdentifier:groupPriority:designatedIdentifier:]([TUIHostingProperties alloc], "initWithPresentation:flags:arrowDirection:groupIdentifier:groupPriority:designatedIdentifier:", v15, 0, v17, v19, v20, v18);
  if (objc_msgSend(v12, "length") && objc_msgSend(v13, "length"))
    v22 = -[TUIHostingIdentifier initWithType:identifier:]([TUIHostingIdentifier alloc], "initWithType:identifier:", v12, v13);
  else
    v22 = 0;
  objc_msgSend(v11, "setHostingIdentifier:", v22);
  objc_msgSend(v11, "setHostingProperties:", v21);

  if (!v22)
    objc_msgSend(v23, "reportError:", 1001);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5;

  v5 = objc_msgSend(a4, "finalizeModelsWithParent:box:context:", a3, a3, a5);
}

@end
