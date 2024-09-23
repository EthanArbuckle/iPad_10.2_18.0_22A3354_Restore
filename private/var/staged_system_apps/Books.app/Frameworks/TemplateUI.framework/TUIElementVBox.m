@implementation TUIElementVBox

+ (id)supportedAttributes
{
  return +[TUIAttributeSet supportedAttributesSize](TUIAttributeSet, "supportedAttributesSize");
}

+ (id)containerAttributes
{
  if (qword_2CB310 != -1)
    dispatch_once(&qword_2CB310, &stru_23EB98);
  return (id)qword_2CB308;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIVBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementVBoxBuilder, a2);
}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  uint64_t var0;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a5;
  v11 = a6;
  var0 = a4.var0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 219, a4.var0));
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("baseline")))
    objc_msgSend(v11, "setPivotChild:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 217, var0));
  objc_msgSend(v16, "setVcompressed:", +[TUIBox compressedFromString:](TUIBox, "compressedFromString:", v14));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dynamicArrayWindowingBox"));
  if (v15)
  {
    objc_msgSend(v10, "floatForAttribute:node:", 79, var0);
    objc_msgSend(v15, "setEstimatedWidth:");
    objc_msgSend(v10, "floatForAttribute:node:", 77, var0);
    objc_msgSend(v15, "setEstimatedHeight:");
  }

}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;

  var0 = a4.var0;
  v8 = a3;
  objc_msgSend(v8, "setGrouped:", objc_msgSend(a5, "BOOLForAttribute:node:", 93, var0));

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "finalizeModelsWithParent:box:context:", v8, v8, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pivotChild"));

  objc_msgSend(v8, "setPivotChild:", v10);
}

@end
