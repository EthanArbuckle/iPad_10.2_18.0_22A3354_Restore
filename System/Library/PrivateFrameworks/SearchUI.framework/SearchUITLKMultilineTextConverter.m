@implementation SearchUITLKMultilineTextConverter

+ (id)textForSearchUIText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0DBD9C0];
    v4 = a3;
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "maxLines");
    objc_msgSend(v6, "setMaxLines:", v7);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)richTextForSearchUIText:(id)a3
{
  return (id)objc_msgSend(a1, "richTextForSearchUIText:withCompletionHandler:", a3, 0);
}

+ (id)textForSearchUIString:(id)a3
{
  void *v3;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DBD9C0], "textWithString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMaxLines:", 1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)richTextForSearchUIText:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  id v14[2];
  id from;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v20 = objc_msgSend(a1, "richTextOverridesAsyncLoader:", v6);
    v8 = (void *)objc_opt_new();
    if (*((_BYTE *)v18 + 24))
    {
      objc_initWeak(&location, v6);
      objc_initWeak(&from, v8);
      objc_msgSend(a1, "applyRichText:toTLKRichText:isAsync:", v6, v8, 1);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke;
      v10[3] = &unk_1EA1F62C8;
      objc_copyWeak(&v13, &location);
      objc_copyWeak(v14, &from);
      v14[1] = a1;
      v11 = v7;
      v12 = &v17;
      objc_msgSend(v6, "loadRichTextWithCompletionHandler:", v10);

      objc_destroyWeak(v14);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(a1, "applyRichText:toTLKRichText:isAsync:", v6, v8, 0);
      if (v7)
        (*((void (**)(id, id, void *, _QWORD))v7 + 2))(v7, v6, v8, *((unsigned __int8 *)v18 + 24));
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;
  id v7;
  id v8[2];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1EA1F62C8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  objc_copyWeak(v8, (id *)(a1 + 56));
  v8[1] = *(id *)(a1 + 64);
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v4);

  objc_destroyWeak(v8);
  objc_destroyWeak(&v7);
}

void __83__SearchUITLKMultilineTextConverter_richTextForSearchUIText_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "applyRichText:toTLKRichText:isAsync:", WeakRetained, v2, 1);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id, id, _QWORD))(v3 + 16))(v3, WeakRetained, v2, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

+ (void)applyRichText:(id)a3 toTLKRichText:(id)a4 isAsync:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v30 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = a4;
  v8 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v7, "formattedTextPieces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "formattedTextForSearchUIText:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v7, "icons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
        v20 = (void *)objc_opt_new();
        +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v19, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setImage:", v22);

        objc_msgSend(v8, "addObject:", v20);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v16);
  }

  objc_msgSend(v7, "starRating");
  if (v23 > 0.0)
  {
    v24 = (void *)objc_opt_new();
    objc_msgSend(v7, "starRating");
    objc_msgSend(v24, "setStarRating:");
    objc_msgSend(v8, "addObject:", v24);

  }
  objc_msgSend(v7, "contentAdvisory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (v26)
  {
    v25 = (void *)objc_opt_new();
    objc_msgSend(v7, "contentAdvisory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setString:", v27);

    objc_msgSend(v8, "addObject:", v25);
  }
  objc_msgSend(v31, "setFormattedTextItems:", v8);
  if (v30)
  {
    objc_msgSend(v7, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "length"))
    {
      objc_msgSend(v31, "setText:", CFSTR(" "));
      goto LABEL_24;
    }
  }
  objc_msgSend(v7, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v28);

  if (v30)
  {
LABEL_24:

    v29 = 1;
    goto LABEL_25;
  }
  v29 = objc_msgSend(v7, "maxLines");
LABEL_25:
  objc_msgSend(v31, "setMaxLines:", v29);

}

+ (BOOL)richTextOverridesAsyncLoader:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "methodForSelector:", sel_loadRichTextWithCompletionHandler_);
  return v3 != objc_msgSend(MEMORY[0x1E0D8C660], "instanceMethodForSelector:", sel_loadRichTextWithCompletionHandler_);
}

+ (id)formattedTextForSearchUIText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "glyph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "glyph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (TLKSnippetModernizationEnabled())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v7, "symbolScale"))
        objc_msgSend(v7, "setSymbolScale:", 1);
    }
    +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTlkImage:", v8);

  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:", v9);

    objc_msgSend(v5, "setMaxLines:", objc_msgSend(v3, "maxLines"));
    v10 = objc_msgSend(v3, "encapsulationStyle");
    if (v10 == 1)
      v11 = 1;
    else
      v11 = 2 * (v10 == 2);
    objc_msgSend(v5, "setEncapsulationStyle:", v11);
  }
  objc_msgSend(v5, "setColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", objc_msgSend(v3, "textColor")));
  objc_msgSend(v5, "setIsBold:", objc_msgSend(v3, "isBold"));
  objc_msgSend(v5, "setIsEmphasized:", objc_msgSend(v3, "isEmphasized"));

  return v5;
}

@end
