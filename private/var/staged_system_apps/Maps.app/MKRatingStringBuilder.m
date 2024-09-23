@implementation MKRatingStringBuilder

+ (id)carPlayHeaderStringForMapItem:(id)a3 isHighlighted:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSAttributedStringKey v24;
  NSAttributedStringKey v25;
  void *v26;
  uint64_t v27;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  v7 = sub_100984FC0((uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:grade:](UIFont, "_mapsCar_fontForTextStyle:weight:grade:", UIFontTextStyleCaption2, 3, UIFontWeightRegular));
  v10 = (void *)v9;
  if (v4)
    v11 = v6;
  else
    v11 = v8;
  v24 = NSForegroundColorAttributeName;
  v25 = NSFontAttributeName;
  v26 = v11;
  v27 = v9;
  v12 = v8;
  v13 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v24, 2));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  if (v4)
    v17 = v15;
  else
    v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
  v24 = NSForegroundColorAttributeName;
  v25 = NSFontAttributeName;
  v26 = v17;
  v27 = (uint64_t)v18;
  v19 = v16;
  v20 = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v24, 2));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKRatingStringBuilder carPlayHeaderStringForMapItem:titleAttributes:providerAttributes:](MKRatingStringBuilder, "carPlayHeaderStringForMapItem:titleAttributes:providerAttributes:", v5, v14, v21));
  return v22;
}

@end
