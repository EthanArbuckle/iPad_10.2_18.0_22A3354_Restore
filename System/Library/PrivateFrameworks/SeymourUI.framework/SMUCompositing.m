@implementation SMUCompositing

+ (id)kCAFilterSourceAtop
{
  return (id)*MEMORY[0x24BDE5BF8];
}

+ (id)kCAFilterPlusD
{
  return (id)*MEMORY[0x24BDE5BD0];
}

+ (id)kCAFilterPlusL
{
  return (id)*MEMORY[0x24BDE5BD8];
}

+ (id)kCAFilterScreenBlendMode
{
  return (id)*MEMORY[0x24BDE5BE8];
}

+ (id)kCAFilterColorBurnBlendMode
{
  return (id)*MEMORY[0x24BDE59D8];
}

@end
