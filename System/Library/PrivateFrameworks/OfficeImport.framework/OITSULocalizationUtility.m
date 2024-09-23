@implementation OITSULocalizationUtility

+ (id)displayStringForIndexSet:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (displayStringForIndexSet__onceToken != -1)
    dispatch_once(&displayStringForIndexSet__onceToken, &__block_literal_global_17);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__OITSULocalizationUtility_displayStringForIndexSet___block_invoke_2;
  v6[3] = &unk_24F39B008;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v6);
  return v4;
}

id __53__OITSULocalizationUtility_displayStringForIndexSet___block_invoke()
{
  id result;

  displayStringForIndexSet__sIndexSeparator = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR(", "), &stru_24F3BFFF8, CFSTR("TSUtility"));
  result = (id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("-"), &stru_24F3BFFF8, CFSTR("TSUtility"));
  displayStringForIndexSet__sRangeSeparator = (uint64_t)result;
  return result;
}

uint64_t __53__OITSULocalizationUtility_displayStringForIndexSet___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", displayStringForIndexSet__sIndexSeparator);
  result = objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2), 1));
  if (a3 >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", displayStringForIndexSet__sRangeSeparator);
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 + a2 - 1), 1));
  }
  return result;
}

+ (id)displayStringForStrings:(id)a3
{
  if (displayStringForStrings__onceToken != -1)
    dispatch_once(&displayStringForStrings__onceToken, &__block_literal_global_11_0);
  return (id)objc_msgSend(a1, "displayStringForStrings:itemSeparator:", a3, displayStringForStrings__sSeparator);
}

id __52__OITSULocalizationUtility_displayStringForStrings___block_invoke()
{
  id result;

  result = (id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR(", "), &stru_24F3BFFF8, CFSTR("TSUtility"));
  displayStringForStrings__sSeparator = (uint64_t)result;
  return result;
}

+ (id)displayStringForStrings:(id)a3 itemSeparator:(id)a4
{
  return (id)objc_msgSend(a1, "displayStringForStrings:itemSeparator:lastItemSeparator:", a3, a4, 0);
}

+ (id)displayStringForStrings:(id)a3 itemSeparator:(id)a4 lastItemSeparator:(id)a5
{
  void *v8;
  uint64_t v9;
  _QWORD v11[8];

  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = objc_msgSend(a3, "count");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__OITSULocalizationUtility_displayStringForStrings_itemSeparator_lastItemSeparator___block_invoke;
  v11[3] = &unk_24F39B358;
  v11[4] = v8;
  v11[5] = a4;
  v11[6] = a5;
  v11[7] = v9;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);
  return v8;
}

uint64_t __84__OITSULocalizationUtility_displayStringForStrings_itemSeparator_lastItemSeparator___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  void *v6;
  uint64_t v7;

  if (a3)
  {
    v5 = *(_QWORD *)(a1 + 56) - 1;
    v6 = *(void **)(a1 + 32);
    if (v5 > a3 || (v7 = *(_QWORD *)(a1 + 48)) == 0)
      v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "appendString:", v7);
  }
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

@end
