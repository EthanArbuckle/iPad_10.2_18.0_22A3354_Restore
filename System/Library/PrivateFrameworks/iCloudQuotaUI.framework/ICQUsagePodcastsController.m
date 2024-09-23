@implementation ICQUsagePodcastsController

+ (id)mediaGroups
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("audiopodcasts");
  v3[1] = CFSTR("videopodcasts");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
