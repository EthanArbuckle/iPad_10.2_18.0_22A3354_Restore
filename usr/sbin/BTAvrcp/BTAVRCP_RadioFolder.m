@implementation BTAVRCP_RadioFolder

- (BTAVRCP_RadioFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  BTAVRCP_RadioFolder *v4;
  void *v5;
  BTAVRCP_Syncifier *v6;
  id v7;
  NSObject *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  BTAVRCP_RadioFolder *v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BTAVRCP_RadioFolder;
  v4 = -[BTAVRCP_VFSFolder initWithName:uid:](&v16, "initWithName:uid:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "refreshRecentStations", MPRadioLibraryStationsDidChangeNotification, 0);

    v6 = objc_alloc_init(BTAVRCP_Syncifier);
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_10000C354;
    v13 = &unk_100018B08;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v6, "createSwitcher"));
    v15 = v7;
    v14 = v4;
    -[BTAVRCP_RadioFolder fetchRecentStations:](v14, "fetchRecentStations:", &v10);
    if (!-[BTAVRCP_Syncifier wait:](v6, "wait:", 3.0, v10, v11, v12, v13))
    {
      v8 = qword_10001F1C0;
      if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR))
        sub_100010074(v8);
    }

  }
  return v4;
}

- (void)refreshRecentStations
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000C49C;
  v2[3] = &unk_100018B30;
  v2[4] = self;
  -[BTAVRCP_RadioFolder fetchRecentStations:](self, "fetchRecentStations:", v2);
}

- (void)fetchRecentStations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPRadioLibrary defaultRadioLibrary](MPRadioLibrary, "defaultRadioLibrary"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C5B4;
  v6[3] = &unk_100018B58;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getRecentStationGroupsWithCompletionHandler:", v6);

}

- (id)stationWithUid:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if (a3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        (unint64_t)v6 >= a3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3 - 1));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)childrenCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder stationWithUid:](self, "stationWithUid:", a3, a4));

  if (v4)
    return 8;
  else
    return 9;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 <= a3)
  {
    v13 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3));

    if (objc_msgSend(v6, "containsObject:", &off_100019B50))
    {
      v17 = CFSTR("kTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedName"));
      v18 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    }
    else
    {
      v12 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyItemWithUid:name:attributes:](self, "replyItemWithUid:name:attributes:", v14, v15, v12));

  }
  return v13;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder stationWithUid:](self, "stationWithUid:", a3));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (objc_msgSend(v6, "containsObject:", &off_100019B50))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
      objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("kTitle"));

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder stationWithUid:](self, "stationWithUid:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMusicPlayerController systemMusicPlayer](MPMusicPlayerController, "systemMusicPlayer"));
    objc_msgSend(v4, "setQueueWithRadioStation:", v3);
    objc_msgSend(v4, "play");

    v5 = 4;
  }
  else
  {
    v5 = 9;
  }

  return v5;
}

- (NSArray)recentStations
{
  return self->_recentStations;
}

- (void)setRecentStations:(id)a3
{
  objc_storeStrong((id *)&self->_recentStations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentStations, 0);
}

@end
