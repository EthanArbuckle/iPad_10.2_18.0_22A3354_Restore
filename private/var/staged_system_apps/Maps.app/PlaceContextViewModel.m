@implementation PlaceContextViewModel

- (PlaceContextViewModel)initWithType:(unint64_t)a3 image:(id)a4 string:(id)a5 stringHighlightRanges:(id)a6
{
  id v11;
  id v12;
  id v13;
  PlaceContextViewModel *v14;
  PlaceContextViewModel *v15;
  uint64_t v16;
  NSAttributedString *attributedString;
  uint64_t v18;
  NSAttributedString *highlightedAttributedString;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PlaceContextViewModel;
  v14 = -[PlaceContextViewModel init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_image, a4);
    v16 = objc_claimAutoreleasedReturnValue(-[PlaceContextViewModel attributedStringWithString:stringHighlightRanges:](v15, "attributedStringWithString:stringHighlightRanges:", v12, v13));
    attributedString = v15->_attributedString;
    v15->_attributedString = (NSAttributedString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(-[PlaceContextViewModel attributedStringHighlightedWithString:stringHighlightRanges:](v15, "attributedStringHighlightedWithString:stringHighlightRanges:", v12, v13));
    highlightedAttributedString = v15->_highlightedAttributedString;
    v15->_highlightedAttributedString = (NSAttributedString *)v18;

  }
  return v15;
}

- (PlaceContextViewModel)initWithType:(unint64_t)a3 image:(id)a4 attributedString:(id)a5
{
  id v9;
  id v10;
  PlaceContextViewModel *v11;
  PlaceContextViewModel *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PlaceContextViewModel;
  v11 = -[PlaceContextViewModel init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_image, a4);
    objc_storeStrong((id *)&v12->_attributedString, a5);
  }

  return v12;
}

- (id)attributedStringHighlightedWithString:(id)a3 stringHighlightRanges:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v5);
  if (objc_msgSend(v6, "count"))
  {
    v19 = v5;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
          v15 = objc_msgSend(v13, "rangeValue");
          objc_msgSend(v7, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, v15, v16);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v5 = v19;
  }
  v17 = objc_msgSend(v7, "copy");

  return v17;
}

- (id)attributedStringWithString:(id)a3 stringHighlightRanges:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v5);
  if (objc_msgSend(v6, "count"))
  {
    v19 = v5;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
          v15 = objc_msgSend(v13, "rangeValue");
          objc_msgSend(v7, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, v15, v16);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v5 = v19;
  }
  v17 = objc_msgSend(v7, "copy");

  return v17;
}

- (PlaceContextViewModel)initWithLibraryContextForPlaceNote:(id)a3
{
  id v4;
  id v5;
  PlaceContextViewModel *v6;
  PlaceContextViewModel *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v4);
    v6 = -[PlaceContextViewModel initWithType:image:attributedString:](self, "initWithType:image:attributedString:", 9, 0, v5);

    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PlaceContextViewModel)initWithLibraryContextForUserCollectionName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  PlaceContextViewModel *v10;
  uint64_t v11;
  UIColor *imageTintColor;
  PlaceContextViewModel *v13;
  NSAttributedStringKey v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    v6 = objc_alloc((Class)NSAttributedString);
    v15 = NSForegroundColorAttributeName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v16 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v9 = objc_msgSend(v6, "initWithString:attributes:", v4, v8);

    v10 = -[PlaceContextViewModel initWithType:image:attributedString:](self, "initWithType:image:attributedString:", 10, v5, v9);
    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      imageTintColor = v10->_imageTintColor;
      v10->_imageTintColor = (UIColor *)v11;

    }
    self = v10;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PlaceContextViewModel)initWithLibraryContextForPinnedItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  PlaceContextViewModel *v10;
  uint64_t v11;
  UIColor *imageTintColor;
  NSAttributedStringKey v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Library] Pinned"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pin.fill")));
  v6 = objc_alloc((Class)NSAttributedString);
  v14 = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v15 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v9 = objc_msgSend(v6, "initWithString:attributes:", v4, v8);

  v10 = -[PlaceContextViewModel initWithType:image:attributedString:](self, "initWithType:image:attributedString:", 11, v5, v9);
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    imageTintColor = v10->_imageTintColor;
    v10->_imageTintColor = (UIColor *)v11;

    objc_storeStrong((id *)&v10->_highlightedAttributedString, v9);
  }

  return v10;
}

- (PlaceContextViewModel)initWithPlaceCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PlaceContextViewModel *v21;
  uint64_t v22;
  NSArray *placeCollections;
  id v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisherAttribution"));
  v6 = objc_msgSend(v5, "iconIdentifier");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", v6, 1, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisherAttribution"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v12, "addObject:", v10);
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v12, "addObject:", v11);
  if (-[PlaceContextViewModel isRTL](self, "isRTL"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reverseObjectEnumerator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    v15 = objc_msgSend(v14, "mutableCopy");

    v12 = v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(": ")));
  v17 = objc_msgSend(v16, "rangeOfString:", v11);
  if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v17, v18));
    v26 = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));

  }
  v21 = -[PlaceContextViewModel initWithType:image:string:stringHighlightRanges:](self, "initWithType:image:string:stringHighlightRanges:", 1, v8, v16, v19);
  if (v21)
  {
    v25 = v4;
    v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    placeCollections = v21->_placeCollections;
    v21->_placeCollections = (NSArray *)v22;

    v21->_imageContinuousCornerRadius = 3.0;
  }

  return v21;
}

- (PlaceContextViewModel)initWithPlaceCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  PlaceContextViewModel *v16;
  NSArray *v17;
  NSArray *placeCollections;
  uint64_t v19;
  UIColor *imageTintColor;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("star.fill")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Featured in %lu Guides"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, objc_msgSend(v4, "count")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%lu Guides"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, objc_msgSend(v4, "count")));

  v13 = objc_msgSend(v8, "rangeOfString:", v11);
  v14 = 0;
  if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v13, v12));
    v22 = v15;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));

  }
  v16 = -[PlaceContextViewModel initWithType:image:string:stringHighlightRanges:](self, "initWithType:image:string:stringHighlightRanges:", 2, v5, v8, v14);
  if (v16)
  {
    v17 = (NSArray *)objc_msgSend(v4, "copy");
    placeCollections = v16->_placeCollections;
    v16->_placeCollections = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    imageTintColor = v16->_imageTintColor;
    v16->_imageTintColor = (UIColor *)v19;

  }
  return v16;
}

- (PlaceContextViewModel)initWithCurrentLocation
{
  void *v3;
  unsigned __int8 v4;
  PlaceContextViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PlaceContextViewModel *v10;
  uint64_t v11;
  UIColor *imageTintColor;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("location.fill"), v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR(" Requires precise location"), CFSTR("localized string not found"), 0));

    v10 = -[PlaceContextViewModel initWithType:image:string:stringHighlightRanges:](self, "initWithType:image:string:stringHighlightRanges:", 4, v7, v9, 0);
    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      imageTintColor = v10->_imageTintColor;
      v10->_imageTintColor = (UIColor *)v11;

    }
    self = v10;

    v5 = self;
  }

  return v5;
}

- (PlaceContextViewModel)initWithRatingsWithMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PlaceContextViewModel *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKRatingStringBuilder ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:](MKRatingStringBuilder, "ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:", v4, v5, v6, v7));

  v9 = -[PlaceContextViewModel initWithType:image:attributedString:](self, "initWithType:image:attributedString:", 5, 0, v8);
  return v9;
}

- (PlaceContextViewModel)initWithUserGeneratedCollection:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PlaceContextViewModel *v19;
  PlaceContextViewModel *v20;
  uint64_t v21;
  UIColor *imageTintColor;
  PlaceContextViewModel *v23;
  void *v25;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("In your Guide %@"), CFSTR("localized string not found"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v14 = objc_msgSend(v12, "rangeOfString:", v13);
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v14, v16));
    v25 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));

    v19 = -[PlaceContextViewModel initWithType:image:string:stringHighlightRanges:](self, "initWithType:image:string:stringHighlightRanges:", 3, v8, v12, v18);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_userGeneratedCollection, a3);
      v21 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      imageTintColor = v20->_imageTintColor;
      v20->_imageTintColor = (UIColor *)v21;

    }
    self = v20;

    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (PlaceContextViewModel)initWithChargerNumberString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  PlaceContextViewModel *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = a3;
  v5 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v13[0] = v6;
  v12[1] = NSFontAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v13[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v9 = objc_msgSend(v5, "initWithString:attributes:", v4, v8);

  v10 = -[PlaceContextViewModel initWithType:image:attributedString:](self, "initWithType:image:attributedString:", 6, 0, v9);
  return v10;
}

- (PlaceContextViewModel)initWithUGCUserSubmittedRecommendationWithReviewedPlace:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PlaceContextViewModel *v8;

  v4 = objc_msgSend(a3, "recommendState");
  if (v4 == (id)1)
    v5 = 1;
  else
    v5 = 2 * (v4 == (id)2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKFirstPartyRatingStringBuilder userRecommendationStringWithFont:ratingState:numberOfPhotosAdded:](MKFirstPartyRatingStringBuilder, "userRecommendationStringWithFont:ratingState:numberOfPhotosAdded:", v6, v5, 0));

  v8 = -[PlaceContextViewModel initWithType:image:attributedString:](self, "initWithType:image:attributedString:", 7, 0, v7);
  return v8;
}

- (PlaceContextViewModel)initWithUGCRatingsWithMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PlaceContextViewModel *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKFirstPartyRatingStringBuilder userRecommendedRatingSummaryAttributedStringForMapItem:textColor:font:theme:](MKFirstPartyRatingStringBuilder, "userRecommendedRatingSummaryAttributedStringForMapItem:textColor:font:theme:", v4, v5, v6, v7));

  v9 = -[PlaceContextViewModel initWithType:image:attributedString:](self, "initWithType:image:attributedString:", 8, 0, v8);
  return v9;
}

- (PlaceContextViewModel)initWithMapItem:(id)a3 context:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  PlaceContextViewModel *v10;
  void *v11;
  PlaceContextViewModel *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PlaceContextViewModel *v18;
  PlaceContextViewModel *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v6 = a3;
  if (a4 == 2)
  {
    if (+[MKPOIEnrichmentAvailibility shouldShowAppleRatingsForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowAppleRatingsForMapItem:", v6))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UGCReviewedPlaceManager locallyCachedReviewedPlaceForMUID:](UGCReviewedPlaceManager, "locallyCachedReviewedPlaceForMUID:", objc_msgSend(v6, "_muid")));
      v9 = v11;
      if (v11 && objc_msgSend(v11, "recommendState"))
        goto LABEL_7;

      if ((objc_msgSend(v6, "_hasChargerNumberString") & 1) != 0)
      {
LABEL_25:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_chargerNumberString"));
        v10 = -[PlaceContextViewModel initWithChargerNumberString:](self, "initWithChargerNumberString:", v9);
        goto LABEL_26;
      }
      v12 = -[PlaceContextViewModel initWithUGCRatingsWithMapItem:](self, "initWithUGCRatingsWithMapItem:", v6);
    }
    else
    {
      if (objc_msgSend(v6, "_hasChargerNumberString"))
        goto LABEL_25;
      if (!objc_msgSend(v6, "_hasMUID")
        || (objc_msgSend(v6, "_isMapItemTypeAddress") & 1) != 0
        || (objc_msgSend(v6, "_isMapItemTypeSettlement") & 1) != 0)
      {
        goto LABEL_45;
      }
      v12 = -[PlaceContextViewModel initWithRatingsWithMapItem:](self, "initWithRatingsWithMapItem:", v6);
    }
    self = v12;
    v18 = self;
    goto LABEL_46;
  }
  if (a4 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceContextViewModel userGeneratedCollectionContainingMapItem:](self, "userGeneratedCollectionContainingMapItem:", v6));
    if (v9)
    {
LABEL_13:
      v10 = -[PlaceContextViewModel initWithUserGeneratedCollection:](self, "initWithUserGeneratedCollection:", v9);
      goto LABEL_26;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_placeCollections"));
    v14 = objc_msgSend(v13, "count");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_placeCollections"));
    v16 = v15;
    if (v14 == (id)1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
      self = -[PlaceContextViewModel initWithPlaceCollection:](self, "initWithPlaceCollection:", v17);

LABEL_39:
      goto LABEL_27;
    }
    v20 = objc_msgSend(v15, "count");

    if ((unint64_t)v20 >= 2)
      goto LABEL_37;
    goto LABEL_45;
  }
  if (a4)
    goto LABEL_45;
  v7 = +[MKPOIEnrichmentAvailibility shouldShowAppleRatingsForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowAppleRatingsForMapItem:", v6);
  if (!v7)
  {
LABEL_22:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceContextViewModel userGeneratedCollectionContainingMapItem:](self, "userGeneratedCollectionContainingMapItem:", v6));
    if (v9)
      goto LABEL_13;
    if (objc_msgSend(v6, "_hasChargerNumberString"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_chargerNumberString"));
      v19 = -[PlaceContextViewModel initWithChargerNumberString:](self, "initWithChargerNumberString:", v16);
LABEL_38:
      self = v19;
      goto LABEL_39;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_placeCollections"));
    v22 = objc_msgSend(v21, "count");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_placeCollections"));
    v24 = v23;
    if (v22 == (id)1)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
      self = -[PlaceContextViewModel initWithPlaceCollection:](self, "initWithPlaceCollection:", v25);

      goto LABEL_27;
    }
    v26 = objc_msgSend(v23, "count");

    if ((unint64_t)v26 >= 2)
    {
LABEL_37:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_placeCollections"));
      v19 = -[PlaceContextViewModel initWithPlaceCollections:](self, "initWithPlaceCollections:", v16);
      goto LABEL_38;
    }
    if (v7)
    {
      v10 = -[PlaceContextViewModel initWithUGCRatingsWithMapItem:](self, "initWithUGCRatingsWithMapItem:", v6);
      goto LABEL_26;
    }
    if (objc_msgSend(v6, "_hasMUID")
      && (objc_msgSend(v6, "_isMapItemTypeAddress") & 1) == 0
      && (objc_msgSend(v6, "_isMapItemTypeSettlement") & 1) == 0)
    {
      v10 = -[PlaceContextViewModel initWithRatingsWithMapItem:](self, "initWithRatingsWithMapItem:", v6);
      goto LABEL_26;
    }
LABEL_45:
    v18 = 0;
    goto LABEL_46;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCReviewedPlaceManager locallyCachedReviewedPlaceForMUID:](UGCReviewedPlaceManager, "locallyCachedReviewedPlaceForMUID:", objc_msgSend(v6, "_muid")));
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "recommendState"))
  {

    goto LABEL_22;
  }
LABEL_7:
  v10 = -[PlaceContextViewModel initWithUGCUserSubmittedRecommendationWithReviewedPlace:](self, "initWithUGCUserSubmittedRecommendationWithReviewedPlace:", v9);
LABEL_26:
  self = v10;
LABEL_27:

  v18 = self;
LABEL_46:

  return v18;
}

- (BOOL)isTappable
{
  return self->_type - 1 < 3;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[UIImage hash](self->_image, "hash");
  return (unint64_t)-[NSAttributedString hash](self->_attributedString, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  PlaceContextViewModel *v4;
  uint64_t v5;
  PlaceContextViewModel *v6;
  UIImage *v7;
  UIImage *v8;
  NSAttributedString *v9;
  NSAttributedString *v10;
  unsigned __int8 v11;

  v4 = (PlaceContextViewModel *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      if (-[PlaceContextViewModel type](v6, "type") == self->_type)
      {
        v7 = (UIImage *)objc_claimAutoreleasedReturnValue(-[PlaceContextViewModel image](v6, "image"));
        v8 = v7;
        if (v7 == self->_image || -[UIImage isEqual:](v7, "isEqual:"))
        {
          v9 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[PlaceContextViewModel attributedString](v6, "attributedString"));
          v10 = v9;
          if (v9 == self->_attributedString)
            v11 = 1;
          else
            v11 = -[NSAttributedString isEqual:](v9, "isEqual:");

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isRTL
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == (id)1;

  return v3;
}

- (id)userGeneratedCollectionContainingMapItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1006A95D4;
  v13 = sub_1006A95E4;
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionsContainingMapItem:", v3));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006A95EC;
  v8[3] = &unk_1011BFFF8;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (double)imageContinuousCornerRadius
{
  return self->_imageContinuousCornerRadius;
}

- (void)setImageContinuousCornerRadius:(double)a3
{
  self->_imageContinuousCornerRadius = a3;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSAttributedString)highlightedAttributedString
{
  return self->_highlightedAttributedString;
}

- (void)setHighlightedAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CollectionHandler)userGeneratedCollection
{
  return self->_userGeneratedCollection;
}

- (void)setUserGeneratedCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)stringHighlightRanges
{
  return self->_stringHighlightRanges;
}

- (void)setStringHighlightRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringHighlightRanges, 0);
  objc_storeStrong((id *)&self->_userGeneratedCollection, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_highlightedAttributedString, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
