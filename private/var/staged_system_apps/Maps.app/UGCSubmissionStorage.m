@implementation UGCSubmissionStorage

+ (unint64_t)muidForClientSubmissionIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForKey:", CFSTR("UGCPendingSubmissions")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0;

  return (unint64_t)v7;
}

+ (void)setMUIDAndSubmissionIdentifierWithCorrectionsRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "feedbackRequestParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
  v6 = objc_msgSend(v5, "type");

  if (v6 == 10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "feedbackRequestParameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "submissionParameters"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "details"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "poiEnrichmentUpdate"));

    if ((objc_msgSend(v10, "hasPlaceContext") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeContext"));
      v12 = objc_msgSend(v11, "muid");

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "feedbackRequestParameters"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "submissionParameters"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientSubmissionUuid"));

      if (v12 && objc_msgSend(v15, "length"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dictionaryForKey:", CFSTR("UGCPendingSubmissions")));
        v18 = objc_msgSend(v17, "mutableCopy");

        if (!v18)
          v18 = objc_alloc_init((Class)NSMutableDictionary);
        if (objc_msgSend(v15, "length"))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
          objc_msgSend(v18, "setObject:forKey:", v19, v15);

        }
        v20 = objc_msgSend(v18, "copy");
        objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("UGCPendingSubmissions"));

      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: muid > 0 && clientIdentifier.length > 0", v21, 2u);
      }

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: enrichment.hasPlaceContext", buf, 2u);
    }

  }
}

+ (void)removeClientSubmissionIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("UGCPendingSubmissions")));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectForKey:", v3);
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("UGCPendingSubmissions"));

}

@end
