@implementation UIFont

+ (id)buttonFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0);
}

+ (id)cellTitleFont
{
  return +[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody);
}

+ (id)cellDetailFont
{
  return objc_msgSend(a1, "mt_preferredFontForTextStyle:addingSymbolicTraits:", UIFontTextStyleCaption1, 0);
}

+ (id)headerTitleFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0);
}

+ (id)headerDetailFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0);
}

+ (id)sectionFooterFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedFooterConfiguration](UIListContentConfiguration, "groupedFooterConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));

  return v4;
}

+ (id)mt_preferredFontForTextStyle:(id)a3
{
  return objc_msgSend(a1, "mt_preferredFontForTextStyle:addingSymbolicTraits:", a3, 0);
}

+ (id)mt_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, *(_QWORD *)&a4, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));

  return v5;
}

+ (id)mt_fontForTextStyle:(id)a3 contentSizeCategoryName:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mt_fontDescriptorForTextStyle:contentSizeCategoryName:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));

  return v5;
}

+ (id)mt_fontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 contentSizeCategoryName:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)&a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mt_fontDescriptorForTextStyle:contentSizeCategoryName:", a3, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
  return v8;
}

+ (id)mt_fontDescriptorForTextStyle:(id)a3 contentSizeCategoryName:(id)a4
{
  return (id)CTFontDescriptorCreateWithTextStyle(a3, a4, 0);
}

+ (double)mt_scaledConstantForTextStyle:(id)a3 defaultConstant:(double)a4
{
  void *v5;
  double v6;
  double v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", a3));
  objc_msgSend(v5, "_scaledValueForValue:", a4);
  v7 = v6;

  return v7;
}

- (double)mt_offsetFromCapHeightToAscent
{
  double v3;
  double v4;
  double v5;

  -[UIFont ascender](self, "ascender");
  v4 = v3;
  -[UIFont capHeight](self, "capHeight");
  return v4 - v5;
}

- (double)mt_offsetFromLastBaselineToBottom
{
  double v2;

  -[UIFont descender](self, "descender");
  return -v2;
}

- (double)mt_leftMargin
{
  double v3;

  v3 = 0.0;
  CTFontGetLanguageAwareOutsets(self, &v3, 0, 0, 0);
  return v3;
}

@end
