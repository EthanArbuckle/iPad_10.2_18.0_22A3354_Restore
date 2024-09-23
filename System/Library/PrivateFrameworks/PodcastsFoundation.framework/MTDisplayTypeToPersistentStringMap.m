@implementation MTDisplayTypeToPersistentStringMap

void __MTDisplayTypeToPersistentStringMap_inverted_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = &unk_1E5538C60;
  v4[1] = &unk_1E5538DE0;
  v5[0] = CFSTR("free");
  v5[1] = CFSTR("paid");
  v4[2] = &unk_1E5538DF8;
  v5[2] = CFSTR("hybrid");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTDisplayTypeToPersistentStringMap_inverted_map;
  MTDisplayTypeToPersistentStringMap_inverted_map = v0;

  objc_msgSend((id)MTDisplayTypeToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MTDisplayTypeToPersistentStringMap_inverted_invertedMap;
  MTDisplayTypeToPersistentStringMap_inverted_invertedMap = v2;

}

@end
