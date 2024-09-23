@implementation SSItemStoreFrontURLForItemKind

uint64_t __SSItemStoreFrontURLForItemKind_block_invoke()
{
  uint64_t result;

  SSItemStoreFrontURLForItemKind_sItemKinds = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("audiobook"), CFSTR("course"), CFSTR("itunes-u"), CFSTR("movie"), CFSTR("music-video"), CFSTR("newsstand"), CFSTR("podcast"), CFSTR("podcast-episode"), CFSTR("ringtone"), CFSTR("software"), CFSTR("software-update"), CFSTR("song"), CFSTR("tone"), CFSTR("tv-episode"), CFSTR("tv-season"), 0);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("itms://?action=audiobooks"), CFSTR("itms://?action=itunes-u"), CFSTR("itms://?action=itunes-u"), CFSTR("itms://?action=movies"), CFSTR("itms://?action=music-videos"), CFSTR("itms-apps://?action=newsstand"), CFSTR("itms://?action=podcasts"), CFSTR("itms://?action=podcasts"), CFSTR("itms://?action=ringtones"), CFSTR("itms-apps://?action=software"), CFSTR("itms-apps://?action=updates"), CFSTR("itms://?action=music"), CFSTR("itms://?action=ringtones"), CFSTR("itms://?action=tv-shows"), CFSTR("itms://?action=tv-shows"), 0);
  SSItemStoreFrontURLForItemKind_sURLStrings = result;
  return result;
}

@end
