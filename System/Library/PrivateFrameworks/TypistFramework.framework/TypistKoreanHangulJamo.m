@implementation TypistKoreanHangulJamo

- (TypistKoreanHangulJamo)initWithJamo:(unsigned __int16)a3 position:(unint64_t)a4
{
  uint64_t v5;
  TypistKoreanHangulJamo *v6;
  TypistKoreanHangulJamo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKoreanHangulJamo;
  v6 = -[TypistKoreanHangulJamo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_jamo = v5;
    v6->_hangulJamoPosition = -[TypistKoreanHangulJamo _getJamoType:withOrderInSyllable:](v6, "_getJamoType:withOrderInSyllable:", v5, a4);
    v7->_isConsonantVariant = -[TypistKoreanHangulJamo _isConsonantVariant:](v7, "_isConsonantVariant:", v5);
    v7->_isVerticalVowel = -[TypistKoreanHangulJamo _isVerticalVowel:](v7, "_isVerticalVowel:", v5);
  }
  return v7;
}

- (int)_getJamoType:(unsigned __int16)a3 withOrderInSyllable:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  char v7;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  int v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulLeadingConsonants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "characterIsMember:", v5);

  if (!a4 && (v7 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulTrailingConsonants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "characterIsMember:", v5);

  if (a4 && (v10 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulHorizontalVowels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "characterIsMember:", v5);

  if ((v12 & 1) != 0)
    return 2;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulVerticalVowels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "characterIsMember:", v5);

  if ((v14 & 1) != 0)
    return 3;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulMixedVowels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "characterIsMember:", v5);

  if (v16)
    return 4;
  else
    return 5;
}

- (unsigned)jamo
{
  return self->_jamo;
}

- (int)hangulJamoPosition
{
  return self->_hangulJamoPosition;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), self->_jamo);
}

- (BOOL)_isConsonantVariant:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulConsonantVariants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

- (BOOL)_isVerticalVowel:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulVerticalVowels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

- (BOOL)isConsonantVariant
{
  return self->_isConsonantVariant;
}

- (BOOL)isVerticalVowel
{
  return self->_isVerticalVowel;
}

+ (id)leadingConsonants
{
  if (leadingConsonants_leadingConsonantsToken != -1)
    dispatch_once(&leadingConsonants_leadingConsonantsToken, &__block_literal_global_12);
  return (id)leadingConsonants_leadingConsonants;
}

void __43__TypistKoreanHangulJamo_leadingConsonants__block_invoke()
{
  void *v0;

  v0 = (void *)leadingConsonants_leadingConsonants;
  leadingConsonants_leadingConsonants = (uint64_t)&unk_251A991F8;

}

+ (id)vowels
{
  if (vowels_vowelToken != -1)
    dispatch_once(&vowels_vowelToken, &__block_literal_global_85);
  return (id)vowels_hangulVowels;
}

void __32__TypistKoreanHangulJamo_vowels__block_invoke()
{
  void *v0;

  v0 = (void *)vowels_hangulVowels;
  vowels_hangulVowels = (uint64_t)&unk_251A99210;

}

+ (id)trailingConsonants
{
  if (trailingConsonants_trailingConsonantsToken != -1)
    dispatch_once(&trailingConsonants_trailingConsonantsToken, &__block_literal_global_130);
  return (id)trailingConsonants_trailingConsonants;
}

void __44__TypistKoreanHangulJamo_trailingConsonants__block_invoke()
{
  void *v0;

  v0 = (void *)trailingConsonants_trailingConsonants;
  trailingConsonants_trailingConsonants = (uint64_t)&unk_251A99228;

}

@end
