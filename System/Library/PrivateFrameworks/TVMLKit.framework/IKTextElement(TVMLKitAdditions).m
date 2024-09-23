@implementation IKTextElement(TVMLKitAdditions)

- (id)tv_attributedString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;

  v17 = 0;
  objc_msgSend(a1, "attributedStringWithFontHandler:defaultAttributes:", &__block_literal_global_2, &v17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v17;
  v4 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v4, "tv_currentParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(a1, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:withTextAlignment:", v8, objc_msgSend(v9, "tv_textAlignment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x24BDF6628];
  objc_msgSend(v4, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v10, 0, objc_msgSend(v4, "length"));
  v12 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v11);
  v13 = (void *)objc_msgSend(v4, "copy");
  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v13, "tv_setDefaultAttributes:", v14);

  if (+[TVMLUtilities mainBundleSupportsSFSymbols](TVMLUtilities, "mainBundleSupportsSFSymbols"))
  {
    objc_msgSend(a1, "tv_attributedStringReplacingSFSymbols:", v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }

  return v13;
}

- (id)tv_attributedStringWithForegroundColor:()TVMLKitAdditions textAlignment:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v19 = 0;
  objc_msgSend(a1, "attributedStringWithFontHandler:foregroundColor:textAlignment:defaultAttributes:", &__block_literal_global_44_0, a3, a4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "tv_currentParagraphStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:withTextAlignment:", v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDF6628];
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v13, 0, objc_msgSend(v8, "length"));
  v15 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v14);
  v16 = (void *)objc_msgSend(v8, "copy");
  v17 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v16, "tv_setDefaultAttributes:", v17);

  return v16;
}

- (uint64_t)tv_textStyle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "elementName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("subtitle")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("description")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("decorationLabel")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)tv_textAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVMLUtilities fontFromStyle:](TVMLUtilities, "fontFromStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x24BDF65F8]);
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v6, *MEMORY[0x24BDF6628]);
  objc_msgSend(a1, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v2, "setObject:forKey:", v9, *MEMORY[0x24BDF6600]);
  objc_msgSend(a1, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tv_textShadow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v2, "setObject:forKey:", v11, *MEMORY[0x24BDF6640]);
  v12 = (void *)objc_msgSend(v2, "copy");

  return v12;
}

- (id)tv_paragraphStyleForDefaultStyle:()TVMLKitAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tv_textAlignment");

  objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:withTextAlignment:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tv_paragraphStyleForDefaultStyle:()TVMLKitAdditions withTextAlignment:
{
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a1, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_textHyphenationFactor");
  *(float *)&v8 = v8;
  objc_msgSend(v6, "setHyphenationFactor:", v8);

  objc_msgSend(v6, "setLineBreakMode:", 4);
  objc_msgSend(v6, "setAlignment:", a4);
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

- (id)tv_attributedStringReplacingSFSymbols:()TVMLKitAdditions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v3 = a3;
  if (textImageUnicodeImageMapping_onceToken != -1)
    dispatch_once(&textImageUnicodeImageMapping_onceToken, &__block_literal_global_65);
  v4 = (id)textImageUnicodeImageMapping_mapping;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "length");
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke;
  v21[3] = &unk_24EB85288;
  v10 = v4;
  v22 = v10;
  v11 = v5;
  v23 = v11;
  v12 = v6;
  v24 = v12;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v21);

  if (objc_msgSend(v11, "count"))
  {
    v13 = (void *)objc_msgSend(v3, "mutableCopy");
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke_2;
    v18[3] = &unk_24EB852B0;
    v19 = v11;
    v14 = v13;
    v20 = v14;
    objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, v18);
    v15 = v20;
    v16 = v14;

  }
  else
  {
    v16 = v3;
  }

  return v16;
}

- (uint64_t)tv_associatedViewElement
{
  return objc_msgSend(a1, "tv_associatedViewElementWithDefaultClass:", objc_opt_class());
}

@end
