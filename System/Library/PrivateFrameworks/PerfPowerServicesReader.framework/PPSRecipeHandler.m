@implementation PPSRecipeHandler

+ (id)eventRecipes
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)metricRecipes
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)timeSeriesRecipes
{
  return (id)MEMORY[0x24BDBD1B8];
}

@end
