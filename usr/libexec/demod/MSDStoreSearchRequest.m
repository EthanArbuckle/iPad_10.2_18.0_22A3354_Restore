@implementation MSDStoreSearchRequest

- (id)getUrl
{
  return CFSTR("/api/stores/1/search_store_and_hq");
}

- (id)getQueryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  int v30;
  void *v31;

  if (-[MSDDemoUnitServerRequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getCurrentDeviceLocaleCode"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest text](self, "text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("text"), v6));

    objc_msgSend(v5, "addObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest longitude](self, "longitude"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest latitude](self, "latitude"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest longitude](self, "longitude"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("longitude"), v12));

        objc_msgSend(v5, "addObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest latitude](self, "latitude"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("latitude"), v15));

        objc_msgSend(v5, "addObject:", v7);
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("locale_code"), v4));

    objc_msgSend(v5, "addObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getCurrentDeviceLanguage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("language"), v18));

    objc_msgSend(v5, "addObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getCurrentDeviceRegion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("country"), v21));

    objc_msgSend(v5, "addObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest maxStoreResults](self, "maxStoreResults"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest maxStoreResults](self, "maxStoreResults"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringValue"));
      v26 = objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("max_store_results"), v25));

      v22 = (void *)v26;
    }
    v27 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138543362;
      v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Store search queries: %{public}@", (uint8_t *)&v30, 0xCu);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MSDStoreSearchRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v32, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v15 = 0;
    v11 = 0;
  }
  else
  {
    v31 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v31));
    v12 = v31;

    if (v11)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("store_results")));
      if (v13)
      {
        v15 = (void *)v13;
        v16 = objc_opt_class(NSArray, v14);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v30 = v12;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v15, 0, &v30));
          v18 = v30;

          objc_msgSend(v9, "setData:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));

          if (v19 && !v18)
          {
            v6 = 0;
            goto LABEL_8;
          }
          v25 = sub_1000604F0();
          v22 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_1000C04D0((uint64_t)v18, v22, v26);
          v12 = v18;
        }
        else
        {
          v24 = sub_1000604F0();
          v22 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_1000C053C((uint64_t)v15, v22);
        }
      }
      else
      {
        v21 = sub_1000604F0();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1000C0464((uint64_t)v11, v22, v23);
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
    v6 = v12;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v27)
  {
    v29 = v6;
    sub_1000B6428(&v29, 3727744512, CFSTR("Unexpected server response."));
    v28 = v29;

    objc_msgSend(v9, "setError:", v28);
    v6 = v28;
  }
LABEL_8:

  return v9;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  self->_longitude = (NSNumber *)a3;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  self->_latitude = (NSNumber *)a3;
}

- (NSNumber)maxStoreResults
{
  return self->_maxStoreResults;
}

- (void)setMaxStoreResults:(id)a3
{
  self->_maxStoreResults = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
