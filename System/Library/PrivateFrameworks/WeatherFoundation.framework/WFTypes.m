@implementation WFTypes

+ (id)WeatherDescriptions
{
  if (WeatherDescriptions_onceToken != -1)
    dispatch_once(&WeatherDescriptions_onceToken, &__block_literal_global_22_1);
  return (id)WeatherDescriptions_WeatherDescriptions;
}

void __30__WFTypes_WeatherDescriptions__block_invoke()
{
  void *v0;

  v0 = (void *)WeatherDescriptions_WeatherDescriptions;
  WeatherDescriptions_WeatherDescriptions = (uint64_t)&unk_24CCC0FC8;

}

@end
