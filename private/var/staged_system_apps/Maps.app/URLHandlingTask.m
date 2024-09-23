@implementation URLHandlingTask

+ (id)taskForURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7 windowSize:(CGSize)a8
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  __objc2_class **v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  unsigned __int8 v32;
  _MKHandlerURLHandlingTask *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  void *v37;
  _MKHandlerURLHandlingTask *v38;
  void *v40;
  void *v41;
  void *v42;
  NSString *v43;
  NSString *v44;
  _QWORD v45[2];
  uint64_t v46;
  uint8_t buf[4];
  id v48;

  height = a8.height;
  width = a8.width;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = sub_100431A4C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "taskForURL %{private}@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scheme"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lowercaseString"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "query"));
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("reset=1"));

  if ((v24 & 1) != 0)
  {
    v25 = off_101198730;
LABEL_31:
    v38 = (_MKHandlerURLHandlingTask *)objc_msgSend(objc_alloc(*v25), "initWithURL:referringURL:sourceApplication:sceneOptions:mkOptions:", v14, v15, v16, v17, v18);
LABEL_32:
    -[URLHandlingTask setWindowSize:](v38, "setWindowSize:", width, height);
    v33 = v38;
    goto LABEL_33;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("x-maps-ac-auth")) & 1) != 0)
  {
    v25 = off_101198628;
    goto LABEL_31;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("x-maps-reopen")) & 1) != 0)
  {
    v25 = off_101198738;
    goto LABEL_31;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("x-maps-punchinhint")) & 1) != 0)
  {
    v25 = off_101198740;
    goto LABEL_31;
  }
  if (!+[MKDirectionsRequest isDirectionsRequestURL:](MKDirectionsRequest, "isDirectionsRequestURL:", v14))
  {
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("x-maps-bulletin")) & 1) != 0)
    {
      v25 = &off_101198630;
      goto LABEL_31;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
    v32 = objc_msgSend(v31, "containsString:", CFSTR("add-license-plate"));

    if ((v32 & 1) != 0)
    {
      v25 = &off_101198670;
      goto LABEL_31;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
    v35 = objc_msgSend(v34, "containsString:", CFSTR("vehicles"));

    if ((v35 & 1) != 0)
    {
      v25 = off_101198728;
      goto LABEL_31;
    }
    if (!objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("file")))
    {
      v25 = &off_101198660;
      goto LABEL_31;
    }
    if (!objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("x-maps-category")))
    {
      v25 = off_101198658;
      goto LABEL_31;
    }
    if (!+[_MKURLHandler canHandleURL:](_MKURLHandler, "canHandleURL:", v14))
    {
      v38 = 0;
      v33 = 0;
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("test")) & 1) != 0)
        goto LABEL_33;
      goto LABEL_32;
    }
    v33 = -[URLHandlingTask initWithURL:referringURL:sourceApplication:sceneOptions:mkOptions:]([_MKHandlerURLHandlingTask alloc], "initWithURL:referringURL:sourceApplication:sceneOptions:mkOptions:", v14, v15, v16, v17, v18);
    goto LABEL_24;
  }
  v26 = objc_msgSend(objc_alloc((Class)MKDirectionsRequest), "initWithContentsOfURL:", v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "source"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "destination"));
  if (v28)
  {
    v41 = v27;
    v42 = (void *)v28;
    if (v27)
    {
      v45[0] = v27;
      v45[1] = v28;
      v29 = v45;
      v30 = 2;
    }
    else
    {
      v46 = v28;
      v29 = &v46;
      v30 = 1;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, v30));
    v43 = MKLaunchOptionsDirectionsModeKey;
    v44 = MKLaunchOptionsDirectionsModeDefault;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem urlForMapItems:options:](MKMapItem, "urlForMapItems:options:", v40, v36));

    v33 = -[URLHandlingTask initWithURL:referringURL:sourceApplication:sceneOptions:mkOptions:]([_MKHandlerURLHandlingTask alloc], "initWithURL:referringURL:sourceApplication:sceneOptions:mkOptions:", v37, v15, v16, v17, v18);
LABEL_24:
    -[URLHandlingTask setWindowSize:](v33, "setWindowSize:", width, height);
    +[MKSiriInteraction generateHashForNavigationURL:](MKSiriInteraction, "generateHashForNavigationURL:", v14);
    goto LABEL_33;
  }

  v33 = 0;
LABEL_33:

  return v33;
}

- (URLHandlingTask)initWithURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  URLHandlingTask *v17;
  URLHandlingTask *v18;
  id v20;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20 = a7;
  v21.receiver = self;
  v21.super_class = (Class)URLHandlingTask;
  v17 = -[URLHandlingTask init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_url, a3);
    objc_storeStrong((id *)&v18->_referringURL, a4);
    objc_storeStrong((id *)&v18->_sourceApplication, a5);
    objc_storeStrong((id *)&v18->_sceneOptions, a6);
    objc_storeStrong((id *)&v18->_mkOptions, a7);
    -[URLHandlingTask _populateSessionAnalytics](v18, "_populateSessionAnalytics");
  }

  return v18;
}

- (void)_populateSessionAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask referringURL](self, "referringURL"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(".")));
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", (char *)objc_msgSend(v4, "count") - 2, 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(".")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask sourceApplication](self, "sourceApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v8, "setMapLaunchSourceAppId:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask urlScheme](self, "urlScheme"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v10, "setMapLaunchLaunchUri:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v11, "setMapLaunchReferringWebsite:", v6);

}

- (id)urlScheme
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self->_url, "scheme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lowercaseString"));

  return v3;
}

- (NSString)sourceApplication
{
  NSString *sourceApplication;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  sourceApplication = self->_sourceApplication;
  if (sourceApplication)
    v4 = sourceApplication;
  else
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[UISceneOpenURLOptions sourceApplication](self->_sceneOptions, "sourceApplication"));
  v5 = self->_sourceApplication;
  self->_sourceApplication = v4;

  v6 = self->_sourceApplication;
  if (v6)
    v7 = v6;
  else
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[MKMapItem _sourceAppIdFromLaunchURL:](MKMapItem, "_sourceAppIdFromLaunchURL:", self->_url));
  v8 = self->_sourceApplication;
  self->_sourceApplication = v7;

  return self->_sourceApplication;
}

- (void)taskFinished:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)URLHandlingTask;
  -[RichMapsActivityCreatingTaskImpl taskFinished:](&v4, "taskFinished:", a3);
  -[URLHandlingTask _sendAnalytics](self, "_sendAnalytics");
}

- (void)taskFailed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)URLHandlingTask;
  -[RichMapsActivityCreatingTaskImpl taskFailed](&v3, "taskFailed");
  -[URLHandlingTask _sendAnalytics](self, "_sendAnalytics");
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSURL)referringURL
{
  return self->_referringURL;
}

- (void)setReferringURL:(id)a3
{
  objc_storeStrong((id *)&self->_referringURL, a3);
}

- (UISceneOpenURLOptions)sceneOptions
{
  return self->_sceneOptions;
}

- (void)setSceneOptions:(id)a3
{
  objc_storeStrong((id *)&self->_sceneOptions, a3);
}

- (NSDictionary)mkOptions
{
  return self->_mkOptions;
}

- (void)setMkOptions:(id)a3
{
  objc_storeStrong((id *)&self->_mkOptions, a3);
}

- (BOOL)launchedFromTTL
{
  return self->_launchedFromTTL;
}

- (void)setLaunchedFromTTL:(BOOL)a3
{
  self->_launchedFromTTL = a3;
}

- (NSDate)ttlEventTime
{
  return self->_ttlEventTime;
}

- (void)setTtlEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_ttlEventTime, a3);
}

- (CGSize)windowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (void)setSourceApplication:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_ttlEventTime, 0);
  objc_storeStrong((id *)&self->_mkOptions, 0);
  objc_storeStrong((id *)&self->_sceneOptions, 0);
  objc_storeStrong((id *)&self->_referringURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
