@implementation VUIMediaEntityFetchRequestRequiredProperties

void __VUIMediaEntityFetchRequestRequiredProperties_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("type"), CFSTR("title"), CFSTR("identifier"), CFSTR("coverArtImageIdentifier"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VUIMediaEntityFetchRequestRequiredProperties___requiredProperties;
  VUIMediaEntityFetchRequestRequiredProperties___requiredProperties = v0;

}

@end
