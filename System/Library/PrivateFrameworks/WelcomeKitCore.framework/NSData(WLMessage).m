@implementation NSData(WLMessage)

- (id)wl_subdataWithRangeExcludingTrailingCrnl:()WLMessage
{
  void *v7;
  void *v8;
  void *v10;

  if (wl_subdataWithRangeExcludingTrailingCrnl__onceToken != -1)
    dispatch_once(&wl_subdataWithRangeExcludingTrailingCrnl__onceToken, &__block_literal_global_322);
  if (a4 >= 2)
  {
    objc_msgSend(a1, "subdataWithRange:", a4 - 2 + a3, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToData:", wl_subdataWithRangeExcludingTrailingCrnl__crlfData))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4 - 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      a4 -= 2;
    }

  }
  if (a4)
  {
    objc_msgSend(a1, "subdataWithRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
