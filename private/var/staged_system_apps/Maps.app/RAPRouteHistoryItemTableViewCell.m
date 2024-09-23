@implementation RAPRouteHistoryItemTableViewCell

- (void)setHistoryItem:(id)a3
{
  id v4;
  __objc2_prot *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  RAPTwoLinesViewModelImpl *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v4 = a3;
  v5 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  v6 = objc_opt_class(HistoryEntryRecentsItem);
  v7 = v4;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "historyEntry")),
        v11 = objc_msgSend(v10, "conformsToProtocol:", v5),
        v10,
        v11))
  {
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

  if (v12)
  {
    v25 = 0;
    v26 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry"));
    +[SearchResult newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:](SearchResult, "newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:", &v26, &v25, v13);
    v14 = v26;
    v15 = v25;

    v16 = objc_alloc_init(RAPTwoLinesViewModelImpl);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteHistoryItemTableViewCell _destinationTextForEndSearchResult:](self, "_destinationTextForEndSearchResult:", v15));

    -[RAPTwoLinesViewModelImpl setTitle:](v16, "setTitle:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteHistoryItemTableViewCell _formattedTimeStringSinceDirectionsWereTaken:](self, "_formattedTimeStringSinceDirectionsWereTaken:", v7));
    -[RAPTwoLinesViewModelImpl setSubtitle:](v16, "setSubtitle:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry"));
    v20 = (char *)objc_msgSend(v19, "transportType");

    if ((unint64_t)(v20 - 2) > 3)
      v21 = CFSTR("rp_drive");
    else
      v21 = *(&off_1011BB520 + (_QWORD)(v20 - 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v21));
    -[RAPTwoLinesViewModelImpl setImage:](v16, "setImage:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesMenuTableViewCell leftImageView](self, "leftImageView"));
    objc_msgSend(v24, "setTintColor:", v23);

    -[RAPTwoLinesMenuTableViewCell setViewModel:](self, "setViewModel:", v16);
  }

}

- (id)_destinationTextForEndSearchResult:(id)a3
{
  return objc_msgSend(a3, "name");
}

- (id)_formattedTimeStringSinceDirectionsWereTaken:(id)a3
{
  id v3;
  double Current;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  double v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v3, "timestamp");
  v6 = v5;

  v7 = Current - v6;
  if (Current - v6 >= 60.0)
  {
    if (v7 >= 86400.0)
    {
      if (v7 >= 172800.0)
      {
        if (v7 < 604800.0)
        {
          v17 = -v7;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_weekdayForDate:](NSDateFormatter, "_maps_weekdayForDate:", v18));

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v17));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_timeForDate:](NSDateFormatter, "_maps_timeForDate:", v19));

          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v8, v20));
          goto LABEL_9;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v7));
        v9 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_dateStringWithoutYearForDate:](NSDateFormatter, "_maps_dateStringWithoutYearForDate:", v8));
        goto LABEL_3;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_timeForDate:](NSDateFormatter, "_maps_timeForDate:", v14));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("Yesterday %@ [DirectionsHistoryItemCell]");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter _maps_stringLongFromTimeInterval:](NSDateComponentsFormatter, "_maps_stringLongFromTimeInterval:"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("%@ ago [DirectionsHistoryItemCell]");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v8));

    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v7));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Just now [DirectionsHistoryItemCell]"), CFSTR("localized string not found"), 0));
LABEL_3:
  v10 = (void *)v9;
LABEL_9:

  return v10;
}

@end
