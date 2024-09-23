@implementation NSURL

- (id)_fr_representationWithScheme:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", self, 1);
  objc_msgSend(v5, "setScheme:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
  return v6;
}

- (id)fr_httpRepresentation
{
  return -[NSURL _fr_representationWithScheme:](self, "_fr_representationWithScheme:", NSSHTTPURLScheme);
}

- (id)fr_httpsRepresentation
{
  return -[NSURL _fr_representationWithScheme:](self, "_fr_representationWithScheme:", NSSHTTPSURLScheme);
}

- (id)fr_podcastRepresentation
{
  return -[NSURL _fr_representationWithScheme:](self, "_fr_representationWithScheme:", CFSTR("podcast"));
}

- (void)fr_feldsparArticleIDWithAssetManager:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, NSMutableArray *, void *, uint64_t);
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  FRNewsReferralItemDecoder *v31;
  uint64_t v32;
  id v33;
  void *v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  uint64_t v43;
  NSURL *v44;
  id v45;
  void (**v46)(id, id, NSMutableArray *, void *, uint64_t);
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v6 = a3;
  v7 = (void (**)(id, id, NSMutableArray *, void *, uint64_t))a4;
  v62 = 0;
  LOBYTE(a4) = -[NSURL fc_isHardPaywallNewsArticleURL:](self, "fc_isHardPaywallNewsArticleURL:", &v62);
  v8 = v62;
  if ((a4 & 1) == 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NSURL fc_NewsArticleID](self, "fc_NewsArticleID"));

    v8 = (id)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("&")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (!v14)
  {

    v15 = 0;
    v28 = 0;
    v30 = 0;
    v35 = 0;
LABEL_36:
    v43 = 1;
    if (!v7)
      goto LABEL_38;
LABEL_37:
    v7[2](v7, v8, v35, v12, v43);
    goto LABEL_38;
  }
  v44 = self;
  v45 = v8;
  v47 = v6;
  v48 = v12;
  v51 = 0;
  obj = v13;
  v46 = v7;
  v15 = 0;
  v53 = 0;
  v16 = *(_QWORD *)v59;
  v17 = FCArticleListPathComponent;
  v50 = FCWidgetArticleListReferralItemQueryItemName;
  v49 = NSSOpenedFromPathComponent;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v59 != v16)
        objc_enumerationMutation(obj);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("="), v44));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByRemovingPercentEncoding"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByRemovingPercentEncoding"));

      if ((objc_msgSend(v21, "isEqualToString:", v17) & 1) != 0)
      {
        v24 = v53;
        v53 = v23;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", v50) & 1) != 0)
      {
        v24 = v51;
        v51 = v23;
      }
      else
      {
        v25 = objc_msgSend(v21, "isEqualToString:", v49);
        v26 = v15;
        v24 = v15;
        v15 = v23;
        if (!v25)
          goto LABEL_14;
      }
      v27 = v23;

      v26 = v15;
LABEL_14:
      v15 = v26;

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  }
  while (v14);
  v13 = obj;

  v28 = v51;
  if (!v51)
  {
    v12 = v48;
    v8 = v45;
    v30 = v53;
    if (!v15)
    {
      v43 = 1;
      goto LABEL_34;
    }
    v29 = -[NSURL _articleOpenedFromQueryValue:](v44, "_articleOpenedFromQueryValue:", v15);
LABEL_31:
    v43 = (uint64_t)v29;
LABEL_34:
    v7 = v46;
    if (!v30)
    {
      v14 = 0;
      v35 = 0;
      if (!v46)
        goto LABEL_38;
      goto LABEL_37;
    }
    v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "componentsSeparatedByString:", CFSTR(",")));
    v14 = 0;
    goto LABEL_36;
  }
  v29 = -[NSURL fr_articleOpenedFrom](v44, "fr_articleOpenedFrom");
  v12 = v48;
  v8 = v45;
  v30 = v53;
  if (v29 != (id)2)
    goto LABEL_31;
  v31 = -[FRNewsReferralItemDecoder initWithAssetManager:]([FRNewsReferralItemDecoder alloc], "initWithAssetManager:", v6);
  v33 = -[FRNewsReferralItemDecoder destructivelyDecodeReferraltemOfClass:withQueryValue:error:](v31, "destructivelyDecodeReferraltemOfClass:withQueryValue:error:", objc_opt_class(FRNewsReferralItemWidgetArticleList, v32), v51, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue(v33);

  if (!v14)
  {
    v43 = 2;
    goto LABEL_34;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "referredArticlesWithAssetManager:", v6));
  v35 = objc_opt_new(NSMutableArray);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v36 = v34;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "articleID"));
        -[NSMutableArray addObject:](v35, "addObject:", v42);
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v41, v42);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v38);
  }

  v43 = 2;
  v7 = v46;
  v6 = v47;
  v28 = v51;
  v13 = obj;
  v12 = v48;
  v30 = v53;
  if (v46)
    goto LABEL_37;
LABEL_38:

}

- (int64_t)fr_articleOpenedFrom
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int64_t v19;
  void *v20;
  NSURL *v21;
  void *v22;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("&")));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v26 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v28;
    v8 = NSSOpenedFromPathComponent;
    v9 = NSSSectionPathComponent;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByRemovingPercentEncoding"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByRemovingPercentEncoding"));

        if (!objc_msgSend(v13, "caseInsensitiveCompare:", v8))
        {
          v16 = v15;

          v6 = v16;
        }
        if (!objc_msgSend(v13, "caseInsensitiveCompare:", v9))
        {
          v17 = v15;

          v26 = v17;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }
  else
  {
    v26 = 0;
    v6 = 0;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL nss_campaignID](self, "nss_campaignID"));
  if ((objc_msgSend(v18, "isEqualToString:", NSSNewsWidgetNewsModeCampaignID) & 1) != 0)
  {
    v19 = 2;
    v20 = v26;
  }
  else
  {
    v20 = v26;
    if (v26 && (id)-[NSURL _articleOpenedFromQueryValue:](self, "_articleOpenedFromQueryValue:", v6) == (id)8)
    {
      v21 = self;
      v22 = v26;
    }
    else
    {
      v21 = self;
      v22 = v6;
    }
    v19 = -[NSURL _articleOpenedFromQueryValue:](v21, "_articleOpenedFromQueryValue:", v22);
  }

  return v19;
}

- (int64_t)_articleOpenedFromQueryValue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("newsletter")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("editorpicks")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("editorialarticle")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("following")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("endofarticle")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("article")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("morefrompublisher")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("related")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)fr_widgetEngagementFileURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL fr_widgetReferralItemWithQueryItemName:](self, "fr_widgetReferralItemWithQueryItemName:", FCWidgetEngagementFilePathQueryItemName));
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));
  else
    v3 = 0;

  return v3;
}

- (id)fr_widgetReferralItemWithQueryItemName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007BF78();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&")));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByRemovingPercentEncoding"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByRemovingPercentEncoding"));

        if (objc_msgSend(v14, "isEqualToString:", v4))
        {
          v17 = v16;

          v9 = v17;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)fr_isFromSafariSearchWithSourceApplication:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL fr_campaignID](self, "fr_campaignID"));
  if (objc_msgSend(v5, "isEqualToString:", NSSSafariSearchCampaignID))
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
  else
    v6 = 0;

  return v6;
}

- (id)fr_valueForQueryItemWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C030();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000185D4;
  v17 = sub_10001850C;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&")));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003630C;
  v10[3] = &unk_1000DB698;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)fr_NewsURLForTagID:(id)a3 title:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_urlForTagID:internal:", a3, 0));
  objc_msgSend(v7, "_setTitle:", v6);

  return v7;
}

+ (id)fr_NewsInternalURLForTagID:(id)a3
{
  return objc_msgSend(a1, "_urlForTagID:internal:", a3, 1);
}

+ (id)_urlForTagID:(id)a3 internal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a4;
  v6 = a3;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C264();
  if (!objc_msgSend(v6, "length") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C1AC();
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("/")) != (id)0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007C0EC();
  }
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v7, v4));

  return v8;
}

- (BOOL)fr_isFeldsparForYouURL
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = -[NSURL _caseInsensitiveCompareWithFirstPathComponent:](self, "_caseInsensitiveCompareWithFirstPathComponent:", NSSNewsForYouPathComponent);

  return v4;
}

- (BOOL)fr_isFeldsparFollowingURL
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = -[NSURL _caseInsensitiveCompareWithFirstPathComponent:](self, "_caseInsensitiveCompareWithFirstPathComponent:", CFSTR("following"));

  return v4;
}

- (BOOL)fr_isFeldsparSpotlightURL
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = -[NSURL _caseInsensitiveCompareWithFirstPathComponent:](self, "_caseInsensitiveCompareWithFirstPathComponent:", CFSTR("spotlight"));

  return v4;
}

- (BOOL)fr_isFeldsparSavedURL
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = -[NSURL _caseInsensitiveCompareWithFirstPathComponent:](self, "_caseInsensitiveCompareWithFirstPathComponent:", NSSNewsSavedComponent);

  return v4;
}

- (BOOL)fr_isFeldsparHistoryURL
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = -[NSURL _caseInsensitiveCompareWithFirstPathComponent:](self, "_caseInsensitiveCompareWithFirstPathComponent:", NSSNewsHistoryComponent);

  return v4;
}

- (BOOL)fr_isFeldsparFavoritesPickerURL
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = -[NSURL _caseInsensitiveCompareWithFirstPathComponent:](self, "_caseInsensitiveCompareWithFirstPathComponent:", NSSNewsFavoritePickerComponent);

  return v4;
}

- (BOOL)fr_isFeldsparTabURL
{
  if (-[NSURL fr_isFeldsparForYouURL](self, "fr_isFeldsparForYouURL")
    || -[NSURL fr_isFeldsparSavedURL](self, "fr_isFeldsparSavedURL")
    || -[NSURL fr_isFeldsparHistoryURL](self, "fr_isFeldsparHistoryURL")
    || -[NSURL fr_isFeldsparSpotlightURL](self, "fr_isFeldsparSpotlightURL"))
  {
    return 1;
  }
  else
  {
    return -[NSURL fr_isFeldsparFollowingURL](self, "fr_isFeldsparFollowingURL");
  }
}

- (BOOL)fr_isFeldsparReferableURL
{
  if (-[NSURL fr_isFeldsparTabURL](self, "fr_isFeldsparTabURL")
    || -[NSURL fr_isFeldsparFavoritesPickerURL](self, "fr_isFeldsparFavoritesPickerURL")
    || (-[NSURL fc_isNewsTagURL](self, "fc_isNewsTagURL") & 1) != 0
    || (-[NSURL fc_isNewsArticleURL](self, "fc_isNewsArticleURL") & 1) != 0
    || (-[NSURL fc_isHardPaywallNewsArticleURL:](self, "fc_isHardPaywallNewsArticleURL:", 0) & 1) != 0
    || -[NSURL fr_isSubcriptionURL](self, "fr_isSubcriptionURL"))
  {
    return 1;
  }
  else
  {
    return -[NSURL fr_isBundleSubcriptionURL](self, "fr_isBundleSubcriptionURL");
  }
}

- (BOOL)fr_isOpenedFromExploreTab
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = NSSOpenedFromPathComponent;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
        if (objc_msgSend(v12, "isEqualToString:", v9)
          && objc_msgSend(v13, "isEqualToString:", CFSTR("editorialarticle")))
        {

          v14 = 1;
          goto LABEL_12;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)fr_isUserSegmentationURL
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = -[NSURL _caseInsensitiveCompareWithFirstPathComponent:](self, "_caseInsensitiveCompareWithFirstPathComponent:", CFSTR("segmentation-settings"));

  return v4;
}

- (BOOL)_caseInsensitiveCompareWithFirstPathComponent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007C3D4();
    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C31C();
LABEL_6:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 1));

  if (objc_msgSend(v8, "length"))
    v9 = objc_msgSend(v8, "caseInsensitiveCompare:", v4) == 0;
  else
    v9 = 0;

  return v9;
}

- (id)fr_storeURLRepresentation
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSURL fr_isStoreURL](self, "fr_isStoreURL"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", self, 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("http"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("http"), CFSTR("itms")));
      objc_msgSend(v3, "setScheme:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)fr_isStoreURL
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("itms")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("itunes.apple.com")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("buy.itunes.apple.com")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
        v4 = objc_msgSend(v7, "isEqualToString:", CFSTR("storepreview.apple.com"));

      }
    }

  }
  return v4;
}

- (BOOL)fr_isBundleSubcriptionURL
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("subscription"));

  }
  return -[NSURL nss_isNewsURL](self, "nss_isNewsURL") & v6;
}

- (BOOL)fr_isSubcriptionURL
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v3 = -[NSURL fr_isSubscriptionURLForWebOptIn](self, "fr_isSubscriptionURLForWebOptIn");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if (objc_msgSend(v4, "count") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("subscription"));

    v3 |= v7;
  }

  if (!-[NSURL nss_isNewsURL](self, "nss_isNewsURL") || !v3)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));

  LOBYTE(v8) = objc_msgSend(v9, "fc_isValidTagID");
  return (char)v8;
}

- (id)fr_subscriptionURLTagID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[NSURL fr_isSubcriptionURL](self, "fr_isSubcriptionURL"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 1));

    if (objc_msgSend(v4, "fc_isValidTagID"))
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)fr_isSubscriptionURLForWebOptIn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;

  if (!-[NSURL nss_isNewsURL](self, "nss_isNewsURL"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  if (objc_msgSend(v3, "count") != (id)4)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("weboptin")) & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 2));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("subscription"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 1));

    v10 = objc_msgSend(v3, "fc_isValidTagID");
LABEL_9:

    return v10;
  }
  return 0;
}

- (void)fr_subscriptionURLQueryParametersWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, void *, void *, void *, void *, id, id, id);
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v22 = (void (**)(id, void *, void *, void *, void *, id, id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByRemovingPercentEncoding"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&")));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v7)
  {
    v23 = 0;
    v24 = 0;
    v9 = 0;
    v10 = 0;
    v25 = 0;
    goto LABEL_21;
  }
  v8 = v7;
  v23 = 0;
  v24 = 0;
  v9 = 0;
  v10 = 0;
  v25 = 0;
  v11 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(obj);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
      if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("qtoken")))
      {
        if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("campaignId")))
        {
          if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("presentedContext")))
          {
            if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("feedId")))
            {
              v16 = v9;
              v17 = v15;
              if (objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("articleId")))
                goto LABEL_17;
            }
            else
            {
              v16 = v23;
              v17 = v9;
              v23 = v15;
            }
          }
          else
          {
            v16 = v24;
            v24 = v15;
            v17 = v9;
          }
        }
        else
        {
          v16 = v25;
          v17 = v9;
          v25 = v15;
        }
      }
      else
      {
        v16 = v10;
        v17 = v9;
        v10 = v15;
      }
      v18 = v15;

      v9 = v17;
LABEL_17:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v8);
LABEL_21:

  v19 = objc_msgSend(v24, "isEqualToString:", CFSTR("feed"));
  v20 = objc_msgSend(v24, "isEqualToString:", CFSTR("article"));
  v21 = objc_msgSend(v24, "isEqualToString:", CFSTR("betweenArticle"));
  if (v22)
    v22[2](v22, v10, v25, v23, v9, v19, v20, v21);

}

- (id)fr_creativeID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("creative_id")))
        {
          v13 = v12;

          v7 = v13;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fr_campaignType
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("campaign_type")))
        {
          v13 = v12;

          v7 = v13;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fr_widgetModeGroupID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    v9 = FCWidgetModeGroupIDPathComponent;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
        if (objc_msgSend(v12, "isEqualToString:", v9))
        {
          v14 = v13;

          v7 = v14;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fr_userActionDate
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", self, 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "queryItems"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v17;
    v7 = FCUserActionDatePathComponent;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
          v13 = objc_claimAutoreleasedReturnValue(+[NSDate fc_dateFromStringWithISO8601Format:](NSDate, "fc_dateFromStringWithISO8601Format:", v12));

          v5 = (void *)v13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fr_accessTokenFromAuthenticationCallback
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("access_token")))
        {
          v13 = v12;

          v7 = v13;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)fr_NewsURLForNotificationsWithTagID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C54C();
  if (!objc_msgSend(v4, "length") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C494();
  v8[0] = v4;
  v8[1] = NSSNewsNotificationsPathComponent;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0));

  return v6;
}

- (id)fr_notificationsURLTagID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 1));

    if (objc_msgSend(v6, "fc_isValidTagID"))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)fr_openedFromEditorialArticleURLQueryParametersWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, void *, void *, _QWORD);
  BOOL v17;
  id obj;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v16 = (void (**)(id, void *, void *, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByRemovingPercentEncoding"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&")));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v17 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("componentId")))
        {
          v13 = v12;

          v22 = v13;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("articleId")))
        {
          v14 = v12;

          v21 = v14;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("articleVersion")))
        {
          v15 = v12;

          v20 = v15;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("showingBadge")))
          v17 = objc_msgSend(v12, "intValue") == 1;

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  else
  {
    v17 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
  }

  if (v16)
    ((void (**)(id, void *, void *, void *, BOOL))v16)[2](v16, v22, v21, v20, v17);

}

- (BOOL)fr_isPreviewURL
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("preview")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
    v5 = objc_msgSend(v4, "count") == (id)3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)fr_getPreviewChannelIdentifier:(id *)a3 articleIdentifier:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self, "URLByDeletingLastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = v8;
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  if (a4)
    *a4 = objc_retainAutorelease(v10);

}

- (void)fr_getOverrideSegmentSetIDs:(id *)a3 additionalSegmentSetIDs:(id *)a4 disableABTesting:(BOOL *)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&")));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), "componentsSeparatedByString:", CFSTR("=")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByRemovingPercentEncoding"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByRemovingPercentEncoding"));

        if (objc_msgSend(v13, "isEqualToString:", CFSTR("overrideSSIDs")))
          *a3 = objc_msgSend(v15, "copy");
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("additionalSSIDs")))
          *a4 = objc_msgSend(v15, "copy");
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("disableABTesting")))
          *a5 = objc_msgSend(v15, "isEqualToString:", CFSTR("1"));

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

- (BOOL)fr_isiAdOriginatedURL
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v8 |= objc_msgSend(v12, "isEqualToString:", CFSTR("adpreviewid"));
        v7 |= objc_msgSend(v12, "isEqualToString:", CFSTR("adpreviewlimit"));

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
    v13 = v8 & v7;
  }
  else
  {
    v13 = 0;
  }

  return v13 & 1;
}

- (id)fr_iAdPreviewId
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("adpreviewid")))
        {
          v13 = v12;

          v7 = v13;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)fr_iAdPreviewLimit
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("adpreviewlimit")))
          v8 = objc_msgSend(v13, "integerValue");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return (int64_t)v8;
}

- (BOOL)fr_isFeldsparOpenInNewsErrorURL
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  if (objc_msgSend(v2, "length"))
    v3 = objc_msgSend(v2, "rangeOfString:options:", CFSTR("openinnewserror"), 1) != (id)0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 0;

  return v3;
}

+ (id)fr_createArticleLinkWithArticleID:(id)a3 url:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://apple.news/%@"), a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v6, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queryItems"));
    objc_msgSend(v8, "setQueryItems:", v10);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  }
  return v4;
}

+ (BOOL)fr_canHandleNavigationAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "targetFrame"));

  v6 = objc_msgSend(v5, "isMainFrame");
  LOBYTE(v6) = +[WebView _canHandleRequest:forMainFrame:](WebView, "_canHandleRequest:forMainFrame:", v4, v6);

  return (char)v6;
}

- (id)fr_deepLinkURL
{
  void *v3;
  NSURL *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSURL *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLOverrideForURL:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationsAvailableForOpeningURL:", v4));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
    v9 = objc_msgSend(v8, "length");

    if (v9)
      self = v4;

  }
  v10 = self;

  return v10;
}

+ (id)fr_sanitizedURLForWebView:(id)a3 navigationAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));

  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetFrame"));
  if ((objc_msgSend(v9, "isMainFrame") & 1) != 0)
  {

  }
  else
  {
    v10 = objc_msgSend(v5, "navigationType");

    v11 = v8;
    if (v10)
      goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fr_deepLinkURL"));

LABEL_5:
  if (objc_msgSend(v11, "isEqual:", v8))
  {
    if ((objc_msgSend(a1, "fr_canHandleNavigationAction:", v5) & 1) == 0
      && objc_msgSend(v8, "isSpringboardHandledURL")
      && ((objc_msgSend(v8, "hasTelephonyScheme") & 1) != 0
       || (objc_msgSend(v8, "isFaceTimeURL") & 1) != 0
       || objc_msgSend(v8, "isFaceTimeAudioURL")))
    {
      v12 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithURL:", v8);
      objc_msgSend(v12, "setShowUIPrompt:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));

      v8 = v13;
    }
    else
    {
      v13 = v8;
    }
  }
  else
  {
    v13 = v11;
  }
  v14 = v13;

  return v14;
}

- (BOOL)fr_handleExternalURLWithPrompt
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  NSURL *v19;
  UIApplicationOpenURLOptionsKey v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  if (-[NSURL fr_isStoreURL](self, "fr_isStoreURL"))
    goto LABEL_2;
  if (-[NSURL fr_isHTTPScheme](self, "fr_isHTTPScheme"))
  {
    v5 = 0;
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self, "absoluteString"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("about:blank"));

  v5 = 0;
  if ((v7 & 1) == 0 && v3)
  {
    if (-[NSURL nss_isNewsURL](self, "nss_isNewsURL"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
      v20 = UIApplicationOpenURLOptionsSourceApplicationKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
      v21 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v5 = objc_msgSend(v9, "application:openURL:options:", v8, self, v12);

    }
    else
    {
      if ((-[NSURL hasTelephonyScheme](self, "hasTelephonyScheme") & 1) != 0
        || (-[NSURL isFaceTimeAudioURL](self, "isFaceTimeAudioURL") & 1) != 0
        || -[NSURL isFaceTimeURL](self, "isFaceTimeURL"))
      {
LABEL_2:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        objc_msgSend(v4, "openURL:options:completionHandler:", self, &__NSDictionary0__struct, 0);

        v5 = 1;
        goto LABEL_11;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationsAvailableForOpeningURL:", self));

      if (!objc_msgSend(v8, "count"))
      {
        v5 = 0;
        goto LABEL_10;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedName"));
      v16 = objc_msgSend(v15, "length");
      v5 = v16 != 0;

      if (v16)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100038D60;
        block[3] = &unk_1000D97A8;
        v18 = v9;
        v19 = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

LABEL_10:
  }
LABEL_11:

  return v5;
}

- (BOOL)fr_isWebArchiveURL
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathExtension](self, "pathExtension"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("file")))
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("webarchive"));
  else
    v5 = 0;

  return v5;
}

- (BOOL)fr_isHTTPScheme
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = -[NSURL fr_isWebArchiveURL](self, "fr_isWebArchiveURL");
  }

  return v4;
}

@end
