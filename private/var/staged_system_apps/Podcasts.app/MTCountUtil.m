@implementation MTCountUtil

+ (id)stringForEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a4;
  if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("1 Episode");
    else
      v7 = CFSTR("1 episode");
    goto LABEL_13;
  }
  if (!a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("0 Episodes");
    else
      v7 = CFSTR("0 episodes");
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1004C6D40, 0));
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v4)
    v10 = CFSTR("%@ Episodes");
  else
    v10 = CFSTR("%@ episodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1004C6D40, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v12 = IMAccessibilityLocalizedNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v13));

LABEL_14:
  return v14;
}

+ (id)stringForNewEpisodeCount:(int64_t)a3
{
  return objc_msgSend(a1, "stringForNewEpisodeCount:titleCase:", a3, 0);
}

+ (id)stringForNewEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a4;
  if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("1 New Episode");
    else
      v7 = CFSTR("1 new episode");
    goto LABEL_13;
  }
  if (!a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("0 New Episodes");
    else
      v7 = CFSTR("0 new episodes");
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1004C6D40, 0));
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v4)
    v10 = CFSTR("%@ New Episodes");
  else
    v10 = CFSTR("%@ new episodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1004C6D40, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v12 = IMAccessibilityLocalizedNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v13));

LABEL_14:
  return v14;
}

+ (id)stringForUnplayedEpisodeCount:(int64_t)a3
{
  return _objc_msgSend(a1, "stringForUnplayedEpisodeCount:titleCase:", a3, 0);
}

+ (id)stringForUnplayedEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a4;
  if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("1 Unplayed Episode");
    else
      v7 = CFSTR("1 unplayed episode");
    goto LABEL_13;
  }
  if (!a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("0 Unplayed Episodes");
    else
      v7 = CFSTR("0 unplayed episodes");
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1004C6D40, 0));
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v4)
    v10 = CFSTR("%@ Unplayed Episodes");
  else
    v10 = CFSTR("%@ unplayed episodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1004C6D40, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v12 = IMAccessibilityLocalizedNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v13));

LABEL_14:
  return v14;
}

+ (id)stringForPodcastCount:(int64_t)a3
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
    v6 = CFSTR("1 podcast");
  }
  else
  {
    if (a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ podcasts"), &stru_1004C6D40, 0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v10 = IMAccessibilityLocalizedNumber();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v11));

      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("0 podcasts");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1004C6D40, 0));
LABEL_7:

  return v7;
}

+ (id)stringForStationCount:(int64_t)a3
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
    v6 = CFSTR("1 station");
  }
  else
  {
    if (a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ stations"), &stru_1004C6D40, 0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v10 = IMAccessibilityLocalizedNumber();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v11));

      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("0 stations");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1004C6D40, 0));
LABEL_7:

  return v7;
}

@end
