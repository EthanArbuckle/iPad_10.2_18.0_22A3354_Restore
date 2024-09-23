@implementation UGCCredentialsBuilder

+ (BOOL)isUserLoggedInForICloud
{
  void *v2;
  BOOL v3;
  uint64_t v5;

  v5 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UGCCredentialsBuilder buildICloudUserCredentialsWithError:](UGCCredentialsBuilder, "buildICloudUserCredentialsWithError:", &v5));
  v3 = v2 != 0;

  return v3;
}

+ (id)buildICloudUserCredentialsWithError:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  const __CFString *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPUserCredentials _credentialsForPrimaryICloudAccount](GEORPUserCredentials, "_credentialsForPrimaryICloudAccount"));
  objc_msgSend(v4, "setUserCredentials:", v5);

  v6 = sub_100431FFC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userCredentials"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "icloudUserPersonId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userCredentials"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "icloudUserMapsAuthToken"));
    v21 = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "UGCCredentialsBuilder icloud person id %@ and auth token %@", (uint8_t *)&v21, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userCredentials"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "icloudUserPersonId"));
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
    if (a3)
    {
      v19 = CFSTR("NoDSID");
LABEL_10:
      v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, -1, 0));
      goto LABEL_12;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userCredentials"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "icloudUserMapsAuthToken"));
  v17 = objc_msgSend(v16, "length");

  if (!v17)
  {
    if (a3)
    {
      v19 = CFSTR("NoAuthToken");
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v18 = v4;
LABEL_12:

  return v18;
}

+ (void)fetchCommunityIDWithMUID:(unint64_t)a3 identifierHistory:(id)a4 CompletionHandler:(id)a5
{
  +[UGCCredentialsBuilder fetchCommunityIDWithMUID:identifierHistory:shouldIncreaseCount:CompletionHandler:](UGCCredentialsBuilder, "fetchCommunityIDWithMUID:identifierHistory:shouldIncreaseCount:CompletionHandler:", a3, a4, 1, a5);
}

+ (void)fetchCommunityIDWithMUID:(unint64_t)a3 identifierHistory:(id)a4 shouldIncreaseCount:(BOOL)a5 CompletionHandler:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  v12 = objc_alloc_init((Class)GEORPTdmInfo);
  objc_msgSend(v11, "setTdmUserInfo:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FeedbackCommunityIDManager shared](_TtC4Maps26FeedbackCommunityIDManager, "shared"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100664E3C;
  v16[3] = &unk_1011BF368;
  v17 = v11;
  v18 = v9;
  v14 = v11;
  v15 = v9;
  objc_msgSend(v13, "fetchAuthenticationInfoForReviewedPlaceWithMuid:identifierHistory:shouldIncreaseCount:completion:", a3, v10, v6, v16);

}

@end
