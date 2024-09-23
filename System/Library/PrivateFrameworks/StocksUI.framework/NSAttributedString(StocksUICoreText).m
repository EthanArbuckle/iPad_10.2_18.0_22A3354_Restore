@implementation NSAttributedString(StocksUICoreText)

- (BOOL)su_containsExcessiveLineHeightCharacter
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "string");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  su_excessiveLineHeightCharacters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (double)su_languageAwareOutsetsAtScale:()StocksUICoreText
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x4010000000;
  v13 = &unk_1DC4A317E;
  v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  v14 = *MEMORY[0x1E0DC49E8];
  v15 = v4;
  v5 = objc_msgSend(a1, "length");
  v6 = *MEMORY[0x1E0DC1138];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__NSAttributedString_StocksUICoreText__su_languageAwareOutsetsAtScale___block_invoke;
  v9[3] = &unk_1EA44CF88;
  *(double *)&v9[5] = a2;
  v9[4] = &v10;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v9);
  v7 = v11[4];
  _Block_object_dispose(&v10, 8);
  return v7;
}

@end
