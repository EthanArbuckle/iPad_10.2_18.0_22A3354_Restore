@implementation NSMutableAttributedString

uint64_t __95__NSMutableAttributedString_IC__ic_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3 - *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 56), a4);
}

void __92__NSMutableAttributedString_ReminderKitAdditions__rem_replaceTTREMHashtag_withTTREMHashtag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", a3, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("_TTREMHashtag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v15 + 32) = a3;
    *(_QWORD *)(v15 + 40) = a4;
    *a5 = 1;
  }

}

void __96__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setFontHint_isOn_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  id v15;

  v7 = a2;
  v15 = v7;
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", TTAttributeNameFontHints);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  v12 = *(_QWORD *)(a1 + 40);
  v13 = v11;
  if ((v12 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 48))
      v13 = v11 | 1;
    else
      v13 = v11 & 0xFFFFFFFE;
  }
  if ((v12 & 2) != 0)
  {
    if (*(_BYTE *)(a1 + 48))
      v13 |= 2u;
    else
      v13 &= ~2u;
  }
  if (v13 != v11)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v14, TTAttributeNameFontHints);

    }
    else
    {
      objc_msgSend(v9, "removeObjectForKey:", TTAttributeNameFontHints);
    }
    objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);
  }

}

void __92__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setUnderline_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", TTAttributeNameUnderline);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = v13;
  if (*(unsigned __int8 *)(a1 + 40) != v8)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (v13)
      {
        v10 = objc_msgSend(v13, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, TTAttributeNameUnderline);

      objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v11, a3, a4);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", TTAttributeNameUnderline, a3, a4);
    }
    v9 = v13;
  }

}

@end
