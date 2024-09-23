@implementation MTPlayReasonToPersistentStringMap

void __MTPlayReasonToPersistentStringMap_inverted_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[16];
  _QWORD v5[17];

  v5[16] = *MEMORY[0x1E0C80C00];
  v4[0] = &unk_1E5538C48;
  v4[1] = &unk_1E5538C78;
  v5[0] = CFSTR("none");
  v5[1] = CFSTR("restoration");
  v4[2] = &unk_1E5538C90;
  v4[3] = &unk_1E5538CA8;
  v5[2] = CFSTR("handoff");
  v5[3] = CFSTR("user");
  v4[4] = &unk_1E5538CC0;
  v4[5] = &unk_1E5538CD8;
  v5[4] = CFSTR("car-play");
  v5[5] = CFSTR("magical-moments");
  v4[6] = &unk_1E5538CF0;
  v4[7] = &unk_1E5538D08;
  v5[6] = CFSTR("store");
  v5[7] = CFSTR("media-remote");
  v4[8] = &unk_1E5538D20;
  v4[9] = &unk_1E5538D38;
  v5[8] = CFSTR("siri");
  v5[9] = CFSTR("quick-actions");
  v4[10] = &unk_1E5538D50;
  v4[11] = &unk_1E5538D68;
  v5[10] = CFSTR("top-shelf");
  v5[11] = CFSTR("shared-queue");
  v4[12] = &unk_1E5538D80;
  v4[13] = &unk_1E5538D98;
  v5[12] = CFSTR("rich-notifications");
  v5[13] = CFSTR("playthrough");
  v4[14] = &unk_1E5538DB0;
  v4[15] = &unk_1E5538DC8;
  v5[14] = CFSTR("widget");
  v5[15] = CFSTR("**Invalid(enum-count)**");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTPlayReasonToPersistentStringMap_inverted_map;
  MTPlayReasonToPersistentStringMap_inverted_map = v0;

  objc_msgSend((id)MTPlayReasonToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MTPlayReasonToPersistentStringMap_inverted_invertedMap;
  MTPlayReasonToPersistentStringMap_inverted_invertedMap = v2;

}

@end
