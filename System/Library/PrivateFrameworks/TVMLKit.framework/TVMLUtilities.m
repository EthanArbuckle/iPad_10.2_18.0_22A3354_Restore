@implementation TVMLUtilities

void __30__TVMLUtilities_TVMLKitBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TVMLKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TVMLKitBundle_bundle;
  TVMLKitBundle_bundle = v0;

}

+ (id)TVMLKitBundle
{
  if (TVMLKitBundle_onceToken != -1)
    dispatch_once(&TVMLKitBundle_onceToken, &__block_literal_global);
  return (id)TVMLKitBundle_bundle;
}

+ (id)TVUIKitBundle
{
  if (TVUIKitBundle_onceToken != -1)
    dispatch_once(&TVUIKitBundle_onceToken, &__block_literal_global_14);
  return (id)TVUIKitBundle_bundle;
}

void __30__TVMLUtilities_TVUIKitBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TVUIKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TVUIKitBundle_bundle;
  TVUIKitBundle_bundle = v0;

}

+ (id)TVKitBundle
{
  if (TVKitBundle_onceToken != -1)
    dispatch_once(&TVKitBundle_onceToken, &__block_literal_global_17);
  return (id)TVKitBundle_bundle;
}

void __28__TVMLUtilities_TVKitBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TVKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TVKitBundle_bundle;
  TVKitBundle_bundle = v0;

}

+ (BOOL)mainBundleSupportsSFSymbols
{
  if (mainBundleSupportsSFSymbols_onceToken != -1)
    dispatch_once(&mainBundleSupportsSFSymbols_onceToken, &__block_literal_global_20);
  return mainBundleSupportsSFSymbols_supportsSFSymbols;
}

void __44__TVMLUtilities_mainBundleSupportsSFSymbols__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("TVSupportsSFSymbols"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  mainBundleSupportsSFSymbols_supportsSFSymbols = objc_msgSend(v1, "BOOLValue");

}

+ (double)uiFontWeightFromCSSFontWeight:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  v3 = a3;
  if (uiFontWeightFromCSSFontWeight__onceToken != -1)
    dispatch_once(&uiFontWeightFromCSSFontWeight__onceToken, &__block_literal_global_21);
  if (objc_msgSend(v3, "length")
    && (v4 = (void *)uiFontWeightFromCSSFontWeight__sFontWeightMap,
        objc_msgSend(v3, "lowercaseString"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;

  }
  else
  {
    v8 = *MEMORY[0x24BDF7888];
  }

  return v8;
}

void __47__TVMLUtilities_uiFontWeightFromCSSFontWeight___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("ultralight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF78A8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v0;
  v11[1] = CFSTR("thin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7898]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v1;
  v11[2] = CFSTR("light");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7878]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v2;
  v11[3] = CFSTR("regular");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7888]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v3;
  v11[4] = CFSTR("medium");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7880]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v4;
  v11[5] = CFSTR("semibold");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v5;
  v11[6] = CFSTR("bold");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v6;
  v11[7] = CFSTR("heavy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7870]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v7;
  v11[8] = CFSTR("black");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7860]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[8] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)uiFontWeightFromCSSFontWeight__sFontWeightMap;
  uiFontWeightFromCSSFontWeight__sFontWeightMap = v9;

}

+ (id)fontFromStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "tv_textStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tv_fontWeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tv_fontSize");
  v8 = v7;
  v9 = objc_msgSend(v4, "tv_fontStretch");
  objc_msgSend((id)objc_opt_class(), "fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", v5, v6, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_20;
  objc_msgSend(v4, "tv_fontFamily");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uiFontWeightFromCSSFontWeight:", v6);
  v13 = v12;
  v14 = 0x24BDF6000uLL;
  if (v8 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
    v8 = v15;
  }
  if (objc_msgSend(v11, "length"))
  {
    if (!objc_msgSend(v6, "length") || v13 == *MEMORY[0x24BDF7888])
    {
      objc_msgSend(MEMORY[0x24BDF6A78], "fontDescriptorWithName:size:", v11, v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        goto LABEL_11;
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x24BDF6A78]);
      v44[0] = *MEMORY[0x24BDF7770];
      v42 = *MEMORY[0x24BDF78A0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = *MEMORY[0x24BDF7740];
      v45[0] = v18;
      v45[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v16, "initWithFontAttributes:", v19);

      v14 = 0x24BDF6000;
      if (v20)
        goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(v14 + 2672), "systemFontOfSize:weight:", v8, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fontDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  objc_msgSend(v4, "valueForStyle:", CFSTR("itml-text-caps"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22 && objc_msgSend(v22, "isEqualToString:", CFSTR("small")))
  {
    objc_msgSend(0, "fontDescriptor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x24BDF7748];
    v25 = *MEMORY[0x24BDF7778];
    v37[0] = *MEMORY[0x24BDF7780];
    v24 = v37[0];
    v37[1] = v25;
    v38[0] = &unk_24EBCC9D0;
    v38[1] = &unk_24EBCC9E8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v32;
    v35[0] = v24;
    v35[1] = v25;
    v36[0] = &unk_24EBCCA00;
    v36[1] = &unk_24EBCC9E8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v34 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "fontDescriptorByAddingAttributes:", v28);
    v31 = objc_claimAutoreleasedReturnValue();

    v14 = 0x24BDF6000uLL;
    v11 = v34;

    v20 = (void *)v31;
  }
  if ((_DWORD)v9)
  {
    objc_msgSend(v20, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v20, "symbolicTraits") | v9);
    v29 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v29;
  }
  if (v20)
  {
    objc_msgSend(*(id *)(v14 + 2672), "fontWithDescriptor:size:", v20, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

LABEL_20:
  return v10;
}

+ (id)fontFromTextStyle:(id)a3 fontWeight:(id)a4 fontSize:(double)a5 symbolicTraits:(unsigned int)a6
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "tv_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", a3, a4, *(_QWORD *)&a6, a5);
}

+ (id)randomColor
{
  double v2;
  double v3;

  v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v2, v3, (double)arc4random_uniform(0xFFu) / 255.0, 0.4);
}

+ (BOOL)_cornerRadiiFromImgTreatmentValue:(id)a3 width:(double)a4 cornerRadii:(TVCornerRadii *)a5 circle:(BOOL *)a6
{
  id v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  v9 = a3;
  if (!objc_msgSend(v9, "length"))
    goto LABEL_16;
  v10 = 4.0;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("small")) & 1) != 0)
    goto LABEL_13;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("corner-small")) & 1) != 0)
    goto LABEL_13;
  v10 = 8.0;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("medium")) & 1) != 0)
    goto LABEL_13;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("corner-medium")) & 1) != 0)
    goto LABEL_13;
  v10 = 12.0;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("large")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("corner-large")) & 1) != 0)
  {
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("circle")))
  {
    v10 = fabs(a4 * 0.5);
    if (a6)
      *a6 = 1;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v9, "floatValue");
  v10 = v11;
LABEL_13:
  if (a5)
  {
    +[TVCornerUtilities radiiFromRadius:](TVCornerUtilities, "radiiFromRadius:", v10);
    a5->topLeft = v12;
    a5->topRight = v13;
    a5->bottomLeft = v14;
    a5->bottomRight = v15;
  }
  v16 = 1;
LABEL_17:

  return v16;
}

+ (BOOL)cornerRadiiFromElement:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5
{
  void *v8;

  objc_msgSend(a3, "element");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(a1, "_cornerRadiiFromElement:cornerRadii:circle:", v8, a4, a5);

  return (char)a5;
}

+ (BOOL)_cornerRadiiFromImageLayout:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v8 = a3;
  objc_msgSend(v8, "ikBorderRadius");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decoratorSize");
  v11 = v10;
  objc_msgSend(v8, "imageTreatment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "_cornerRadiiWithBorderRadius:cornerRadii:imageWidth:imageTreatmentValue:circle:", v9, a4, v12, a5, v11);
  return (char)a5;
}

+ (BOOL)_cornerRadiiFromElement:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  char v17;

  v8 = a3;
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_borderRadius");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "tv_imageScaleToSize");
    v12 = v11;
  }
  else
  {
    objc_msgSend(v8, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tv_width");
    v12 = v14;

  }
  objc_msgSend(v8, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tv_imageTreatment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(a1, "_cornerRadiiWithBorderRadius:cornerRadii:imageWidth:imageTreatmentValue:circle:", v10, a4, v16, a5, v12);
  return v17;
}

+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4
{
  double result;

  objc_msgSend((id)objc_opt_class(), "focusedSizeIncreaseForSize:upscaleFactor:useInSearchPartial:", 0, a3.width, a3.height, a4);
  return result;
}

+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4 useInSearchPartial:(BOOL)a5
{
  _BOOL4 v5;
  double v6;
  double result;

  v5 = a3.width < 180.0 || a5;
  v6 = 70.0;
  if (v5)
    v6 = 60.0;
  result = v6 + floor(fmax(a3.width, a3.height) * (a4 + -1.0));
  if (a4 <= 1.0)
    return v6;
  return result;
}

+ (CGRect)centerRect:(CGRect)result inRect:(CGRect)a4
{
  double v4;
  double v5;

  v4 = round(a4.origin.x + (a4.size.width - result.size.width) * 0.5);
  v5 = round(a4.origin.y + (a4.size.height - result.size.height) * 0.5);
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (void)getValuesFromTransform:(CGAffineTransform *)a3 translation:(CGPoint *)a4 rotation:(CGPoint *)a5
{
  long double v6;

  if (a4)
    *a4 = *(CGPoint *)&a3->tx;
  if (a5)
  {
    v6 = atan2(a3->b, a3->d);
    a5->x = v6;
    a5->y = v6;
  }
}

+ (id)indexPathForFirstItemAttributeValue:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  if (!a3)
    return 0;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)v4;
  if (v4)
  {
    v6 = malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
    if (v6)
    {
      v7 = v6;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __53__TVMLUtilities_indexPathForFirstItemAttributeValue___block_invoke;
      v9[3] = &__block_descriptor_40_e25_v32__0__NSString_8Q16_B24l;
      v9[4] = v6;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:", v7, v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      free(v7);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

uint64_t __53__TVMLUtilities_indexPathForFirstItemAttributeValue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3) = result;
  return result;
}

+ (id)rowSpacingMetricsForRowMetrics:(id)a3
{
  return (id)objc_msgSend(a1, "rowSpacingMetricsForRowMetrics:forShowcase:", a3, 0);
}

+ (id)rowSpacingMetricsForRowMetrics:(id)a3 forShowcase:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  __n128 (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x7010000000;
    v23[3] = &unk_222E82B8D;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x7010000000;
    v17[3] = &unk_222E82B8D;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __60__TVMLUtilities_rowSpacingMetricsForRowMetrics_forShowcase___block_invoke;
    v12 = &unk_24EB847F8;
    v15 = v23;
    v16 = v17;
    v13 = v4;
    v7 = v6;
    v14 = v7;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v9);
    v5 = (void *)objc_msgSend(v7, "copy", v9, v10, v11, v12);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v23, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

__n128 __60__TVMLUtilities_rowSpacingMetricsForRowMetrics_forShowcase___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __n128 result;
  double *v16;
  void *v17;
  void *v18;
  void *v19;
  double *v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v5 = *(_OWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(_OWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v7 = v6[6];
  v9 = v6[3];
  v8 = v6[4];
  v5[5] = v6[5];
  v5[6] = v7;
  v5[3] = v9;
  v5[4] = v8;
  v5[2] = v6[2];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tv_rowMetricsValue");
  v11 = *(_OWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v13 = v36;
  v12 = v37;
  v11[4] = v35;
  v11[5] = v13;
  v11[6] = v12;
  v14 = v34;
  v11[2] = v33;
  v11[3] = v14;

  if (a3)
  {
    v16 = *(double **)(*(_QWORD *)(a1 + 56) + 8);
    if (v16[5] == 0.0)
    {
      v17 = *(void **)(a1 + 40);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v28 = 0u;
      objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

    }
    else
    {
      v19 = *(void **)(a1 + 40);
      v20 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
      v21 = fmax(fmax(46.0 - (v20[7] + v16[6]), 0.0), fmax(v20[13] + 30.0 - (v20[9] + v16[10]), v16[12] + 30.0 - (v20[11] + v16[8])));
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      *(_QWORD *)&v28 = 1;
      *((double *)&v28 + 1) = v21;
      objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v22);

      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v25 = *(_OWORD *)(v24 + 96);
      v27 = *(_OWORD *)(v24 + 48);
      v26 = *(_OWORD *)(v24 + 64);
      *(_OWORD *)(v23 + 80) = *(_OWORD *)(v24 + 80);
      *(_OWORD *)(v23 + 96) = v25;
      *(_OWORD *)(v23 + 48) = v27;
      *(_OWORD *)(v23 + 64) = v26;
      result = *(__n128 *)(v24 + 32);
      *(__n128 *)(v23 + 32) = result;
    }
  }
  return result;
}

+ (id)imageWithRadialGradientOverlayFromImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double width;
  double height;
  void *v20;
  double v21;
  CGFloat v22;
  CGContext *CurrentContext;
  double v24;
  double v25;
  void *v26;
  CGAffineTransform v28;
  CGSize v29;
  CGRect v30;
  CGRect v31;

  v3 = (void *)MEMORY[0x24BDF6D38];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, "size");
  v11 = v10;
  v13 = v12;
  v14 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageNamed:inBundle:", CFSTR("TVCKBackgroundShelfGradient"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v7 / v11;
  if (v7 / v11 < v9 / v13)
    v17 = v9 / v13;
  CGAffineTransformMakeScale(&v28, v17, v17);
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = v11;
  v30.size.height = v13;
  v31 = CGRectApplyAffineTransform(v30, &v28);
  width = v31.size.width;
  height = v31.size.height;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", v31.origin.x, v31.origin.y);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;
  v29.width = v7;
  v29.height = v9;
  UIGraphicsBeginImageContextWithOptions(v29, 0, v22);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v24 = round((v7 - width) * 0.5 + *MEMORY[0x24BDBEFB0]);
  v25 = round((v9 - height) * 0.5 + *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend(v4, "drawInRect:blendMode:alpha:", 17, v24, v25, width, height, 1.0);

  objc_msgSend(v16, "drawInRect:blendMode:alpha:", 0, v24, v25, width, height, 1.0);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v26;
}

+ (id)placeholderImageForViewElement:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_placeholderImageForViewElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)placeholderImageForViewElement:(id)a3 withCornerRadii:(TVCornerRadii)a4 andScaledSize:(CGSize)a5
{
  double height;
  double width;
  double bottomRight;
  double bottomLeft;
  double topRight;
  double topLeft;
  void *v12;
  void *v13;

  height = a5.height;
  width = a5.width;
  bottomRight = a4.bottomRight;
  bottomLeft = a4.bottomLeft;
  topRight = a4.topRight;
  topLeft = a4.topLeft;
  objc_msgSend(a3, "element");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_placeholderImageForViewElement:withCornerRadii:andScaledSize:", v12, topLeft, topRight, bottomLeft, bottomRight, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (CGPath)shadowPathWithCornerRadii:(TVCornerRadii)a3 andScaledSize:(CGSize)a4
{
  double height;
  double width;
  double bottomRight;
  double bottomLeft;
  double topRight;
  double topLeft;
  void *v10;
  void *Mutable;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  bottomRight = a3.bottomRight;
  bottomLeft = a3.bottomLeft;
  topRight = a3.topRight;
  topLeft = a3.topLeft;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.1lf, %.1lf}[%.1f %.1f %.1f %.1f]"), *(_QWORD *)&a4.width, *(_QWORD *)&a4.height, *(_QWORD *)&a3.topLeft, *(_QWORD *)&a3.topRight, *(_QWORD *)&a3.bottomRight, *(_QWORD *)&a3.bottomLeft);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)shadowPathWithCornerRadii_andScaledSize__pathsByShape, "objectForKeyedSubscript:", v10);
  Mutable = (void *)objc_claimAutoreleasedReturnValue();

  if (!Mutable)
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint((CGMutablePathRef)Mutable, 0, topLeft, height);
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, width - (topLeft + topRight), height);
    if (topRight > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, width - topRight, height - topRight, topRight, 1.57079633, 0.0, 1);
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, width, bottomRight);
    if (bottomRight > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, width - bottomRight, bottomRight, bottomRight, 0.0, -1.57079633, 1);
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, bottomLeft, 0.0);
    if (bottomLeft > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, bottomLeft, bottomLeft, bottomLeft, -1.57079633, -3.14159265, 1);
    v12 = height - topLeft;
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, 0.0, v12);
    if (topLeft > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, topLeft, v12, topLeft, 3.14159265, 1.57079633, 1);
    v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    if (!shadowPathWithCornerRadii_andScaledSize__pathsByShape)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
      shadowPathWithCornerRadii_andScaledSize__pathsByShape = v14;

      v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", Mutable, v10);

  }
  return (CGPath *)Mutable;
}

+ (int64_t)semanticContentAttributeForTemplateElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("layoutDirection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ltr")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("rtl")))
    {
      v6 = 4;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)_interfaceStyleForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "app");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_255791C30))
  {
    objc_msgSend(v4, "appDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "app");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyTraitEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceStyle");

  }
  else
  {
    v14 = 0;
  }

  v15 = objc_msgSend(a1, "_overrideInterfaceStyleForElement:", v4);
  if (v15)
    v16 = v15;
  else
    v16 = v14;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "userInterfaceStyle");

  }
  return v16;
}

+ (int64_t)_overrideInterfaceStyleForElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_11:
    v13 = 0;
    goto LABEL_18;
  }
  v5 = v3;
  while (1)
  {
    v6 = objc_msgSend(v5, "elementType");
    objc_msgSend(v5, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 35)
    {
      objc_msgSend(v7, "attributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("theme"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      if (v8)
      {
        v11 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v5, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("theme"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    if (objc_msgSend(v11, "length"))
      break;
    objc_msgSend(v5, "parent");
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
    if (!v12)
      goto LABEL_11;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("light")) & 1) != 0)
  {
    v13 = 1;
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("dark")))
  {
    v13 = 2;
  }
  else
  {
    v13 = 0;
  }

LABEL_18:
  return v13;
}

+ (id)_bgImageElementForProductTemplate:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(a3, "unfilteredChildren");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (!v4)
    goto LABEL_48;
  v5 = v4;
  v6 = *(_QWORD *)v43;
  v27 = *(_QWORD *)v43;
  v28 = v3;
  do
  {
    v7 = 0;
    v29 = v5;
    do
    {
      if (*(_QWORD *)v43 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v7);
      if (objc_msgSend(v8, "tv_elementType") == 4)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v8, "unfilteredChildren");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (!v10)
          goto LABEL_42;
        v11 = v10;
        v12 = *(_QWORD *)v39;
LABEL_9:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
          if (objc_msgSend(v14, "tv_elementType") == 16
            && (!objc_msgSend(v14, "tv_imageType") || objc_msgSend(v14, "tv_imageType") == 3))
          {
            break;
          }
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
            if (v11)
              goto LABEL_9;
            goto LABEL_42;
          }
        }
LABEL_44:
        v25 = v14;
      }
      else
      {
        if (objc_msgSend(v8, "tv_elementType") != 12)
          goto LABEL_46;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v8, "unfilteredChildren");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (!v15)
        {
LABEL_42:
          v25 = 0;
          goto LABEL_45;
        }
        v16 = v15;
        v17 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v14, "tv_elementType") == 16 && objc_msgSend(v14, "tv_imageType") == 3)
            {
              v6 = v27;
              v3 = v28;
              v5 = v29;
              goto LABEL_44;
            }
            if (objc_msgSend(v14, "tv_elementType") == 24)
            {
              v32 = 0u;
              v33 = 0u;
              v30 = 0u;
              v31 = 0u;
              objc_msgSend(v14, "unfilteredChildren");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v31;
LABEL_29:
                v23 = 0;
                while (1)
                {
                  if (*(_QWORD *)v31 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v23);
                  if (objc_msgSend(v24, "tv_elementType") == 16 && objc_msgSend(v24, "tv_imageType") == 3)
                    break;
                  if (v21 == ++v23)
                  {
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
                    if (v21)
                      goto LABEL_29;
                    goto LABEL_36;
                  }
                }
                v25 = v24;

                if (v25)
                  goto LABEL_41;
              }
              else
              {
LABEL_36:

              }
            }
          }
          v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          if (v16)
            continue;
          break;
        }
        v25 = 0;
LABEL_41:
        v6 = v27;
        v3 = v28;
        v5 = v29;
      }
LABEL_45:

      if (v25)
        goto LABEL_49;
LABEL_46:
      ++v7;
    }
    while (v7 != v5);
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  }
  while (v5);
LABEL_48:
  v25 = 0;
LABEL_49:

  return v25;
}

+ (int64_t)semanticAlignmentForAlignment:(int64_t)a3 semanticContentAttribute:(int64_t)a4
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", a4);
  if (a3 == 5)
  {
    if (v5 == 1)
      return 1;
    else
      return 3;
  }
  else if (a3 == 4)
  {
    if (v5 == 1)
      return 3;
    else
      return 1;
  }
  return a3;
}

+ (int64_t)semanticPositionForPosition:(int64_t)a3 semanticContentAttribute:(int64_t)a4
{
  uint64_t v5;
  BOOL v6;
  int64_t v7;
  BOOL v8;
  int64_t v9;

  v5 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", a4);
  switch(a3)
  {
    case 12:
      v6 = v5 == 1;
      v7 = 4;
      goto LABEL_7;
    case 13:
      v8 = v5 == 1;
      v9 = 4;
      goto LABEL_11;
    case 14:
      v6 = v5 == 1;
      v7 = 6;
      goto LABEL_7;
    case 15:
      v8 = v5 == 1;
      v9 = 6;
      goto LABEL_11;
    case 16:
      v6 = v5 == 1;
      v7 = 8;
LABEL_7:
      if (v6)
        a3 = v7 + 1;
      else
        a3 = v7;
      break;
    case 17:
      v8 = v5 == 1;
      v9 = 8;
LABEL_11:
      if (v8)
        a3 = v9;
      else
        a3 = v9 + 1;
      break;
    default:
      return a3;
  }
  return a3;
}

+ (int64_t)contentModeForPosition:(int64_t)a3 defaultMode:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) >= 9)
    return a4;
  else
    return a3 + 3;
}

+ (BOOL)_cornerRadiiWithBorderRadius:(id)a3 cornerRadii:(TVCornerRadii *)a4 imageWidth:(double)a5 imageTreatmentValue:(id)a6 circle:(BOOL *)a7
{
  id v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  BOOL v25;

  v12 = a3;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  if (!objc_msgSend(a1, "_cornerRadiiFromImgTreatmentValue:width:cornerRadii:circle:", a6, &v23, &v25, a5)|| (v13 = 1, v12) && !v25)
  {
    objc_msgSend(v12, "namedStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (!v12)
      {
        LOBYTE(v13) = 0;
        goto LABEL_17;
      }
      objc_msgSend(v12, "cornerRadiiValue");
      *(_QWORD *)&v23 = v18;
      *((_QWORD *)&v23 + 1) = v19;
      *(_QWORD *)&v24 = v20;
      *((_QWORD *)&v24 + 1) = v21;
      v13 = 1;
      if (a4)
        goto LABEL_7;
      goto LABEL_9;
    }
    objc_msgSend(v12, "namedStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "_cornerRadiiFromImgTreatmentValue:width:cornerRadii:circle:", v15, &v23, &v25, a5);

  }
  if (a4)
  {
LABEL_7:
    if (v13)
    {
      v16 = v24;
      *(_OWORD *)&a4->topLeft = v23;
      *(_OWORD *)&a4->bottomLeft = v16;
    }
  }
LABEL_9:
  v17 = v13 ^ 1;
  if (!a7)
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    *a7 = v25;
    LOBYTE(v13) = 1;
  }
LABEL_17:

  return v13;
}

+ (id)_placeholderImageForValue:(id)a3 userInterfaceStyle:(int64_t)a4
{
  return (id)objc_msgSend(a1, "_placeholderImageForValue:userInterfaceStyle:withCornerRadii:andScaledSize:", a3, a4, 0.0, 0.0, 0.0, 0.0, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

+ (id)_placeholderImageForValue:(id)a3 userInterfaceStyle:(int64_t)a4 withCornerRadii:(TVCornerRadii)a5 andScaledSize:(CGSize)a6
{
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  objc_msgSend(a3, "lowercaseString", a5.topLeft, a5.topRight, a5.bottomLeft, a5.bottomRight, a6.width, a6.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("movie")))
  {
    v8 = CFSTR("PreloadAsset-Movie");
    v9 = CFSTR("PreloadAsset-Dark-Movie");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("tv")))
  {
    v8 = CFSTR("PreloadAsset-TV");
    v9 = CFSTR("PreloadAsset-Dark-TV");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("music")))
  {
    v8 = CFSTR("PreloadAsset-Music");
    v9 = CFSTR("PreloadAsset-Dark-Music");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("podcast")))
  {
    v8 = CFSTR("PreloadAsset-Podcast");
    v9 = CFSTR("PreloadAsset-Dark-Podcast");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("icloud")))
  {
    v8 = CFSTR("PreloadAsset-iCloud");
    v9 = CFSTR("PreloadAsset-Dark-iCloud");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("monogram")))
  {
    v8 = CFSTR("PreloadAsset-Monogram");
    v9 = CFSTR("PreloadAsset-Dark-Monogram");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("flowcase")))
  {
    v8 = CFSTR("PreloadAsset-GenericFlowcase");
    v9 = CFSTR("PreloadAsset-Dark-GenericFlowcase");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("16x9")))
  {
    v8 = CFSTR("PreloadAsset-Generic16x9");
    v9 = CFSTR("PreloadAsset-Dark-Generic16x9");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("tv16x9")))
  {
    v8 = CFSTR("PreloadAsset-TV16x9");
    v9 = CFSTR("PreloadAsset-Dark-TV16x9");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("movie16x9")))
  {
    v8 = CFSTR("PreloadAsset-Movie16x9");
    v9 = CFSTR("PreloadAsset-Dark-Movie16x9");
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("generic")))
    {
      v12 = 0;
      goto LABEL_34;
    }
    v8 = CFSTR("PreloadAsset-Generic");
    v9 = CFSTR("PreloadAsset-Dark-Generic");
  }
  if (a4 == 2)
    v8 = (__CFString *)v9;
  v10 = v8;
  if (_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____once != -1)
    dispatch_once(&_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____once, &__block_literal_global_217);
  v11 = v10;
  objc_msgSend((id)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = (void *)MEMORY[0x24BDF6AC8];
    +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:", v11, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend((id)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache, "setObject:forKey:", v12, v11);
    }
    else
    {
      v15 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR))
        +[TVMLUtilities _placeholderImageForValue:userInterfaceStyle:withCornerRadii:andScaledSize:].cold.1((uint64_t)v11, v15);
      v12 = 0;
    }
  }

LABEL_34:
  return v12;
}

uint64_t __92__TVMLUtilities__placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache;
  _placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache = (uint64_t)v0;

  return objc_msgSend((id)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache, "setCountLimit:", 15);
}

+ (id)_defaultPlaceholderImageForUserInterfaceStyle:(int64_t)a3
{
  uint64_t *v3;

  if (a3 == 2)
  {
    if (_defaultPlaceholderImageForUserInterfaceStyle____once != -1)
      dispatch_once(&_defaultPlaceholderImageForUserInterfaceStyle____once, &__block_literal_global_220);
    v3 = &_defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  }
  else
  {
    if (_defaultPlaceholderImageForUserInterfaceStyle____once_221 != -1)
      dispatch_once(&_defaultPlaceholderImageForUserInterfaceStyle____once_221, &__block_literal_global_222);
    v3 = &_defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  }
  return (id)*v3;
}

void __63__TVMLUtilities__defaultPlaceholderImageForUserInterfaceStyle___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  CGSize v3;
  CGRect v4;

  v3.width = 1.0;
  v3.height = 1.0;
  UIGraphicsBeginImageContext(v3);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.11372549, 0.11372549, 0.11372549, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  UIRectFillUsingBlendMode(v4, kCGBlendModeCopy);
  UIGraphicsGetImageFromCurrentImageContext();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  _defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

void __63__TVMLUtilities__defaultPlaceholderImageForUserInterfaceStyle___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  CGSize v3;
  CGRect v4;

  v3.width = 1.0;
  v3.height = 1.0;
  UIGraphicsBeginImageContext(v3);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.921568627, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  UIRectFillUsingBlendMode(v4, kCGBlendModeCopy);
  UIGraphicsGetImageFromCurrentImageContext();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  _defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

+ (id)_defaultPlaceholderImageForUserInterfaceStyle:(int64_t)a3 withCornerRadii:(TVCornerRadii)a4 andSize:(CGSize)a5
{
  double height;
  double width;
  double bottomRight;
  double bottomLeft;
  double topRight;
  double topLeft;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CGPath *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  CGSize v24;
  CGSize v25;
  CGSize v26;

  height = a5.height;
  width = a5.width;
  bottomRight = a4.bottomRight;
  bottomLeft = a4.bottomLeft;
  topRight = a4.topRight;
  topLeft = a4.topLeft;
  if (_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____once != -1)
    dispatch_once(&_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____once, &__block_literal_global_223);
  v12 = (void *)MEMORY[0x24BDD17C8];
  v24.width = width;
  v24.height = height;
  NSStringFromCGSize(v24);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (a3 == 2)
  {
    objc_msgSend(v12, "stringWithFormat:", CFSTR("placeholder-dark-%@-%0.2f-%0.2f-%0.2f-%0.2f"), v13, *(_QWORD *)&topRight, *(_QWORD *)&bottomRight, *(_QWORD *)&bottomLeft, *(_QWORD *)&topLeft);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache, "objectForKey:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = +[TVCornerUtilities createPathForRadii:inRect:](TVCornerUtilities, "createPathForRadii:inRect:", topLeft, topRight, bottomLeft, bottomRight, 0.0, 0.0, width, height);
      v25.width = width;
      v25.height = height;
      UIGraphicsBeginImageContext(v25);
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDF6950];
      v20 = 0.11372549;
LABEL_9:
      objc_msgSend(v19, "colorWithRed:green:blue:alpha:", v20, v20, v20, 1.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFill");

      objc_msgSend(v18, "fillWithBlendMode:alpha:", 17, 1.0);
      UIGraphicsGetImageFromCurrentImageContext();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      CGPathRelease(v17);
      objc_msgSend((id)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache, "setObject:forKey:", v21, v15);

      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v12, "stringWithFormat:", CFSTR("placeholder-light-%@-%0.2f-%0.2f-%0.2f-%0.2f"), v13, *(_QWORD *)&topRight, *(_QWORD *)&bottomRight, *(_QWORD *)&bottomLeft, *(_QWORD *)&topLeft);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache, "objectForKey:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = +[TVCornerUtilities createPathForRadii:inRect:](TVCornerUtilities, "createPathForRadii:inRect:", topLeft, topRight, bottomLeft, bottomRight, 0.0, 0.0, width, height);
      v26.width = width;
      v26.height = height;
      UIGraphicsBeginImageContext(v26);
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDF6950];
      v20 = 0.921568627;
      goto LABEL_9;
    }
  }
  v21 = (void *)v16;
LABEL_10:

  return v21;
}

uint64_t __87__TVMLUtilities__defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache;
  _defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache = (uint64_t)v0;

  return objc_msgSend((id)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache, "setCountLimit:", 8);
}

+ (id)_placeholderImageForViewElement:(id)a3 imageLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForStyle:", CFSTR("tv-placeholder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "templateElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(a1, "interfaceStyleForTemplateElement:", v11);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(a1, "_placeholderImageForValue:userInterfaceStyle:", v9, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_13;
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageForResource:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_11;
    }
    else
    {
      v13 = 0;
      if (!v6)
        goto LABEL_11;
    }
    if (!v13)
    {
      objc_msgSend(v6, "placeholderArtworkName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_12;
      objc_msgSend(v6, "placeholderArtworkName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageForResource:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:
    if (v13)
      goto LABEL_13;
LABEL_12:
    objc_msgSend(a1, "_defaultPlaceholderImageForUserInterfaceStyle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

+ (id)_placeholderImageForViewElement:(id)a3
{
  return (id)objc_msgSend(a1, "_placeholderImageForViewElement:imageLayout:", a3, 0);
}

+ (id)_placeholderImageForViewElement:(id)a3 withImageLayout:(id)a4 cornerRadii:(TVCornerRadii)a5 andScaledSize:(CGSize)a6
{
  double height;
  double width;
  double bottomRight;
  double bottomLeft;
  double topRight;
  double topLeft;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  height = a6.height;
  width = a6.width;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topRight = a5.topRight;
  topLeft = a5.topLeft;
  v14 = a3;
  v15 = a4;
  objc_msgSend(v14, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForStyle:", CFSTR("tv-placeholder"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "appDocument");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "templateElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(a1, "interfaceStyleForTemplateElement:", v19);
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(a1, "_placeholderImageForValue:userInterfaceStyle:withCornerRadii:andScaledSize:", v17, v20, topLeft, topRight, bottomLeft, bottomRight, width, height);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_10;
    }
    else
    {
      v21 = 0;
      if (!v15)
        goto LABEL_10;
    }
    if (!v21)
    {
      objc_msgSend(v15, "placeholderArtworkName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_11;
      objc_msgSend(a1, "_placeholderImageForViewElement:imageLayout:", v14, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_10:
    if (v21)
      goto LABEL_12;
LABEL_11:
    objc_msgSend(a1, "_defaultPlaceholderImageForUserInterfaceStyle:withCornerRadii:andSize:", v20, topLeft, topRight, bottomLeft, bottomRight, width, height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v21 = 0;
LABEL_12:

  return v21;
}

+ (id)_placeholderImageForViewElement:(id)a3 withCornerRadii:(TVCornerRadii)a4 andScaledSize:(CGSize)a5
{
  return (id)objc_msgSend(a1, "_placeholderImageForViewElement:withImageLayout:cornerRadii:andScaledSize:", a3, 0, a4.topLeft, a4.topRight, a4.bottomLeft, a4.bottomRight, a5.width, a5.height);
}

+ (void)disassociateIKViewElementsRecursivelyFromView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "tv_setAssociatedIKViewElement:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "disassociateIKViewElementsRecursivelyFromView:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "components", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(a1, "disassociateIKViewElementsRecursivelyFromView:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
}

+ (BOOL)isFlowcaseAtTopOfStackFromElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "appDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tv_elementType");

  if (v6 == 74)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "appDocument", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        if (objc_msgSend(v14, "tv_elementType") == 12)
          break;
        if (objc_msgSend(v14, "tv_elementType") == 10)
        {
          objc_msgSend(v14, "children");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v17, "tv_elementType") == 9 || objc_msgSend(v17, "tv_elementType") == 12;
          goto LABEL_18;
        }
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          v15 = 0;
          if (v11)
            goto LABEL_4;
          goto LABEL_18;
        }
      }
    }
    v15 = 0;
LABEL_18:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)canHandleDecodingOnRenderThread
{
  return 0;
}

+ (id)_mobileGestaltStringForKey:(__CFString *)a3
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  void *v6;

  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (double)_headerFadeForShowcaseFactor:(double)a3
{
  return fmax(a3 * -2.0 + 1.0, 0.0);
}

+ (BOOL)isAXSmallEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDF76C0]))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x24BDF7678]) == NSOrderedDescending
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x24BDF7650]) == NSOrderedAscending;

  return v8;
}

+ (BOOL)isAXLargeEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDF76C0]))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x24BDF7658]) == NSOrderedDescending;

  return v8;
}

+ (void)_placeholderImageForValue:(uint64_t)a1 userInterfaceStyle:(NSObject *)a2 withCornerRadii:andScaledSize:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_222D98000, a2, OS_LOG_TYPE_ERROR, "Failed to load placeholder image named: [%@]", (uint8_t *)&v2, 0xCu);
}

@end
