@implementation TUIElementTextAttributed

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAttributedStringConsuming;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIAttributedStringBuilder, a2);
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementTextAttributedObject, a2);
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  TUIAttributedStringBuilder *v12;
  void *v13;

  var0 = a3.var0;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorForAttribute:node:", 51, var0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontSpecForNode:", var0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForAttribute:node:", 201, var0));
  v11 = +[TUIBox textAlignmentFromString:](TUIBox, "textAlignmentFromString:", v10);

  v12 = -[TUIAttributedStringBuilder initWithFontSpec:style:color:textAlignment:]([TUIAttributedStringBuilder alloc], "initWithFontSpec:style:color:textAlignment:", v9, 0, v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForAttribute:node:", 102, var0));

  -[TUIAttributedStringBuilder setOptions:](v12, "setOptions:", sub_5C748(v13, 2uLL));
  return v12;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;

  var0 = a4.var0;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 176, var0));
  objc_msgSend(v8, "setRole:", v9);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "finalizeTextModelWithContext:", a5));
  objc_msgSend(v7, "setString:", v8);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));

  objc_msgSend(v6, "addAttributedString:forRole:", v9, v8);
}

@end
