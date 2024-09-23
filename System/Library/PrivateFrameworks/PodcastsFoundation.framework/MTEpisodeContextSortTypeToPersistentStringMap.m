@implementation MTEpisodeContextSortTypeToPersistentStringMap

void __MTEpisodeContextSortTypeToPersistentStringMap_inverted_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];
  _QWORD v5[11];

  v5[10] = *MEMORY[0x1E0C80C00];
  v4[0] = &unk_1E5538C60;
  v4[1] = &unk_1E5538DE0;
  v5[0] = CFSTR("default");
  v5[1] = CFSTR("pub-date");
  v4[2] = &unk_1E5538DF8;
  v4[3] = &unk_1E5538E10;
  v5[2] = CFSTR("pub-date-ascending");
  v5[3] = CFSTR("title");
  v4[4] = &unk_1E5538E28;
  v4[5] = &unk_1E5538E40;
  v5[4] = CFSTR("bookmarked-date");
  v5[5] = CFSTR("bookmarked-date-ascending");
  v4[6] = &unk_1E5538E58;
  v4[7] = &unk_1E5538E70;
  v5[6] = CFSTR("group-by-shows");
  v5[7] = CFSTR("downloaded-date-ascending");
  v4[8] = &unk_1E5538E88;
  v4[9] = &unk_1E5538EA0;
  v5[8] = CFSTR("downloaded-date");
  v5[9] = CFSTR("**Invalid(enum-count)**");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTEpisodeContextSortTypeToPersistentStringMap_inverted_map;
  MTEpisodeContextSortTypeToPersistentStringMap_inverted_map = v0;

  objc_msgSend((id)MTEpisodeContextSortTypeToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MTEpisodeContextSortTypeToPersistentStringMap_inverted_invertedMap;
  MTEpisodeContextSortTypeToPersistentStringMap_inverted_invertedMap = v2;

}

@end
