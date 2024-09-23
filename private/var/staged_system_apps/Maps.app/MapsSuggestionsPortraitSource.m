@implementation MapsSuggestionsPortraitSource

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(GEOConfigMapsSuggestionsPortraitSourceEnabled[0], GEOConfigMapsSuggestionsPortraitSourceEnabled[1]);
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsPortraitSource)initWithPortrait:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9;
  MapsSuggestionsPortraitSource *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsPortraitSource;
  v10 = -[MapsSuggestionsPortraitSource initWithDelegate:name:](&v16, "initWithDelegate:name:", a4, a5);
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("MapsSuggestionsPortraitSourceQueue", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_portrait, a3);
  }

  return v10;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MapsSuggestionsPortraitSource *v12;
  uint64_t Log;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
    v14 = objc_claimAutoreleasedReturnValue(Log);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitSource.m";
    v21 = 1024;
    v22 = 66;
    v23 = 2082;
    v24 = "-[MapsSuggestionsPortraitSource initFromResourceDepot:name:]";
    v25 = 2082;
    v26 = "nil == (resourceDepot)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v19, 0x26u);
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oneSourceDelegate"));

  if (!v8)
  {
    v16 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitSource.m";
    v21 = 1024;
    v22 = 67;
    v23 = 2082;
    v24 = "-[MapsSuggestionsPortraitSource initFromResourceDepot:name:]";
    v25 = 2082;
    v26 = "nil == (resourceDepot.oneSourceDelegate)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "onePortrait"));

  if (!v9)
  {
    v17 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitSource.m";
      v21 = 1024;
      v22 = 68;
      v23 = 2082;
      v24 = "-[MapsSuggestionsPortraitSource initFromResourceDepot:name:]";
      v25 = 2082;
      v26 = "nil == (resourceDepot.onePortrait)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Portrait!";
      goto LABEL_11;
    }
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "onePortrait"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oneSourceDelegate"));
  self = -[MapsSuggestionsPortraitSource initWithPortrait:delegate:name:](self, "initWithPortrait:delegate:name:", v10, v11, v7);

  v12 = self;
LABEL_13:

  return v12;
}

- (void)start
{
  uint64_t Log;
  NSObject *v3;
  uint8_t v4[16];

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
  v3 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "start", v4, 2u);
  }

}

- (void)stop
{
  uint64_t Log;
  NSObject *v3;
  uint8_t v4[16];

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
  v3 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "stop", v4, 2u);
  }

}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t Log;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *queue;
  double Double;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  MapsSuggestionsPortraitSource *v23;
  void (**v24)(_QWORD);
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;

  v4 = (void (**)(_QWORD))a3;
  v5 = MapsSuggestionsLoggingSubsystem;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsPortraitSource uniqueName](self, "uniqueName"));
    *(_DWORD *)buf = 138412546;
    v27 = v8;
    v28 = 2080;
    v29 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  v9 = GEOFindOrCreateLog(v5, "PortraitSource");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", ", buf, 2u);
  }

  v11 = MapsSuggestionsCurrentBestLocation();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10069D98C;
    v21[3] = &unk_1011B3550;
    objc_copyWeak(&v25, (id *)buf);
    v22 = v12;
    v23 = self;
    v24 = v4;
    dispatch_async(queue, v21);
    Double = GEOConfigGetDouble(GEOConfigMapsSuggestionsPortraitUpdateLookIntervalInSeconds[0], GEOConfigMapsSuggestionsPortraitUpdateLookIntervalInSeconds[1]);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v4)
      v4[2](v4);
    v15 = GEOFindOrCreateLog(v5, "PortraitSource");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsPortraitSource uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v27 = v17;
      v28 = 2080;
      v29 = "updateSuggestionEntriesWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    v18 = GEOFindOrCreateLog(v5, "PortraitSource");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", ", buf, 2u);
    }

    Double = GEOConfigGetDouble(GEOConfigMapsSuggestionsPortraitRetryWithoutCurrentLocationInSeconds[0], GEOConfigMapsSuggestionsPortraitRetryWithoutCurrentLocationInSeconds[1]);
  }

  return Double;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 17;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  MapsSuggestionsPortrait *v10;
  id v11;
  void *v12;
  MapsSuggestionsPortrait *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t Log;
  MapsSuggestionsPortrait *portrait;
  void *v22;
  MapsSuggestionsPortrait *v23;
  uint8_t v24[16];
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    if (objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsPortraitClientIdentifier")))
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("MapsSuggestionsPortraitClientIdentifier")));
    else
      v7 = CFSTR("maps");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "undecoratedTitle"));
    if (objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")))
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")));

      v8 = (void *)v9;
    }
    if (v8)
    {
      switch(a4)
      {
        case 0:
          Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
          v18 = objc_claimAutoreleasedReturnValue(Log);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_WORD *)v24 = 0;
          v19 = "EntryEngagementNone not allowed";
          goto LABEL_12;
        case 1:
          portrait = self->_portrait;
          v25 = v8;
          v11 = v8;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
          v13 = portrait;
          v14 = v7;
          v15 = 0;
          v16 = 0;
          v22 = v12;
          goto LABEL_20;
        case 2:
        case 3:
        case 4:
          v10 = self->_portrait;
          v27 = v8;
          v11 = v8;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
          v13 = v10;
          v14 = v7;
          v15 = v12;
          v16 = 0;
          goto LABEL_19;
        case 5:
          v23 = self->_portrait;
          v26 = v8;
          v11 = v8;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
          v13 = v23;
          v14 = v7;
          v15 = 0;
          v16 = v12;
LABEL_19:
          v22 = 0;
LABEL_20:
          -[MapsSuggestionsPortrait sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:](v13, "sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:", v14, 1, v15, v16, v22, 0);

          break;
        case 6:
          break;
        default:
          -[MapsSuggestionsPortrait sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:](self->_portrait, "sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:", v7, 1, 0, 0, 0, 0);
          break;
      }
    }
    else
    {
      v17 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        v19 = "Cannot pass feedback to Portrait. Feedback string was nil";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, v24, 2u);
      }
LABEL_13:

    }
  }

}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t Log;
  NSObject *v14;
  uint8_t v15[16];

  v6 = a3;
  v7 = +[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled");
  if ((unint64_t)(a4 - 1) <= 3 && v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      objc_msgSend(v8, "addObject:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortAddress"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortAddress"));
      objc_msgSend(v8, "addObject:", v12);

    }
    if (objc_msgSend(v8, "count"))
    {
      -[MapsSuggestionsPortrait sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:](self->_portrait, "sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:", CFSTR("mapssearch"), 0, 0, 0, v8, 0);
    }
    else
    {
      Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "PortraitSource");
      v14 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "No feedback to send", v15, 2u);
      }

    }
  }

}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  id v6;
  unsigned int v7;
  MapsSuggestionsPortrait *portrait;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = +[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled");
  if ((unint64_t)(a4 - 1) <= 3 && v7)
  {
    portrait = self->_portrait;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v11 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    -[MapsSuggestionsPortrait sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:](portrait, "sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:", CFSTR("mapssearch"), 0, 0, 0, v10, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_portrait, 0);
}

@end
