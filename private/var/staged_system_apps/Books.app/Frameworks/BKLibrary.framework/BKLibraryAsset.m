@implementation BKLibraryAsset

- (BOOL)hasSpecifiedFinishedDate
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  if (_os_feature_enabled_impl("Books", "iveReadThisFullFlow"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
      v6 = objc_msgSend(v4, "isEqualToDate:", v5) ^ 1;

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (int64_t)finishedCollectionSectionID
{
  return -[BKLibraryAsset hasSpecifiedFinishedDate](self, "hasSpecifiedFinishedDate") ^ 1;
}

- (NSString)finishedCollectionSectionName
{
  void *v2;
  id v3;
  void *v4;

  if (-[BKLibraryAsset hasSpecifiedFinishedDate](self, "hasSpecifiedFinishedDate"))
  {
    v2 = 0;
  }
  else
  {
    v3 = BKLibraryFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Date Not Set"), &stru_C40E8, &stru_C40E8));

  }
  return (NSString *)v2;
}

- (BOOL)_validateIsState1
{
  if ((-[BKLibraryAsset isFinished](self, "isFinished") & 1) != 0)
    return 0;
  else
    return -[BKLibraryAsset notFinished](self, "notFinished") ^ 1;
}

- (BOOL)_validateIsState2
{
  if ((-[BKLibraryAsset isFinished](self, "isFinished") & 1) != 0)
    return 0;
  else
    return -[BKLibraryAsset notFinished](self, "notFinished");
}

- (BOOL)_validateIsState3
{
  unsigned int v3;

  v3 = -[BKLibraryAsset isFinished](self, "isFinished");
  if (v3)
    LOBYTE(v3) = -[BKLibraryAsset notFinished](self, "notFinished") ^ 1;
  return v3;
}

- (void)_setFinishedStates:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[BKLibraryAsset setIsFinished:](self, "setIsFinished:");
  -[BKLibraryAsset setNotFinished:](self, "setNotFinished:", !v3);
}

- (id)_dateFinishedForYearOnly:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v5, "setCalendar:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "setEra:", objc_msgSend(v4, "component:fromDate:", 2, v3));
  objc_msgSend(v5, "setYear:", objc_msgSend(v4, "component:fromDate:", 4, v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v5));
  v8 = v7;
  if (!v7)
    v7 = v3;
  v9 = v7;

  return v9;
}

- (void)userUpdateDateFinished:(id)a3 ofKind:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v10 = v6;
  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = v7;
  if ((_DWORD)v4 == 2)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset _dateFinishedForYearOnly:](self, "_dateFinishedForYearOnly:", v7));

    v8 = (void *)v9;
  }
  -[BKLibraryAsset setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v8, CFSTR("dateFinished"));
  if (-[BKLibraryAsset finishedDateKind](self, "finishedDateKind") != (_DWORD)v4)
    -[BKLibraryAsset setFinishedDateKind:](self, "setFinishedDateKind:", v4);

}

- (void)cleanupDateFinished
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = -[BKLibraryAsset finishedDateKind](self, "finishedDateKind"),
        v4,
        v5 != 2))
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastEngagedDate](self, "lastEngagedDate"));
    if (v6
      && (v7 = (void *)v6,
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastEngagedDate](self, "lastEngagedDate")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast")),
          v10 = objc_msgSend(v8, "isEqual:", v9),
          v9,
          v8,
          v7,
          (v10 & 1) == 0))
    {
      v21 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastEngagedDate](self, "lastEngagedDate"));
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
      if (v11
        && (v12 = (void *)v11,
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast")),
            v15 = objc_msgSend(v13, "isEqual:", v14),
            v14,
            v13,
            v12,
            (v15 & 1) == 0))
      {
        v21 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
      }
      else
      {
        v16 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset purchaseDate](self, "purchaseDate"));
        if (!v16)
          goto LABEL_13;
        v17 = (void *)v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset purchaseDate](self, "purchaseDate"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_13;
        v21 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset purchaseDate](self, "purchaseDate"));
      }
    }
    v22 = (void *)v21;

    v24 = v22;
LABEL_13:
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetDetailsModificationDate](self, "assetDetailsModificationDate"));
    -[BKLibraryAsset setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v24, CFSTR("dateFinished"));
    -[BKLibraryAsset setFinishedDateKind:](self, "setFinishedDateKind:", 1);
    -[BKLibraryAsset setAssetDetailsModificationDate:](self, "setAssetDetailsModificationDate:", v23);

  }
}

- (void)unsetFinishedDate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  -[BKLibraryAsset userUpdateDateFinished:ofKind:](self, "userUpdateDateFinished:ofKind:", v3, 0);

}

- (void)setFinishedStateUserSetsFinished:(BOOL)a3 userInfo:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BKLibraryAsset *v32;
  __int16 v33;
  void *v34;

  v6 = a4;
  v7 = -[BKLibraryAsset isContainer](self, "isContainer");
  if (v7)
  {
    v8 = BKLibraryUILog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_8017C((uint64_t)self, v9, v10);
LABEL_7:

    goto LABEL_8;
  }
  v11 = -[BKLibraryAsset _validateIsState3](self, "_validateIsState3");
  if (v11)
  {
    v12 = BKLibraryUILog(v11);
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_801E8(v9, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_7;
  }
  -[BKLibraryAsset _setFinishedStates:](self, "_setFinishedStates:", 1);
  if (a3
    || (v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished")),
        v23,
        !v23))
  {
    v24 = -[BKLibraryAsset userUpdateDateFinished:ofKind:](self, "userUpdateDateFinished:ofKind:", 0, 1);
  }
  v25 = BKLibraryUILog(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
    v31 = 138412546;
    v32 = self;
    v33 = 2112;
    v34 = v27;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "setFinishedStateUserSetsFinished: for asset %@ with date %@", (uint8_t *)&v31, 0x16u);

  }
  if (-[BKLibraryAsset isTrackedAsRecent](self, "isTrackedAsRecent")
    && -[BKLibraryAsset hasSpecifiedFinishedDate](self, "hasSpecifiedFinishedDate"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[BKLibraryAsset setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v28, CFSTR("lastEngagedDate"));

    v30 = BKLibraryUILog(v29);
    v9 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "userUpdateDateFinished: lastEngagedDate updated", (uint8_t *)&v31, 2u);
    }
    goto LABEL_7;
  }
LABEL_8:
  if (v6 && -[BKLibraryAsset isFinished](self, "isFinished"))
  {
    v20 = objc_msgSend(v6, "mutableCopy");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset permanentOrTemporaryAssetID](self, "permanentOrTemporaryAssetID"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("BKLibraryAssetIDKey"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("BKLibraryAssetMarkedAsFinishedNotification"), self, v20);

  }
}

- (void)setFinishedStateUserSetsUnfinished
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BKLibraryAsset *v15;

  v3 = -[BKLibraryAsset _validateIsState2](self, "_validateIsState2");
  if (v3)
  {
    v4 = BKLibraryUILog(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_80218(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    -[BKLibraryAsset _setFinishedStates:](self, "_setFinishedStates:", 0);
    -[BKLibraryAsset setDateFinished:](self, "setDateFinished:", 0);
    v13 = BKLibraryUILog(-[BKLibraryAsset setFinishedDateKind:](self, "setFinishedDateKind:", 0));
    v5 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "setFinishedStateUserSetsUnfinished for asset %@", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)setFinishedStateRemoveFromFinishedCollection
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BKLibraryAsset *v15;

  v3 = -[BKLibraryAsset _validateIsState2](self, "_validateIsState2");
  if (v3)
  {
    v4 = BKLibraryUILog(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_80248(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    -[BKLibraryAsset _setFinishedStates:](self, "_setFinishedStates:", 0);
    -[BKLibraryAsset setDateFinished:](self, "setDateFinished:", 0);
    v13 = BKLibraryUILog(-[BKLibraryAsset setFinishedDateKind:](self, "setFinishedDateKind:", 0));
    v5 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "setFinishedStateRemoveFromFinishedCollection for asset %@", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)setFinishedStateAssetRead
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  BKLibraryAsset *v6;

  if (-[BKLibraryAsset _validateIsState2](self, "_validateIsState2"))
  {
    -[BKLibraryAsset setIsFinished:](self, "setIsFinished:", 0);
    v3 = BKLibraryUILog(-[BKLibraryAsset setNotFinished:](self, "setNotFinished:", 0));
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "setFinishedStateAssetRead for asset %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)setFinishedStateAddToFinishedCollection
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  BKLibraryAsset *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v3 = -[BKLibraryAsset isContainer](self, "isContainer");
  if (v3)
  {
    v4 = BKLibraryUILog(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_80278(self, v5);
  }
  else
  {
    if ((-[BKLibraryAsset isFinished](self, "isFinished") & 1) != 0)
      return;
    -[BKLibraryAsset _setFinishedStates:](self, "_setFinishedStates:", 1);
    -[BKLibraryAsset userUpdateDateFinished:ofKind:](self, "userUpdateDateFinished:ofKind:", 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset permanentOrTemporaryAssetID](self, "permanentOrTemporaryAssetID"));
    if (v6)
    {
      v18 = CFSTR("BKLibraryAssetIDKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset permanentOrTemporaryAssetID](self, "permanentOrTemporaryAssetID"));
      v19 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v5 = objc_msgSend(v8, "mutableCopy");

    }
    else
    {
      v5 = objc_msgSend(&__NSDictionary0__struct, "mutableCopy");
    }

    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", BALocationTypeFromAddToFinishCollection, CFSTR("BKLibraryAssetMarkedLocation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("BKLibraryAssetMarkedAsFinishedNotification"), self, v5);

    v11 = BKLibraryUILog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "setFinishedStateAddToFinishedCollection for asset %@ with date %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

+ (BOOL)hasBookReachedReadThreshold:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  float v9;

  v3 = a3;
  v5 = objc_opt_class(NSNumber, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCAssetReadingProgressKey));

  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  objc_msgSend(v8, "floatValue");
  LOBYTE(v3) = v9 > kAEAnnotationReadingLocationSignificantHighwaterMark;

  return (char)v3;
}

+ (id)keyPathsForValuesAffectingIsDownloading
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("state"));
}

+ (id)keyPathsForValuesAffectingIsLocal
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("state"));
}

+ (id)keyPathsForValuesAffectingIsImporting
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("state"));
}

+ (id)unknownAuthor
{
  if (qword_DE488 != -1)
    dispatch_once(&qword_DE488, &stru_C2688);
  return (id)gUnknownAuthor;
}

+ (id)unknownTitle
{
  if (qword_DE490 != -1)
    dispatch_once(&qword_DE490, &stru_C26A8);
  return (id)gUnknownTitle;
}

+ (id)multipleAuthors
{
  if (qword_DE498 != -1)
    dispatch_once(&qword_DE498, &stru_C26C8);
  return (id)gMultipleAuthors;
}

- (void)willSave
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if ((-[BKLibraryAsset isFault](self, "isFault") & 1) != 0
    || (-[BKLibraryAsset isDeleted](self, "isDeleted") & 1) != 0)
  {
    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset sortAuthor](self, "sortAuthor"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
      -[BKLibraryAsset setSortAuthor:](self, "setSortAuthor:", v7);

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset sortAuthor](self, "sortAuthor"));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("UnknownAuthor")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("UnknownAuthor"));

    if ((v10 & 1) != 0)
      goto LABEL_11;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
    -[BKLibraryAsset setSortAuthor:](self, "setSortAuthor:", v8);
  }

LABEL_11:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset sortTitle](self, "sortTitle"));
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset title](self, "title"));
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset title](self, "title"));
      -[BKLibraryAsset setSortTitle:](self, "setSortTitle:", v15);

    }
  }
  v21 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "laterDate:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset purchaseDate](self, "purchaseDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "laterDate:", v19));

  if ((objc_msgSend(v21, "isEqualToDate:", v20) & 1) == 0)
    -[BKLibraryAsset nonUserUpdateLastOpenDateTo:](self, "nonUserUpdateLastOpenDateTo:", v20);

}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryAsset;
  -[BKLibraryAsset didChangeValueForKey:](&v6, "didChangeValueForKey:", v4);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("assetDetailsModificationDate")) & 1) == 0
    && ((objc_msgSend(v4, "isEqualToString:", CFSTR("isFinished")) & 1) != 0
     || (objc_msgSend(v4, "isEqualToString:", CFSTR("notFinished")) & 1) != 0
     || (objc_msgSend(v4, "isEqualToString:", CFSTR("lastOpenDate")) & 1) != 0
     || (objc_msgSend(v4, "isEqualToString:", CFSTR("dateFinished")) & 1) != 0
     || -[BKLibraryAsset isAudiobook](self, "isAudiobook")
     && ((objc_msgSend(v4, "isEqualToString:", CFSTR("readingProgress")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("bookHighWaterMarkProgress")))))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[BKLibraryAsset setAssetDetailsModificationDate:](self, "setAssetDetailsModificationDate:", v5);

  }
}

- (NSString)permanentOrTemporaryAssetID
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset temporaryAssetID](self, "temporaryAssetID"));
  return (NSString *)v3;
}

+ (id)actualAuthorFromMetedata:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownAuthor")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("MultipleAuthors")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (NSString)actualAuthor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAsset actualAuthorFromMetedata:](BKLibraryAsset, "actualAuthorFromMetedata:", v2));

  return (NSString *)v3;
}

- (NSString)displayAuthor
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  uint64_t v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset hasTooManyAuthors](self, "hasTooManyAuthors"));
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset authorNames](self, "authorNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset authorCount](self, "authorCount"));
  v7 = v6;
  if (v4)
  {
LABEL_2:
    v8 = objc_claimAutoreleasedReturnValue(+[BKLibraryAsset multipleAuthors](BKLibraryAsset, "multipleAuthors"));
LABEL_21:
    v18 = (void *)v8;
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "intValue") == 1 && objc_msgSend(v5, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "intValue") == 2 && (unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v9 = BKLibraryFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Library.Item.TwoArtists"), CFSTR("%@ & %@"), &stru_C40E8));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    v14 = (void *)v13;
LABEL_15:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, v13, v27));
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "intValue") != 3 || (unint64_t)objc_msgSend(v5, "count") < 3)
  {
    if ((int)objc_msgSend(v7, "intValue") < 4 || (unint64_t)objc_msgSend(v5, "count") < 2)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("UnknownAuthor"));

      if (v23)
      {
        v8 = objc_claimAutoreleasedReturnValue(+[BKLibraryAsset unknownAuthor](BKLibraryAsset, "unknownAuthor"));
        goto LABEL_21;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("MultipleAuthors"));

      if (!v25)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset author](self, "author"));
        goto LABEL_21;
      }
      goto LABEL_2;
    }
    v19 = objc_msgSend(v7, "intValue") - 2;
    v20 = BKLibraryFrameworkBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Library.Item.TwoAndOtherArtists"), CFSTR("%@, %@, & %d others"), &stru_C40E8));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    v14 = (void *)v13;
    v27 = v19;
    goto LABEL_15;
  }
  v15 = BKLibraryFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Library.Item.ThreeArtists"), CFSTR("%@, %@, & %@"), &stru_C40E8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, v14, v17));

LABEL_16:
LABEL_22:

  return (NSString *)v18;
}

- (BOOL)isValid
{
  return -[BKLibraryAsset isDeleted](self, "isDeleted") ^ 1;
}

- (BOOL)isStore
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset storeID](self, "storeID"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isDownloading
{
  return -[BKLibraryAsset state](self, "state") == 2;
}

- (BOOL)isLocal
{
  return -[BKLibraryAsset state](self, "state") == 1;
}

- (BOOL)isCloud
{
  return -[BKLibraryAsset state](self, "state") == 3;
}

- (BOOL)isNonLocalSample
{
  if ((-[BKLibraryAsset isSample](self, "isSample") & 1) != 0
    || -[BKLibraryAsset isLocal](self, "isLocal"))
  {
    return 0;
  }
  else
  {
    return -[BKLibraryAsset isInSamples](self, "isInSamples");
  }
}

- (BOOL)isAudiobookPreview
{
  unsigned int v3;
  void *v4;

  if ((-[BKLibraryAsset isSample](self, "isSample") & 1) != 0
    || -[BKLibraryAsset isLocal](self, "isLocal"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset isStoreAudiobook](self, "isStoreAudiobook"));
    if (objc_msgSend(v4, "BOOLValue"))
      v3 = !-[BKLibraryAsset isOwned](self, "isOwned");
    else
      LOBYTE(v3) = 0;

  }
  return v3;
}

- (BOOL)iTunesU
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset permlink](self, "permlink"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dataSourceIdentifier](self, "dataSourceIdentifier"));
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ibooks.datasource.itunesu")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dataSourceIdentifier](self, "dataSourceIdentifier"));
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ibooks.plugin.Bookshelf.platformDataSource.iTunesU"));

    }
  }

  return v4;
}

- (signed)seriesType
{
  signed __int16 v3;
  void *v4;
  void *v5;

  if (-[BKLibraryAsset contentType](self, "contentType") == 5)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesID](self, "seriesID"));

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset sequenceDisplayName](self, "sequenceDisplayName"));
  if (objc_msgSend(v5, "length"))
    v3 = 2;
  else
    v3 = 3;

  return v3;
}

- (BOOL)isSeriesItem
{
  return -[BKLibraryAsset state](self, "state") == 5
      && -[BKLibraryAsset contentType](self, "contentType") != 5;
}

- (BOOL)needsGlobalAnnotation
{
  if (-[BKLibraryAsset state](self, "state") == 5)
    return 0;
  else
    return !-[BKLibraryAsset isStoreItem](self, "isStoreItem");
}

- (BOOL)isStoreItem
{
  return -[BKLibraryAsset state](self, "state") == 6;
}

- (BOOL)isStoreOrSeriesItem
{
  if (-[BKLibraryAsset isStoreItem](self, "isStoreItem"))
    return 1;
  else
    return -[BKLibraryAsset isSeriesItem](self, "isSeriesItem");
}

- (BOOL)isOwned
{
  if ((-[BKLibraryAsset isSample](self, "isSample") & 1) != 0
    || -[BKLibraryAsset isStoreItem](self, "isStoreItem")
    || -[BKLibraryAsset isSeriesItem](self, "isSeriesItem")
    || -[BKLibraryAsset isContainer](self, "isContainer"))
  {
    return 0;
  }
  else
  {
    return !-[BKLibraryAsset isPreorderBook](self, "isPreorderBook");
  }
}

- (BOOL)isContainer
{
  return -[BKLibraryAsset contentType](self, "contentType") == 5;
}

- (BOOL)isImporting
{
  return -[BKLibraryAsset state](self, "state") == 4;
}

- (BOOL)isMemberOfCustomCollection
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset collectionMembers](self, "collectionMembers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "collection"));
        v7 = v6;
        if (v6 && (objc_msgSend(v6, "isDefaultCollection") & 1) == 0)
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)isInSamples
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset collectionMembers](self, "collectionMembers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("collectionID")));
  v4 = objc_msgSend(v3, "containsObject:", kBKCollectionDefaultIDSamples);

  return v4;
}

- (BOOL)canEditMetadata
{
  unsigned int v3;

  v3 = -[BKLibraryAsset isLocal](self, "isLocal");
  if (v3)
  {
    if (-[BKLibraryAsset isAudiobook](self, "isAudiobook")
      || (-[BKLibraryAsset isProof](self, "isProof") & 1) != 0
      || (-[BKLibraryAsset isSample](self, "isSample") & 1) != 0
      || (-[BKLibraryAsset isHidden](self, "isHidden") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = -[BKLibraryAsset isLocked](self, "isLocked") ^ 1;
    }
  }
  return v3;
}

- (BOOL)titleEditsSavedInLibraryOnly
{
  return -[BKLibraryAsset contentType](self, "contentType") == 3;
}

- (void)setCreationDateToNow
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BKLibraryAsset setCreationDate:](self, "setCreationDate:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset purchasedAndLocalParent](self, "purchasedAndLocalParent"));
  objc_msgSend(v3, "setCreationDate:", v5);

  -[BKLibraryAsset setModificationDate:](self, "setModificationDate:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset purchasedAndLocalParent](self, "purchasedAndLocalParent"));
  objc_msgSend(v4, "setModificationDate:", v5);

}

- (void)nonUserUpdateLastOpenDateTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetDetailsModificationDate](self, "assetDetailsModificationDate"));
  -[BKLibraryAsset setLastOpenDate:](self, "setLastOpenDate:", v4);

  -[BKLibraryAsset setAssetDetailsModificationDate:](self, "setAssetDetailsModificationDate:", v5);
}

- (id)seriesStackAssetIDs
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesStackIDs](self, "seriesStackIDs"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesStackIDs](self, "seriesStackIDs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(",")));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)assetLogID
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetGUID](self, "assetGUID"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    -[BKLibraryAsset willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assetGUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](NSString, "UUID"));
    -[BKLibraryAsset setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("assetGUID"));

    -[BKLibraryAsset didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assetGUID"));
  }
  return (NSString *)-[BKLibraryAsset assetGUID](self, "assetGUID");
}

- (id)managedObjectContext
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAsset;
  v2 = -[BKLibraryAsset managedObjectContext](&v4, "managedObjectContext");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isRightToLeft
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset pageProgressionDirection](self, "pageProgressionDirection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("rtl")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("default")) & 1) != 0
         || !v4
         || objc_msgSend(v4, "isEqualToString:", &stru_C40E8))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset language](self, "language"));
    if ((+[IMLanguageUtilities languageIsHebrew:](IMLanguageUtilities, "languageIsHebrew:", v6) & 1) != 0)v5 = 1;
    else
      v5 = +[IMLanguageUtilities languageIsArabic:](IMLanguageUtilities, "languageIsArabic:", v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)streamable
{
  unsigned int v3;

  v3 = BLAudiobookStreamingEnabled(self, a2);
  if (v3)
  {
    if (-[BKLibraryAsset isCloud](self, "isCloud")
      || (v3 = -[BKLibraryAsset isDownloading](self, "isDownloading")) != 0)
    {
      v3 = -[BKLibraryAsset isAudiobook](self, "isAudiobook");
      if (v3)
        LOBYTE(v3) = !-[BKLibraryAsset isPreorderBook](self, "isPreorderBook");
    }
  }
  return v3;
}

- (BOOL)canOpen
{
  if (-[BKLibraryAsset isLocal](self, "isLocal"))
    return 1;
  else
    return -[BKLibraryAsset streamable](self, "streamable");
}

- (BOOL)isUbiquitousBook
{
  void *v3;
  BOOL cachedUbiquitousState;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset path](self, "path"));
  if (v3)
  {
    if (!-[NSString isEqualToString:](self->_cachedAssetPath, "isEqualToString:", v3))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
      self->_cachedUbiquitousState = objc_msgSend(v5, "isUbiquitousItemAtURL:", v6);

      objc_storeStrong((id *)&self->_cachedAssetPath, v3);
    }
    cachedUbiquitousState = self->_cachedUbiquitousState;
  }
  else
  {
    cachedUbiquitousState = 0;
  }

  return cachedUbiquitousState;
}

- (id)assetDetailRepresentation
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc((Class)BCMutableAssetDetail);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
  v5 = objc_msgSend(v3, "initWithAssetID:", v4);

  objc_msgSend(v5, "setIsFinished:", -[BKLibraryAsset isFinished](self, "isFinished"));
  objc_msgSend(v5, "setNotFinished:", -[BKLibraryAsset notFinished](self, "notFinished"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
  objc_msgSend(v5, "setLastOpenDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
  objc_msgSend(v5, "setDateFinished:", v7);

  objc_msgSend(v5, "setFinishedDateKind:", -[BKLibraryAsset finishedDateKind](self, "finishedDateKind"));
  objc_msgSend(v5, "setTaste:", -[BKLibraryAsset taste](self, "taste"));
  objc_msgSend(v5, "setTasteSyncedToStore:", -[BKLibraryAsset tasteSyncedToStore](self, "tasteSyncedToStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetDetailsModificationDate](self, "assetDetailsModificationDate"));
  objc_msgSend(v5, "setModificationDate:", v8);

  if (-[BKLibraryAsset isAudiobook](self, "isAudiobook"))
  {
    objc_msgSend(v5, "setBookmarkTime:", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    objc_msgSend(v5, "setDatePlaybackTimeUpdated:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset readingProgress](self, "readingProgress"));
    objc_msgSend(v10, "floatValue");
    objc_msgSend(v5, "setReadingProgress:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset bookHighWaterMarkProgress](self, "bookHighWaterMarkProgress"));
    objc_msgSend(v11, "floatValue");
    objc_msgSend(v5, "setReadingProgressHighWaterMark:");

  }
  return v5;
}

- (BOOL)hasImportantAssetDetails
{
  void *v2;
  void *v3;
  unsigned int v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if ((-[BKLibraryAsset isFinished](self, "isFinished") & 1) == 0
    && (-[BKLibraryAsset notFinished](self, "notFinished") & 1) == 0
    && !-[BKLibraryAsset taste](self, "taste")
    && !-[BKLibraryAsset tasteSyncedToStore](self, "tasteSyncedToStore")
    && !-[BKLibraryAsset isAudiobook](self, "isAudiobook"))
  {
    if (-[BKLibraryAsset isDownloading](self, "isDownloading") || -[BKLibraryAsset isSeriesItem](self, "isSeriesItem"))
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
    if (!v7
      || (v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast")),
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate")),
          objc_msgSend(v2, "isEqualToDate:", v3)))
    {
      v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dateFinished](self, "dateFinished"));
        v5 = objc_msgSend(v10, "isEqualToDate:", v11) ^ 1;

        if (!v7)
        {
LABEL_17:

          return v5;
        }
      }
      else
      {
        LOBYTE(v5) = 0;
        if (!v7)
          goto LABEL_17;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }

    goto LABEL_17;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)configureFromAssetDetail:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  void *v35;
  unsigned int v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  float v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  float v48;
  double v49;
  void *v50;
  unsigned int v51;
  id v52;
  NSObject *v53;
  void *v54;
  const char *v55;
  void *v56;
  id v57;
  double v58;
  double v59;
  double v60;
  id v61;
  _BYTE v62[24];
  void *v63;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetDetailsModificationDate](self, "assetDetailsModificationDate"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modificationDate"));
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v14 = objc_msgSend(v13, "verboseLoggingEnabled");

    if (!v14)
      goto LABEL_40;
    v15 = BKLibraryAssetDetailsDevelopmentLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset title](self, "title"));
    *(_DWORD *)v62 = 138412290;
    *(_QWORD *)&v62[4] = v17;
    v18 = "\"\\\"configureFromAssetDetail No local modDate, No assetDetail modDate for assetDetail %@\\\"\";
LABEL_11:
    v19 = v16;
    v20 = 12;
LABEL_38:
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, v18, v62, v20);

    goto LABEL_39;
  }
  if (!v5 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v9 = objc_msgSend(v8, "verboseLoggingEnabled");

    if (v9)
    {
      v10 = BKLibraryAssetDetailsDevelopmentLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset title](self, "title"));
        *(_DWORD *)v62 = 138412546;
        *(_QWORD *)&v62[4] = v7;
        *(_WORD *)&v62[12] = 2112;
        *(_QWORD *)&v62[14] = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "\"\\\"No local modDate, assetDetail has modDate:%@  for assetDetail %@ \\\"\", v62, 0x16u);

      }
    }
    goto LABEL_21;
  }
  if (v5 && v6)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v22 = objc_msgSend(v21, "verboseLoggingEnabled");

    if (v22)
    {
      v23 = BKLibraryAssetDetailsDevelopmentLog();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset title](self, "title"));
        *(_DWORD *)v62 = 138412802;
        *(_QWORD *)&v62[4] = v5;
        *(_WORD *)&v62[12] = 2112;
        *(_QWORD *)&v62[14] = v7;
        *(_WORD *)&v62[22] = 2112;
        v63 = v25;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "\"\\\"local has modDate:%@, assetDetail has modDate:%@ for assetDetail %@\\\"\", v62, 0x20u);

      }
    }
  }
  else
  {
    if (!v6)
      goto LABEL_40;
    if (!v5)
      goto LABEL_21;
  }
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v27 = v26;
  objc_msgSend((id)v5, "timeIntervalSinceReferenceDate");
  if (v27 <= v28)
  {
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v59 = v58;
    objc_msgSend((id)v5, "timeIntervalSinceReferenceDate");
    if (v59 >= v60)
      goto LABEL_40;
    v61 = BKLibraryAssetDetailsLog();
    v16 = objc_claimAutoreleasedReturnValue(v61);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
    *(_DWORD *)v62 = 138412290;
    *(_QWORD *)&v62[4] = v17;
    v18 = "BKLibraryAsset Not Taking changes from asset detail as my mod date is > detail mod date for asset: %@";
    goto LABEL_11;
  }
LABEL_21:
  v29 = -[BKLibraryAsset isFinished](self, "isFinished");
  if (v29 != objc_msgSend(v4, "isFinished"))
    -[BKLibraryAsset setIsFinished:](self, "setIsFinished:", objc_msgSend(v4, "isFinished"));
  v30 = -[BKLibraryAsset notFinished](self, "notFinished");
  if (v30 != objc_msgSend(v4, "notFinished"))
    -[BKLibraryAsset setNotFinished:](self, "setNotFinished:", objc_msgSend(v4, "notFinished"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFinished"));
  -[BKLibraryAsset setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v31, CFSTR("dateFinished"));

  LODWORD(v31) = -[BKLibraryAsset finishedDateKind](self, "finishedDateKind");
  if ((_DWORD)v31 != objc_msgSend(v4, "finishedDateKind"))
    -[BKLibraryAsset setFinishedDateKind:](self, "setFinishedDateKind:", objc_msgSend(v4, "finishedDateKind"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastOpenDate"));
  -[BKLibraryAsset setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v32, CFSTR("lastOpenDate"));

  LODWORD(v32) = -[BKLibraryAsset taste](self, "taste");
  if ((_DWORD)v32 != objc_msgSend(v4, "taste"))
    -[BKLibraryAsset setTaste:](self, "setTaste:", objc_msgSend(v4, "taste"));
  v33 = -[BKLibraryAsset tasteSyncedToStore](self, "tasteSyncedToStore");
  if (v33 != objc_msgSend(v4, "tasteSyncedToStore"))
    -[BKLibraryAsset setTasteSyncedToStore:](self, "setTasteSyncedToStore:", objc_msgSend(v4, "tasteSyncedToStore"));
  if (-[BKLibraryAsset hasChanges](self, "hasChanges"))
  {
    -[BKLibraryAsset setAssetDetailsModificationDate:](self, "setAssetDetailsModificationDate:", v7);
    v34 = BKLibraryAssetDetailsLog();
    v16 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
      *(_DWORD *)v62 = 138412546;
      *(_QWORD *)&v62[4] = v17;
      *(_WORD *)&v62[12] = 2112;
      *(_QWORD *)&v62[14] = v4;
      v18 = "BKLibraryAsset %@ Configured with changes: %@";
LABEL_37:
      v19 = v16;
      v20 = 22;
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
  v36 = objc_msgSend(v35, "verboseLoggingEnabled");

  if (v36)
  {
    v37 = BKLibraryAssetDetailsDevelopmentLog();
    v16 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
      *(_DWORD *)v62 = 138412546;
      *(_QWORD *)&v62[4] = v17;
      *(_WORD *)&v62[12] = 2112;
      *(_QWORD *)&v62[14] = v4;
      v18 = "\"\\\"BKLibraryAsset %@ Configure - No changes for libraryAsset from assetDetail %@\\\"\";
      goto LABEL_37;
    }
LABEL_39:

  }
LABEL_40:
  if (!-[BKLibraryAsset isAudiobook](self, "isAudiobook", *(_OWORD *)v62, *(_QWORD *)&v62[16]))
    goto LABEL_54;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingPositionLocationUpdateDate"));

  if (!v38)
    goto LABEL_54;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset readingProgress](self, "readingProgress"));
  objc_msgSend(v39, "doubleValue");
  v41 = v40;
  objc_msgSend(v4, "readingProgress");
  v43 = vabdd_f64(v41, v42);

  if (v43 >= 0.00001)
  {
    objc_msgSend(v4, "readingProgress");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[BKLibraryAsset setReadingProgress:](self, "setReadingProgress:", v44);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset bookHighWaterMarkProgress](self, "bookHighWaterMarkProgress"));
  objc_msgSend(v45, "doubleValue");
  v47 = v46;
  objc_msgSend(v4, "readingProgressHighWaterMark");
  v49 = vabdd_f64(v47, v48);

  if (v49 >= 0.00001)
  {
    objc_msgSend(v4, "readingProgressHighWaterMark");
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[BKLibraryAsset setBookHighWaterMarkProgress:](self, "setBookHighWaterMarkProgress:", v56);

LABEL_50:
    v57 = BKLibraryAssetDetailsLog();
    v53 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
      *(_DWORD *)v62 = 138412546;
      *(_QWORD *)&v62[4] = v54;
      *(_WORD *)&v62[12] = 2112;
      *(_QWORD *)&v62[14] = v4;
      v55 = "BKLibraryAsset %@ Configured with reading progress changes: %@";
      goto LABEL_52;
    }
LABEL_53:

    goto LABEL_54;
  }
  if (v43 >= 0.00001)
    goto LABEL_50;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
  v51 = objc_msgSend(v50, "verboseLoggingEnabled");

  if (v51)
  {
    v52 = BKLibraryAssetDetailsDevelopmentLog();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
      *(_DWORD *)v62 = 138412546;
      *(_QWORD *)&v62[4] = v54;
      *(_WORD *)&v62[12] = 2112;
      *(_QWORD *)&v62[14] = v4;
      v55 = "\"\\\"BKLibraryAsset %@ Configure - No reading progress changes for libraryAsset from assetDetail %@\\\"\";
LABEL_52:
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, v55, v62, 0x16u);

      goto LABEL_53;
    }
    goto LABEL_53;
  }
LABEL_54:

}

- (id)readingNowDetailRepresentation
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  v3 = objc_alloc((Class)BCMutableReadingNowDetail);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
  v5 = objc_msgSend(v3, "initWithAssetID:", v4);

  objc_msgSend(v5, "setIsTrackedAsRecent:", -[BKLibraryAsset isTrackedAsRecent](self, "isTrackedAsRecent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastEngagedDate](self, "lastEngagedDate"));
  objc_msgSend(v5, "setLastEngagedDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset cloudAssetType](self, "cloudAssetType"));
  objc_msgSend(v5, "setCloudAssetType:", v7);

  v8 = BKLibraryAssetDetailsLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_82620(self, (uint64_t)v5, v9);

  return v5;
}

- (BOOL)hasImportantReadingNowDetails
{
  BOOL v3;
  void *v4;

  if ((-[BKLibraryAsset isTrackedAsRecent](self, "isTrackedAsRecent") & 1) != 0)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastEngagedDate](self, "lastEngagedDate"));
  v3 = v4 != 0;

  return v3;
}

- (void)configureFromReadingNowDetail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  unsigned int v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastEngagedDate](self, "lastEngagedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastEngagedDate"));
  v7 = (char *)objc_msgSend(v5, "compare:", v6);

  if (v7 == (_BYTE *)&dword_0 + 1)
  {
    v8 = BKLibraryAssetDetailsLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
      v22 = 138412546;
      v23 = v10;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BKLibraryAsset %@ received unexpected Reading Now changes: %@", (uint8_t *)&v22, 0x16u);

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isTrackedAsRecent")));
  -[BKLibraryAsset setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:", v11, CFSTR("isTrackedAsRecent"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastEngagedDate"));
  -[BKLibraryAsset setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v12, CFSTR("lastEngagedDate"));

  if (-[BKLibraryAsset hasChanges](self, "hasChanges"))
  {
    v13 = BKLibraryAssetDetailsLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
      v22 = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v4;
      v16 = "BKLibraryAsset %@ Configured with Reading Now changes: %@";
      v17 = v14;
      v18 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_0, v17, v18, v16, (uint8_t *)&v22, 0x16u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
  v20 = objc_msgSend(v19, "verboseLoggingEnabled");

  if (v20)
  {
    v21 = BKLibraryAssetDetailsDevelopmentLog();
    v14 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](self, "assetID"));
      v22 = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v4;
      v16 = "\"\\\"BKLibraryAsset %@ Configure - No changes for libraryAsset from Reading Now %@\\\"\";
      v17 = v14;
      v18 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }
LABEL_12:

  }
}

- (NSString)cloudAssetType
{
  unsigned int v3;
  id *v4;
  id *v5;

  if (-[BKLibraryAsset isStore](self, "isStore"))
  {
    v3 = -[BKLibraryAsset isAudiobook](self, "isAudiobook");
    v4 = (id *)&BDSCloudAssetTypeStoreEbook;
    v5 = (id *)&BDSCloudAssetTypeStoreAudiobook;
  }
  else
  {
    v3 = -[BKLibraryAsset _isUbiquityItem](self, "_isUbiquityItem");
    v4 = (id *)&BDSCloudAssetTypeSideloadedLocal;
    v5 = (id *)&BDSCloudAssetTypeSideloadedUbiquity;
  }
  if (v3)
    v4 = v5;
  return (NSString *)*v4;
}

- (BOOL)_isUbiquityItem
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dataSourceIdentifier](self, "dataSourceIdentifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ibooks.datasource.ubiquity"));

  return v3;
}

- (BOOL)isAudiobook
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dataSourceIdentifier](self, "dataSourceIdentifier"));
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ibooks.datasource.audiobooks")) & 1) != 0
    || -[BKLibraryAsset contentType](self, "contentType") == 6;

  return v4;
}

- (BOOL)isBook
{
  unsigned int v3;

  v3 = -[BKLibraryAsset contentType](self, "contentType");
  if (v3 != 1)
    LOBYTE(v3) = -[BKLibraryAsset contentType](self, "contentType") == 3
              || -[BKLibraryAsset contentType](self, "contentType") == 4;
  return v3;
}

- (BOOL)isPreorderBook
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset expectedDate](self, "expectedDate"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isManagedBook
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset dataSourceIdentifier](self, "dataSourceIdentifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ibooks.plist.managed"));

  return v3;
}

- (BOOL)isDeletable
{
  if (-[BKLibraryAsset currentlyDownloading](self, "currentlyDownloading")
    || -[BKLibraryAsset isSeriesItem](self, "isSeriesItem"))
  {
    return 0;
  }
  else
  {
    return !-[BKLibraryAsset isContainer](self, "isContainer");
  }
}

- (BOOL)isPartOfSeries
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[BKLibraryAsset isContainer](self, "isContainer"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesID](self, "seriesID"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesID](self, "seriesID"));
    v3 = objc_msgSend(v5, "unsignedLongLongValue") != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)shortBookTitle
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset title](self, "title"));
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(": "));
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL
    && (v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("; ")), v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    && (v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(" / ")), v3 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v4 = v2;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringToIndex:", v3));
  }
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)currentlyUploading
{
  return 0;
}

- (void)setLastOpenDate:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
  v5 = objc_msgSend(v4, "isEqual:", v18);

  if ((v5 & 1) == 0)
  {
    -[BKLibraryAsset willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lastOpenDate"));
    -[BKLibraryAsset setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v18, CFSTR("lastOpenDate"));
    -[BKLibraryAsset didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lastOpenDate"));
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesContainer](self, "seriesContainer"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[BKLibraryAsset isOwned](self, "isOwned");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesContainer](self, "seriesContainer"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastOpenDate"));
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        v15 = v14;

        if (v11 > v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset lastOpenDate](self, "lastOpenDate"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesContainer](self, "seriesContainer"));
          objc_msgSend(v17, "setLastOpenDate:", v16);

        }
      }
    }
  }

}

- (int64_t)isRightToLeftValue
{
  return self->isRightToLeftValue;
}

- (void)setIsRightToLeftValue:(int64_t)a3
{
  self->isRightToLeftValue = a3;
}

- (BOOL)isDecompressing
{
  return self->isDecompressing;
}

- (void)setIsDecompressing:(BOOL)a3
{
  self->isDecompressing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAssetPath, 0);
}

- (BOOL)shouldBeInDownloadedCollection
{
  _BOOL4 v3;

  v3 = -[BKLibraryAsset isLocal](self, "isLocal");
  if (v3)
  {
    if ((-[BKLibraryAsset isEphemeral](self, "isEphemeral") & 1) != 0)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[BKLibraryAsset isContainer](self, "isContainer");
  }
  return v3;
}

- (BOOL)shouldBeInMySamplesCollection
{
  unsigned int v3;

  v3 = -[BKLibraryAsset isSample](self, "isSample");
  if (v3)
  {
    v3 = -[BKLibraryAsset isLocal](self, "isLocal");
    if (v3)
    {
      if ((-[BKLibraryAsset isEphemeral](self, "isEphemeral") & 1) != 0)
        LOBYTE(v3) = 0;
      else
        LOBYTE(v3) = !-[BKLibraryAsset isContainer](self, "isContainer");
    }
  }
  return v3;
}

@end
