@implementation ICTagSelection

void __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(v5, "ic_attachmentCharacterString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%lu"), v7, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18[0] = *MEMORY[0x1E0DC1138];
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v6, "boldFontForTextStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = *MEMORY[0x1E0DC1140];
  v19[0] = v9;
  v19[1] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "excludedHashtagPrefixedDisplayTexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "containsObject:", v5);

  if ((_DWORD)v10)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E5C71DD8, *MEMORY[0x1E0DC11A8]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v11);
  objc_msgSend(*(id *)(a1 + 56), "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rangeOfString:", v8);
  v17 = v16;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL && v15 + v17 <= (unint64_t)objc_msgSend(*(id *)(a1 + 56), "length"))
    objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withAttributedString:", v15, v17, v13);

}

@end
