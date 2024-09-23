@implementation NSAttributedString(UIKitAdditions_Internal)

- (id)_ui_attributedStringAdjustedToTraitCollection:()UIKitAdditions_Internal
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  +[_NSAttributedStringIntentResolver attributedStringByResolvingString:](_UIAttributedStringIntentResolver, "attributedStringByResolvingString:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  if (v4)
  {
    v6 = objc_msgSend(a1, "length");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__NSAttributedString_UIKitAdditions_Internal___ui_attributedStringAdjustedToTraitCollection___block_invoke;
    v13[3] = &unk_1E16B15F8;
    v14 = v4;
    v16 = &v17;
    v15 = v5;
    objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0x100000, v13);

    v7 = (void *)v18[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = a1;
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_ui_rtfdFileWrapperError:()UIKitAdditions_Internal
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "length");
  v9 = *(_QWORD *)off_1E1678CE0;
  v10[0] = *(_QWORD *)off_1E1679000;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileWrapperFromRange:documentAttributes:error:", 0, v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_ui_rtfDataError:()UIKitAdditions_Internal
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "length");
  v9 = *(_QWORD *)off_1E1678CE0;
  v10[0] = *(_QWORD *)off_1E1679008;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
