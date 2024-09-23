@implementation WAGeoServicesMessageSubmitter

- (WAGeoServicesMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  WAGeoServicesMessageSubmitter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WAGeoServicesMessageSubmitter;
  result = -[WAGeoServicesMessageSubmitter init](&v5, "init");
  result->_groupTypeForThisSubmitter = a3;
  return result;
}

- (id)submitMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WAGeoServicesMessageSubmitter;
  v5 = -[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:](&v15, "instantiateAWDProtobufAndPopulateValues:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (objc_opt_class(GEOWiFiConnectionQualityReporter))
    {
      +[GEOWiFiConnectionQualityReporter reportWiFiConnectionQuality:](GEOWiFiConnectionQualityReporter, "reportWiFiConnectionQuality:", v6);
      v7 = WALogCategoryDefaultHandle();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
        *(_DWORD *)buf = 136446722;
        v17 = "-[WAGeoServicesMessageSubmitter submitMessage:]";
        v18 = 1024;
        v19 = 48;
        v20 = 2112;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Successfully submitted GeoServices message with key: %@", buf, 0x1Cu);

      }
    }
    else
    {
      v14 = WALogCategoryDefaultHandle();
      v8 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v17 = "-[WAGeoServicesMessageSubmitter submitMessage:]";
        v18 = 1024;
        v19 = 45;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:No GEOWiFiConnectionQualityReporter to report WiFiConnectionQuality with", buf, 0x12u);
      }
    }
    v10 = 0;
  }
  else
  {
    v22 = NSLocalizedFailureReasonErrorKey;
    v23 = CFSTR("WAErrorCodeSubmissionModelFailure");
    v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9007, v8));
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDSubmitter submissionDelegate](self, "submissionDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  objc_msgSend(v11, "messsageWasSubmittedWithUUID:", v12);

  return v10;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end
