@implementation PFXMargins

+ (void)initialize
{
  if ((id)objc_opt_class(PFXMargins) == a1)
  {
    objc_opt_class(PFXConstants);
    operator new();
  }
}

+ (const)paddingPropertyNames
{
  return (const $7CD0A2DAA6FEE0E813DE24BAD448BB2F *)qword_5436B0;
}

+ (void)loadMarginsForEntry:(id)a3 entryMediaState:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  objc_msgSend(a4, "parentFontSize", a3);
  v6 = v5;
  objc_msgSend(a4, "blockWidth");
  v8 = v7;
  v25 = -65536.0;
  v26 = -65536.0;
  v23 = -65536.0;
  v24 = -65536.0;
  v21 = -65536.0;
  v22 = -65536.0;
  v19 = -65536.0;
  v20 = -65536.0;
  v9 = objc_msgSend(a4, "propertySet");
  +[PFSMargins mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:](PFSMargins, "mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:", v9, qword_5436B0, &v26, &v24, &v25, &v23, v6, v8);
  objc_msgSend(a4, "leftPadding");
  objc_msgSend(a4, "setLeftPadding:", v10 - v26);
  objc_msgSend(a4, "rightPadding");
  objc_msgSend(a4, "setRightPadding:", v11 - v25);
  objc_msgSend(a4, "paddingBefore");
  objc_msgSend(a4, "setPaddingBefore:", v12 + v24);
  objc_msgSend(a4, "paddingAfter");
  objc_msgSend(a4, "setPaddingAfter:", v13 + v23);
  v14 = objc_msgSend(a4, "propertySet");
  +[PFSMargins mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:](PFSMargins, "mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:", v14, qword_5436B8, &v21, &v22, &v19, &v20, v6, v8);
  if (v22 > 0.0)
  {
    objc_msgSend(a4, "marginBefore", v22);
    objc_msgSend(a4, "setMarginBefore:", v15 + v22);
  }
  if (v21 > 0.0)
  {
    objc_msgSend(a4, "leftMargin", v21);
    objc_msgSend(a4, "setLeftMargin:", v16 + v21);
  }
  if (v20 > 0.0)
  {
    objc_msgSend(a4, "marginAfter", v20);
    objc_msgSend(a4, "setMarginAfter:", v17 + v20);
  }
  if (v19 > 0.0)
  {
    objc_msgSend(a4, "rightMargin", v19);
    objc_msgSend(a4, "setRightMargin:", v18 + v19);
  }
}

+ (void)mapMarginsForEntry:(id)a3 to:(id)a4 inList:(BOOL)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  void *v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;

  v8 = objc_msgSend(a3, "currentEntryMediaState");
  objc_msgSend(a1, "loadMarginsForEntry:entryMediaState:", a3, v8);
  objc_msgSend(v8, "leftMargin");
  v10 = v9;
  objc_msgSend(v8, "rightMargin");
  v12 = v11;
  v13 = objc_msgSend(v8, "ancestorParagraphStyle");
  if (v13)
  {
    v15 = v13;
    if (objc_msgSend(v13, "definesProperty:", 81))
    {
      objc_msgSend(v15, "floatValueForProperty:", 81);
      v10 = v10 + v16;
    }
    if (objc_msgSend(v15, "definesProperty:", 82))
    {
      objc_msgSend(v15, "floatValueForProperty:", 82);
      v14 = v17;
      v12 = v12 + v14;
    }
  }
  *(float *)&v14 = v10;
  objc_msgSend(a4, "setFloatValue:forProperty:", 81, v14);
  *(float *)&v18 = v12;
  objc_msgSend(a4, "setFloatValue:forProperty:", 82, v18);
  objc_msgSend(v8, "marginBefore");
  *(float *)&v19 = v19;
  objc_msgSend(a4, "setFloatValue:forProperty:", 87, v19);
  objc_msgSend(v8, "marginAfter");
  *(float *)&v20 = v20;
  objc_msgSend(a4, "setFloatValue:forProperty:", 88, v20);
}

@end
