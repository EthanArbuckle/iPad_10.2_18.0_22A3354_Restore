@implementation TSDSliderTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDSliderTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = (NSString *)-[TSDSliderTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("sliderValueFormat"));
  -[TSDSliderTableViewCellAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("sliderValue"));
  v5 = v4;
  v6 = -[TSDSliderTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mLabelSuffix"));
  if (v3)
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);
  if (objc_msgSend(v6, "length"))
  {
    if (-[NSString length](v3, "length"))
      return -[NSString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR(" %@"), v6);
    return v6;
  }
  return v3;
}

@end
