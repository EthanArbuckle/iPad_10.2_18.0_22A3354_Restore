@implementation MKMapView(Weather)

- (void)configureForWeather
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1960]), "initWithEmphasisStyle:", 101);
  objc_msgSend(a1, "setPreferredConfiguration:");

}

- (void)configureForMuted
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1960]), "initWithEmphasisStyle:", 1);
  objc_msgSend(a1, "setPreferredConfiguration:");

}

- (void)configureForWeatherWind
{
  id v2;
  id v3;

  v2 = objc_alloc(MEMORY[0x1E0CC1960]);
  v3 = (id)objc_msgSend(v2, "initWithEmphasisStyle:", *MEMORY[0x1E0CC16E0]);
  objc_msgSend(a1, "setPreferredConfiguration:");

}

@end
