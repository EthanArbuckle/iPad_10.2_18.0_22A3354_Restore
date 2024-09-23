@implementation UIFont

+ (BOOL)bc_contentSizeCategoryIsGreaterThan:(id)a3
{
  NSString *v3;
  void *v4;
  NSString *v5;
  NSComparisonResult v6;

  v3 = (NSString *)a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v6 = UIContentSizeCategoryCompareToCategory(v5, v3);
  return v6 == NSOrderedDescending;
}

+ (BOOL)bc_accessibilityFontSizesEnabled
{
  void *v2;
  NSString *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

- (id)bc_cssFontFamily
{
  void *v3;
  __CFString *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont familyName](self, "familyName"));
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR(".AppleSystemUIFont")) & 1) != 0)
  {
    v4 = CFSTR("system-ui");
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[UIFont fontName](self, "fontName"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\", \"%@\"), v5, v3));

    v3 = (void *)v5;
  }

  return v4;
}

- (id)bc_cssFontWeight
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v3 = objc_msgSend(v2, "symbolicTraits");

  if ((v3 & 2) != 0)
    return CFSTR("bold");
  else
    return CFSTR("normal");
}

- (id)bc_cssFontSize
{
  double v2;
  void *v3;
  void *v4;

  -[UIFont pointSize](self, "pointSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v2)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@pt"), v3));

  return v4;
}

@end
