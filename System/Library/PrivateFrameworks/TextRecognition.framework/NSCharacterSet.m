@implementation NSCharacterSet

void __62__NSCharacterSet_CRCharacterSet___crUnknownScriptCharacterSet__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  unicodeToNSString(57345);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v0);

  unicodeToNSString(57346);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v1);

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0B4458;
  qword_1ED0B4458 = v2;

}

void __78__NSCharacterSet_CRCharacterSet___crJapaneseKoreanAsUnknownScriptCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  unicodeToNSString(57346);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v0);

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0B4468;
  qword_1ED0B4468 = v1;

}

void __61__NSCharacterSet_CRCharacterSet___crBiDiMirroredCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("()<>{}[]«»"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4478;
  qword_1ED0B4478 = v0;

}

void __60__NSCharacterSet_CRCharacterSet___crBasicArabicCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(&unk_1E993CFE0, "componentsJoinedByString:", &stru_1E98DC948);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0B4488;
  qword_1ED0B4488 = v1;

}

void __60__NSCharacterSet_CRCharacterSet___crArabicDigitCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("٠١٢٣٤٥٦٧٨٩"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4498;
  qword_1ED0B4498 = v0;

}

void __64__NSCharacterSet_CRCharacterSet___crArabicDiacriticCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(&unk_1E993CFF8, "componentsJoinedByString:", &stru_1E98DC948);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0B44A8;
  qword_1ED0B44A8 = v1;

}

void __71__NSCharacterSet_CRCharacterSet___crArabicTanweenDiacriticCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(&unk_1E993D010, "componentsJoinedByString:", &stru_1E98DC948);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0B44B8;
  qword_1ED0B44B8 = v1;

}

void __73__NSCharacterSet_CRCharacterSet___crArabicCombiningDiacriticCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(&unk_1E993D028, "componentsJoinedByString:", &stru_1E98DC948);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0B44C8;
  qword_1ED0B44C8 = v1;

}

void __61__NSCharacterSet_CRLineWrappingUtilities___crBOSCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("¿\"'¡§"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = v0;

}

void __61__NSCharacterSet_CRLineWrappingUtilities___crEOSCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".．。｡?？!！:：;；"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4548;
  qword_1ED0B4548 = v0;

}

void __76__NSCharacterSet_CRLineWrappingUtilities___crClosingPunctuationCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("»)）】]"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4558;
  qword_1ED0B4558 = v0;

}

void __61__NSCharacterSet_CRLineWrappingUtilities___crMOSCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4568;
  qword_1ED0B4568 = v0;

}

@end
