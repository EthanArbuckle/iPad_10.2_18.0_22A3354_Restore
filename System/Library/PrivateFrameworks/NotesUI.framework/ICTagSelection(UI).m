@implementation ICTagSelection(UI)

- (id)summaryWithJoinOperatorMenu:()UI usingTextStyle:foregroundColor:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = *MEMORY[0x1E0DC1138];
  v54[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(a1, "fontForTextStyle:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = *MEMORY[0x1E0DC1140];
  v55[0] = v12;
  v55[1] = v9;
  v13 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(a1, "mode");
  switch(v16)
  {
    case 2:
      v21 = objc_alloc(MEMORY[0x1E0CB3778]);
      v22 = (void *)MEMORY[0x1E0D64218];
      v23 = CFSTR("Show untagged notes only.");
LABEL_8:
      objc_msgSend(v22, "localizedFrameworkStringForKey:value:table:allowSiri:", v23, v23, 0, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      goto LABEL_9;
    case 1:
      v21 = objc_alloc(MEMORY[0x1E0CB3778]);
      v22 = (void *)MEMORY[0x1E0D64218];
      v23 = CFSTR("Show notes with tags.");
      goto LABEL_8;
    case 0:
      if ((unint64_t)objc_msgSend(a1, "selectedTagCount") >= 3)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS %lu selected tags."), CFSTR("Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS %lu selected tags."), 0, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v17, objc_msgSend(a1, "selectedTagCount"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v18, "initWithString:attributes:", v19, v15);

        goto LABEL_10;
      }
      if (objc_msgSend(a1, "selectedTagCount"))
      {
        if (objc_msgSend(a1, "selectedTagCount") == 1)
          v35 = CFSTR("Show notes that match the selected tag: %@.");
        else
          v35 = CFSTR("Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS selected tags: %@.");
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v35, v35, 0, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "hashtagPrefixedDisplayTexts");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke;
        v49[3] = &unk_1E5C1FB58;
        v50 = v37;
        v51 = v36;
        v44 = v36;
        v39 = v37;
        objc_msgSend(v38, "enumerateObjectsUsingBlock:", v49);

        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR(", "), CFSTR(", "), 0, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", v43);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v17, v42);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v40, v15);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke_2;
        v45[3] = &unk_1E5C1FB80;
        v45[4] = a1;
        v46 = v8;
        v47 = v9;
        v20 = v41;
        v48 = v20;
        objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v45);

        v13 = 0x1E0C99000;
LABEL_10:

        if ((a3 & 1) != 0)
          goto LABEL_15;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS selected tags."), CFSTR("Show notes that match INLINE_MENU_PLEASE_READ_COMMENTS selected tags."), 0, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x1E0CB3778]);
LABEL_9:
      v20 = (id)objc_msgSend(v24, "initWithString:attributes:", v17, v15);
      goto LABEL_10;
  }
  v20 = 0;
  if ((a3 & 1) != 0)
    goto LABEL_15;
LABEL_13:
  objc_msgSend(v20, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "rangeOfString:", ICTagSelectionMenuReplacementSubstring);
  v28 = v27;

  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v52 = v11;
    objc_msgSend(a1, "boldFontForTextStyle:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v29;
    objc_msgSend(*(id *)(v13 + 3456), "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttributes:range:", v30, v26, v28);

    objc_msgSend(a1, "tagOperator");
    ICLocalizedStringFromICTagSelectionOperator();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "replaceCharactersInRange:withString:", v26, v28, v31);

  }
LABEL_15:
  if (v20)
    v32 = objc_msgSend(v20, "copy");
  else
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E5C2F8C0);
  v33 = (void *)v32;

  return v33;
}

- (id)fontForTextStyle:()UI
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_fontWithSingleLineA");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)boldFontForTextStyle:()UI
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForStyle:symbolicTraits:", a3, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_fontWithSingleLineA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
