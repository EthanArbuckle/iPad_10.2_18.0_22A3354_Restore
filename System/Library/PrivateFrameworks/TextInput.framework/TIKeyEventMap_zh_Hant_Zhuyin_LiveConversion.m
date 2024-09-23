@implementation TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___onceToken_146 != -1)
    dispatch_once(&sharedInstance___onceToken_146, block);
  return (id)sharedInstance___keyEventMap_145;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)shouldInsertZhuyinCharacterAfter:(id)a3
{
  return objc_msgSend(a3, "_containsBopomofoOnly");
}

- (int64_t)candidateNumberKey:(int)a3
{
  __int16 v3;
  void *v4;
  int64_t v5;
  __int16 v7;

  v3 = a3;
  if (candidateNumberKey____onceToken != -1)
    dispatch_once(&candidateNumberKey____onceToken, &__block_literal_global_147);
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)candidateNumberKey____numberKeys, "indexOfObject:", v4);

  return v5;
}

@end
