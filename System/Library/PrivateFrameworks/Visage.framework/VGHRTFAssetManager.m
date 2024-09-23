@implementation VGHRTFAssetManager

+ (id)getAssetWithError:(id *)a3
{
  void *v4;
  id *v6;

  v6 = 0;
  vg::hrtf::getAssetWithError(&v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && v6)
    *a3 = objc_retainAutorelease(*v6);
  return v4;
}

@end
