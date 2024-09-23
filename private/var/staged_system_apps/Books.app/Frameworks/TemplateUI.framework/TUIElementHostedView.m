@implementation TUIElementHostedView

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIHostedBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  uint64_t var0;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  TUIHostingIdentifier *v23;
  TUIHostingProperties *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a5;
  v9 = a6;
  var0 = a4.var0;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForAttribute:node:", 212, a4.var0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForAttribute:node:", 104, var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForAttribute:node:", 155, var0));
  +[TUIHostedBox presentationFromString:](TUIHostedBox, "presentationFromString:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForAttribute:node:", 12, var0));
  v15 = +[TUIHostedBox arrowDirectionFromString:](TUIHostedBox, "arrowDirectionFromString:", v14);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForAttribute:node:", 67, var0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForAttribute:node:", 94, var0));
  v17 = objc_msgSend(v29, "unsignedIntegerForAttribute:withDefault:node:", 95, 0, var0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForAttribute:node:", 150, var0));
  if (objc_msgSend(v12, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewRegistry"));
    v20 = objc_msgSend(v19, "useHostedViewFactoryForType:", v12);

    if (v20)
    {
      v21 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifierWithNode:", var0));
    }
    else
    {
      v21 = v9;
      v22 = 0;
    }
    if (objc_msgSend(v28, "length"))
      v23 = -[TUIHostingIdentifier initWithType:identifier:parameters:modelIdentifier:]([TUIHostingIdentifier alloc], "initWithType:identifier:parameters:modelIdentifier:", v12, v28, v27, v22);
    else
      v23 = 0;
  }
  else
  {
    v21 = v9;
    v23 = 0;
    v22 = 0;
  }
  v24 = -[TUIHostingProperties initWithPresentation:flags:arrowDirection:groupIdentifier:groupPriority:designatedIdentifier:]([TUIHostingProperties alloc], "initWithPresentation:flags:arrowDirection:groupIdentifier:groupPriority:designatedIdentifier:", 0, 0, v15, v16, v17, v26);
  objc_msgSend(v11, "setHostingIdentifier:", v23);
  objc_msgSend(v11, "setHostingProperties:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringForAttribute:node:", 11, var0));
  objc_msgSend(v11, "setAnchorRefId:", v25);

  objc_msgSend(v29, "insetsForAttribute:node:", 112, var0);
  objc_msgSend(v11, "setInsets:");

  if (!v23)
    objc_msgSend(v21, "reportError:", 1001);

}

@end
