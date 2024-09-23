@implementation _SpotlightPunchInURLHandlingTask

- (_SpotlightPunchInURLHandlingTask)initWithURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7
{
  id v12;
  _SpotlightPunchInURLHandlingTask *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  NSObject *v24;
  GEOSpotlightSearchPunchIn *v25;
  GEOSpotlightSearchPunchIn *punchInDetails;
  id v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];

  v12 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SpotlightPunchInURLHandlingTask;
  v13 = -[URLHandlingTask initWithURL:referringURL:sourceApplication:sceneOptions:mkOptions:](&v34, "initWithURL:referringURL:sourceApplication:sceneOptions:mkOptions:", v12, a4, a5, a6, a7);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v14));

    v29 = v15;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "queryItems"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
LABEL_4:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("pm"));

        if ((v23 & 1) != 0)
          break;
        if (v18 == (id)++v20)
        {
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
          if (v18)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "value"));

      if (!v24)
        goto LABEL_13;
      v25 = (GEOSpotlightSearchPunchIn *)objc_msgSend(objc_alloc((Class)GEOSpotlightSearchPunchIn), "initWithEncodedString:", v24);
      punchInDetails = v13->_punchInDetails;
      v13->_punchInDetails = v25;

    }
    else
    {
LABEL_10:

LABEL_13:
      v27 = sub_100431A4C();
      v24 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_SpotlightPunchInURLHandlingTask open url: %@", buf, 0xCu);
      }
    }

  }
  return v13;
}

- (void)performTask
{
  id v3;
  NSObject *v4;
  SearchFieldItem *v5;
  GEOSpotlightSearchPunchIn *punchInDetails;
  void *v7;
  SearchAction *v8;
  MapsActivity *v9;
  id v10;
  void *v11;
  RichMapsActivity *v12;
  uint8_t v13[16];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_SpotlightPunchInURLHandlingTask has been started", v13, 2u);
  }

  v5 = objc_alloc_init(SearchFieldItem);
  punchInDetails = self->_punchInDetails;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSpotlightSearchPunchIn completedSearchQuery](punchInDetails, "completedSearchQuery"));
  -[SearchFieldItem setPunchInDetails:searchString:](v5, "setPunchInDetails:searchString:", punchInDetails, v7);

  v8 = -[SearchAction initWithSearchItem:alongRoute:]([SearchAction alloc], "initWithSearchItem:alongRoute:", v5, 0);
  -[MapsAction setUserLocationAccuracy:](v8, "setUserLocationAccuracy:", kCLLocationAccuracyKilometer);
  v9 = objc_alloc_init(MapsActivity);
  v10 = objc_alloc_init((Class)GEOURLOptions);
  -[MapsActivity setDisplayOptions:](v9, "setDisplayOptions:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v9, "displayOptions"));
  objc_msgSend(v11, "setUserTrackingMode:", 1);

  v12 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", v9, v8);
  -[URLHandlingTask taskFinished:](self, "taskFinished:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchInDetails, 0);
}

@end
