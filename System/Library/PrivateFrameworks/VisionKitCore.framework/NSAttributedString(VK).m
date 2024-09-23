@implementation NSAttributedString(VK)

- (uint64_t)vk_range
{
  objc_msgSend(a1, "length");
  return 0;
}

- (id)vk_attributedSubstringFromVKRange:()VK
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  void *v16;
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "isEmpty"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3498]);
LABEL_6:
    v10 = v5;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "containsMultipleRanges") & 1) == 0)
  {
    v11 = objc_msgSend(v4, "nsRange");
    objc_msgSend(a1, "vk_attributedSubstringFromRange:", v11, v12);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v4, "rangeArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__NSAttributedString_VK__vk_attributedSubstringFromVKRange___block_invoke;
  v14[3] = &unk_1E9465C50;
  v15 = v6;
  v16 = a1;
  v17 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  v10 = (void *)objc_msgSend(v9, "copy");

LABEL_7:
  return v10;
}

- (void)vk_enumerateClampedAttribute:()VK inRange:options:usingBlock:
{
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[6];

  v12 = a3;
  v13 = a7;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[3] = &unk_1D2EE27EA;
  v18[4] = a4;
  v18[5] = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__NSAttributedString_VK__vk_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
  v15[3] = &unk_1E9465C78;
  v14 = v13;
  v16 = v14;
  v17 = v18;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, a4, a5, a6, v15);

  _Block_object_dispose(v18, 8);
}

- (void)vk_enumerateUnclampedAttribute:()VK inRange:options:usingBlock:
{
  id v12;
  void (**v13)(id, void *, unint64_t, uint64_t, char *);
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;

  v12 = a3;
  v13 = a7;
  if (a5)
  {
    v14 = a4 + ((a5 - 1) & (a6 << 62 >> 63));
    v21 = 0;
    v15 = objc_msgSend(a1, "length");
    while (1)
    {
      v19 = 0;
      v20 = 0;
      if ((a6 & 0x100000) != 0)
        objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v12, v14, &v19);
      else
        objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v14, &v19, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v16, v19, v20, &v21);
      if (v21)
        break;
      if ((a6 & 2) != 0)
      {
        if (v19 <= a4)
          break;
        v14 = v19 - 1;
      }
      else
      {
        v17 = objc_msgSend(a1, "length");
        v18 = a5 - v15 + v17;
        if (v17 == v15)
          v14 = v20 + v19;
        else
          v14 = v17 - v15 + v19 + v20;
        if (v17 != v15)
        {
          v15 = v17;
          a5 = v18;
        }
        if (v14 >= a5 + a4)
          break;
      }

    }
  }

}

- (id)vk_attributedStringByReplacingNewlineCharactersWithWhiteSpace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_attributedStringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)vk_attributedStringByReplacingCharactersInSet:()VK withString:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v6);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v6);
    v15 = v14;

    while (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v13, v15, v7);
      objc_msgSend(v11, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length") - v13;

      objc_msgSend(v11, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "rangeOfCharacterFromSet:options:range:", v6, 2, v13, v17);
      v15 = v19;

    }
    if (v11)
    {
      v20 = objc_msgSend(v11, "copy");

      v8 = (id)v20;
    }
  }

  return v8;
}

@end
