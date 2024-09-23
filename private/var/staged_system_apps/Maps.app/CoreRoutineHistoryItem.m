@implementation CoreRoutineHistoryItem

- (CoreRoutineHistoryItem)initWithSearchResult:(id)a3 andLocationOfInterestType:(int64_t)a4
{
  id v6;
  CoreRoutineHistoryItem *v7;
  id v8;
  CoreRoutineHistoryItem *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CoreRoutineHistoryItem;
  v7 = -[CoreRoutineHistoryItem init](&v11, "init");
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    -[CoreRoutineHistoryItem setSearchResult:](v7, "setSearchResult:", v8);
    -[CoreRoutineHistoryItem setLocationOfInterestType:](v7, "setLocationOfInterestType:", a4);
    v9 = v7;

  }
  return v7;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineHistoryItem searchResult](self, "searchResult"));
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (int64_t)locationOfInterestType
{
  return self->_locationOfInterestType;
}

- (void)setLocationOfInterestType:(int64_t)a3
{
  self->_locationOfInterestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
}

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineHistoryItem searchResult](self, "searchResult"));
  objc_msgSend(v5, "updateModel:", v4);

  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v9));
  objc_msgSend(v4, "setDebugSubtitle:", v8);

}

- (id)entryWithTicket:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSString *v28;
  uint64_t v30;
  id v31;

  v4 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreRoutineHistoryItem searchResult](self, "searchResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventName"));
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    if (objc_msgSend(v8, "isEventAllDay"))
    {
      v31 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Source of All Day CoreRoutine Event"), CFSTR("localized string not found"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "eventName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v15));
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventDate"));

      if (!v21)
      {
        v16 = 0;
LABEL_16:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventName"));
        if (!objc_msgSend(v18, "isEqualToString:", v6))
        {
LABEL_19:

          goto LABEL_20;
        }
        v19 = v6;
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "singleLineAddress"));
LABEL_18:

        goto LABEL_19;
      }
      if (qword_1014D3E90 != -1)
        dispatch_once(&qword_1014D3E90, &stru_1011E1998);
      v31 = v4;
      v22 = (void *)qword_1014D3E88;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventDate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringFromDate:", v23));

      v25 = objc_msgSend(v24, "length");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v25)
      {
        v12 = v26;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Source of CoreRoutine Item With Time"), CFSTR("localized string not found"), 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_geoMapItem"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventName"));
        v11 = v24;
        v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v27, v24);
      }
      else
      {
        v11 = v24;
        v12 = v26;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Source of CoreRoutine Item"), CFSTR("localized string not found"), 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_geoMapItem"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventName"));
        v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v27, v30);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(v28);

    }
    v4 = v31;
    goto LABEL_16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "singleLineAddress"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CoreRoutine Non Event PLOI"), CFSTR("localized string not found"), 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "singleLineAddress"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20));

    goto LABEL_18;
  }
  v16 = 0;
LABEL_20:
  objc_msgSend(v4, "safeAddDisplayLine:", v6);
  objc_msgSend(v4, "safeAddDisplayLine:", v16);

  return v4;
}

@end
