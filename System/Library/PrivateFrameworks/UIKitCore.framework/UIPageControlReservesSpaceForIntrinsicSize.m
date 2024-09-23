@implementation UIPageControlReservesSpaceForIntrinsicSize

void ___UIPageControlReservesSpaceForIntrinsicSize_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIPageControlReservesSpaceForIntrinsicSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "BOOLValue");
    v1 = v3;
  }
  else
  {
    v2 = 0;
  }
  _MergedGlobals_23_6 = v2;

}

@end
