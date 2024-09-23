@implementation NSString

void __53__NSString_CRStringUtilities___crStartsWithUppercase__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;

  v9 = objc_msgSend(a2, "characterAtIndex:", 0);
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "characterIsMember:", v9);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v12, "characterIsMember:", v9);

    *a7 = 1;
  }
}

void __53__NSString_CRStringUtilities___crStartsWithLowercase__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;

  v9 = objc_msgSend(a2, "characterAtIndex:", 0);
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "characterIsMember:", v9);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v12, "characterIsMember:", v9);

    *a7 = 1;
  }
}

- (uint64_t)_codePointIsSpaceSeparatedScript:(int16x4_t)a3
{
  _BOOL4 v6;

  if (result)
  {
    a3.i16[0] = a2 & 0xFFDF;
    a3.i16[1] = a2;
    result = 1;
    if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x158001F0017001ALL, (uint16x4_t)vadd_s16(vzip1_s16(a3, vdup_lane_s16(a3, 1)), (int16x4_t)0xFF08FF28FF40FFBFLL))) & 1) == 0)
    {
      v6 = a2 >> 8 == 17
        || a2 - 12592 < 0x60
        || a2 >> 5 == 1355
        || (unsigned __int16)((unsigned __int16)(a2 + 21504) >> 10) < 0xBu;
      return (unsigned __int16)(a2 - 880) < 0x1C0u || v6;
    }
  }
  return result;
}

void __48__NSString_CRStringUtilities___crEndsWithHyphen__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-－"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;

}

void __54__NSString_CRStringUtilities___crLocaleForNLLanguage___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[25];
  _QWORD v15[26];

  v15[25] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CCDF58];
  v14[0] = *MEMORY[0x1E0CCDEF8];
  v14[1] = v0;
  v15[0] = CFSTR("en-US");
  v15[1] = CFSTR("pt-BR");
  v1 = *MEMORY[0x1E0CCDF20];
  v14[2] = *MEMORY[0x1E0CCDF08];
  v14[3] = v1;
  v15[2] = CFSTR("fr-FR");
  v15[3] = CFSTR("it-IT");
  v2 = *MEMORY[0x1E0CCDF80];
  v14[4] = *MEMORY[0x1E0CCDF10];
  v14[5] = v2;
  v15[4] = CFSTR("de-DE");
  v15[5] = CFSTR("es-ES");
  v3 = *MEMORY[0x1E0CCDFB0];
  v14[6] = *MEMORY[0x1E0CCDF68];
  v14[7] = v3;
  v15[6] = CFSTR("ru-RU");
  v15[7] = CFSTR("uk-UA");
  v4 = *MEMORY[0x1E0CCDFC0];
  v14[8] = *MEMORY[0x1E0CCDF90];
  v14[9] = v4;
  v15[8] = CFSTR("th-TH");
  v15[9] = CFSTR("vi-VT");
  v5 = *MEMORY[0x1E0CCDF18];
  v14[10] = *MEMORY[0x1E0CCDFA8];
  v14[11] = v5;
  v15[10] = CFSTR("tr-TR");
  v15[11] = CFSTR("id-ID");
  v6 = *MEMORY[0x1E0CCDEE8];
  v14[12] = *MEMORY[0x1E0CCDEE0];
  v14[13] = v6;
  v15[12] = CFSTR("cs-CZ");
  v15[13] = CFSTR("da-DK");
  v7 = *MEMORY[0x1E0CCDF48];
  v14[14] = *MEMORY[0x1E0CCDEF0];
  v14[15] = v7;
  v15[14] = CFSTR("nl-NL");
  v15[15] = CFSTR("no-NO");
  v8 = *MEMORY[0x1E0CCDF50];
  v14[16] = *MEMORY[0x1E0CCDF38];
  v14[17] = v8;
  v15[16] = CFSTR("ms-MY");
  v15[17] = CFSTR("pl-PL");
  v9 = *MEMORY[0x1E0CCDF88];
  v14[18] = *MEMORY[0x1E0CCDF60];
  v14[19] = v9;
  v15[18] = CFSTR("ro-RO");
  v15[19] = CFSTR("sv-SE");
  v10 = *MEMORY[0x1E0CCDF98];
  v14[20] = *MEMORY[0x1E0CCDF70];
  v14[21] = v10;
  v15[20] = CFSTR("zh-Hans");
  v15[21] = CFSTR("zh-Hant");
  v11 = *MEMORY[0x1E0CCDF30];
  v14[22] = *MEMORY[0x1E0CCDF28];
  v14[23] = v11;
  v15[22] = CFSTR("ja-JP");
  v15[23] = CFSTR("ko-KR");
  v14[24] = *MEMORY[0x1E0CCDED8];
  v15[24] = CFSTR("ar-SA");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 25);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ED0B43E8;
  qword_1ED0B43E8 = v12;

}

void __73__NSString_CRStringUtilities___crStringByPreparingForLanguageRecognition__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)qword_1ED0B43F8;
  qword_1ED0B43F8 = v2;

}

uint64_t __59__NSString_CRStringUtilities___crArrayOfComposedCharacters__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __67__NSString_CRStringUtilities___crStringByRemovingParenthesizedText__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("([{<（［｛＜"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4408;
  qword_1ED0B4408 = v0;

}

uint64_t __77__NSString_CRStringUtilities___crStringByReversingComposedCharacterSequences__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

void __80__NSString_CRLineWrappingUtilities___crIsSentencePunctuatedIncludingWhitespace___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v12;
  void *v13;
  char v14;
  id v15;

  v15 = a2;
  if ((objc_msgSend(v15, "containsString:", CFSTR(".")) & 1) == 0
    && (objc_msgSend(v15, "containsString:", CFSTR(",")) & 1) == 0
    && !objc_msgSend(v15, "containsString:", CFSTR("，")))
  {
    goto LABEL_7;
  }
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v12
    || (objc_msgSend(v12, "_crContainsText") & 1) != 0
    || a5 + a6 < (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length")
    && (objc_msgSend(*(id *)(a1 + 32), "substringWithRange:"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "_crContainsText"),
        v13,
        (v14 & 1) != 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a7 = 1;
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("•⋅"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0B4718;
  qword_1ED0B4718 = v2;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[\\(|\\[] ?([0-9]+) ?[\\)|\\]]"), 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0B4720;
  qword_1ED0B4720 = v4;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([a-zA-Z])(\\([0-9]+\\))"), 0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED0B4728;
  qword_1ED0B4728 = v6;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("((\\s|^|\\.|/)([a-zA-Z]|\\p{script=Cyrillic})+)(\\s\\.|\\.\\s|\\s\\.\\s)((com|рф)(\\s|$|/))"), 0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED0B4730;
  qword_1ED0B4730 = v8;

  v10 = *(void **)(a1 + 32);
  objc_msgSend(&unk_1E99446E8, "allKeys");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_1ED0B4738;
  qword_1ED0B4738 = v11;

  v13 = *(void **)(a1 + 32);
  objc_msgSend(&unk_1E9944710, "allKeys");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)qword_1ED0B4740;
  qword_1ED0B4740 = v14;

  v16 = *(void **)(a1 + 32);
  objc_msgSend(&unk_1E9944738, "allKeys");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)qword_1ED0B4748;
  qword_1ED0B4748 = v17;

  v19 = *(void **)(a1 + 32);
  objc_msgSend(&unk_1E9944760, "allKeys");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)qword_1ED0B4750;
  qword_1ED0B4750 = v20;

}

const __CFString *__52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_2()
{
  return CFSTR("($1)");
}

const __CFString *__52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_3()
{
  return CFSTR("$1 $2");
}

const __CFString *__52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_4()
{
  return CFSTR("$1.$5");
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "rangeAtIndex:", 2);
  objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(&unk_1E99446E8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("$1%@$3"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "rangeAtIndex:", 2);
  objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(&unk_1E9944710, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("$1%@$3"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "rangeAtIndex:", 2);
  objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(&unk_1E9944738, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("$1%@$3"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "rangeAtIndex:", 2);
  objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(&unk_1E9944760, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("$1%@$3"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
