@implementation RAPReportComposerPlaceSnippetTableViewCell

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPReportComposerPlaceSnippetTableViewCell;
  -[RAPReportComposerPlaceSnippetTableViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell imageView](self, "imageView"));
  objc_msgSend(v3, "setImage:", 0);

}

- (id)attributedStringFormat
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PLACE NAME\nADDRESS [Report a Problem place snippet]"), CFSTR("localized string not found"), 0));

  v5 = objc_alloc((Class)NSAttributedString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell defaultReplacementAttributes](self, "defaultReplacementAttributes"));
  v7 = objc_msgSend(v5, "initWithString:attributes:", v4, v6);

  return v7;
}

- (id)defaultReplacementAttributes
{
  void *v2;
  void *v3;
  NSAttributedStringKey v5;
  void *v6;

  v5 = NSFontAttributeName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (void)setContentsFromMapItem:(id)a3
{
  -[RAPReportComposerPlaceSnippetTableViewCell setContentsFromMapItem:isCurrentLocation:](self, "setContentsFromMapItem:isCurrentLocation:", a3, 0);
}

- (void)setContentsFromMapItem:(id)a3 isCurrentLocation:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_addressFormattedAsShortenedAddress"));
  -[RAPReportComposerPlaceSnippetTableViewCell _setPlaceName:singleLineAddress:](self, "_setPlaceName:singleLineAddress:", v6, v7);

  -[RAPReportComposerPlaceSnippetTableViewCell _setImageForMapItem:isCurrentLocation:](self, "_setImageForMapItem:isCurrentLocation:", v11, v4);
  if (objc_msgSend(v11, "_hasTransitLabels"))
  {
    v8 = objc_msgSend(objc_alloc((Class)MKTransitInfoLabelView), "initWithMapItem:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v8, "setTextColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    objc_msgSend(v8, "setFont:", v10);

    objc_msgSend(v8, "setShieldSize:", 6);
    -[RAPReportComposerTwoLineSnippetTableViewCell setThirdLineAccessoryView:](self, "setThirdLineAccessoryView:", v8);

  }
  else
  {
    -[RAPReportComposerTwoLineSnippetTableViewCell setThirdLineAccessoryView:](self, "setThirdLineAccessoryView:", 0);
  }

}

- (void)_setImageForMapItem:(id)a3 isCurrentLocation:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell imageView](self, "imageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "image"));

  if (!v7)
  {
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPCurrentLocation")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell imageView](self, "imageView"));
      objc_msgSend(v9, "setImage:", v8);

    }
    else
    {
      -[RAPReportComposerPlaceSnippetTableViewCell _setImageForMapItem:](self, "_setImageForMapItem:", v10);
    }
  }

}

- (void)_setImageForMapItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell imageView](self, "imageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

  if (!v5)
  {
    if (objc_msgSend(v10, "_hasTransit"))
    {
      -[RAPReportComposerPlaceSnippetTableViewCell _setTransitImageForMapItem:](self, "_setTransitImageForMapItem:", v10);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v6, "scale");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForMapItem:forScale:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:forScale:fallbackToBundleIcon:", v10, 0));

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageScaledToSize:", 40.0, 40.0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell imageView](self, "imageView"));
      objc_msgSend(v9, "setImage:", v8);

    }
  }

}

- (void)_setTransitImageForMapItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell imageView](self, "imageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

  v6 = v22;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_transitInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lines"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell window](self, "window"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "scale");
        v14 = v13;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v15, "scale");
        v14 = v16;

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modeArtwork"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v17, 6, v14));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0824000016, 0.493999988, 0.984000027, 1.0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "drawnInCircleWithDiameter:backgroundColor:", v19, 40.0));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceSnippetTableViewCell imageView](self, "imageView"));
      objc_msgSend(v21, "setImage:", v20);

    }
    v6 = v22;
  }

}

- (void)_setPlaceName:(id)a3 singleLineAddress:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v6 = (__CFString *)a4;
  v7 = (__CFString *)a3;
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = v8;
  if (v7)
    v10 = v7;
  else
    v10 = &stru_1011EB268;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("placeName"));

  v17[0] = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v18[0] = v11;
  v17[1] = NSForegroundColorAttributeName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v18[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

  v14 = objc_alloc((Class)NSAttributedString);
  if (v6)
    v15 = v6;
  else
    v15 = &stru_1011EB268;
  v16 = objc_msgSend(v14, "initWithString:attributes:", v15, v13);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("address"));
  -[RAPReportComposerTwoLineSnippetTableViewCell updateTextWithReplacements:](self, "updateTextWithReplacements:", v9);

}

@end
