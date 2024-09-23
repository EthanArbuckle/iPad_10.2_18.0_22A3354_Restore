@implementation IMAccessibilityLabelAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  char *v8;
  char *v9;
  char *i;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IMAccessibilityLabelAccessibility;
  v3 = -[IMAccessibilityLabelAccessibility accessibilityLabel](&v15, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMAccessibilityLabelAccessibility imaxIdentification](self, "imaxIdentification"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("LabelWithSeparatedChars"));

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v8 = (char *)objc_msgSend(v4, "length");
    if ((uint64_t)v8 >= 1)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = objc_msgSend(v4, "characterAtIndex:", i);
        if (i)
        {
          v12 = v11;
          if (objc_msgSend(v4, "characterAtIndex:", i - 1) != 32 && v12 == 32)
            continue;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", i, 1));
        objc_msgSend(v7, "appendString:", v13);

      }
    }
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

@end
