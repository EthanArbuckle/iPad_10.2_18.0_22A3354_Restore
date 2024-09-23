@implementation MOResource(MOWeather)

- (id)metaData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource data](self, "data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v2));

  return v3;
}

@end
