@implementation UITextFormattingViewControllerFormattingDescriptor

+ (BOOL)_canToggleTrait:(unsigned int)a3 forFont:(id)a4 inText:(id)a5
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = sub_1865074F8();
  v9 = v8;
  v10 = a4;
  LOBYTE(a3) = sub_1856EBACC(a3, v7, v9);

  swift_bridgeObjectRelease();
  return a3 & 1;
}

- (UITextFormattingViewControllerFormattingDescriptor)init
{
  UITextFormattingViewControllerFormattingDescriptor *v2;
  uint64_t v3;
  NSSet *textAlignments;
  uint64_t v5;
  NSSet *textLists;
  uint64_t v7;
  NSSet *highlights;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITextFormattingViewControllerFormattingDescriptor;
  v2 = -[UITextFormattingViewControllerFormattingDescriptor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    textAlignments = v2->_textAlignments;
    v2->_textAlignments = (NSSet *)v3;

    v5 = objc_opt_new();
    textLists = v2->_textLists;
    v2->_textLists = (NSSet *)v5;

    v7 = objc_opt_new();
    highlights = v2->_highlights;
    v2->_highlights = (NSSet *)v7;

    v2->__blockquote = 0;
    v2->_strikethrough = 0;
    v2->_listStyle = 0;
    v2->_underline = 0;
    *(_WORD *)&v2->__canToggleBold = 257;
  }
  return v2;
}

- (UITextFormattingViewControllerFormattingDescriptor)initWithString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  UITextFormattingViewControllerFormattingDescriptor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  UITextFormattingViewControllerFormattingDescriptor *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (location + length <= objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", location, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__100;
    v32[4] = __Block_byref_object_dispose__100;
    v33 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __75__UITextFormattingViewControllerFormattingDescriptor_initWithString_range___block_invoke;
    v25[3] = &unk_1E16C8FF0;
    v15 = v11;
    v26 = v15;
    v16 = v12;
    v27 = v16;
    v31 = v32;
    v17 = v13;
    v28 = v17;
    v18 = v14;
    v29 = v18;
    v19 = v10;
    v30 = v19;
    objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v25);
    if ((unint64_t)objc_msgSend(v15, "count") >= 2)
      objc_msgSend(v19, "setValue:forKey:", v15, *(_QWORD *)off_1E1678D90);
    if ((unint64_t)objc_msgSend(v16, "count") >= 2)
      objc_msgSend(v19, "setValue:forKey:", v16, *(_QWORD *)off_1E1678F98);
    if ((unint64_t)objc_msgSend(v17, "count") >= 2)
      objc_msgSend(v19, "setValue:forKey:", v17, *(_QWORD *)off_1E16790F0);
    if ((unint64_t)objc_msgSend(v18, "count") >= 2)
      objc_msgSend(v19, "setValue:forKey:", v18, *(_QWORD *)off_1E1679130);
    v20 = -[UITextFormattingViewControllerFormattingDescriptor initWithAttributes:](self, "initWithAttributes:", v19);
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerFormattingDescriptor set_canToggleBold:](v20, "set_canToggleBold:", +[UITextFormattingViewControllerFormattingDescriptor _canToggleTrait:forFont:inText:](UITextFormattingViewControllerFormattingDescriptor, "_canToggleTrait:forFont:inText:", 2, v21, v22));

      objc_msgSend(v7, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerFormattingDescriptor set_canToggleItalic:](v20, "set_canToggleItalic:", +[UITextFormattingViewControllerFormattingDescriptor _canToggleTrait:forFont:inText:](UITextFormattingViewControllerFormattingDescriptor, "_canToggleTrait:forFont:inText:", 1, v21, v23));

    }
    v8 = v20;

    _Block_object_dispose(v32, 8);
  }
  else
  {
    v8 = -[UITextFormattingViewControllerFormattingDescriptor initWithAttributes:](self, "initWithAttributes:", MEMORY[0x1E0C9AA70]);
  }

  return v8;
}

void __75__UITextFormattingViewControllerFormattingDescriptor_initWithString_range___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)off_1E16790F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v6
      || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_opt_respondsToSelector() & 1),
          v7 = objc_claimAutoreleasedReturnValue(),
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
          v9 = *(void **)(v8 + 40),
          *(_QWORD *)(v8 + 40) = v7,
          v9,
          (v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) != 0))
    {
      if (objc_msgSend(v6, "BOOLValue"))
      {
        objc_msgSend(v5, "performSelector:", sel_name);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

      }
    }
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679130);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
  v12 = *(_QWORD *)off_1E1679240;
  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679240);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 64), "valueForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v16, v12);

    }
  }
  v17 = *(_QWORD *)off_1E1679060;
  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679060);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 64), "valueForKey:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setValue:forKey:", v21, v17);

    }
  }

}

- (UITextFormattingViewControllerFormattingDescriptor)initWithAttributes:(id)a3
{
  id v4;
  UITextFormattingViewControllerFormattingDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void **v9;
  uint64_t v10;
  NSArray *fonts;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *textColors;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSSet *customComponentKeys;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UITextFormattingViewControllerFormattingDescriptor init](self, "init");
  if (!v5)
    goto LABEL_40;
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1678D90);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1678F78);
  v7 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v7;
  if (v7)
  {
    v58[0] = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = (void **)v58;
LABEL_4:
    objc_msgSend(v8, "arrayWithObjects:count:", v9, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    fonts = v5->_fonts;
    v5->_fonts = (NSArray *)v10;

    goto LABEL_5;
  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v5->_fonts, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = v6;
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = &v57;
        goto LABEL_4;
      }
    }
  }
LABEL_5:
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1678D98);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v56 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    textColors = v5->_textColors;
    v5->_textColors = (NSArray *)v14;

  }
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1678F98, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  if (!v16)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v16, "count"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_17;
      goto LABEL_13;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  v17 = v16;
LABEL_13:
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v5->__paragraphStyle, v18);
  objc_msgSend(v18, "minimumLineHeight");
  if (v19 > 0.0)
  {
    objc_msgSend(v18, "minimumLineHeight");
    v5->_lineHeight = v20;
  }
  v21 = (void *)objc_opt_new();
  v22 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke;
  v53[3] = &unk_1E16C9018;
  v54 = v21;
  v23 = v21;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v53);
  -[UITextFormattingViewControllerFormattingDescriptor setTextAlignments:](v5, "setTextAlignments:", v23);
  v51[0] = v22;
  v51[1] = 3221225472;
  v51[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_2;
  v51[3] = &unk_1E16C9018;
  v52 = (id)objc_opt_new();
  v24 = v52;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v51);
  v49[0] = v22;
  v49[1] = 3221225472;
  v49[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_3;
  v49[3] = &unk_1E16C9040;
  v50 = (id)objc_opt_new();
  v25 = v50;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v49);
  -[UITextFormattingViewControllerFormattingDescriptor setTextLists:](v5, "setTextLists:", v25);

LABEL_17:
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1679240);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_underlinePresent = objc_msgSend(v26, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1679060);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_strikethroughPresent = objc_msgSend(v27, "BOOLValue");

  v5->__blockquote = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E16790F0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_4;
      v47[3] = &unk_1E16B8630;
      v48 = v28;
      objc_msgSend(v29, "enumerateObjectsUsingBlock:", v47);
      v30 = v48;
    }
    else
    {
      v30 = v29;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v30, "performSelector:", sel_name);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        if (v31)
        {
          _UITextFormattingViewControllerComponentKeyForAnimation(v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v33);

        }
      }
    }

  }
  if (objc_msgSend(v28, "count"))
  {
    v34 = objc_msgSend(v28, "copy");
    customComponentKeys = v5->__customComponentKeys;
    v5->__customComponentKeys = (NSSet *)v34;

  }
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1679130);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_opt_new();
  if (!v36)
    goto LABEL_36;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_5;
    v45[3] = &unk_1E16B8630;
    v46 = v37;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:", v45);
    v38 = v46;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_36;
    _UITextFormattingViewControllerHighlightFromColorScheme(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v38);
  }

LABEL_36:
  -[UITextFormattingViewControllerFormattingDescriptor setHighlights:](v5, "setHighlights:", v37);
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1679170);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSSet count](v5->_highlights, "count") && v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("UITextFormattingViewControllerHighlightDefault"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor setHighlights:](v5, "setHighlights:", v40);

  }
LABEL_40:

  return v5;
}

uint64_t __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  __CFString *v4;

  v3 = objc_msgSend(a2, "alignment");
  if (v3 > 4)
    v4 = 0;
  else
    v4 = off_1E16C9060[v3];
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "textLists");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "markerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)off_1E1679188);

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = CFSTR("UITextFormattingViewControllerTextListDisc");
    goto LABEL_7;
  }
  objc_msgSend(v12, "markerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)off_1E1679180))
  {

LABEL_6:
    v5 = *(void **)(a1 + 32);
    v6 = CFSTR("UITextFormattingViewControllerTextListDecimal");
    goto LABEL_7;
  }
  objc_msgSend(v12, "markerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("{decimal}."));

  if (v9)
    goto LABEL_6;
  objc_msgSend(v12, "markerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)off_1E1679190);

  v5 = *(void **)(a1 + 32);
  if (v11)
    v6 = CFSTR("UITextFormattingViewControllerTextListHyphen");
  else
    v6 = CFSTR("UITextFormattingViewControllerTextListOther");
LABEL_7:
  objc_msgSend(v5, "addObject:", v6);

}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  _UITextFormattingViewControllerComponentKeyForAnimation(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  _UITextFormattingViewControllerHighlightFromColorScheme(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UITextFormattingViewControllerFormattingDescriptor formattingStyleKey](self, "formattingStyleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFormattingStyleKey:", v5);

  -[UITextFormattingViewControllerFormattingDescriptor fonts](self, "fonts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)v4[6];
  v4[6] = v7;

  -[UITextFormattingViewControllerFormattingDescriptor textColors](self, "textColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v4[7];
  v4[7] = v10;

  -[UITextFormattingViewControllerFormattingDescriptor lineHeight](self, "lineHeight");
  v4[8] = v12;
  objc_msgSend(v4, "setUnderline:", -[UITextFormattingViewControllerFormattingDescriptor underline](self, "underline"));
  objc_msgSend(v4, "setUnderlinePresent:", -[UITextFormattingViewControllerFormattingDescriptor underlinePresent](self, "underlinePresent"));
  objc_msgSend(v4, "setStrikethrough:", -[UITextFormattingViewControllerFormattingDescriptor strikethrough](self, "strikethrough"));
  objc_msgSend(v4, "setStrikethroughPresent:", -[UITextFormattingViewControllerFormattingDescriptor strikethroughPresent](self, "strikethroughPresent"));
  -[UITextFormattingViewControllerFormattingDescriptor textAlignments](self, "textAlignments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignments:", v13);

  objc_msgSend(v4, "setListStyle:", -[UITextFormattingViewControllerFormattingDescriptor listStyle](self, "listStyle"));
  -[UITextFormattingViewControllerFormattingDescriptor textLists](self, "textLists");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextLists:", v14);

  -[UITextFormattingViewControllerFormattingDescriptor highlights](self, "highlights");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlights:", v15);

  -[UITextFormattingViewControllerFormattingDescriptor _paragraphStyle](self, "_paragraphStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_paragraphStyle:", v16);

  -[UITextFormattingViewControllerFormattingDescriptor _customComponentKeys](self, "_customComponentKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "set_customComponentKeys:", v18);

  -[UITextFormattingViewControllerFormattingDescriptor _emphasisStyleKey](self, "_emphasisStyleKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_emphasisStyleKey:", v19);

  objc_msgSend(v4, "set_blockquote:", -[UITextFormattingViewControllerFormattingDescriptor _blockquote](self, "_blockquote"));
  objc_msgSend(v4, "set_canToggleBold:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleBold](self, "_canToggleBold"));
  objc_msgSend(v4, "set_canToggleItalic:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleItalic](self, "_canToggleItalic"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UITextFormattingViewControllerFormattingDescriptor *v4;
  UITextFormattingViewControllerFormattingDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  int64_t v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = (UITextFormattingViewControllerFormattingDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UITextFormattingViewControllerFormattingDescriptor formattingStyleKey](self, "formattingStyleKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerFormattingDescriptor formattingStyleKey](v5, "formattingStyleKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[UITextFormattingViewControllerFormattingDescriptor fonts](self, "fonts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextFormattingViewControllerFormattingDescriptor fonts](v5, "fonts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToArray:", v9))
        {
          -[UITextFormattingViewControllerFormattingDescriptor textColors](self, "textColors");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextFormattingViewControllerFormattingDescriptor textColors](v5, "textColors");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToArray:", v11)
            && (-[UITextFormattingViewControllerFormattingDescriptor lineHeight](self, "lineHeight"),
                v13 = v12,
                -[UITextFormattingViewControllerFormattingDescriptor lineHeight](v5, "lineHeight"),
                v13 == v14)
            && (v15 = -[UITextFormattingViewControllerFormattingDescriptor underlinePresent](self, "underlinePresent"),
                v15 == -[UITextFormattingViewControllerFormattingDescriptor underlinePresent](v5, "underlinePresent"))
            && (v16 = -[UITextFormattingViewControllerFormattingDescriptor strikethroughPresent](self, "strikethroughPresent"), v16 == -[UITextFormattingViewControllerFormattingDescriptor strikethroughPresent](v5, "strikethroughPresent")))
          {
            -[UITextFormattingViewControllerFormattingDescriptor textAlignments](self, "textAlignments");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITextFormattingViewControllerFormattingDescriptor textAlignments](v5, "textAlignments");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v19;
            if (objc_msgSend(v19, "isEqualToSet:", v37))
            {
              -[UITextFormattingViewControllerFormattingDescriptor textLists](self, "textLists");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextFormattingViewControllerFormattingDescriptor textLists](v5, "textLists");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v20;
              if (objc_msgSend(v20, "isEqualToSet:", v35))
              {
                -[UITextFormattingViewControllerFormattingDescriptor highlights](self, "highlights");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[UITextFormattingViewControllerFormattingDescriptor highlights](v5, "highlights");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = v21;
                if (objc_msgSend(v21, "isEqualToSet:", v33))
                {
                  -[UITextFormattingViewControllerFormattingDescriptor _customComponentKeys](self, "_customComponentKeys");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UITextFormattingViewControllerFormattingDescriptor _customComponentKeys](v5, "_customComponentKeys");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = v22;
                  if (objc_msgSend(v22, "isEqualToSet:", v31))
                  {
                    -[UITextFormattingViewControllerFormattingDescriptor _emphasisStyleKey](self, "_emphasisStyleKey");
                    v23 = objc_claimAutoreleasedReturnValue();
                    -[UITextFormattingViewControllerFormattingDescriptor _emphasisStyleKey](v5, "_emphasisStyleKey");
                    v24 = objc_claimAutoreleasedReturnValue();
                    v30 = (void *)v23;
                    v25 = (void *)v23;
                    v26 = (void *)v24;
                    if (objc_msgSend(v25, "isEqualToString:", v24)
                      && (v28 = -[UITextFormattingViewControllerFormattingDescriptor _blockquote](self, "_blockquote"),
                          v28 == -[UITextFormattingViewControllerFormattingDescriptor _blockquote](v5, "_blockquote"))
                      && (v29 = -[UITextFormattingViewControllerFormattingDescriptor _canToggleBold](self, "_canToggleBold"), v29 == -[UITextFormattingViewControllerFormattingDescriptor _canToggleBold](v5, "_canToggleBold")))
                    {
                      v27 = -[UITextFormattingViewControllerFormattingDescriptor _canToggleItalic](self, "_canToggleItalic");
                      v17 = v27 ^ -[UITextFormattingViewControllerFormattingDescriptor _canToggleItalic](v5, "_canToggleItalic") ^ 1;
                    }
                    else
                    {
                      LOBYTE(v17) = 0;
                    }

                  }
                  else
                  {
                    LOBYTE(v17) = 0;
                  }

                }
                else
                {
                  LOBYTE(v17) = 0;
                }

              }
              else
              {
                LOBYTE(v17) = 0;
              }

            }
            else
            {
              LOBYTE(v17) = 0;
            }

          }
          else
          {
            LOBYTE(v17) = 0;
          }

        }
        else
        {
          LOBYTE(v17) = 0;
        }

      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  -[UITextFormattingViewControllerFormattingDescriptor formattingStyleKey](self, "formattingStyleKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v29, "hash");
  -[UITextFormattingViewControllerFormattingDescriptor fonts](self, "fonts");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v28, "hash");
  -[UITextFormattingViewControllerFormattingDescriptor textColors](self, "textColors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v27, "hash");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextFormattingViewControllerFormattingDescriptor lineHeight](self, "lineHeight");
  objc_msgSend(v3, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v26, "hash");
  v19 = -[UITextFormattingViewControllerFormattingDescriptor underlinePresent](self, "underlinePresent");
  v18 = -[UITextFormattingViewControllerFormattingDescriptor strikethroughPresent](self, "strikethroughPresent");
  -[UITextFormattingViewControllerFormattingDescriptor textAlignments](self, "textAlignments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v22, "hash");
  -[UITextFormattingViewControllerFormattingDescriptor textLists](self, "textLists");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v20, "hash");
  -[UITextFormattingViewControllerFormattingDescriptor highlights](self, "highlights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "hash");
  -[UITextFormattingViewControllerFormattingDescriptor _paragraphStyle](self, "_paragraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[UITextFormattingViewControllerFormattingDescriptor _customComponentKeys](self, "_customComponentKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[UITextFormattingViewControllerFormattingDescriptor _emphasisStyleKey](self, "_emphasisStyleKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = -[UITextFormattingViewControllerFormattingDescriptor _blockquote](self, "_blockquote");
  v12 = -[UITextFormattingViewControllerFormattingDescriptor _canToggleBold](self, "_canToggleBold");
  v13 = v25 ^ v24 ^ v23 ^ v19 ^ v18 ^ v17 ^ v21 ^ v16 ^ v15 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ -[UITextFormattingViewControllerFormattingDescriptor _canToggleItalic](self, "_canToggleItalic") ^ 1;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[UITextFormattingViewControllerFormattingDescriptor formattingStyleKey](self, "formattingStyleKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("_FormattingStyleKey"));

  -[UITextFormattingViewControllerFormattingDescriptor fonts](self, "fonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("_Fonts"));

  -[UITextFormattingViewControllerFormattingDescriptor textColors](self, "textColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("_TextColors"));

  -[UITextFormattingViewControllerFormattingDescriptor lineHeight](self, "lineHeight");
  *(float *)&v7 = v7;
  objc_msgSend(v14, "encodeFloat:forKey:", CFSTR("_LineHeight"), v7);
  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor underline](self, "underline"), CFSTR("Underline"));
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor underlinePresent](self, "underlinePresent"), CFSTR("_UnderlinePresent"));
  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor strikethrough](self, "strikethrough"), CFSTR("_Strikethrough"));
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor strikethroughPresent](self, "strikethroughPresent"), CFSTR("_StrikethroughPresent"));
  -[UITextFormattingViewControllerFormattingDescriptor textAlignments](self, "textAlignments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("_TextAlignments"));

  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor listStyle](self, "listStyle"), CFSTR("_ListStyle"));
  -[UITextFormattingViewControllerFormattingDescriptor textLists](self, "textLists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("_TextLists"));

  -[UITextFormattingViewControllerFormattingDescriptor highlights](self, "highlights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("_Highlights"));

  -[UITextFormattingViewControllerFormattingDescriptor _paragraphStyle](self, "_paragraphStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeInteger:forKey:", v11, CFSTR("_ParagraphStyle"));

  -[UITextFormattingViewControllerFormattingDescriptor _customComponentKeys](self, "_customComponentKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("_CustomComponentKeys"));

  -[UITextFormattingViewControllerFormattingDescriptor _emphasisStyleKey](self, "_emphasisStyleKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("_EmphasisStyleKey"));

  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor _blockquote](self, "_blockquote"), CFSTR("_Blockquote"));
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleBold](self, "_canToggleBold"), CFSTR("_CanToggleBold"));
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleItalic](self, "_canToggleItalic"), CFSTR("_CanToggleItalic"));

}

- (UITextFormattingViewControllerFormattingDescriptor)initWithCoder:(id)a3
{
  id v4;
  UITextFormattingViewControllerFormattingDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = -[UITextFormattingViewControllerFormattingDescriptor init](self, "init");
  if (v5)
  {
    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_FormattingStyleKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor setFormattingStyleKey:](v5, "setFormattingStyleKey:", v7);

    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_Fonts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor setFonts:](v5, "setFonts:", v9);

    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_TextColors"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor setTextColors:](v5, "setTextColors:", v11);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_LineHeight"));
    -[UITextFormattingViewControllerFormattingDescriptor setLineHeight:](v5, "setLineHeight:", v12);
    -[UITextFormattingViewControllerFormattingDescriptor setUnderline:](v5, "setUnderline:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Underline")));
    -[UITextFormattingViewControllerFormattingDescriptor setUnderlinePresent:](v5, "setUnderlinePresent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UnderlinePresent")));
    -[UITextFormattingViewControllerFormattingDescriptor setStrikethrough:](v5, "setStrikethrough:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_Strikethrough")));
    -[UITextFormattingViewControllerFormattingDescriptor setStrikethroughPresent:](v5, "setStrikethroughPresent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_StrikethroughPresent")));
    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_TextAlignments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor setTextAlignments:](v5, "setTextAlignments:", v14);

    -[UITextFormattingViewControllerFormattingDescriptor setListStyle:](v5, "setListStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_ListStyle")));
    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_TextLists"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor setTextLists:](v5, "setTextLists:", v16);

    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_Highlights"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor setHighlights:](v5, "setHighlights:", v18);

    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_ParagraphStyle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor set_paragraphStyle:](v5, "set_paragraphStyle:", v20);

    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_CustomComponentKeys"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor set_customComponentKeys:](v5, "set_customComponentKeys:", v22);

    _UITextFormattingViewControllerFormattingDescriptorClasses();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("_EmphasisStyleKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerFormattingDescriptor set_emphasisStyleKey:](v5, "set_emphasisStyleKey:", v24);

    -[UITextFormattingViewControllerFormattingDescriptor set_blockquote:](v5, "set_blockquote:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_Blockquote")));
    -[UITextFormattingViewControllerFormattingDescriptor set_canToggleBold:](v5, "set_canToggleBold:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_CanToggleBold")));
    -[UITextFormattingViewControllerFormattingDescriptor set_canToggleItalic:](v5, "set_canToggleItalic:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_CanToggleItalic")));
  }

  return v5;
}

- (void)setUnderline:(int64_t)a3
{
  self->_underlinePresent = a3 != 0;
  self->_underline = a3;
}

- (void)setStrikethrough:(int64_t)a3
{
  self->_strikethroughPresent = a3 != 0;
  self->_strikethrough = a3;
}

- (void)setListStyle:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  NSSet *v7;
  NSSet *textLists;

  if (a3 > 2)
  {
    if (a3 == 3)
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = CFSTR("UITextFormattingViewControllerTextListDecimal");
      goto LABEL_11;
    }
    if (a3 == 98)
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = CFSTR("UITextFormattingViewControllerTextListOther");
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 1)
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = CFSTR("UITextFormattingViewControllerTextListDisc");
      goto LABEL_11;
    }
    if (a3 == 2)
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = CFSTR("UITextFormattingViewControllerTextListHyphen");
LABEL_11:
      objc_msgSend(v5, "setWithObject:", v6);
      v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  v7 = (NSSet *)objc_opt_new();
LABEL_12:
  textLists = self->_textLists;
  self->_textLists = v7;

  self->_listStyle = a3;
}

- (int64_t)underline
{
  return self->_underline;
}

- (int64_t)strikethrough
{
  return self->_strikethrough;
}

- (int64_t)listStyle
{
  return self->_listStyle;
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void)setFonts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)textColors
{
  return self->_textColors;
}

- (void)setTextColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (void)setLineHeight:(double)a3
{
  self->_lineHeight = a3;
}

- (BOOL)underlinePresent
{
  return self->_underlinePresent;
}

- (void)setUnderlinePresent:(BOOL)a3
{
  self->_underlinePresent = a3;
}

- (BOOL)strikethroughPresent
{
  return self->_strikethroughPresent;
}

- (void)setStrikethroughPresent:(BOOL)a3
{
  self->_strikethroughPresent = a3;
}

- (NSSet)textAlignments
{
  return self->_textAlignments;
}

- (void)setTextAlignments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)textLists
{
  return self->_textLists;
}

- (void)setTextLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)highlights
{
  return self->_highlights;
}

- (void)setHighlights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)formattingStyleKey
{
  return self->_formattingStyleKey;
}

- (void)setFormattingStyleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSParagraphStyle)_paragraphStyle
{
  return self->__paragraphStyle;
}

- (void)set_paragraphStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSSet)_customComponentKeys
{
  return self->__customComponentKeys;
}

- (void)set_customComponentKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)_emphasisStyleKey
{
  return self->__emphasisStyleKey;
}

- (void)set_emphasisStyleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)_blockquote
{
  return self->__blockquote;
}

- (void)set_blockquote:(int64_t)a3
{
  self->__blockquote = a3;
}

- (BOOL)_canToggleBold
{
  return self->__canToggleBold;
}

- (void)set_canToggleBold:(BOOL)a3
{
  self->__canToggleBold = a3;
}

- (BOOL)_canToggleItalic
{
  return self->__canToggleItalic;
}

- (void)set_canToggleItalic:(BOOL)a3
{
  self->__canToggleItalic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__emphasisStyleKey, 0);
  objc_storeStrong((id *)&self->__customComponentKeys, 0);
  objc_storeStrong((id *)&self->__paragraphStyle, 0);
  objc_storeStrong((id *)&self->_formattingStyleKey, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_textLists, 0);
  objc_storeStrong((id *)&self->_textAlignments, 0);
  objc_storeStrong((id *)&self->_textColors, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
