@implementation FTPersonalizationWidgetEventTracker

- (FTPersonalizationWidgetEventTracker)init
{
  FTPersonalizationWidgetEventTracker *v2;
  NSMutableArray *v3;
  NSMutableArray *events;
  id v5;
  uint64_t updated;
  void *v7;
  FCFileCoordinatedTodayPersonalizationUpdate *v8;
  FCFileCoordinatedTodayPersonalizationUpdate *fileCoordinatedStore;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FTPersonalizationWidgetEventTracker;
  v2 = -[FTPersonalizationWidgetEventTracker init](&v11, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    events = v2->_events;
    v2->_events = v3;

    v5 = objc_alloc((Class)FCFileCoordinatedTodayPersonalizationUpdate);
    updated = FCURLForTodayPersonalizationUpdateStore();
    v7 = (void *)objc_claimAutoreleasedReturnValue(updated);
    v8 = (FCFileCoordinatedTodayPersonalizationUpdate *)objc_msgSend(v5, "initWithFileURL:", v7);
    fileCoordinatedStore = v2->_fileCoordinatedStore;
    v2->_fileCoordinatedStore = v8;

  }
  return v2;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "todayResults"));
  v9 = v8;
  if (v8)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sections"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100018860;
    v11[3] = &unk_1000AAD98;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    v14 = v15;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

    _Block_object_dispose(v15, 8);
  }

}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersonalizationWidgetEventTracker events](self, "events"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_opt_new(NTPBTodayPersonalizationUpdate);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addEvents:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11));
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersonalizationWidgetEventTracker fileCoordinatedStore](self, "fileCoordinatedStore"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100018BD4;
    v14[3] = &unk_1000AADC0;
    v15 = v4;
    objc_msgSend(v12, "submitUpdate:withCompletion:", v6, v14);

    v13 = objc_opt_new(NSMutableArray);
    -[FTPersonalizationWidgetEventTracker setEvents:](self, "setEvents:", v13);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, uint64_t);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fc_NewsArticleID"));
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_100018DA8;
    v31 = sub_100018DB8;
    v32 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "todayResults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sections"));
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100018DC0;
    v24 = &unk_1000AAE10;
    v16 = v13;
    v25 = v16;
    v26 = &v27;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v21);

    v17 = v28[5];
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionForItem:", v28[5], v21, v22, v23, v24));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersonalizationWidgetEventTracker personalizationEventAtDate:withAction:headline:section:trackableWidgetState:](self, "personalizationEventAtDate:withAction:headline:section:trackableWidgetState:", v8, 2, v17, v18, v10));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersonalizationWidgetEventTracker events](self, "events"));
        objc_msgSend(v20, "addObject:", v19);

      }
    }

    _Block_object_dispose(&v27, 8);
  }

}

- (id)personalizationEventAtDate:(id)a3 withAction:(int)a4 headline:(id)a5 section:(id)a6 trackableWidgetState:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100082BE8();
    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082B30();
LABEL_6:
  if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100082A78();
    if (v14)
      goto LABEL_11;
  }
  else if (v14)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000829C0();
LABEL_11:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personalizationMetadata"));

  if (v15)
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NTPBTodayPersonalizationEvent ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:](NTPBTodayPersonalizationEvent, "ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:", v11, v10, v12, v13, objc_msgSend(v14, "absoluteOrderOfItemInSection:", v12), objc_msgSend(v14, "absoluteOrderOfItem:", v12), objc_msgSend(v14, "absoluteOrderOfSection:", v13)));
  else
    v16 = 0;

  return v16;
}

- (FCFileCoordinatedTodayPersonalizationUpdate)fileCoordinatedStore
{
  return self->_fileCoordinatedStore;
}

- (void)setFileCoordinatedStore:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedStore, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedStore, 0);
}

@end
