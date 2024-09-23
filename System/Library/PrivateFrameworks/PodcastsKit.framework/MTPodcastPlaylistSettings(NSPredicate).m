@implementation MTPodcastPlaylistSettings(NSPredicate)

+ (uint64_t)predicateForPlaylistSettingsUuid:()NSPredicate
{
  return objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x24BE73A68], a3);
}

@end
