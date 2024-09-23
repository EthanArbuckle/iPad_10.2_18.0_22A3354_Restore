@implementation PGGraphOverTheYearsNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
