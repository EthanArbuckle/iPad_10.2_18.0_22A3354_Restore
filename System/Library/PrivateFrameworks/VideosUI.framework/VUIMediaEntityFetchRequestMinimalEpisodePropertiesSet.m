@implementation VUIMediaEntityFetchRequestMinimalEpisodePropertiesSet

void __VUIMediaEntityFetchRequestMinimalEpisodePropertiesSet_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;

  VUIMediaEntityFetchRequestMinimalPropertiesSet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("releaseYear"), CFSTR("releaseDate"), CFSTR("isLocal"), CFSTR("seasonNumber"), CFSTR("storeID"), CFSTR("isPlayable"), CFSTR("duration"), CFSTR("previewFrameImageIdentifier"), CFSTR("episodeNumber"), CFSTR("fractionalEpisodeNumber"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v1, "unionSet:", v4);
  objc_msgSend(v1, "unionSet:", v0);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)VUIMediaEntityFetchRequestMinimalEpisodePropertiesSet___minimalSeasonPropertiesSet;
  VUIMediaEntityFetchRequestMinimalEpisodePropertiesSet___minimalSeasonPropertiesSet = v2;

}

@end
