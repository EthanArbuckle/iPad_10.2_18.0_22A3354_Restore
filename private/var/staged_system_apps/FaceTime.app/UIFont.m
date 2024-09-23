@implementation UIFont

- (UIFont)withCaseSensitiveAttribute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  void *v12;
  UIFontDescriptorAttributeName v13;
  void *v14;

  v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_10008DC30;
  v11[1] = &off_10008DC48;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
  return (UIFont *)v8;
}

+ (id)preferredCaption1Font
{
  return _objc_msgSend(a1, "preferredFontWithTextStyle:", UIFontTextStyleCaption1);
}

+ (id)preferredCaption1BoldFont
{
  return _objc_msgSend(a1, "preferredBoldFontWithTextStyle:", UIFontTextStyleCaption1);
}

+ (id)preferredSubheadline1Font
{
  return _objc_msgSend(a1, "preferredFontWithTextStyle:", UIFontTextStyleSubheadline1);
}

+ (id)preferredFontWithTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 0, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)preferredBoldFontWithTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 2, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)preferredItalicFontWithTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 1, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)preferredTightLeadingWithForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 0x8000, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)phPreferredFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)phPreferredBoldFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)phPreferredItalicFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)phPreferredTightLeadingFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 0x8000));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)_thinSystemFontWithDialerCharacteristicsOfSize:(double)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _thinSystemFontOfSize:](UIFont, "_thinSystemFontOfSize:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "withCaseSensitiveAttribute"));

  return v4;
}

@end
