@implementation NSURL

- (id)ft_referralURLWithSourceIdentifier:(id)a3 appConfigTreatmentID:(id)a4 widgetEngagement:(id)a5 otherQueryItems:(id)a6 sharedDirectoryFileURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v40;
  id v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v41 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000945D8();
    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100094510();
LABEL_6:
  v16 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", self, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "queryItems"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v17));

  if (v13)
  {
    v19 = FCWidgetModeGroupIDPathComponent;
    v20 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v19, v21));
    objc_msgSend(v18, "addObject:", v22);

    v13 = v20;
  }
  if (v14)
  {
    v40 = v12;
    v23 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "URLByAppendingPathComponent:", v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
    v28 = objc_msgSend(v27, "writeToURL:atomically:", v26, 1);

    if (v28)
    {
      v29 = FCWidgetEngagementFilePathQueryItemName;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v29, v30));
      objc_msgSend(v18, "addObject:", v31);

    }
    v13 = v23;
    v12 = v40;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "fc_stringWithISO8601Format"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", FCUserActionDatePathComponent, v33));
    objc_msgSend(v18, "addObject:", v34);

  }
  objc_msgSend(v18, "addObjectsFromArray:", v15);
  objc_msgSend(v16, "setQueryItems:", v18);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URL"));
  v36 = FTCampaignIdentifierForSourceIdentifier(v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "nss_URLWithCampaignID:", v37));

  return v38;
}

@end
