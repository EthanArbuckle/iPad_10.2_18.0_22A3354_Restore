@implementation NSDictionary

- (BOOL)series_isContainer
{
  return 0;
}

- (NSString)series_genre
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary series_genres](self, "series_genres"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (NSString *)v3;
}

- (NSArray)series_genres
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v3 = objc_opt_class(NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("genres")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = sub_12338(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (NSArray *)v8;
}

- (NSString)series_adamId
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("id")));
  v3 = BUProtocolCast(&OBJC_PROTOCOL___IMAdamID, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamIDStringValue"));
  return (NSString *)v5;
}

- (NSString)series_sortTitle
{
  return 0;
}

- (NSString)series_sortAuthor
{
  return 0;
}

- (NSString)series_title
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("name")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)series_author
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("artistName")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSNumber)series_isExplicit
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[AEUserPublishingProductProfile _isContentRatingExplicitForInfo:](AEUserPublishingProductProfile, "_isContentRatingExplicitForInfo:", self));
}

- (NSNumber)series_isAudiobook
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  NSNumber *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary series_genres](self, "series_genres"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = (NSNumber *)&__kCFBooleanTrue;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "isEqualToString:", CFSTR("Audiobooks"), (_QWORD)v9) & 1) != 0)break;
      if (v4 == (id)++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        v6 = (NSNumber *)&__kCFBooleanFalse;
        break;
      }
    }
  }
  else
  {
    v6 = (NSNumber *)&__kCFBooleanFalse;
  }

  return v6;
}

- (NSNumber)series_isSG
{
  return 0;
}

- (NSString)series_formattedPrice
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  v3 = objc_opt_class(NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("offers")));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = objc_opt_class(NSDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v9 = BUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (!v10)
    {
      v18 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v11 = objc_opt_class(NSNumber);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("price")));
    v13 = BUDynamicCast(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14 && (objc_msgSend(v14, "isEqualToNumber:", &off_2A93C8) & 1) != 0)
    {
      v15 = IMCommonCoreBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("GET"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    }
    else
    {
      v19 = objc_opt_class(NSString);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("priceFormatted")));
      v21 = BUDynamicCast(v19, v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v21);

      if (!v16)
      {
        v18 = 0;
        goto LABEL_12;
      }
      v17 = v16;
      v16 = v17;
    }
    v18 = v17;
LABEL_12:

    goto LABEL_13;
  }
  v18 = 0;
LABEL_14:

  return (NSString *)v18;
}

- (NSString)series_displayLabel
{
  return 0;
}

- (NSNumber)series_position
{
  return 0;
}

- (NSString)series_seriesId
{
  return 0;
}

- (NSString)series_seriesTitle
{
  return 0;
}

- (BOOL)hasSeriesTypes
{
  void *v3;
  void *v4;
  char v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", BKSeriesManagerSeriesTypeBookSeries[0]));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", BKSeriesManagerSeriesTypeAudiobookSeries));
  if (objc_msgSend(v3, "count"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)hasAssetTypes
{
  void *v3;
  void *v4;
  char v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", BKSeriesManagerAssetTypeBooks[0]));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", BKSeriesManagerAssetTypeAudiobooks[0]));
  if (objc_msgSend(v3, "count"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

@end
