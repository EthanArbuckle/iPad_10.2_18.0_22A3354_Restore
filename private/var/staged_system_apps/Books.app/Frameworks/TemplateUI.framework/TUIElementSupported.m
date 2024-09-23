@implementation TUIElementSupported

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB9F0 != -1)
    dispatch_once(&qword_2CB9F0, &stru_242B30);
  return (id)qword_2CB9E8;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a6;
  var0 = a4.var0;
  v9 = a5;
  v10 = objc_msgSend(v9, "constantNameForAttribute:node:", 137, a4.var0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 71, var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 81, var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 14, var0));

  v14 = +[TUIAttributeRegistry lookupAttributeWithName:](TUIAttributeRegistry, "lookupAttributeWithName:", v13);
  v15 = v14;
  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "manager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "elementRegistry"));
    v18 = objc_msgSend(v17, "elementClassForName:", v11);

    v19 = v18 != 0;
    if (v13)
    {
      v20 = 0;
      if ((_DWORD)v15 == 0xFFFF || !v18)
        goto LABEL_23;
      if ((objc_opt_respondsToSelector(v18, "supportedAttributes") & 1) == 0)
        goto LABEL_22;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "supportedAttributes"));
      v19 = objc_msgSend(v21, "containsAttribute:", v15);

    }
    if (v12)
      v20 = 0;
    else
      v20 = (id)v19;
    if (v12 && v19)
    {
      if ((objc_opt_respondsToSelector(v18, "supportAttribute:feature:") & 1) != 0)
      {
        v20 = objc_msgSend(v18, "supportAttribute:feature:", v15, v12);
        goto LABEL_23;
      }
LABEL_22:
      v20 = 0;
    }
  }
  else if ((_DWORD)v14 != 0xFFFF && v12 == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[TUIAttributeSet allSupportedAttributes](TUIAttributeSet, "allSupportedAttributes"));
    v20 = objc_msgSend(v25, "containsAttribute:", v15);

  }
  else
  {
    v20 = 0;
    if ((_DWORD)v14 == 0xFFFF && v12)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "manager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "elementRegistry"));
      v20 = objc_msgSend(v24, "supportFeature:", v12);

    }
  }
LABEL_23:
  objc_msgSend(v26, "defineBool:withName:", v20, v10);

}

@end
