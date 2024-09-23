@implementation TypistKoreanHangulSyllable

- (TypistKoreanHangulSyllable)initWithSyllable:(unsigned __int16)a3
{
  TypistKoreanHangulSyllable *v4;
  NSMutableArray *v5;
  NSMutableArray *jamosInSyllable;
  void *v7;
  unint64_t v8;
  TypistKoreanHangulJamo *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TypistKoreanHangulSyllable;
  v4 = -[TypistKoreanHangulSyllable init](&v13, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    jamosInSyllable = v4->jamosInSyllable;
    v4->jamosInSyllable = v5;

    v4->_syllable = a3;
    +[TypistKoreanHangulSyllable decomposeSyllableForScribble:](TypistKoreanHangulSyllable, "decomposeSyllableForScribble:", -[TypistKoreanHangulSyllable syllable](v4, "syllable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = 0;
      do
      {
        v9 = -[TypistKoreanHangulJamo initWithJamo:position:]([TypistKoreanHangulJamo alloc], "initWithJamo:position:", objc_msgSend(v7, "characterAtIndex:", v8), v8);
        -[NSMutableArray addObject:](v4->jamosInSyllable, "addObject:", v9);

        ++v8;
      }
      while (objc_msgSend(v7, "length") > v8);
    }
    v10 = -[NSMutableArray count](v4->jamosInSyllable, "count");
    -[NSMutableArray objectAtIndexedSubscript:](v4->jamosInSyllable, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_syllableStructure = -[TypistKoreanHangulSyllable _determineSyllableStructure:vowelPositionType:](v4, "_determineSyllableStructure:vowelPositionType:", v10, objc_msgSend(v11, "hangulJamoPosition"));

    v4->_hasConsonantVariants = -[TypistKoreanHangulSyllable _hasConsonantVariants:](v4, "_hasConsonantVariants:", v4->jamosInSyllable);
  }
  return v4;
}

- (id)jamos
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->jamosInSyllable);
}

- (int)syllableStructure
{
  return self->_syllableStructure;
}

- (unsigned)syllable
{
  return self->_syllable;
}

- (BOOL)hasConsonantVariants
{
  return self->_hasConsonantVariants;
}

- (BOOL)_hasConsonantVariants:(id)a3
{
  id v3;
  unint64_t v4;
  char v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isConsonantVariant");

      v6 |= v8;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isVerticalVowel");

      v5 |= v10;
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
    v11 = v6 & v5;
  }
  else
  {
    v11 = 0;
  }

  return v11 & 1;
}

+ (id)decomposeSyllableForScribble:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "isKoreanSyllable:", v3))
  {
    v6 = v3 - 44032;
    v7 = ((int)v3 - 44032) / 588;
    v8 = v7;
    v9 = (int)(((18725 * (__int16)(v6 - 588 * v7)) >> 19) + ((18725 * (__int16)(v6 - 588 * v7)) >> 31));
    v10 = v6 % 28;
    +[TypistKoreanHangulJamo leadingConsonants](TypistKoreanHangulJamo, "leadingConsonants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[TypistKoreanHangulJamo vowels](TypistKoreanHangulJamo, "vowels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[TypistKoreanHangulJamo trailingConsonants](TypistKoreanHangulJamo, "trailingConsonants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendString:", v12);
    objc_msgSend(v5, "appendString:", v14);
    if (v16)
      objc_msgSend(v5, "appendString:", v16);
    v17 = v5;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int)_determineSyllableStructure:(unint64_t)a3 vowelPositionType:(int)a4
{
  int v4;
  _DWORD *v5;

  if (a3 == 3)
  {
    v4 = a4 - 2;
    if ((a4 - 2) <= 2)
    {
      v5 = &unk_2494B1DBC;
      return v5[v4];
    }
  }
  else if (a3 == 2)
  {
    v4 = a4 - 2;
    if ((a4 - 2) < 3)
    {
      v5 = &unk_2494B1DB0;
      return v5[v4];
    }
  }
  return 6;
}

+ (BOOL)isKoreanSyllable:(unsigned __int16)a3
{
  return (unsigned __int16)((unsigned __int16)(a3 + 21504) >> 2) < 0xAE9u;
}

- (void)setSyllable:(unsigned __int16)a3
{
  self->_syllable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->jamosInSyllable, 0);
}

@end
