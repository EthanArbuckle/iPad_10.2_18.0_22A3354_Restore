@implementation IKTextElement

id __54__IKTextElement_TVMLKitAdditions__tv_attributedString__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TVMLUtilities fontFromStyle:](TVMLUtilities, "fontFromStyle:", a2);
}

id __88__IKTextElement_TVMLKitAdditions__tv_attributedStringWithForegroundColor_textAlignment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TVMLUtilities fontFromStyle:](TVMLUtilities, "fontFromStyle:", a2);
}

void __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  objc_msgSend(a1[4], "objectForKeyedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v8, v7);
    objc_msgSend(a1[6], "addObject:", v7);

  }
}

void __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *MEMORY[0x24BDF65F8];
  v7 = objc_msgSend(v4, "rangeValue");
  objc_msgSend(v5, "attribute:atIndex:longestEffectiveRange:inRange:", v6, 0, 0, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointSize");
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", v19, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDF6768]);
  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v13);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  v16 = objc_msgSend(v4, "rangeValue");
  v18 = v17;

  objc_msgSend(v15, "replaceCharactersInRange:withAttributedString:", v16, v18, v14);
}

@end
