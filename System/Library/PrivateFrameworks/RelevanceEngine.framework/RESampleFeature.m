@implementation RESampleFeature

void __RESampleFeature_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("SamplePosition"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RESampleFeature_Feature;
  RESampleFeature_Feature = v0;

}

@end
