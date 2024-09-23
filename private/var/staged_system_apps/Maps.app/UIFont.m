@implementation UIFont

+ (void)setPlacecardShouldUseSmallFont:(BOOL)a3
{
  +[MKFontManager setUseSmallFont:](MKFontManager, "setUseSmallFont:", a3);
}

+ (BOOL)accessibilityTextEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));

  if (qword_1014D2288 != -1)
    dispatch_once(&qword_1014D2288, &stru_1011B3A38);
  v4 = objc_msgSend((id)qword_1014D2280, "containsObject:", v3);

  return v4;
}

+ (id)system28Bold
{
  return objc_msgSend(a1, "system28BoldCompatibleWithTraitCollection:", 0);
}

+ (id)system28BoldCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleTitle1, v3, 0, UIFontWeightBold));

  return v4;
}

+ (id)system28Medium
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle1, UIFontWeightMedium);
}

+ (id)system28AdaptiveBoldShort
{
  int v2;
  const UIFontTextStyle *v3;

  v2 = _MKPlaceCardUseSmallerFont(a1, a2);
  v3 = &UIFontTextStyleTitle1;
  if (v2)
    v3 = &UIFontTextStyleTitle2;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", *v3, 0, 0x8000, UIFontWeightBold));
}

+ (id)system28AdaptiveCondensedBold
{
  int v2;
  const UIFontTextStyle *v3;

  v2 = _MKPlaceCardUseSmallerFont(a1, a2);
  v3 = &UIFontTextStyleTitle1;
  if (v2)
    v3 = &UIFontTextStyleTitle2;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", *v3, 0, 64, UIFontWeightBold));
}

+ (id)system28
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleTitle1);
}

+ (id)system22Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle2, UIFontWeightBold);
}

+ (id)system22AdaptiveCondensedBold
{
  int v2;
  const UIFontTextStyle *v3;

  v2 = _MKPlaceCardUseSmallerFont(a1, a2);
  v3 = &UIFontTextStyleTitle2;
  if (v2)
    v3 = &UIFontTextStyleTitle3;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", *v3, 0, 64, UIFontWeightBold));
}

+ (id)system22Semibold
{
  return objc_msgSend(a1, "system22SemiboldCompatibleWithTraitCollection:", 0);
}

+ (id)system22SemiboldCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleTitle2, v3, 0, UIFontWeightSemibold));

  return v4;
}

+ (id)system22
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleTitle2);
}

+ (id)system20Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle3, UIFontWeightBold);
}

+ (id)system20
{
  return objc_msgSend(a1, "system20CompatibleWithTraitCollection:", 0);
}

+ (id)system20CompatibleWithTraitCollection:(id)a3
{
  return _objc_msgSend(a1, "system20CompatibleWithTraitCollection:withSymbolicTraits:", a3, 0);
}

+ (id)system20CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleTitle3, v5, v4, 0.0));

  return v6;
}

+ (id)system20Light
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle3, UIFontWeightLight);
}

+ (id)system20Medium
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle3, UIFontWeightMedium);
}

+ (id)system20Semibold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle3, UIFontWeightSemibold);
}

+ (id)system22AdaptiveSemibold
{
  int v2;
  const UIFontTextStyle *v3;

  v2 = _MKPlaceCardUseSmallerFont(a1, a2);
  v3 = &UIFontTextStyleTitle2;
  if (v2)
    v3 = &UIFontTextStyleBody;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *v3, UIFontWeightSemibold));
}

+ (id)system20AdaptiveSemibold
{
  return _objc_msgSend(a1, "system20AdaptiveSemiboldCompatibleWithTraitCollection:", 0);
}

+ (id)system20AdaptiveSemiboldCompatibleWithTraitCollection:(id)a3
{
  id v3;
  uint64_t v4;
  const UIFontTextStyle *v5;
  UIFontTextStyle v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (_MKPlaceCardUseSmallerFont(v3, v4))
    v5 = &UIFontTextStyleBody;
  else
    v5 = &UIFontTextStyleTitle3;
  v6 = *v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", v6, v7, 0, UIFontWeightSemibold));
  return v8;
}

+ (id)system20AdaptiveMedium
{
  int v2;
  const UIFontTextStyle *v3;

  v2 = _MKPlaceCardUseSmallerFont(a1, a2);
  v3 = &UIFontTextStyleTitle3;
  if (v2)
    v3 = &UIFontTextStyleBody;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *v3, UIFontWeightMedium));
}

+ (id)system20Adaptive
{
  int v2;
  const UIFontTextStyle *v3;

  v2 = _MKPlaceCardUseSmallerFont(a1, a2);
  v3 = &UIFontTextStyleBody;
  if (!v2)
    v3 = &UIFontTextStyleTitle3;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", *v3));
}

+ (id)system18
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleHeadline);
}

+ (id)system17Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleBody, UIFontWeightBold);
}

+ (id)system17SemiBold
{
  return objc_msgSend(a1, "system17SemiboldCompatibleWithTraitCollection:", 0);
}

+ (id)system17SemiboldCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleBody, v3, 0, UIFontWeightSemibold));

  return v4;
}

+ (id)system17SemiboldTall
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleBody, 0, 0x10000, UIFontWeightSemibold);
}

+ (id)system17Medium
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleBody, UIFontWeightMedium);
}

+ (id)system17Light
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleBody, UIFontWeightLight);
}

+ (id)system17Tall
{
  return _objc_msgSend(a1, "system17CompatibleWithTraitCollection:withSymbolicTraits:", 0, 0x10000);
}

+ (id)system17
{
  return objc_msgSend(a1, "system17CompatibleWithTraitCollection:", 0);
}

+ (id)system17CompatibleWithTraitCollection:(id)a3
{
  return _objc_msgSend(a1, "system17CompatibleWithTraitCollection:withSymbolicTraits:", a3, 0);
}

+ (id)system17CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleBody, v5, v4, 0.0));

  return v6;
}

+ (id)system16
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleCallout);
}

+ (id)system15Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleSubheadline, UIFontWeightBold);
}

+ (id)system15Semibold
{
  return objc_msgSend(a1, "system15SemiboldCompatibleWithTraitCollection:", 0);
}

+ (id)system15SemiboldCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleSubheadline, v3, 0, UIFontWeightSemibold));

  return v4;
}

+ (id)system15Medium
{
  return objc_msgSend(a1, "system15MediumCompatibleWithTraitCollection:", 0);
}

+ (id)system15MediumCompatibleWithTraitCollection:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleSubheadline, v4, 0, UIFontWeightMedium));

  return v5;
}

+ (id)system15Tall
{
  return objc_msgSend(a1, "system15CompatibleWithTraitCollection:withSymbolicTraits:", 0, 0x10000);
}

+ (id)system15
{
  return objc_msgSend(a1, "system15CompatibleWithTraitCollection:", 0);
}

+ (id)system15CompatibleWithTraitCollection:(id)a3
{
  return objc_msgSend(a1, "system15CompatibleWithTraitCollection:withSymbolicTraits:", a3, 0);
}

+ (id)system15CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleSubheadline, v5, v4, 0.0));

  return v6;
}

+ (id)system15Light
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleSubheadline, UIFontWeightLight);
}

+ (id)system13SemiboldCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleFootnote, v3, 0, UIFontWeightSemibold));

  return v4;
}

+ (id)system13Adaptive
{
  return _objc_msgSend(a1, "system13AdaptiveCompatibleWithTraitCollection:", 0);
}

+ (id)system13AdaptiveCompatibleWithTraitCollection:(id)a3
{
  id v3;
  uint64_t v4;
  const UIFontTextStyle *v5;
  UIFontTextStyle v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (_MKPlaceCardUseSmallerFont(v3, v4))
    v5 = &UIFontTextStyleCaption1;
  else
    v5 = &UIFontTextStyleFootnote;
  v6 = *v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", v6, v7, 0, 0.0));
  return v8;
}

+ (id)system13MediumCompatibleWithTraitCollection:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleFootnote, v4, 0, UIFontWeightMedium));

  return v5;
}

+ (id)system13Tall
{
  return _objc_msgSend(a1, "system13CompatibleWithTraitCollection:withSymbolicTraits:", 0, 0x10000);
}

+ (id)system13
{
  return objc_msgSend(a1, "system13CompatibleWithTraitCollection:", 0);
}

+ (id)system13CompatibleWithTraitCollection:(id)a3
{
  return _objc_msgSend(a1, "system13CompatibleWithTraitCollection:withSymbolicTraits:", a3, 0);
}

+ (id)system13CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleFootnote, v5, v4, 0.0));

  return v6;
}

+ (id)system12Bold
{
  return objc_msgSend(a1, "system12BoldCompatibleWithTraitCollection:", 0);
}

+ (id)system12BoldCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleCaption1, v3, 0, UIFontWeightBold));

  return v4;
}

+ (id)system12Semibold
{
  return _objc_msgSend(a1, "system12SemiboldCompatibleWithTraitCollection:", 0);
}

+ (id)system12SemiboldCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleCaption1, v3, 0, UIFontWeightSemibold));

  return v4;
}

+ (id)system12Medium
{
  return _objc_msgSend(a1, "system12MediumCompatibleWithTraitCollection:", 0);
}

+ (id)system12MediumCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleCaption1, v3, 0, UIFontWeightMedium));

  return v4;
}

+ (id)system12
{
  return _objc_msgSend(a1, "system12CompatibleWithTraitCollection:", 0);
}

+ (id)system12CompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleCaption1, v3, 0, 0.0));

  return v4;
}

+ (id)system11Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleCaption2, UIFontWeightBold);
}

+ (id)system11
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleCaption2);
}

+ (id)_maps_systemFontWithSize:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_textStyleForSize:useAdaptiveIfNeeded:effectivePointSize:", 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", v5, 0));

  objc_msgSend(a1, "_maps_discreteSizeForSize:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_fontScaledByScaleFactor:", a3 / v7));

  return v8;
}

+ (id)_maps_boldSystemFontWithSize:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_textStyleForSize:useAdaptiveIfNeeded:effectivePointSize:", 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", v5, 2));

  objc_msgSend(a1, "_maps_discreteSizeForSize:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_fontScaledByScaleFactor:", a3 / v7));

  return v8;
}

+ (id)_maps_systemFontWithSize:(double)a3 weight:(double)a4 grade:(unint64_t)a5
{
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_textStyleForSize:useAdaptiveIfNeeded:effectivePointSize:", 0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:grade:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:grade:", v9, a5, a4));
  objc_msgSend(a1, "_maps_discreteSizeForSize:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_fontScaledByScaleFactor:", a3 / v11));

  return v12;
}

+ (id)_maps_systemFontWithFixedSize:(double)a3
{
  return objc_msgSend(a1, "_maps_systemFontWithFixedSize:adaptiveFont:", 0, a3);
}

+ (id)_maps_systemFontWithFixedSize:(double)a3 adaptiveFont:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v8;

  v8 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_textStyleForSize:useAdaptiveIfNeeded:effectivePointSize:", a4, &v8, a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v4, 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, v8));

  return v6;
}

+ (id)_maps_boldSystemFontWithFixedSize:(double)a3
{
  return objc_msgSend(a1, "_maps_boldSystemFontWithFixedSize:adaptiveFont:", 0, a3);
}

+ (id)_maps_boldSystemFontWithFixedSize:(double)a3 adaptiveFont:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v8;

  v8 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_textStyleForSize:useAdaptiveIfNeeded:effectivePointSize:", a4, &v8, a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v4, 2, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, v8));

  return v6;
}

+ (id)_maps_navHeadingFontWithPreferredSize:(double)a3 diameter:(double)a4 desiredPadding:(double)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  double v45;
  void *i;
  void *v47;
  void *v48;
  double v49;
  double v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  NSAttributedStringKey v70;
  void *v71;
  _BYTE v72[128];
  NSAttributedStringKey v73;
  void *v74;
  _BYTE v75[128];
  _QWORD v76[3];
  _QWORD v77[8];

  v8 = MKLocalizedAbbreviationForCompassPoint(1, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v77[0] = v9;
  v11 = MKLocalizedAbbreviationForCompassPoint(8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v77[1] = v12;
  v14 = MKLocalizedAbbreviationForCompassPoint(7, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v77[2] = v15;
  v17 = MKLocalizedAbbreviationForCompassPoint(6, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v77[3] = v18;
  v20 = MKLocalizedAbbreviationForCompassPoint(5, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v77[4] = v21;
  v23 = MKLocalizedAbbreviationForCompassPoint(4, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v77[5] = v24;
  v26 = MKLocalizedAbbreviationForCompassPoint(3, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v77[6] = v27;
  v29 = MKLocalizedAbbreviationForCompassPoint(2, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v77[7] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 8));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v76[0] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3 + -1.0));
  v76[1] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3 + -2.0));
  v76[2] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 3));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));
  objc_msgSend(v36, "cgFloatValue");
  v38 = v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", v38));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v40 = v31;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v41)
  {
    v42 = v41;
    v43 = 0;
    v44 = *(_QWORD *)v67;
    v45 = 0.0;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v44)
          objc_enumerationMutation(v40);
        v47 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v73 = NSFontAttributeName;
        v74 = v39;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
        objc_msgSend(v47, "boundingRectWithSize:options:attributes:context:", 3, v48, 0, a4, a4);
        v50 = v49;

        if (v45 < v50)
        {
          v51 = v47;

          v45 = v50;
          v43 = v51;
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v42);
  }
  else
  {
    v43 = 0;
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v52 = v35;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v63;
LABEL_14:
    v56 = 0;
    v57 = v39;
    while (1)
    {
      if (*(_QWORD *)v63 != v55)
        objc_enumerationMutation(v52);
      objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v56), "cgFloatValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:"));

      v70 = NSFontAttributeName;
      v71 = v39;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
      objc_msgSend(v43, "boundingRectWithSize:options:attributes:context:", 3, v58, 0, a4, a4);
      v60 = v59;

      if (ceil((a4 - v60) * 0.5) >= a5)
        break;
      v56 = (char *)v56 + 1;
      v57 = v39;
      if (v54 == v56)
      {
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        if (v54)
          goto LABEL_14;
        break;
      }
    }
  }

  return v39;
}

+ (double)_maps_discreteSizeForSize:(double)a3
{
  double v3;

  v3 = 11.0;
  if (a3 > 11.0)
  {
    v3 = 12.0;
    if (a3 > 12.0)
    {
      v3 = 15.0;
      if (a3 > 15.0)
      {
        v3 = 17.0;
        if (a3 > 17.0)
        {
          v3 = 20.0;
          if (a3 > 20.0)
          {
            v3 = 22.0;
            if (a3 > 22.0)
              return 28.0;
          }
        }
      }
    }
  }
  return v3;
}

+ (id)_maps_textStyleForSize:(double)a3 useAdaptiveIfNeeded:(BOOL)a4 effectivePointSize:(double *)a5
{
  _BOOL4 v6;
  id v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  float v15;
  char *v16;
  uint64_t v17;
  void *v18;
  float v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a4;
  if (qword_1014D22A0 != -1)
    dispatch_once(&qword_1014D22A0, &stru_1011B3A58);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (id)qword_1014D2290;
  v9 = (char *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      v13 = 0;
      v14 = &v11[(_QWORD)v10];
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13), "floatValue", (_QWORD)v21);
        if (v15 >= a3)
        {
          v14 = &v13[(_QWORD)v11];
          goto LABEL_14;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = (char *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v11 = v14;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  v16 = (char *)objc_msgSend((id)qword_1014D2290, "count");
  if (v14 >= v16)
  {
    v16 = (char *)objc_msgSend((id)qword_1014D2290, "count");
    v14 = v16;
  }
  if (v6 && _MKPlaceCardUseSmallerFont(v16, v17) && v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2290, "objectAtIndexedSubscript:", --v14));
    objc_msgSend(v18, "floatValue");
    a3 = v19;

  }
  if (a5)
    *a5 = a3;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2298, "objectAtIndexedSubscript:", v14, (_QWORD)v21));
}

+ (id)_maps_cappedFont:(id)a3 withMaxPoint:(double)a4
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(v5, "pointSize");
  if (v6 <= a4)
  {
    v9 = v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptorWithSize:", a4));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v8, 0.0));

  }
  return v9;
}

- (UIFont)_maps_fontWithMonospacedNumbers
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIFont pointSize](self, "pointSize");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapkit_fontDescriptorByAddingFeaturesForTabularFigures"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, v4));

  return (UIFont *)v7;
}

+ (double)_maps_bodyScaledValueForValue:(double)a3
{
  double result;

  objc_msgSend(a1, "_maps_bodyScaledValueForValue:compatibleWithTraitCollection:", 0, a3);
  return result;
}

+ (double)_maps_bodyScaledValueForValue:(double)a3 compatibleWithTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleBody, v7, 0, 0.0));

  objc_msgSend(v6, "displayScale");
  v10 = v9;

  if (v10 == 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v11, "scale");
    v10 = v12;

  }
  objc_msgSend(v8, "_scaledValueForValue:", a3);
  v14 = UICeilToScale(v13, v10);

  return v14;
}

+ (id)_maps_fontWithTextStyle:(id)a3 weight:(double)a4 compatibleWithTraitCollection:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIFontDescriptorTraitKey v14;
  void *v15;
  UIFontDescriptorAttributeName v16;
  void *v17;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", a3, a5));
  v16 = UIFontDescriptorTraitsAttribute;
  v14 = UIFontWeightTrait;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v15 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fontWithDescriptor:size:", v11, 0.0));
  return v12;
}

- (id)_maps_scaledFontForScaleFactor:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;

  -[UIFont pointSize](self, "pointSize");
  v6 = ceil(v5 * a3 + -0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, v6));

  return v8;
}

+ (id)_maps_fontProviderWeight:(double)a3 minimumPointSize:(double)a4 minimumSizeCategory:(id)a5 maximumPointSize:(double)a6 maximumSizeCategory:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;

  v11 = a5;
  v12 = a7;
  if (qword_1014D2278 != -1)
    dispatch_once(&qword_1014D2278, &stru_1011B3A78);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10039D334;
  v17[3] = &unk_1011B3AA0;
  v20 = a4;
  v21 = a3;
  v18 = v11;
  v19 = v12;
  v22 = a6;
  v13 = v12;
  v14 = v11;
  v15 = objc_retainBlock(v17);

  return v15;
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4
{
  return objc_msgSend(a1, "_mapsCar_fontForTextStyle:weight:grade:", a3, 0xFFFFFFFFLL, a4);
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 grade:(int)a5
{
  return _objc_msgSend(a1, "_mapsCar_fontForTextStyle:weight:grade:traits:", a3, *(_QWORD *)&a5, 0, a4);
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 traits:(unsigned int)a4
{
  return _objc_msgSend(a1, "_mapsCar_fontForTextStyle:weight:grade:traits:", a3, 0xFFFFFFFFLL, *(_QWORD *)&a4, UIFontWeightRegular);
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 traits:(unsigned int)a5
{
  return _objc_msgSend(a1, "_mapsCar_fontForTextStyle:weight:grade:traits:", a3, 0xFFFFFFFFLL, *(_QWORD *)&a5, a4);
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 grade:(int)a5 traits:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIFontDescriptorAttributeName v26;
  id v27;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_w%.2f_g%d_t%d"), v9, *(_QWORD *)&a4, v7, v6));
  v11 = (void *)qword_1014D2658;
  if (!qword_1014D2658)
  {
    v12 = objc_alloc_init((Class)NSCache);
    v13 = (void *)qword_1014D2658;
    qword_1014D2658 = (uint64_t)v12;

    v11 = (void *)qword_1014D2658;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "screenTraitCollection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v9, v16));

    v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
    v19 = UIFontWeightRegular;
    if (UIFontWeightRegular != a4)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, UIFontWeightTrait);

    }
    if ((_DWORD)v6)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6, v19));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, UIFontSymbolicTrait);

    }
    if ((_DWORD)v7 != -1)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7, v19));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, kCTFontGradeTrait);

    }
    if (objc_msgSend(v18, "count"))
    {
      v26 = UIFontDescriptorTraitsAttribute;
      v27 = v18;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fontDescriptorByAddingAttributes:", v23));

      v17 = (void *)v24;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v17, 0.0));
    if (v14)
      objc_msgSend((id)qword_1014D2658, "setObject:forKey:", v14, v10);

  }
  return v14;
}

@end
