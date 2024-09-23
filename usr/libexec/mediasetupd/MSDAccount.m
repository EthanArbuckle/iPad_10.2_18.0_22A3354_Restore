@implementation MSDAccount

- (MSDAccount)initWithHomeUserIdentifier:(id)a3
{
  id v5;
  MSDAccount *v6;
  MSDAccount *v7;
  MSDAccount *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MSDAccount;
  v6 = -[MSDAccount init](&v19, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  if (v5)
  {
    objc_storeStrong((id *)&v6->_homeUserIdentifier, a3);
    v7->_syncLock._os_unfair_lock_opaque = 0;
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10001802C(v10, v11, v12, v13, v14, v15, v16, v17);

  v8 = 0;
LABEL_8:

  return v8;
}

- (MSDAccount)initWithHomeIdentifier:(id)a3
{
  id v5;
  MSDAccount *v6;
  MSDAccount *v7;
  MSDAccount *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MSDAccount;
  v6 = -[MSDAccount init](&v19, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  if (v5)
  {
    objc_storeStrong((id *)&v6->_homeIdentifier, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100018060(v10, v11, v12, v13, v14, v15, v16, v17);

  v8 = 0;
LABEL_8:

  return v8;
}

- (NSString)iTunesAccountName
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100017724;
  v17 = sub_100017734;
  v18 = 0;
  os_unfair_lock_lock(&self->_syncLock);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_mediaAccountForHomeWithIdentifier:", self->_homeIdentifier));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001773C;
  v10[3] = &unk_100049818;
  objc_copyWeak(&v11, &location);
  v10[4] = &v13;
  objc_msgSend(v4, "resultWithTimeout:completion:", v10, 2.0);
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14[5], "username"));
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User Active iTunes Account: %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14[5], "username"));
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  return (NSString *)v8;
}

- (BOOL)hasValidSubscription
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  char *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  dispatch_time_t v30;
  void *v31;
  void *v32;
  dispatch_semaphore_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  uint64_t *v39;
  id v40[2];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  NSObject *v48;

  if (qword_100052770 != -1)
    dispatch_once(&qword_100052770, &stru_100049838);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_iTunesAccountWithHomeUserIdentifier:", self->_homeUserIdentifier));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100052768, "objectForKey:", v5));
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      v41 = 0;
      v42 = &v41;
      v43 = 0x2020000000;
      v44 = 1;
      v16 = dispatch_semaphore_create(0);
      v17 = sub_10002E034();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v34 = v16;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v46 = v4;
        v47 = 2113;
        v48 = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "UserAccount %{private}@ with DSID %{private}@", buf, 0x16u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v5));
      v20 = sub_10002E034();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v46 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "UserIdentity %{private}@", buf, 0xCu);
      }

      v35 = objc_msgSend(objc_alloc((Class)ICStoreRequestContext), "initWithIdentity:", v19);
      v22 = objc_msgSend(objc_alloc((Class)ICMusicSubscriptionStatusRequest), "initWithStoreRequestContext:", v35);
      objc_msgSend(v22, "setShouldReturnLastKnownStatusOnly:", 1);
      v23 = (char *)MSDGenerateSignpostID();
      v24 = MSDSignpostFacility();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      v26 = v25;
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v23, "CheckSubscriptionStatus", (const char *)&unk_100039E4E, buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100017CA0;
      v36[3] = &unk_100049860;
      v39 = &v41;
      objc_copyWeak(v40, (id *)buf);
      v28 = v19;
      v37 = v28;
      v40[1] = v23;
      v29 = v34;
      v38 = v29;
      objc_msgSend(v27, "performSubscriptionStatusRequest:withStatusHandler:", v22, v36);
      v30 = dispatch_time(0, 1000000000 * MSiTunesCloudSubscriptionStatusMaxTimeOut);
      dispatch_semaphore_wait(v29, v30);
      v31 = (void *)qword_100052768;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v42 + 24)));
      objc_msgSend(v31, "setObject:forKey:", v32, v5);

      v8 = *((_BYTE *)v42 + 24) != 0;
      objc_destroyWeak(v40);

      objc_destroyWeak((id *)buf);
      _Block_object_dispose(&v41, 8);
    }

  }
  else
  {
    v9 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100018118((uint64_t)&self->_homeUserIdentifier, v5, v10, v11, v12, v13, v14, v15);
    v8 = 0;
  }

  return v8;
}

- (BOOL)_accountHasLocalPlayableContent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v3));

  objc_msgSend(v4, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v4, "setMediaLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanTrue, MPMediaItemPropertyHasNonPurgeableAsset));
  objc_msgSend(v4, "addFilterPredicate:", v6);

  LOBYTE(v6) = objc_msgSend(v4, "_hasItems");
  return (char)v6;
}

+ (ACAccount)activeiTunesAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return (ACAccount *)v3;
}

- (NSUUID)homeUserIdentifier
{
  return self->_homeUserIdentifier;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifier, 0);
}

@end
