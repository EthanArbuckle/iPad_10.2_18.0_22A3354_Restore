@implementation TUIElementHostedAnchorDecorator

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIHostedAnchorConsuming;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  TUIHostingProperties *v19;
  TUIHostingIdentifier *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 212, var0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 104, var0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 155, var0));
  v12 = +[TUIHostedBox presentationFromString:](TUIHostedBox, "presentationFromString:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 12, var0));
  v14 = +[TUIHostedBox arrowDirectionFromString:](TUIHostedBox, "arrowDirectionFromString:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 67, var0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 94, var0));
  v17 = objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 95, 0, var0);

  if (v12 <= 1)
    v18 = 1;
  else
    v18 = v12;
  v19 = -[TUIHostingProperties initWithPresentation:flags:arrowDirection:groupIdentifier:groupPriority:designatedIdentifier:]([TUIHostingProperties alloc], "initWithPresentation:flags:arrowDirection:groupIdentifier:groupPriority:designatedIdentifier:", v18, 0, v14, v16, v17, v15);
  if (objc_msgSend(v31, "length") && objc_msgSend(v10, "length"))
    v20 = -[TUIHostingIdentifier initWithType:identifier:]([TUIHostingIdentifier alloc], "initWithType:identifier:", v31, v10);
  else
    v20 = 0;
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostingIdentifiers"));
  v22 = (void *)v21;
  if (v21)
    v23 = (void *)v21;
  else
    v23 = &__NSArray0__struct;
  v24 = v23;

  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostingProperities"));
  v26 = (void *)v25;
  if (v25)
    v27 = (void *)v25;
  else
    v27 = &__NSArray0__struct;
  v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrayByAddingObject:", v20));
  objc_msgSend(v9, "setHostingIdentifiers:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "arrayByAddingObject:", v19));
  objc_msgSend(v9, "setHostingProperities:", v30);

}

@end
