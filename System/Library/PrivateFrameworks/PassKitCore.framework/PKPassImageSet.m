@implementation PKPassImageSet

+ (Class)classForImageSetType:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
