@implementation TUIElementHBox

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2CB320 != -1)
    dispatch_once(&qword_2CB320, &stru_23EBB8);
  return (id)qword_2CB318;
}

+ (id)containerAttributes
{
  if (qword_2CB330 != -1)
    dispatch_once(&qword_2CB330, &stru_23EBD8);
  return (id)qword_2CB328;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIHBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  id v11;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 96, var0));
  objc_msgSend(v9, "setHalign:", +[TUIBox halignFromString:](TUIBox, "halignFromString:", v10));

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 120, var0));
  objc_msgSend(v9, "setLayoutMode:", +[TUIBox layoutModeFromString:](TUIBox, "layoutModeFromString:", v11));

}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringForAttribute:node:", 97, a4.var0));
  objc_msgSend(v9, "setHcompressed:", +[TUIBox compressedFromString:](TUIBox, "compressedFromString:", v10));

  v11 = objc_msgSend(v14, "lengthForAttribute:node:", 166, a4.var0);
  objc_msgSend(v9, "setRelativeWidth:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dynamicArrayWindowingBox"));

  if (v13)
  {
    objc_msgSend(v14, "floatForAttribute:node:", 79, a4.var0);
    objc_msgSend(v13, "setEstimatedWidth:");
    objc_msgSend(v14, "floatForAttribute:node:", 77, a4.var0);
    objc_msgSend(v13, "setEstimatedHeight:");
    objc_msgSend(v13, "estimatedHeight");
    objc_msgSend(v14, "floatForAttribute:withDefault:node:", 78, a4.var0);
    objc_msgSend(v13, "setEstimatedHeightAbovePivot:");
  }

}

@end
