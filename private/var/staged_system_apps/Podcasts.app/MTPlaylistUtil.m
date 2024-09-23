@implementation MTPlaylistUtil

+ (id)stringForUnplayedCount:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("1 Unplayed");
  }
  else
  {
    if (a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ Unplayed"), &stru_1004C6D40, 0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v10 = IMAccessibilityLocalizedNumber(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v11));

      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("0 Unplayed");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1004C6D40, 0));
LABEL_7:

  return v7;
}

+ (id)stringForEmptyMessage:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EMPTY_STATION_IOS"), &stru_1004C6D40, 0));

  return v4;
}

+ (id)textForUnplayed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodes"));
  v6 = (uint64_t)objc_msgSend(v5, "count");

  if (v6 < 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("STATIONS_LABEL_EMPTY"), &stru_1004C6D40, 0));
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v4, "totalDuration");
  if (v7 != 0.0)
  {
    v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    if (v6 == 1)
      v13 = CFSTR("STATIONS_COUNT_EPISODES_SINGULAR_FORMAT");
    else
      v13 = CFSTR("STATIONS_COUNT_EPISODES_FORMAT");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1004C6D40, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString prettyStringWithDuration:](NSString, "prettyStringWithDuration:", v10));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
    v16 = IMAccessibilityLocalizedNumber(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@ %@"), 0, v17, v14));
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "textForUnplayedShort:", v4));
LABEL_10:

  return v8;
}

+ (id)textForUnplayedShort:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "episodes"));
  v4 = (uint64_t)objc_msgSend(v3, "count");

  if (v4 < 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("STATIONS_LABEL_EMPTY");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    if (v4 != 1)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ Episodes"), &stru_1004C6D40, 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
      v11 = IMAccessibilityLocalizedNumber(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v12));
      v6 = (void *)v9;
      goto LABEL_7;
    }
    v7 = CFSTR("1 Episode");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1004C6D40, 0));
LABEL_7:

  return v8;
}

@end
