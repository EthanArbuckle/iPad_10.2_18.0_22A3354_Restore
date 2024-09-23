@implementation CRScriptCategoryV1

- (NSArray)scriptLocales
{
  CRScriptCategoryV1 *v2;
  uint64_t v3;
  void *v4;
  _QWORD block[5];

  v2 = self;
  v3 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CRScriptCategoryV1_localesForScriptCategory___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (qword_1ED0B45C0 != -1)
    dispatch_once(&qword_1ED0B45C0, block);
  objc_msgSend((id)qword_1ED0B45B8, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSString)categoryName
{
  uint64_t v3;
  id v4;
  unint64_t categoryValue;
  void *v6;
  void *v7;
  _QWORD block[5];

  v3 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CRScriptCategoryV1_categoryNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (qword_1ED0B45A8 != -1)
    dispatch_once(&qword_1ED0B45A8, block);
  v4 = (id)qword_1ED0B45B0;
  if (self)
    categoryValue = self->_categoryValue;
  else
    categoryValue = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", categoryValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)categoryRevision
{
  return +[CRScriptCategoryV1 categoryRevision](CRScriptCategoryV1, "categoryRevision");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CRScriptCategoryV1;
  -[CRScriptCategoryV1 description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRScriptCategoryV1 categoryName](self, "categoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)categoryRevision
{
  return 1;
}

+ (id)sequenceScriptForCategory:(id)a3
{
  _QWORD *v3;
  char isKindOfClass;
  __CFString *v5;
  unint64_t v6;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    v6 = v3[1] - 1;
    if (v6 > 6)
      v5 = 0;
    else
      v5 = off_1E98DAD00[v6];
  }

  return v5;
}

+ (id)supportedCategories
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CRScriptCategoryV1_supportedCategories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_20 != -1)
    dispatch_once(&_MergedGlobals_20, block);
  return (id)qword_1ED0B4590;
}

void __41__CRScriptCategoryV1_supportedCategories__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[9];

  v10[8] = *MEMORY[0x1E0C80C00];
  +[CRScriptCategoryV1 unknown]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  +[CRScriptCategoryV1 common]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  +[CRScriptCategoryV1 latinCyrillic]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  +[CRScriptCategoryV1 chinese]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  +[CRScriptCategoryV1 japanese]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  +[CRScriptCategoryV1 korean]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  +[CRScriptCategoryV1 thai]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  +[CRScriptCategoryV1 arabic]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED0B4590;
  qword_1ED0B4590 = v8;

}

+ (id)unknown
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CRScriptCategoryV1_unknown__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B45C8 != -1)
    dispatch_once(&qword_1ED0B45C8, block);
  return (id)qword_1ED0B45D0;
}

+ (id)common
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CRScriptCategoryV1_common__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B45D8 != -1)
    dispatch_once(&qword_1ED0B45D8, block);
  return (id)qword_1ED0B45E0;
}

+ (id)latinCyrillic
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CRScriptCategoryV1_latinCyrillic__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B45E8 != -1)
    dispatch_once(&qword_1ED0B45E8, block);
  return (id)qword_1ED0B45F0;
}

+ (id)chinese
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CRScriptCategoryV1_chinese__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B45F8 != -1)
    dispatch_once(&qword_1ED0B45F8, block);
  return (id)qword_1ED0B4600;
}

+ (id)japanese
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CRScriptCategoryV1_japanese__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B4618 != -1)
    dispatch_once(&qword_1ED0B4618, block);
  return (id)qword_1ED0B4620;
}

+ (id)korean
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CRScriptCategoryV1_korean__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B4608 != -1)
    dispatch_once(&qword_1ED0B4608, block);
  return (id)qword_1ED0B4610;
}

+ (id)thai
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CRScriptCategoryV1_thai__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B4628 != -1)
    dispatch_once(&qword_1ED0B4628, block);
  return (id)qword_1ED0B4630;
}

+ (id)arabic
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CRScriptCategoryV1_arabic__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0B4638 != -1)
    dispatch_once(&qword_1ED0B4638, block);
  return (id)qword_1ED0B4640;
}

+ (id)verticalLayoutSupportedCategories
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CRScriptCategoryV1_verticalLayoutSupportedCategories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0B4598 != -1)
    dispatch_once(&qword_1ED0B4598, block);
  return (id)qword_1ED0B45A0;
}

void __55__CRScriptCategoryV1_verticalLayoutSupportedCategories__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  +[CRScriptCategoryV1 japanese]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  +[CRScriptCategoryV1 chinese]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  +[CRScriptCategoryV1 korean]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED0B45A0;
  qword_1ED0B45A0 = v3;

}

void __35__CRScriptCategoryV1_categoryNames__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "supportedCategories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        if (v8)
        {
          switch(*(_QWORD *)(v8 + 8))
          {
            case 0:
              goto LABEL_8;
            case 1:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v2;
              v11 = CFSTR("CommonV1");
              goto LABEL_16;
            case 2:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v2;
              v11 = CFSTR("LatinCyrillicV1");
              goto LABEL_16;
            case 3:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v2;
              v11 = CFSTR("ChineseV1");
              goto LABEL_16;
            case 4:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v2;
              v11 = CFSTR("KoreanV1");
              goto LABEL_16;
            case 5:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v2;
              v11 = CFSTR("JapaneseV1");
              goto LABEL_16;
            case 6:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 6);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v2;
              v11 = CFSTR("ThaiV1");
              goto LABEL_16;
            case 7:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 7);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v2;
              v11 = CFSTR("ArabicV1");
              goto LABEL_16;
            default:
              break;
          }
        }
        else
        {
LABEL_8:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v2;
          v11 = CFSTR("UnknownV1");
LABEL_16:
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v9);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v12 = objc_msgSend(v2, "copy");
  v13 = (void *)qword_1ED0B45B0;
  qword_1ED0B45B0 = v12;

}

void __47__CRScriptCategoryV1_localesForScriptCategory___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[4];
  _QWORD v22[21];
  _QWORD v23[8];
  _QWORD v24[10];

  v24[8] = *MEMORY[0x1E0C80C00];
  +[CRScriptCategoryV1 common]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v0 = MEMORY[0x1E0C9AA60];
  v24[0] = MEMORY[0x1E0C9AA60];
  +[CRScriptCategoryV1 unknown]();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v15;
  v24[1] = v0;
  +[CRScriptCategoryV1 latinCyrillic]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  v22[0] = CFSTR("en-US");
  v22[1] = CFSTR("pt-BR");
  v22[2] = CFSTR("fr-FR");
  v22[3] = CFSTR("it-IT");
  v22[4] = CFSTR("de-DE");
  v22[5] = CFSTR("es-ES");
  v22[6] = CFSTR("ru-RU");
  v22[7] = CFSTR("uk-UA");
  v22[8] = CFSTR("vi-VT");
  v22[9] = CFSTR("tr-TR");
  v22[10] = CFSTR("id-ID");
  v22[11] = CFSTR("cs-CZ");
  v22[12] = CFSTR("da-DK");
  v22[13] = CFSTR("nl-NL");
  v22[14] = CFSTR("no-NO");
  v22[15] = CFSTR("nn-NO");
  v22[16] = CFSTR("nb-NO");
  v22[17] = CFSTR("ms-MY");
  v22[18] = CFSTR("pl-PL");
  v22[19] = CFSTR("ro-RO");
  v22[20] = CFSTR("sv-SE");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  +[CRScriptCategoryV1 chinese]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v1;
  v21[0] = CFSTR("zh-Hans");
  v21[1] = CFSTR("zh-Hant");
  v21[2] = CFSTR("yue-Hans");
  v21[3] = CFSTR("yue-Hant");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v2;
  +[CRScriptCategoryV1 korean]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v3;
  v20 = CFSTR("ko-KR");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  +[CRScriptCategoryV1 japanese]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  v19 = CFSTR("ja-JP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  +[CRScriptCategoryV1 thai]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v7;
  v18 = CFSTR("th-TH");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v8;
  +[CRScriptCategoryV1 arabic]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v9;
  v17[0] = CFSTR("ar-SA");
  v17[1] = CFSTR("ars-SA");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_1ED0B45B8;
  qword_1ED0B45B8 = v11;

}

+ (float)confidenceThreshold
{
  return 0.1;
}

void __29__CRScriptCategoryV1_unknown__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 0;
  }
  v2 = (void *)qword_1ED0B45D0;
  qword_1ED0B45D0 = (uint64_t)v1;

}

void __28__CRScriptCategoryV1_common__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 1;
  }
  v2 = (void *)qword_1ED0B45E0;
  qword_1ED0B45E0 = (uint64_t)v1;

}

void __35__CRScriptCategoryV1_latinCyrillic__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 2;
  }
  v2 = (void *)qword_1ED0B45F0;
  qword_1ED0B45F0 = (uint64_t)v1;

}

void __29__CRScriptCategoryV1_chinese__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 3;
  }
  v2 = (void *)qword_1ED0B4600;
  qword_1ED0B4600 = (uint64_t)v1;

}

void __28__CRScriptCategoryV1_korean__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 4;
  }
  v2 = (void *)qword_1ED0B4610;
  qword_1ED0B4610 = (uint64_t)v1;

}

void __30__CRScriptCategoryV1_japanese__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 5;
  }
  v2 = (void *)qword_1ED0B4620;
  qword_1ED0B4620 = (uint64_t)v1;

}

void __26__CRScriptCategoryV1_thai__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 6;
  }
  v2 = (void *)qword_1ED0B4630;
  qword_1ED0B4630 = (uint64_t)v1;

}

void __28__CRScriptCategoryV1_arabic__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  objc_super v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      v1[1] = 7;
  }
  v2 = (void *)qword_1ED0B4640;
  qword_1ED0B4640 = (uint64_t)v1;

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unint64_t categoryValue;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_7;
  }
  if (!self)
  {
    categoryValue = 0;
    if (v4)
      goto LABEL_4;
LABEL_9:
    v6 = 0;
    goto LABEL_5;
  }
  categoryValue = self->_categoryValue;
  if (!v4)
    goto LABEL_9;
LABEL_4:
  v6 = v4[1];
LABEL_5:
  v7 = categoryValue == v6;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  if (self)
    return *(_QWORD *)(self + 8);
  return self;
}

@end
