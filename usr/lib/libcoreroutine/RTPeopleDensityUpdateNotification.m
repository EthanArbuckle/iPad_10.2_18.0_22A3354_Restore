@implementation RTPeopleDensityUpdateNotification

- (RTPeopleDensityUpdateNotification)initWithPeopleDensityBundles:(id)a3
{
  id v5;
  RTPeopleDensityUpdateNotification *v6;
  RTPeopleDensityUpdateNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTPeopleDensityUpdateNotification;
  v6 = -[RTNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_densityBundles, a3);

  return v7;
}

- (NSArray)densityBundles
{
  return self->_densityBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_densityBundles, 0);
}

@end
