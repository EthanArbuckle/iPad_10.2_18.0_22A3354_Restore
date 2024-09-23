@implementation SSQueryIntent

+ (id)intentString:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v3 = *(_QWORD *)&a3;
  if (intentString__onceToken != -1)
    dispatch_once(&intentString__onceToken, &__block_literal_global_50);
  v4 = (void *)intentString___queryIntentNames;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = CFSTR("Unknown");
  v8 = v6;

  return v8;
}

void __30__SSQueryIntent_intentString___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[21];
  _QWORD v24[23];

  v24[21] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v22;
  v24[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v21;
  v24[1] = CFSTR("Local");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  v24[2] = CFSTR("LocalCalc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v19;
  v24[3] = CFSTR("LocalConv");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v18;
  v24[4] = CFSTR("LocalQuickAction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v17;
  v24[5] = CFSTR("LocalApp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v16;
  v24[6] = CFSTR("LocalSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v15;
  v24[7] = CFSTR("LocalShortcut");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v14;
  v24[8] = CFSTR("LocalPhoto");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v13;
  v24[9] = CFSTR("LocalPhotoQU");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v12;
  v24[10] = CFSTR("LocalFile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 11);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v0;
  v24[11] = CFSTR("LocalComm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v1;
  v24[12] = CFSTR("LocalEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[13] = v2;
  v24[13] = CFSTR("Server");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[14] = v3;
  v24[14] = CFSTR("ServerApp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[15] = v4;
  v24[15] = CFSTR("ServerSports");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[16] = v5;
  v24[16] = CFSTR("ServerGeo");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[17] = v6;
  v24[17] = CFSTR("ServerInfo");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[18] = v7;
  v24[18] = CFSTR("Weather");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[19] = v8;
  v24[19] = CFSTR("LocalWebHistory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[20] = v9;
  v24[20] = CFSTR("ServerExactURL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 21);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)intentString___queryIntentNames;
  intentString___queryIntentNames = v10;

}

+ (id)intentStrengthString:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v3 = *(_QWORD *)&a3;
  if (intentStrengthString__onceToken[0] != -1)
    dispatch_once(intentStrengthString__onceToken, &__block_literal_global_164);
  v4 = (void *)intentStrengthString___queryIntentStrengthNames;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = CFSTR("Unknown");
  v8 = v6;

  return v8;
}

void __38__SSQueryIntent_intentStrengthString___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v8[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v8[1] = CFSTR("Local");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v8[2] = CFSTR("LocalStrong");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  v8[3] = CFSTR("Server");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  v8[4] = CFSTR("ServerStrong");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)intentStrengthString___queryIntentStrengthNames;
  intentStrengthString___queryIntentStrengthNames = v5;

}

+ (int)intentStrength:(int)a3
{
  if ((a3 - 1) > 0x13)
    return 0;
  else
    return dword_1B87DF798[a3 - 1];
}

- (int)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(int)a3
{
  self->_intentType = a3;
}

- (SSIntentBasedSuggestionsConfiguration)suggestionConfig
{
  return self->_suggestionConfig;
}

- (void)setSuggestionConfig:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionConfig, a3);
}

- (SSIntentBasedSectionConfiguration)sectionConfig
{
  return self->_sectionConfig;
}

- (void)setSectionConfig:(id)a3
{
  objc_storeStrong((id *)&self->_sectionConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionConfig, 0);
  objc_storeStrong((id *)&self->_suggestionConfig, 0);
}

@end
