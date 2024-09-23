@implementation SXGradientFillDarkModePolicyException

- (int64_t)shouldApplyDarkModeToComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  void *v5;
  char isKindOfClass;

  objc_msgSend(a3, "fill");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) - 1;
}

@end
