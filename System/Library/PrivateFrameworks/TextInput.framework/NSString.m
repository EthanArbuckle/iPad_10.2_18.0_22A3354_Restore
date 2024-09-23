@implementation NSString

void __58__NSString_TIExtras__normalizeSmartQuotedStringForLocale___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByReplacingOccurrencesOfString:withString:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

_QWORD *__91__NSString_TIExtras___indexFromStartingIndex_byIncrementingComposedCharacterSequenceCount___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) >= result[6])
  {
    *a7 = 1;
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a3 + a4;
  }
  return result;
}

void __81__NSString_TIExtras___stringByComposingDiacriticsLogicalOrder_allowedCharacters___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v4 = a2;
  }
  else
  {
    v5 = a2;
  }
  v6 = (void *)combine_with_accent(v5, v4);
  if ((_DWORD)v6
    && ((v7 = *(_QWORD *)(a1 + 40)) == 0 || (*(unsigned int (**)(uint64_t, void *))(v7 + 16))(v7, v6)))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "_rangeOfLongCharacterAtIndex:", objc_msgSend(*(id *)(a1 + 32), "length") - 1);
    objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", v8, v9);
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v11);
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v11);
    LODWORD(v6) = a2;
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)v6;
}

uint64_t __56__NSString_TIExtras___containsSymbolsAndPunctuationOnly__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", CFSTR("[:Punctuation:]"));
  _containsSymbolsAndPunctuationOnly___SymbolsSet = result;
  return result;
}

uint64_t __55__NSString_TIExtras___containsCJKSymbolsAndPunctuation__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", CFSTR("[^[ [ [:East_Asian_Width=Wide:][:East_Asian_Width=Fullwidth:] ] & [:Punctuation:] ]]"));
  _containsCJKSymbolsAndPunctuation___nonCJKSymbolsSet = result;
  return result;
}

uint64_t __45__NSString_TIExtras___containsCJKScriptsOnly__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", CFSTR("[[:Hani:][:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Bopomofo:][:Hangul:][ˉˊˇˋ˙]]"));
  _containsCJKScriptsOnly___CJKSet = result;
  return result;
}

uint64_t __44__NSString_TIExtras___containsCJScriptsOnly__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", CFSTR("[[:Hani:][:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Bopomofo:][ˉˊˇˋ˙]]"));
  _containsCJScriptsOnly___CJSet = result;
  return result;
}

uint64_t __55__NSString_TIExtras___containsIdeographsOrBopomofoOnly__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", CFSTR("[[:Hani:][:Bopomofo:][ˉˊˇˋ˙]]"));
  _containsIdeographsOrBopomofoOnly___KanijChineseBopomofoSet = result;
  return result;
}

uint64_t __40__NSString_TIExtras___containsEmojiOnly__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (a3 == *(_QWORD *)(v5 + 24))
    *(_QWORD *)(v5 + 24) = a3 + a4;
  else
    *a5 = 1;
  return result;
}

uint64_t __36__NSString_TIExtras___graphemeCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __39__NSString_TIExtras___graphemeAtIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 == a1[6])
  {
    v11 = objc_msgSend(a2, "copy");
    v12 = *(_QWORD *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a7 = 1;
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
  }
  *(_QWORD *)(v7 + 24) = v8 + 1;
}

void __36__NSString_TIExtras___firstGrapheme__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v9 = objc_msgSend(a2, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  *a7 = 1;
}

void __43__NSString_TIExtras___looksLikeNumberInput__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v0);

  objc_msgSend(v3, "addCharactersInString:", CFSTR("$%#"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("-,+=*./)<>:"));
  objc_msgSend(v3, "invert");
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)_looksLikeNumberInput___nonNumberInputSet;
  _looksLikeNumberInput___nonNumberInputSet = v1;

}

uint64_t __51__NSString_TIExtras___contentsExclusivelyInScript___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = uscript_getScript();
  if (result >= 2 && (_DWORD)result != *(_DWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

BOOL __56__NSString_TIExtras___ti_supplementalPrefixOfLastToken___block_invoke(UTF32Char a1)
{
  _BOOL8 result;
  const __CFCharacterSet *Predefined;

  result = 0;
  if (a1 != 39 && a1 != 45 && a1 != 8217)
  {
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
    return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
  }
  return result;
}

uint64_t __52__NSString_TIExtras___fullwidthLettersAndSymbolsSet__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", CFSTR("[ [[:East_Asian_Width=Wide:][:East_Asian_Width=Fullwidth:]] - [:Hani:] - [:Kana:] - [:Hiragana:] ]"));
  _fullwidthLettersAndSymbolsSet___fullwidthLettersAndSymbolsSet = result;
  return result;
}

void __55__NSString_TIExtras___nonFullwidthLettersAndNumbersSet__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[^%@]"), CFSTR("[ [ [[:East_Asian_Width=Wide:][:East_Asian_Width=Fullwidth:]] & [[:Letter:][:Number:]] ] - [:Hani:] ]"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _nonFullwidthLettersAndNumbersSet___nonFullwidthLettersAndNumbersSet = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", v0);

}

uint64_t __52__NSString_TIExtras___fullwidthLettersAndNumbersSet__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_characterSetWithPattern:", CFSTR("[ [ [[:East_Asian_Width=Wide:][:East_Asian_Width=Fullwidth:]] & [[:Letter:][:Number:]] ] - [:Hani:] ]"));
  _fullwidthLettersAndNumbersSet___fullwidthLettersAndNumbersSet = result;
  return result;
}

uint64_t __45__NSString_TIExtras___bopomofoWithoutToneSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[:Bopomofo:]"));
  _bopomofoWithoutToneSet___bopomofoWithoutToneSet = result;
  return result;
}

uint64_t __38__NSString_TIExtras___bopomofoToneSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[ˉˊˇˋ˙]"));
  _bopomofoToneSet___bopomofoToneSet = result;
  return result;
}

uint64_t __34__NSString_TIExtras___bopomofoSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[[:Bopomofo:][ˉˊˇˋ˙]]"));
  _bopomofoSet___bopomofoSet = result;
  return result;
}

uint64_t __35__NSString_TIExtras___ideographSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[:Hani:]"));
  _ideographSet___ideographSet = result;
  return result;
}

uint64_t __43__NSString_TIExtras___nonJapaneseLetterSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[^[[:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Hani:][ー]]]"));
  _nonJapaneseLetterSet___set = result;
  return result;
}

uint64_t __40__NSString_TIExtras___japaneseLetterSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[[:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Hani:][ー]]"));
  _japaneseLetterSet___japaneseLetterSet = result;
  return result;
}

uint64_t __34__NSString_TIExtras___hiraganaSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[[:Hiragana:][ー]]"));
  _hiraganaSet___hiraganaSet = result;
  return result;
}

uint64_t __55__NSString_TIExtras___nonHiraganaKatakanaOrBopomofoSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[^[:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Bopomofo:][ー]]"));
  _nonHiraganaKatakanaOrBopomofoSet___nonHiraganaKatakanaOrBopomofoSet = result;
  return result;
}

uint64_t __44__NSString_TIExtras___nonKatakanaOrKanjiSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[^[:Katakana:][:Katakana_Or_Hiragana:][:Hani:][ー]]"));
  _nonKatakanaOrKanjiSet___nonKatakanaSet = result;
  return result;
}

uint64_t __47__NSString_TIExtras___nonHiraganaOrKatakanaSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[^[:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][ー]]"));
  _nonHiraganaOrKatakanaSet___nonHiraganaOrKatakanaSet = result;
  return result;
}

uint64_t __44__NSString_TIExtras___nonKoreanCharacterSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[:^Hangul:]"));
  _nonKoreanCharacterSet___nonKoreanCharacterSet = result;
  return result;
}

uint64_t __49__NSString_TIExtras___nonIdeographicCharacterSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_characterSetWithPattern:", CFSTR("[:^Ideographic:]"));
  _nonIdeographicCharacterSet___nonIdeographicCharacterSet = result;
  return result;
}

@end
