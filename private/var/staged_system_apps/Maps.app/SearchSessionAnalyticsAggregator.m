@implementation SearchSessionAnalyticsAggregator

+ (id)sharedAggregator
{
  if (qword_1014D3E40 != -1)
    dispatch_once(&qword_1014D3E40, &stru_1011E1410);
  return (id)qword_1014D3E38;
}

- (id)collectedAnalytics
{
  SearchSessionAnalyticsAggregator *v2;
  void *v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  GEOSessionUserActionMetadata *sessionUserActionMetadata;
  int v10;
  __CFString *v11;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSessionUserActionMetadata sessionUserActionMetadata](v2->_sessionUserActionMetadata, "sessionUserActionMetadata"));
  v4 = sub_10043222C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("YES");
    if (!v3)
      v6 = CFSTR("NO");
    v7 = v6;
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SearchSessionAnalyticsAggregator has analytis : %@", (uint8_t *)&v10, 0xCu);

  }
  if (!v3)
  {
    sessionUserActionMetadata = v2->_sessionUserActionMetadata;
    v2->_sessionUserActionMetadata = 0;

  }
  objc_sync_exit(v2);

  return v3;
}

- (void)collectSearchSessionAnalytics:(id)a3
{
  id v4;
  SearchSessionAnalyticsAggregator *v5;
  GEOSessionUserActionMetadata *v6;
  GEOSessionUserActionMetadata *sessionUserActionMetadata;
  uint64_t UInteger;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_sessionUserActionMetadata)
  {
    v6 = (GEOSessionUserActionMetadata *)objc_alloc_init((Class)GEOSessionUserActionMetadata);
    sessionUserActionMetadata = v5->_sessionUserActionMetadata;
    v5->_sessionUserActionMetadata = v6;

    if ((unint64_t)GEOConfigGetUInteger(MapsConfig_SearchSessionUserMaxActions, off_1014B32F8) > 0x63)
      UInteger = 100;
    else
      UInteger = GEOConfigGetUInteger(MapsConfig_SearchSessionUserMaxActions, off_1014B32F8);
    v5->_maxCount = UInteger;
  }
  if (-[SearchSessionAnalyticsAggregator isAllowedSessionAnalytic:](v5, "isAllowedSessionAnalytic:", v4))
  {
    -[GEOSessionUserActionMetadata captureSearchAction:searchTarget:maxCountToMaintain:](v5->_sessionUserActionMetadata, "captureSearchAction:searchTarget:maxCountToMaintain:", objc_msgSend(v4, "action"), objc_msgSend(v4, "target"), v5->_maxCount);
  }
  else
  {
    v9 = sub_10043222C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugDescription"));
      v12 = 138412290;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SearchSessionAnalyticsAggregator is not allowed to log : %@", (uint8_t *)&v12, 0xCu);

    }
  }
  objc_sync_exit(v5);

}

- (BOOL)isAllowedSessionAnalytic:(id)a3
{
  id v3;
  int v4;
  char v5;
  int v6;
  char v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "action");
  v5 = 0;
  if (v4 <= 2006)
  {
    if (((v4 - 1001) > 0x2F || ((1 << (v4 + 23)) & 0x9F0000030209) == 0)
      && (v4 > 8 || ((1 << v4) & 0x186) == 0))
    {
      goto LABEL_15;
    }
LABEL_14:
    v5 = 1;
    goto LABEL_15;
  }
  if (v4 > 2197)
  {
    if ((v4 - 9036) >= 2 && v4 != 2198)
      goto LABEL_15;
    goto LABEL_14;
  }
  if ((v4 - 2007) <= 0x18 && ((1 << (v4 + 41)) & 0x1000003) != 0 || v4 == 2099)
    goto LABEL_14;
LABEL_15:
  v6 = objc_msgSend(v3, "target");

  v7 = 0;
  if (v6 <= 501)
  {
    if ((v6 - 101) > 4 || v6 == 103)
      return v5 & v7;
LABEL_23:
    v7 = 1;
    return v5 & v7;
  }
  if ((v6 - 502) <= 4 && ((1 << (v6 + 10)) & 0x13) != 0 || v6 == 1011 || v6 == 1009)
    goto LABEL_23;
  return v5 & v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUserActionMetadata, 0);
}

@end
