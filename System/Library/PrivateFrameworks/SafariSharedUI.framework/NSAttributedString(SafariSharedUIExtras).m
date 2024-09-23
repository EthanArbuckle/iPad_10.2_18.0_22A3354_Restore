@implementation NSAttributedString(SafariSharedUIExtras)

+ (id)safari_attributedStringWithLinkText:()SafariSharedUIExtras linkUrl:extraTitle:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  if (v9)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
    objc_msgSend(v10, "appendAttributedString:", v12);

    objc_msgSend(v10, "appendAttributedString:", v11);
  }
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v8)
  {
    v17 = *MEMORY[0x1E0CEA0C0];
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v7, v14);
  objc_msgSend(v10, "appendAttributedString:", v15);

  if (v8)
  objc_msgSend(v10, "appendAttributedString:", v11);

  return v10;
}

- (id)safari_attributedStringByReplacingAttributeName:()SafariSharedUIExtras withAttributes:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  v9 = objc_msgSend(a1, "length");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __107__NSAttributedString_SafariSharedUIExtras__safari_attributedStringByReplacingAttributeName_withAttributes___block_invoke;
  v16[3] = &unk_1E5444A90;
  v10 = v8;
  v17 = v10;
  v18 = v6;
  v19 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v9, 0, v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (id)safari_attributedStringByAppendingAttributedString:()SafariSharedUIExtras
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "appendAttributedString:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

@end
