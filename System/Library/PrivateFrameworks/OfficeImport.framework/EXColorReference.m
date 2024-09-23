@implementation EXColorReference

+ (id)edColorReferenceFromXmlColorElement:(_xmlNode *)a3 callerClass:(Class)a4 state:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  double v18;
  unint64_t v19;

  objc_msgSend(a5, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    objc_msgSend(a1, "autoColorWithCallerClass:resources:", a4, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v19 = 0;
  if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"indexed", &v19))
  {
    +[EDColorReference colorReferenceWithColorIndex:resources:](EDColorReference, "colorReferenceWithColorIndex:resources:", v19, v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v9;
    goto LABEL_8;
  }
  v18 = 0.0;
  CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tint", &v18);
  if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"theme", &v19))
  {
    +[EDColorReference colorReferenceWithThemeIndex:tint:resources:](EDColorReference, "colorReferenceWithThemeIndex:tint:resources:", v19, v8, v18);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v17 = 0;
  v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"rgb", &v17);
  v13 = v17;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scanHexInt:", &v19);
    +[OITSUColor colorWithRGBValue:](OITSUColor, "colorWithRGBValue:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDColorReference colorReferenceWithColor:resources:](EDColorReference, "colorReferenceWithColor:resources:", v15, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"auto", &v16);
    if (v16)
    {
      objc_msgSend(a1, "autoColorWithCallerClass:resources:", a4, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

LABEL_8:
  return v10;
}

+ (id)autoColorWithCallerClass:(Class)a3 resources:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = 13;
  }
  else if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()))
  {
    v6 = 11;
  }
  else
  {
    v6 = 33;
  }
  +[EDColorReference colorReferenceWithSystemColorID:resources:](EDColorReference, "colorReferenceWithSystemColorID:resources:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
