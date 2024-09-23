@implementation BSUIElementDailyReading

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  return +[BSUIDailyReadingMetrics supportedAttributes](BSUIDailyReadingMetrics, "supportedAttributes");
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(BSUIDailyReadingBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIWidgetBuilder, a2);
}

+ (BOOL)supportAttribute:(unsigned __int16)a3 feature:(id)a4
{
  id v4;
  unsigned __int8 v5;

  v4 = a4;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("supportsWidgetFormat")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("supportsWidgetFormatV3")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("supportsSymbolImages"));
  }

  return v5;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  unsigned int v46;
  id v47;

  v47 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc((Class)TUIConfiguration);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "finalizeWidgetWithParent:", v47));

  v12 = objc_msgSend(v10, "initWithData:", v11);
  objc_msgSend(v47, "setConfiguration:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dailyReadingMetrics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "configuration"));
  objc_msgSend(v13, "updateWithConfiguration:context:", v14, v8);

  v15 = objc_alloc_init((Class)NSMutableArray);
  if ((objc_msgSend(v13, "iconMode") & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceConformingToProtocol:", &OBJC_PROTOCOL___TUIWPService));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rightToLeft"));
    v18 = objc_msgSend(v17, "BOOLValue");

    v19 = objc_opt_class(TUIWPBox);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "configuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "boxForKey:", CFSTR("title-text-box")));
    v22 = BUDynamicCast(v19, v21);
    v23 = (id)objc_claimAutoreleasedReturnValue(v22);

    if (!v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildTitleTextModel:service:context:writingDirection:", v13, v16, v8, v18));
      v23 = objc_msgSend(objc_alloc((Class)TUIWPBox), "initWithTextModel:", v24);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tui_identifierByAppendingIndex:", 0));
    objc_msgSend(v23, "setIdentifier:", v26);

    objc_msgSend(v15, "addObject:", v23);
    v27 = objc_opt_class(TUIWPBox);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "configuration"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "boxForKey:", CFSTR("time-text-box")));
    v30 = BUDynamicCast(v27, v29);
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);

    if (!v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildTimeTextModel:service:context:writingDirection:", v13, v16, v8, v18));
      v31 = objc_msgSend(objc_alloc((Class)TUIWPBox), "initWithTextModel:", v32);

    }
    v46 = v18;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "tui_identifierByAppendingIndex:", 1));
    objc_msgSend(v31, "setIdentifier:", v34);

    objc_msgSend(v15, "addObject:", v31);
    v35 = objc_opt_class(TUIWPBox);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "configuration"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "boxForKey:", CFSTR("detail-text-box")));
    v38 = BUDynamicCast(v35, v37);
    v39 = (id)objc_claimAutoreleasedReturnValue(v38);

    if (!v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildDetailTextModel:service:context:goalCompleted:writingDirection:", v13, v16, v8, objc_msgSend(v13, "goalCompleted"), v46));
      v39 = objc_msgSend(objc_alloc((Class)TUIWPBox), "initWithTextModel:", v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "tui_identifierByAppendingIndex:", 2));
    objc_msgSend(v39, "setIdentifier:", v42);

    objc_msgSend(v15, "addObject:", v39);
    v43 = objc_alloc_init((Class)TUIVSpacer);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "tui_identifierByAppendingIndex:", 3));
    objc_msgSend(v43, "setIdentifier:", v45);

    objc_msgSend(v15, "addObject:", v43);
  }
  objc_msgSend(v47, "updateModelChildren:", v15);

}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  BSUIDailyReadingMetrics *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;

  v32 = a3;
  v10 = a6;
  v11 = a5;
  v12 = -[BSUIDailyReadingMetrics initWithNode:attributes:context:]([BSUIDailyReadingMetrics alloc], "initWithNode:attributes:context:", a4.var0, v11, v10);

  if (!-[BSUIDailyReadingMetrics iconMode](v12, "iconMode"))
  {
    v13 = objc_alloc_init((Class)NSMutableArray);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceConformingToProtocol:", &OBJC_PROTOCOL___TUIWPService));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics rightToLeft](v12, "rightToLeft"));
    v16 = objc_msgSend(v15, "BOOLValue");

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildTitleTextModel:service:context:writingDirection:", v12, v14, v10, v16));
    v30 = objc_msgSend(objc_alloc((Class)TUIWPBox), "initWithTextModel:", v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tui_identifierByAppendingIndex:", 0));
    objc_msgSend(v30, "setIdentifier:", v18);

    objc_msgSend(v13, "addObject:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildTimeTextModel:service:context:writingDirection:", v12, v14, v10, v16));
    v19 = objc_msgSend(objc_alloc((Class)TUIWPBox), "initWithTextModel:", v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tui_identifierByAppendingIndex:", 1));
    objc_msgSend(v19, "setIdentifier:", v21);

    objc_msgSend(v13, "addObject:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildDetailTextModel:service:context:goalCompleted:writingDirection:", v12, v14, v10, -[BSUIDailyReadingMetrics goalCompleted](v12, "goalCompleted"), v16));
    v23 = objc_msgSend(objc_alloc((Class)TUIWPBox), "initWithTextModel:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tui_identifierByAppendingIndex:", 2));
    objc_msgSend(v23, "setIdentifier:", v25);

    objc_msgSend(v13, "addObject:", v23);
    v26 = objc_alloc_init((Class)TUIVSpacer);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tui_identifierByAppendingIndex:", 3));
    objc_msgSend(v26, "setIdentifier:", v28);

    objc_msgSend(v13, "addObject:", v26);
    objc_msgSend(v32, "updateModelChildren:", v13);

  }
  objc_msgSend(v32, "setDailyReadingMetrics:", v12, v29);

}

+ (id)_buildTitleTextModel:(id)a3 service:(id)a4 context:(id)a5 writingDirection:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  v13 = (void *)v12;
  v14 = &stru_2F6710;
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleFontSpec"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textColor"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "language"));
  LOBYTE(v23) = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUIWPBox textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:](TUIWPBox, "textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:", v16, 0, v17, 1, v6, v19, v23, v10));

  objc_msgSend(v20, "appendString:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "finalizeTextModelWithContext:", v9));

  return v21;
}

+ (id)_buildTimeTextModel:(id)a3 service:(id)a4 context:(id)a5 writingDirection:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeDisplayedText"));
  v13 = (void *)v12;
  v14 = &stru_2F6710;
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeFontSpec"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textColor"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "language"));
  LOBYTE(v23) = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUIWPBox textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:](TUIWPBox, "textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:", v16, 0, v17, 1, v6, v19, v23, v10));

  objc_msgSend(v20, "appendString:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "finalizeTextModelWithContext:", v9));

  return v21;
}

+ (id)_buildDetailTextModel:(id)a3 service:(id)a4 context:(id)a5 goalCompleted:(BOOL)a6 writingDirection:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v7 = a7;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "detailText"));
  v15 = (void *)v14;
  v16 = &stru_2F6710;
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  if (a6)
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "progressColor"));
  else
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textColor"));
  v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "detailFontSpec"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "environment"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "language"));
  LOBYTE(v26) = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TUIWPBox textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:](TUIWPBox, "textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:", v20, 0, v19, 1, v7, v22, v26, v12));

  objc_msgSend(v23, "appendString:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "finalizeTextModelWithContext:", v11));

  return v24;
}

@end
