@implementation UIKeyboardVariants

uint64_t __UIKeyboardVariants_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 + 1) >= *(_QWORD *)(a1 + 40))
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:");
  return TICharIsAlphaNumeric();
}

void __UIKeyboardVariants_block_invoke_2(uint64_t a1, void *a2, int a3)
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  UIKeyboardLocalizedObject(*(void **)(a1 + 32), v20, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      UIKeyboardLocalizedObject(*(void **)(a1 + 40), v20, 0, 0, 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = a3 && !*(_BYTE *)(a1 + 80) && objc_msgSend(*(id *)(a1 + 48), "count") != 0;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Keycaps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Strings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "count");
    if (v12 == objc_msgSend(v11, "count"))
    {
      if (objc_msgSend(v9, "count"))
      {
        v13 = 0;
        while (1)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!*(_BYTE *)(a1 + 80)
            && ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v14) & 1) != 0
             || (objc_msgSend(*(id *)(a1 + 64), "containsObject:", v15) & 1) != 0))
          {
            goto LABEL_19;
          }
          v16 = *(void **)(a1 + 48);
          if (!v7)
            break;
          objc_msgSend(v16, "insertObject:atIndex:", v14, 0);
          objc_msgSend(*(id *)(a1 + 64), "insertObject:atIndex:", v15, 0);
          v7 = 1;
LABEL_20:

          if (++v13 >= (unint64_t)objc_msgSend(v9, "count"))
            goto LABEL_21;
        }
        objc_msgSend(v16, "addObject:", v14);
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v15);
LABEL_19:
        v7 = 0;
        goto LABEL_20;
      }
LABEL_21:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Direction"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

      }
    }
    else
    {
      NSLog(CFSTR("keycaps and strings length differ for %@ %@"), v20, *(_QWORD *)(a1 + 32));
    }

  }
}

@end
