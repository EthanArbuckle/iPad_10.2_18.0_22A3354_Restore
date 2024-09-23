@implementation VUIMediaEntityFetchRequestMinimalMovieRentalsPropertiesSet

void __VUIMediaEntityFetchRequestMinimalMovieRentalsPropertiesSet_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  VUIMediaEntityFetchRequestMinimalPropertiesSet();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("rentalPlaybackDuration"), CFSTR("rentalExpirationDate"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v1, "unionSet:", v4);
  objc_msgSend(v1, "unionSet:", v0);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)VUIMediaEntityFetchRequestMinimalMovieRentalsPropertiesSet___minimalMoviesPropertiesSet;
  VUIMediaEntityFetchRequestMinimalMovieRentalsPropertiesSet___minimalMoviesPropertiesSet = v2;

}

@end
