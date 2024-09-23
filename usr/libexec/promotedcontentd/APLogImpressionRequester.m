@implementation APLogImpressionRequester

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBLogImpressionResponse, a2);
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (id)protoBuffer
{
  APPBLogImpressionRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  signed int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v3 = objc_alloc_init(APPBLogImpressionRequest);
  -[APPBLogImpressionRequest setType:](v3, "setType:", -[APLogImpressionRequester type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](self, "logMetadata"));
  -[APPBLogImpressionRequest setMetaData:](v3, "setMetaData:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transientContent"));
  objc_msgSend(v6, "accumulatedPlaybackTime");
  v8 = v7;

  if (v8 > 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transientContent"));
    objc_msgSend(v10, "accumulatedPlaybackTime");
    *(float *)&v11 = v11;
    -[APPBLogImpressionRequest setPlaybackTime:](v3, "setPlaybackTime:", v11);

    -[APPBLogImpressionRequest playbackTime](v3, "playbackTime");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
    objc_msgSend(v15, "impressionThreshold");
    v17 = v16;

    if (v17 > v13)
      -[APPBLogImpressionRequest setInsufficientPlaybackTime:](v3, "setInsufficientPlaybackTime:", 1);
  }
  if (-[APLogImpressionRequester isViewableImpression](self, "isViewableImpression"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](self, "metric"));
    v19 = metricPropertyValue(v18, (void *)0x15);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](self, "metric"));
      v23 = metricPropertyValue(v22, (void *)0x15);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = objc_msgSend(v24, "intValue");

      if (v25 != -1)
      {
        v26 = v25;
        goto LABEL_15;
      }
    }
    else
    {

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "content"));
    if (v28)
    {
      v29 = (void *)v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "content"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "representations"));
      v33 = objc_msgSend(v32, "count");

      if (!v33)
      {
        v26 = -1;
        goto LABEL_15;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "content"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "getRepresentation"));
      v26 = (uint64_t)objc_msgSend(v35, "placementType");

    }
    else
    {
      v26 = -1;
    }

LABEL_15:
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester context](self, "context"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "content"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contextJSONForRequest:andPlacementType:", v39, v26));
    -[APPBLogImpressionRequest setContextString:](v3, "setContextString:", v40);

  }
  return v3;
}

- (BOOL)isViewableImpression
{
  return -[APLogImpressionRequester type](self, "type") == 2 || -[APLogImpressionRequester type](self, "type") == 3;
}

- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;

  v8 = a4;
  v9 = a5;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v10 = objc_alloc((Class)NSUserDefaults);
    v11 = objc_msgSend(v10, "initWithSuiteName:", APDefaultsBundleID);
    if (objc_msgSend(v11, "BOOLForKey:", CFSTR("disableDelayForRequests")))
    {
      v12 = APLogForCategory(21);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[APLogImpressionRequester makeDelayedRequest:requestSentHandler:responseCallback:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}s Overriding delay to 0 seconds", buf, 0xCu);
      }

      a3 = 0.0;
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)APLogImpressionRequester;
  -[APServerRequester makeDelayedRequest:requestSentHandler:responseCallback:](&v14, "makeDelayedRequest:requestSentHandler:responseCallback:", v8, v9, a3);

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)generatedFromClientVisibility
{
  return self->_generatedFromClientVisibility;
}

- (void)setGeneratedFromClientVisibility:(BOOL)a3
{
  self->_generatedFromClientVisibility = a3;
}

@end
