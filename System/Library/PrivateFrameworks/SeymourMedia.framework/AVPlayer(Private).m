@implementation AVPlayer(Private)

+ (id)smm_playbackWasInterruptedNotification
{
  return (id)*MEMORY[0x24BDB2058];
}

+ (id)smm_playbackRateDidChangedNotification
{
  return (id)*MEMORY[0x24BDB2060];
}

@end
