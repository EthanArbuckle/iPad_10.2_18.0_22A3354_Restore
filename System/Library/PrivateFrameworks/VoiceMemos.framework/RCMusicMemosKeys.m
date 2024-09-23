@implementation RCMusicMemosKeys

void __RCMusicMemosKeys_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("musicMemoStarRating"), CFSTR("musicMemoTags"), CFSTR("musicMemoTextNote"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RCMusicMemosKeys_musicMemosKeys;
  RCMusicMemosKeys_musicMemosKeys = v0;

}

@end
