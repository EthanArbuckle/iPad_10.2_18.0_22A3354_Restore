@implementation MTEpisodePriceTypeToPersistentStringMap

void __MTEpisodePriceTypeToPersistentStringMap_inverted_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v4[0] = &unk_1E5538C60;
  v4[1] = &unk_1E5538E10;
  v5[0] = CFSTR("NONE");
  v5[1] = CFSTR("PLUS");
  v4[2] = &unk_1E5538E28;
  v4[3] = &unk_1E5538DF8;
  v5[2] = CFSTR("PRMO");
  v5[3] = CFSTR("PSUB");
  v4[4] = &unk_1E5538DE0;
  v4[5] = &unk_1E5538E40;
  v5[4] = CFSTR("STDQ");
  v5[5] = CFSTR("**Invalid(enum-count)**");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTEpisodePriceTypeToPersistentStringMap_inverted_map;
  MTEpisodePriceTypeToPersistentStringMap_inverted_map = v0;

  objc_msgSend((id)MTEpisodePriceTypeToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MTEpisodePriceTypeToPersistentStringMap_inverted_invertedMap;
  MTEpisodePriceTypeToPersistentStringMap_inverted_invertedMap = v2;

}

@end
