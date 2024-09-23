@implementation PGMoodSourceSceneDistribution

- (double)weight
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGMoodSourceSceneDistribution;
  -[PGMoodSourceScene weight](&v4, sel_weight);
  return (v2 + v2) / 3.0;
}

+ (BOOL)shouldUseSceneIdentifier:(id)a3
{
  return objc_msgSend(a3, "isDistributed");
}

@end
