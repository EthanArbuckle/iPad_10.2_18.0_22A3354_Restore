@implementation UIFont

+ (id)nt_preferredFontForCondensedTextStyle:(unint64_t)a3 contentSizeCategory:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIFontDescriptorAttributeName v15;
  void *v16;
  UIFontDescriptorTraitKey v17;
  void *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", a4));
  if (a3 > 2)
    v6 = 0;
  else
    v6 = *(id *)*(&off_1000C7000 + a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v6, v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 64));

  v17 = UIFontWeightTrait;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightMedium));
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  v15 = UIFontDescriptorTraitsAttribute;
  v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontDescriptorByAddingAttributes:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12, 0.0));
  return v13;
}

- (double)nt_scaledValueForValue:(double)a3
{
  double result;

  -[UIFont _scaledValueForValue:](self, "_scaledValueForValue:", a3);
  return result;
}

- (CGRect)nt_boundingBoxForString:(id)a3
{
  id v4;
  CFIndex v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGRect result;

  v4 = a3;
  v5 = (CFIndex)objc_msgSend(v4, "length");
  __chkstk_darwin(v5);
  v6 = (2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  objc_msgSend(v4, "getCharacters:range:", (char *)&v8 - v6, 0, v5);

  __chkstk_darwin(v7);
  if (CTFontGetGlyphsForCharacters((CTFontRef)self, (const UniChar *)((char *)&v8 - v6), (CGGlyph *)((char *)&v8 - v6), v5))
  {
    return CTFontGetBoundingRectsForGlyphs((CTFontRef)self, kCTFontOrientationDefault, (const CGGlyph *)((char *)&v8 - v6), 0, v5);
  }
  else
  {
    result.origin.x = CGRectZero.origin.x;
    result.origin.y = CGRectZero.origin.y;
    result.size.width = CGRectZero.size.width;
    result.size.height = CGRectZero.size.height;
  }
  return result;
}

@end
