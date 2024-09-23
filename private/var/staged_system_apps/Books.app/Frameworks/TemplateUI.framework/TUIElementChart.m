@implementation TUIElementChart

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2CB380 != -1)
    dispatch_once(&qword_2CB380, &stru_23ECA0);
  return (id)qword_2CB378;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIChartBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 49, var0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 204, var0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 200, var0));
  objc_msgSend(v8, "floatForAttribute:node:", 52, var0);
  v13 = (uint64_t)fmax(v12, 1.0);
  objc_msgSend(v8, "floatForAttribute:node:", 60, var0);
  v15 = v14;
  objc_msgSend(v8, "floatForAttribute:node:", 157, var0);
  v17 = v16;
  objc_msgSend(v8, "floatForAttribute:node:", 193, var0);
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 51, var0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 30, var0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 185, var0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontSpecForNode:", var0));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "attributesForAttributedString"));
  objc_msgSend(v9, "setChartType:", v26);
  objc_msgSend(v9, "setTitle:", v10);
  objc_msgSend(v9, "setFooter:", v11);
  objc_msgSend(v9, "setColumns:", v13);
  objc_msgSend(v9, "setCornerRadius:", v15);
  objc_msgSend(v9, "setProgress:", v17);
  objc_msgSend(v9, "setSpacing:", v19);
  objc_msgSend(v9, "setColor:", v20);
  objc_msgSend(v9, "setBackgroundColor:", v21);
  objc_msgSend(v9, "setShadowColor:", v22);
  objc_msgSend(v9, "setFontSpec:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "attributes"));
  objc_msgSend(v9, "setFontAttributes:", v25);

}

@end
