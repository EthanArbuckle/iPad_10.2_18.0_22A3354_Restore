@implementation MTEpisodeContextToPersistentStringMap

void __MTEpisodeContextToPersistentStringMap_inverted_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[12];
  _QWORD v5[13];

  v5[12] = *MEMORY[0x1E0C80C00];
  v4[0] = &unk_1E5538C60;
  v4[1] = &unk_1E5538DE0;
  v5[0] = CFSTR("default");
  v5[1] = CFSTR("store");
  v4[2] = &unk_1E5538DF8;
  v4[3] = &unk_1E5538E10;
  v5[2] = CFSTR("library-episodes");
  v5[3] = CFSTR("downloaded-episodes");
  v4[4] = &unk_1E5538E28;
  v4[5] = &unk_1E5538E40;
  v5[4] = CFSTR("show-feed");
  v5[5] = CFSTR("show-user-episodes");
  v4[6] = &unk_1E5538E58;
  v4[7] = &unk_1E5538E70;
  v5[6] = CFSTR("listen-now");
  v5[7] = CFSTR("listen-now-latest-episodes");
  v4[8] = &unk_1E5538E88;
  v4[9] = &unk_1E5538EA0;
  v5[8] = CFSTR("bookmarks");
  v5[9] = CFSTR("show-downloaded-episodes");
  v4[10] = &unk_1E5538EB8;
  v4[11] = &unk_1E5538ED0;
  v5[10] = CFSTR("recently-played");
  v5[11] = CFSTR("**Invalid(enum-count)**");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTEpisodeContextToPersistentStringMap_inverted_map;
  MTEpisodeContextToPersistentStringMap_inverted_map = v0;

  objc_msgSend((id)MTEpisodeContextToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MTEpisodeContextToPersistentStringMap_inverted_invertedMap;
  MTEpisodeContextToPersistentStringMap_inverted_invertedMap = v2;

}

@end
