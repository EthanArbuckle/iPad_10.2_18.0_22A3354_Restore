@implementation WBSReaderLocalizedFonts

+ (id)fontsForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("am")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("ar")))
    {
      +[WBSReaderFont systemFontWithDisplayName:](WBSReaderFont, "systemFontWithDisplayName:", CFSTR("سان فرانسيسكو"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v6;
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Myriad Arabic"), CFSTR("Myriad عربي"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v7;
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Damascus"), CFSTR("دمشق عادي"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v8;
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Times New Roman"), CFSTR("تايمز نيو رومان"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_42;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("hy")))
    {
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Mshtakan"), CFSTR("մշտական"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_42;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("bn")))
    {
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Kohinoor Bangla"), CFSTR("কোহিনুর বাংলা"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v11;
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Tiro Bangla"), CFSTR("Tiro বাংলা"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v12;
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Bangla Sangam MN"), CFSTR("বাংলা সঙ্গম MN"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v13;
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Bangla MN"), CFSTR("বাংলা MN"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_42;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("my")))
    {
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Noto Sans Myanmar"), CFSTR("Noto Sans မြန်မာဘာသာ"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
      +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Noto Serif Myanmar"), CFSTR("Noto Serif မြန်မာဘာသာ"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_42;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("chr")))
    {
      cherokeeFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("gu")))
    {
      gujaratiFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("pa-Guru")))
    {
      punjabiFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("he")))
    {
      hebrewFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("hi")))
    {
      hindiFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ja")))
    {
      japaneseFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kn")))
    {
      kannadaFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("km")))
    {
      khmerFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ko")))
    {
      koreanFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lo")) & 1) == 0)
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("ml")))
        {
          malayalamFonts();
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("or")))
        {
          oriyaFonts();
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("si")))
        {
          sinhalaFonts();
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("ta")))
        {
          tamilFonts();
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("te")))
        {
          teluguFonts();
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("lo")))
        {
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("th")))
          {
            thaiFonts();
            v17 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("zh-Hans")))
          {
            simplifiedChineseFonts();
            v17 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("zh-Hant")))
          {
            traditionalChineseFonts();
            v17 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("iu-Cans")))
          {
            unifiedCanadianSyllabicsFonts();
            v17 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (objc_msgSend(v3, "isEqualToString:", CFSTR("ur")))
              urduFonts();
            else
              defaultFonts();
            v17 = objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_41;
        }
      }
      laoFonts();
      v17 = objc_claimAutoreleasedReturnValue();
    }
LABEL_41:
    v5 = (void *)v17;
    goto LABEL_42;
  }
  +[WBSReaderFont fontWithFamilyName:displayName:](WBSReaderFont, "fontWithFamilyName:displayName:", CFSTR("Kefa"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_42:
  return v5;
}

+ (id)defaultFontFamilyNameForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "defaultFontFamilyNameForLanguageMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[WBSReaderFont systemFont](WBSReaderFont, "systemFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "familyName");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)defaultFontFamilyNameForLanguageMap
{
  void *v2;
  _QWORD v4[24];
  _QWORD v5[25];

  v5[24] = *MEMORY[0x1E0C80C00];
  {
    v2 = (void *)+[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguageMap]::fontFamilyNameForLanguage;
  }
  else
  {
    v4[0] = CFSTR("am");
    v4[1] = CFSTR("hy");
    v5[0] = CFSTR("Kefa");
    v5[1] = CFSTR("Mshtakan");
    v4[2] = CFSTR("bn");
    v4[3] = CFSTR("my");
    v5[2] = CFSTR("Kohinoor Bangla");
    v5[3] = CFSTR("Noto Sans Myanmar");
    v4[4] = CFSTR("chr");
    v4[5] = CFSTR("gu");
    v5[4] = CFSTR("Plantagenet Cherokee");
    v5[5] = CFSTR("Kohinoor Gujarati");
    v4[6] = CFSTR("pa-Guru");
    v4[7] = CFSTR("he");
    v5[6] = CFSTR("Mukta Mahee");
    v5[7] = CFSTR("Arial Hebrew");
    v4[8] = CFSTR("hi");
    v4[9] = CFSTR("ja");
    v5[8] = CFSTR("Kohinoor Devanagari");
    v5[9] = CFSTR("Hiragino Maru Gothic ProN");
    v4[10] = CFSTR("kn");
    v4[11] = CFSTR("km");
    v5[10] = CFSTR("Noto Sans Kannada");
    v5[11] = CFSTR("Khmer Sangam MN");
    v4[12] = CFSTR("ko");
    v4[13] = CFSTR("lo");
    v5[12] = CFSTR("Apple SD Gothic Neo");
    v5[13] = CFSTR("Lao Sangam MN");
    v4[14] = CFSTR("ml");
    v4[15] = CFSTR("or");
    v5[14] = CFSTR("Malayalam Sangam MN");
    v5[15] = CFSTR("Noto Sans Oriya");
    v4[16] = CFSTR("si");
    v4[17] = CFSTR("ta");
    v5[16] = CFSTR("Sinhala Sangam MN");
    v5[17] = CFSTR("Tamil Sangam MN");
    v4[18] = CFSTR("te");
    v4[19] = CFSTR("th");
    v5[18] = CFSTR("Kohinoor Telugu");
    v5[19] = CFSTR("Thonburi");
    v4[20] = CFSTR("zh-Hans");
    v4[21] = CFSTR("zh-Hant");
    v5[20] = CFSTR("PingFang SC");
    v5[21] = CFSTR("PingFang TC");
    v4[22] = CFSTR("iu-Cans");
    v4[23] = CFSTR("ur");
    v5[22] = CFSTR("Euphemia UCAS");
    v5[23] = CFSTR("Noto Nastaliq Urdu");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 24);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguageMap]::fontFamilyNameForLanguage = (uint64_t)v2;
  }
  return v2;
}

@end
