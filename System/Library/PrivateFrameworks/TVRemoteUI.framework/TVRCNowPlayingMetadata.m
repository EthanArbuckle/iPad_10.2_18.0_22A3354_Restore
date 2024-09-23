@implementation TVRCNowPlayingMetadata

uint64_t __77__TVRCNowPlayingMetadata_NowPlayingInfoViewAdditions__infoview_formattedInfo__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __84__TVRCNowPlayingMetadata_NowPlayingInfoViewAdditions__infoview_formattedReleaseDate__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)infoview_formattedReleaseDate_formatter;
  infoview_formattedReleaseDate_formatter = (uint64_t)v0;

  objc_msgSend((id)infoview_formattedReleaseDate_formatter, "setDateStyle:", 2);
  return objc_msgSend((id)infoview_formattedReleaseDate_formatter, "setTimeStyle:", 0);
}

@end
