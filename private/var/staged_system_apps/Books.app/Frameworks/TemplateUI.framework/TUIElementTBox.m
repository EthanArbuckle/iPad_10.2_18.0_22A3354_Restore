@implementation TUIElementTBox

+ (id)supportedAttributes
{
  if (qword_2CB450 != -1)
    dispatch_once(&qword_2CB450, &stru_23F138);
  return (id)qword_2CB448;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIWPBox, a2);
}

+ (id)builderProtocols
{
  _QWORD v3[5];

  v3[0] = &OBJC_PROTOCOL___TUITextModelBuilding;
  v3[1] = &OBJC_PROTOCOL___TUIModelBuilding;
  v3[2] = &OBJC_PROTOCOL___TUIBoxBuilding;
  v3[3] = &OBJC_PROTOCOL___TUIAXActionsBuilding;
  v3[4] = &OBJC_PROTOCOL___TUIAnimationGroupBuilding;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 5));
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  uint64_t var0;
  id v12;
  unsigned int v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  char *v18;
  unsigned __int8 v19;
  char *v20;
  void *v21;
  void *v22;
  TUIAttributedStringBuilder *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;

  v9 = a5;
  v10 = a6;
  var0 = a3.var0;
  v12 = a4;
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 51, a3.var0));
  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontSpecForNode:", a3.var0));
  v13 = objc_msgSend(v9, "BOOLForAttribute:node:", 122, a3.var0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 201, a3.var0));
  v15 = +[TUIBox textAlignmentFromString:](TUIBox, "textAlignmentFromString:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceConformingToProtocol:", &OBJC_PROTOCOL___TUIWPService));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "environment"));
  v18 = (char *)objc_msgSend(v17, "layoutDirection");

  v19 = objc_msgSend(v9, "BOOLForAttribute:node:", 189, a3.var0);
  v20 = (char *)objc_msgSend(v12, "role");

  if (v20 == (_BYTE *)&dword_4 + 2)
  {
    v22 = (void *)v33;
    v21 = (void *)v34;
    v23 = -[TUIAttributedStringBuilder initWithFontSpec:style:color:textAlignment:]([TUIAttributedStringBuilder alloc], "initWithFontSpec:style:color:textAlignment:", v33, 0, v34, v15);
  }
  else
  {
    v32 = v18 == (_BYTE *)&dword_0 + 2;
    if (v13)
      v24 = 4;
    else
      v24 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "environment"));
    v26 = v16;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "language"));
    LOBYTE(v31) = v19;
    v22 = (void *)v33;
    v28 = v24;
    v21 = (void *)v34;
    v23 = (TUIAttributedStringBuilder *)objc_claimAutoreleasedReturnValue(+[TUIWPBox textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:](TUIWPBox, "textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:", v33, v28, v34, v15, v32, v27, v31, v26));

    v16 = v26;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 102, var0));
  -[TUIAttributedStringBuilder setOptions:](v23, "setOptions:", sub_5C748(v29, 2uLL));

  return v23;
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
  objc_msgSend(v9, "setMaxLines:", (unint64_t)fmax((double)(uint64_t)objc_msgSend(v8, "integerForAttribute:withDefault:node:", 129, 0, var0), 0.0));
  objc_msgSend(v9, "setHideEllipses:", objc_msgSend(v8, "BOOLForAttribute:node:", 100, var0));
  objc_msgSend(v9, "setAllowHangingPunctuation:", objc_msgSend(v8, "BOOLForAttribute:node:", 6, var0));
  objc_msgSend(v9, "setAllowShrinkToFit:", objc_msgSend(v8, "BOOLForAttribute:node:", 7, var0));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 37, var0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox blendModeFromString:](TUIBox, "blendModeFromString:", v11));
  objc_msgSend(v9, "setBlendMode:", v10);

}

+ (void)preconfigureBox:(id)a3 context:(id)a4
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setAXElement:", 1);
  objc_msgSend(v4, "setAxStaticText:", 1);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  char *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (char *)objc_msgSend(v14, "role");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalizeTextModelWithContext:", v8));
  if (v9 == (_BYTE *)&dword_4 + 2)
    objc_msgSend(v14, "setPlaceholderString:", v10);
  else
    objc_msgSend(v14, "setTextModel:", v10);

  v11 = objc_msgSend(v7, "finalizeModelsWithParent:box:context:", v14, v14, v8);
  if (objc_msgSend(v14, "isAXElement"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "axLabel"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "string"));
      objc_msgSend(v14, "setAxLabel:", v13);

    }
  }

}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  uint64_t var0;
  id v9;

  var0 = a4.var0;
  v9 = a6;
  objc_msgSend(a5, "floatForAttribute:node:", 34, var0);
  objc_msgSend(v9, "setBaselineOffset:");

}

@end
