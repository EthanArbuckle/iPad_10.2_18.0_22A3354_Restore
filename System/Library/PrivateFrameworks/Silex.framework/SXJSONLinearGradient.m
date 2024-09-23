@implementation SXJSONLinearGradient

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("colorStops")))
    return &__block_literal_global_85;
  else
    return 0;
}

uint64_t __59__SXJSONLinearGradient_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end
