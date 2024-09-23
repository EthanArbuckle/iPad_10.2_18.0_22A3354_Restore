@implementation GKContactsCacheUpdateBatchStartCommand

- (id)executeWithContext:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfoList _gkObjectsMatchingPredicate:withContext:](GKCDContactInfoList, "_gkObjectsMatchingPredicate:withContext:", 0, a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v6 = 0;
  if (!v4)
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v5);
    v8 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_1000D1CD8(v8, v9, v10, v11, v12, v13, v14, v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", GKContactsIntegrationErrorDomain, 5, 0));
  }

  return v6;
}

@end
