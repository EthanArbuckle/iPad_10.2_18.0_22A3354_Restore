@implementation FRPersonalizationAutoFavoritesOperation

- (void)setWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_whitelist, a3);
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setUrlMapping:(id)a3
{
  objc_storeStrong((id *)&self->_urlMapping, a3);
}

- (void)setTagRanker:(id)a3
{
  objc_storeStrong((id *)&self->_tagRanker, a3);
}

- (void)setTagController:(id)a3
{
  objc_storeStrong((id *)&self->_tagController, a3);
}

- (void)setSubscriptionController:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionController, a3);
}

- (void)setSignalProcessingTimeInterval:(double)a3
{
  self->_signalProcessingTimeInterval = a3;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void)setLocalAreasManager:(id)a3
{
  objc_storeStrong((id *)&self->_localAreasManager, a3);
}

- (void)setFavorabilityScores:(id)a3
{
  objc_storeStrong((id *)&self->_favorabilityScores, a3);
}

- (void)setDisregardCache:(BOOL)a3
{
  self->_disregardCache = a3;
}

- (void)setCursor:(id)a3
{
  objc_storeStrong((id *)&self->_cursor, a3);
}

- (void)setConfigurableValues:(id)a3
{
  objc_storeStrong((id *)&self->_configurableValues, a3);
}

- (void)setBundleIDMapping:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDMapping, a3);
}

- (void)setAutoFavoritesCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setAppConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_appConfiguration, a3);
}

- (void)setAggregateStore:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStore, a3);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));

  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100078848();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation subscriptionController](self, "subscriptionController"));

  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100078798();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation tagController](self, "tagController"));

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000786E8();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation userInfo](self, "userInfo"));

  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100078638();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation tagRanker](self, "tagRanker"));

  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100078588();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));

  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000784D8();
  if (v3)
    v9 = v4 == 0;
  else
    v9 = 1;
  return !v9 && v5 != 0 && v6 != 0 && v7 != 0 && v8 != 0;
}

- (void)prepareOperation
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation cursor](self, "cursor"));
  v4 = objc_msgSend(v6, "copy");
  if (v4)
  {
    -[FRPersonalizationAutoFavoritesOperation setResultCursor:](self, "setResultCursor:", v4);
  }
  else
  {
    v5 = (void *)objc_opt_new(FRPersonalizationAutoFavoritesCursor, v3);
    -[FRPersonalizationAutoFavoritesOperation setResultCursor:](self, "setResultCursor:", v5);

  }
}

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[5];

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation tagRanker](self, "tagRanker"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021768;
  v13[3] = &unk_1000D9758;
  v5 = v3;
  v14 = v5;
  objc_msgSend(v4, "prepareForUseWithCompletionHandler:", v13);

  dispatch_group_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021770;
  v11[3] = &unk_1000D9758;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "prepareAggregatesForUseWithCompletionHandler:", v11);

  if (FCDispatchGroupIsEmpty(v7))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021778;
    v15[3] = &unk_1000D9758;
    v15[4] = self;
    -[FRPersonalizationAutoFavoritesOperation _processSignals:](self, "_processSignals:", v15);
  }
  else
  {
    v8 = FCDispatchQueueForQualityOfService(-[FRPersonalizationAutoFavoritesOperation qualityOfService](self, "qualityOfService"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100021784;
    v10[3] = &unk_1000D9758;
    v10[4] = self;
    dispatch_group_notify(v7, v9, v10);

  }
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation autoFavoritesCompletionHandler](self, "autoFavoritesCompletionHandler"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation autoFavoritesCompletionHandler](self, "autoFavoritesCompletionHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation resultAutoFavorites](self, "resultAutoFavorites"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation resultCursor](self, "resultCursor"));
    ((void (**)(_QWORD, void *, void *, id))v5)[2](v5, v6, v7, v8);

  }
}

- (void)_processSignals:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  FRPersonalizationAutoFavoritesOperation *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  FRPersonalizationAutoFavoritesOperation *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[6];
  uint8_t buf[4];
  void *v56;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000789AC();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation whitelist](self, "whitelist"));
  v6 = v5 == 0;

  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000788F8();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation whitelist](self, "whitelist"));
  v8 = v7 == 0;

  if (v8)
  {
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100021E04;
    v54[3] = &unk_1000D9AA8;
    v54[4] = self;
    v54[5] = v4;
    sub_100021E04((uint64_t)v54);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = sub_100018584;
    v52[4] = sub_1000184E4;
    v53 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_100018584;
    v50[4] = sub_1000184E4;
    v51 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = sub_100018584;
    v48[4] = sub_1000184E4;
    v49 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = sub_100018584;
    v46[4] = sub_1000184E4;
    v47 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = sub_100018584;
    v44[4] = sub_1000184E4;
    v45 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_100018584;
    v42[4] = sub_1000184E4;
    v43 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v10 = dispatch_group_create();
    v11 = FCOperationLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation shortOperationDescription](self, "shortOperationDescription"));
      *(_DWORD *)buf = 138543362;
      v56 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider external signals", buf, 0xCu);

    }
    dispatch_group_enter(v10);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100021E5C;
    v35[3] = &unk_1000D9AD0;
    v38 = v48;
    v39 = v46;
    v40 = v44;
    v41 = v42;
    v13 = v10;
    v36 = v13;
    v37 = self;
    -[FRPersonalizationAutoFavoritesOperation _considerExternalSignals:](self, "_considerExternalSignals:", v35);
    v14 = FCOperationLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation shortOperationDescription](self, "shortOperationDescription"));
      *(_DWORD *)buf = 138543362;
      v56 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider internal signals", buf, 0xCu);

    }
    dispatch_group_enter(v13);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100021FD8;
    v30[3] = &unk_1000D9AF8;
    v33 = v52;
    v34 = v50;
    v16 = v13;
    v31 = v16;
    v32 = self;
    -[FRPersonalizationAutoFavoritesOperation _considerInternalSignals:](self, "_considerInternalSignals:", v30);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000220FC;
    v21[3] = &unk_1000D9CC8;
    v21[4] = self;
    v17 = v9;
    v22 = v17;
    v24 = v52;
    v25 = v50;
    v26 = v48;
    v27 = v46;
    v28 = v44;
    v29 = v42;
    v23 = v4;
    v18 = objc_retainBlock(v21);
    if (FCDispatchGroupIsEmpty(v16))
    {
      ((void (*)(_QWORD *))v18[2])(v18);
    }
    else
    {
      v19 = FCDispatchQueueForQualityOfService(-[FRPersonalizationAutoFavoritesOperation qualityOfService](self, "qualityOfService"));
      v20 = objc_claimAutoreleasedReturnValue(v19);
      dispatch_group_notify(v16, v20, v18);

    }
    _Block_object_dispose(v42, 8);

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v46, 8);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v50, 8);

    _Block_object_dispose(v52, 8);
  }

}

- (void)_findValidAutoFavoritesWithCandidates:(id)a3 channelsAllowedProvider:(id)a4 topicsAllowedProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void (**v30)(id, id);
  _QWORD block[4];
  id v32;
  void (**v33)(id, id);
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100023A44;
  v39[3] = &unk_1000D9C50;
  v39[4] = self;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation whitelist](self, "whitelist"));
  v40 = v16;
  v17 = v14;
  v41 = v17;
  v18 = v15;
  v42 = v18;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v39);

  v19 = dispatch_group_create();
  if (objc_msgSend(v18, "count"))
  {
    dispatch_group_enter(v19);
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation tagController](self, "tagController"));
    v29 = v16;
    v30 = v12;
    v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
    v24 = -[FRPersonalizationAutoFavoritesOperation qualityOfService](self, "qualityOfService");
    v25 = FCDispatchQueueForQualityOfService(-[FRPersonalizationAutoFavoritesOperation qualityOfService](self, "qualityOfService"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100023BA4;
    v34[3] = &unk_1000D9CF0;
    v37 = v22;
    v35 = v17;
    v38 = v20;
    v36 = v19;
    objc_msgSend(v21, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v23, v24, v26, v34);

    v10 = v22;
    v16 = v29;
    v12 = v30;

    v11 = v20;
  }
  if (FCDispatchGroupIsEmpty(v19))
  {
    if (v12)
      v12[2](v12, v17);
  }
  else
  {
    v27 = FCDispatchQueueForQualityOfService(-[FRPersonalizationAutoFavoritesOperation qualityOfService](self, "qualityOfService"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023D48;
    block[3] = &unk_1000D9D18;
    v33 = v12;
    v32 = v17;
    dispatch_group_notify(v19, v28, block);

  }
}

- (void)_considerInternalAppUsage:(id)a3
{
  void (**v4)(id, id, id);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  FRPersonalizationAutoFavoritesOperation *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;

  v4 = (void (**)(id, id, id))a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000791F0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  objc_msgSend(v7, "autoFavoriteMinEvents");
  v9 = v8;
  objc_msgSend(v7, "autoFavoriteMinClicks");
  v11 = v10;
  objc_msgSend(v7, "autoFavoriteMinRate");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "baselineAggregateWithConfigurableValues:", v7));

  objc_msgSend(v7, "autoFavoriteMinRelativeRate");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  objc_msgSend(v18, "decayRate");
  objc_msgSend(v15, "personalizationValueWithBaseline:decayRate:", 0);
  v20 = v17 * v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100023F74;
  v28[3] = &unk_1000D9D40;
  v29 = v7;
  v30 = self;
  v31 = v15;
  v34 = v9;
  v35 = v11;
  v36 = v13;
  v37 = v20;
  v22 = v5;
  v32 = v22;
  v23 = v6;
  v33 = v23;
  v24 = v15;
  v25 = v7;
  objc_msgSend(v21, "enumerateAggregatesUsingBlock:", v28);

  if (v4)
  {
    v26 = objc_msgSend(v22, "copy");
    v27 = objc_msgSend(v23, "copy");
    v4[2](v4, v26, v27);

  }
}

- (void)considerLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v6 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation shortOperationDescription](self, "shortOperationDescription"));
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider location", buf, 0xCu);

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000243C8;
  v25[3] = &unk_1000D9D68;
  v25[4] = self;
  v9 = v4;
  v26 = v9;
  v10 = objc_retainBlock(v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation appConfiguration](self, "appConfiguration"));
  v12 = objc_msgSend(v11, "enableLocationBasedAutofavorites");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation locationManager](self, "locationManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mostFrequentLocation"));

    v15 = (void *)FCOperationLog;
    v16 = os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation shortOperationDescription](self, "shortOperationDescription"));
        *(_DWORD *)buf = 138543362;
        v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ has location; will fetch local areas provider",
          buf,
          0xCu);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation localAreasManager](self, "localAreasManager"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000244B4;
      v22[3] = &unk_1000D9D90;
      v22[4] = self;
      v23 = v14;
      v24 = v10;
      objc_msgSend(v19, "fetchLocalAreasProvider:", v22);

    }
    else
    {
      if (v16)
      {
        v20 = v15;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation shortOperationDescription](self, "shortOperationDescription"));
        *(_DWORD *)buf = 138543362;
        v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ could not get location; returning empty auto-favorites",
          buf,
          0xCu);

      }
      ((void (*)(_QWORD *, void *))v10[2])(v10, v5);
    }

  }
  else
  {
    ((void (*)(_QWORD *, void *))v10[2])(v10, v5);
  }

}

- (id)maybeConsiderPortrait
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  FRPersonalizationAutoFavoritesOperation *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation whitelist](self, "whitelist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  objc_msgSend(v4, "portraitDecayRate");
  v6 = 0.0;
  if (v7 != 0.0)
  {
    objc_msgSend(v4, "portraitDecayRate");
    v6 = 0.693147181 / v8;
  }
  v9 = (void *)objc_opt_new(PPTopicQuery, v5);
  objc_msgSend(v9, "setOverrideDecayRate:", 1);
  objc_msgSend(v9, "setDecayRate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v9, "setFromDate:", v10);

  v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", CFSTR("com.apple.news"), 0);
  objc_msgSend(v9, "setExcludingSourceBundleIds:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PPTopicStore defaultStore](PPTopicStore, "defaultStore"));
  v24 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scoresForTopicMapping:query:error:", CFSTR("news-topics"), v9, &v24));
  v14 = v24;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "portraitDisabledTagIDs"));
  objc_msgSend(v4, "portraitGlobalThreshold");
  v17 = v16;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002479C;
  v21[3] = &unk_1000D9DB8;
  v22 = v4;
  v23 = self;
  v18 = v4;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FRPortraitUtilities candidatePortraitSignalsWithPortraitResults:disbabledTagIDs:globalThreshold:multiplierProvider:logBlock:](FRPortraitUtilities, "candidatePortraitSignalsWithPortraitResults:disbabledTagIDs:globalThreshold:multiplierProvider:logBlock:", v13, v15, v21, &stru_1000D9DF8, v17));

  return v19;
}

- (void)considerBiome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000792A8();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100018584;
  v19[4] = sub_1000184E4;
  v20 = &__NSArray0__struct;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100018584;
  v17[4] = sub_1000184E4;
  v18 = &__NSArray0__struct;
  v5 = FCOperationLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation shortOperationDescription](self, "shortOperationDescription"));
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider Biome", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  objc_msgSend(v7, "safariEventBlackoutSeconds");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  v11 = objc_msgSend(v10, "maxExternalSignalEventCount");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100024A60;
  v13[3] = &unk_1000D9E20;
  v15 = v19;
  v16 = v17;
  v13[4] = self;
  v12 = v4;
  v14 = v12;
  +[FCBiomeSignalProvider fetchSignalsFromBiomeWithSafariBlockoutDuration:maxExternalSignalEventCount:resultsBlock:](FCBiomeSignalProvider, "fetchSignalsFromBiomeWithSafariBlockoutDuration:maxExternalSignalEventCount:resultsBlock:", v11, v13, v9);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

- (void)processAppSignals:(id)a3 safariSignals:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  long double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  long double v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD *v50;
  id v51;
  void (*v52)(_QWORD *, id, _QWORD *);
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  double v64;
  _QWORD v65[4];
  id v66;
  double v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  Block_layout *v74;
  unsigned __int8 v75;
  _QWORD v76[5];
  id v77;
  uint8_t buf[4];
  void *v79;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000796A4();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000795EC();
LABEL_6:
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100079534();
  v11 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation shortOperationDescription](self, "shortOperationDescription"));
    *(_DWORD *)buf = 138543362;
    v79 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ will process app signals", buf, 0xCu);

  }
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10002533C;
  v76[3] = &unk_1000D9E48;
  v76[4] = self;
  v14 = v10;
  v77 = v14;
  v15 = objc_retainBlock(v76);
  v16 = objc_msgSend(v8, "count");
  if ((char *)objc_msgSend(v9, "count") + (_QWORD)v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation bundleIDMapping](self, "bundleIDMapping"));
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation urlMapping](self, "urlMapping"));

      if (v19)
      {
        v20 = objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation urlMapping](self, "urlMapping"));
        v21 = objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation bundleIDMapping](self, "bundleIDMapping"));
        v58 = (void *)v20;
        if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10007947C();
          if (!v21)
          {
LABEL_17:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_1000793C4();
          }
        }
        else if (!v21)
        {
          goto LABEL_17;
        }
        v60 = (void *)v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v23 = objc_msgSend(v22, "BOOLForKey:", FCPersonalizationDisregardTimeForSuggestions);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
        objc_msgSend(v24, "appUsageSignalWeight");
        v26 = v25;
        objc_msgSend(v24, "appUsageTimeDecayMultiplier");
        v28 = 1.0;
        v29 = 1.0;
        if ((v23 & 1) == 0)
        {
          v30 = v27;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "date"));
          objc_msgSend(v32, "fc_timeIntervalUntilNow");
          v29 = pow(v30, v33 / 86400.0);

        }
        v34 = v26 * v29;
        objc_msgSend(v24, "safariSignalWeight");
        v36 = v35;
        v57 = v24;
        objc_msgSend(v24, "safariTimeDecayMultiplier");
        if ((v23 & 1) == 0)
        {
          v39 = v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "date"));
          objc_msgSend(v41, "fc_timeIntervalUntilNow");
          v28 = pow(v39, v42 / 86400.0);

        }
        v43 = (void *)objc_opt_new(NSMutableDictionary, v37);
        v45 = (void *)objc_opt_new(NSMutableDictionary, v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation cursor](self, "cursor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "coreDuetLastQueryDate"));

        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_10002555C;
        v68[3] = &unk_1000D9F78;
        v75 = v23;
        v69 = v60;
        v74 = &stru_1000D9E88;
        v48 = v45;
        v70 = v48;
        v71 = v47;
        v72 = v58;
        v49 = v43;
        v73 = v49;
        v56 = v58;
        v59 = v47;
        v61 = v60;
        v50 = objc_retainBlock(v68);
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_100025ABC;
        v65[3] = &unk_1000D9FA0;
        v67 = v34;
        v51 = v57;
        v66 = v51;
        ((void (*)(_QWORD *, id, _QWORD *))v50[2])(v50, v8, v65);
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_100025AF8;
        v62[3] = &unk_1000D9FA0;
        v64 = v36 * v28;
        v63 = v51;
        v52 = (void (*)(_QWORD *, id, _QWORD *))v50[2];
        v53 = v51;
        v52(v50, v9, v62);
        if (v15)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation processExternalAppUsageSignals:](self, "processExternalAppUsageSignals:", v48, v56));
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation processSafariSignals:](self, "processSafariSignals:", v49));
          ((void (*)(_QWORD *, void *, void *))v15[2])(v15, v54, v55);

        }
        goto LABEL_28;
      }
    }
  }
  if (v15)
  {
    v49 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v48 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    ((void (*)(_QWORD *, id, id))v15[2])(v15, v49, v48);
LABEL_28:

  }
}

- (id)processExternalAppUsageSignals:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
        v13 = (double)(unint64_t)objc_msgSend(v12, "count");
        objc_msgSend(v5, "autoFavoriteMinObservationsExtAppUsage");
        if (v14 <= v13)
        {
          objc_msgSend(v5, "appUsagePriorFactorExponent");
          v16 = v15;
          objc_msgSend(v5, "appUsageTagFavorabilityExponent");
          -[FRPersonalizationAutoFavoritesOperation metricMultiplierForTagID:withPriorFactorExponent:tagFavorabilityExponent:](self, "metricMultiplierForTagID:withPriorFactorExponent:tagFavorabilityExponent:", v11, v16, v17);
          v19 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKeyPath:", CFSTR("@sum.self")));
          objc_msgSend(v20, "doubleValue");
          v22 = v19 * v21;

          objc_msgSend(v5, "autoFavoriteMinScoreExtAppUsage");
          if (v22 >= v23)
            objc_msgSend(v25, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  return v25;
}

- (id)processSafariSignals:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  v33 = objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation favorabilityScores](self, "favorabilityScores"));
  if (!v33)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007978C();
    v6 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_ERROR))
      sub_10007975C(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", v33));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v19));
        v21 = (double)(unint64_t)objc_msgSend(v20, "count");
        objc_msgSend(v5, "autoFavoriteMinObservationsSafari");
        if (v22 <= v21)
        {
          objc_msgSend(v5, "safariPriorFactorExponent");
          v24 = v23;
          objc_msgSend(v5, "safariTagFavorabilityExponent");
          -[FRPersonalizationAutoFavoritesOperation metricMultiplierForTagID:withPriorFactorExponent:tagFavorabilityExponent:](self, "metricMultiplierForTagID:withPriorFactorExponent:tagFavorabilityExponent:", v19, v24, v25);
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKeyPath:", CFSTR("@sum.self")));
          objc_msgSend(v28, "doubleValue");
          v30 = v27 * v29;

          objc_msgSend(v5, "autoFavoriteMinScoreSafari");
          if (v30 >= v31)
            objc_msgSend(v35, "addObject:", v19);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v16);
  }

  return v35;
}

- (void)_considerInternalSignals:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[6];
  _QWORD v22[5];
  NSObject *v23;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100079844();
  v5 = dispatch_group_create();
  if (-[FRPersonalizationAutoFavoritesOperation disregardCache](self, "disregardCache"))
  {
LABEL_10:
    dispatch_group_enter(v5);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100026160;
    v22[3] = &unk_1000D9FC8;
    v22[4] = self;
    v23 = v5;
    -[FRPersonalizationAutoFavoritesOperation _considerInternalAppUsage:](self, "_considerInternalAppUsage:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation resultCursor](self, "resultCursor"));
    objc_msgSend(v16, "setLastInternalSignalProcessingDate:", v15);

    if (!v4)
      goto LABEL_14;
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation cursor](self, "cursor"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastInternalSignalProcessingDate"));
  if (!v7)
  {

    goto LABEL_10;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation cursor](self, "cursor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastInternalSignalProcessingDate"));
  objc_msgSend(v10, "fc_timeIntervalUntilNow");
  v12 = v11;
  -[FRPersonalizationAutoFavoritesOperation signalProcessingTimeInterval](self, "signalProcessingTimeInterval");
  v14 = v13;

  if (v12 > v14)
    goto LABEL_10;
  if (!v4)
    goto LABEL_14;
LABEL_11:
  if (FCDispatchGroupIsEmpty(v5))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000261E0;
    v21[3] = &unk_1000D9D18;
    v21[4] = self;
    v21[5] = v4;
    sub_1000261E0((uint64_t)v21);
  }
  else
  {
    v17 = FCDispatchQueueForQualityOfService(-[FRPersonalizationAutoFavoritesOperation qualityOfService](self, "qualityOfService"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100026268;
    v19[3] = &unk_1000D9D18;
    v19[4] = self;
    v20 = v4;
    dispatch_group_notify(v5, v18, v19);

  }
LABEL_14:

}

- (void)_considerExternalSignals:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD block[5];
  _QWORD *v28;
  _QWORD v29[5];
  NSObject *v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000799AC();
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000265D0;
  v31[3] = &unk_1000D9FF0;
  v5 = v4;
  v32 = v5;
  v6 = objc_retainBlock(v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation userInfo](self, "userInfo"));
  v8 = objc_msgSend(v7, "progressivePersonalization");

  if (v8)
  {
    if (v8 == (id)1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      ((void (*)(_QWORD *, void *, void *, void *, void *))v6[2])(v6, v19, v20, v21, v22);

    }
    else if (v8 == (id)2)
    {
      v9 = dispatch_group_create();
      if (!-[FRPersonalizationAutoFavoritesOperation disregardCache](self, "disregardCache"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation cursor](self, "cursor"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastExternalSignalProcessingDate"));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation cursor](self, "cursor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastExternalSignalProcessingDate"));
          objc_msgSend(v14, "fc_timeIntervalUntilNow");
          v16 = v15;
          -[FRPersonalizationAutoFavoritesOperation signalProcessingTimeInterval](self, "signalProcessingTimeInterval");
          v18 = v17;

          if (v16 <= v18)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation maybeConsiderPortrait](self, "maybeConsiderPortrait"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation resultCursor](self, "resultCursor"));
      objc_msgSend(v24, "setLastPortraitAutoFavoriteResults:", v23);

      dispatch_group_enter(v9);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100026728;
      v29[3] = &unk_1000D9FC8;
      v29[4] = self;
      v30 = v9;
      -[FRPersonalizationAutoFavoritesOperation considerBiome:](self, "considerBiome:", v29);

LABEL_16:
      v25 = FCDispatchQueueForQualityOfService(-[FRPersonalizationAutoFavoritesOperation qualityOfService](self, "qualityOfService"));
      v26 = objc_claimAutoreleasedReturnValue(v25);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100026850;
      block[3] = &unk_1000D9D18;
      block[4] = self;
      v28 = v6;
      dispatch_group_notify(v9, v26, block);

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000798FC();
  }

}

- (double)metricMultiplierForTagID:(id)a3 withPriorFactorExponent:(double)a4 tagFavorabilityExponent:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  long double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  NSObject *v20;
  NSObject *v21;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation whitelist](self, "whitelist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultScoringConfig"));
  objc_msgSend(v11, "baselineRatePrior");
  v12 = FCPersonalizationBaselineClicksMultiplerForTagID(v8, v9);

  v13 = pow(v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation favorabilityScores](self, "favorabilityScores"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scoreForTagID:", v8));

  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    v18 = 0.0;
    if (v17 != 0.0)
    {
      objc_msgSend(v15, "doubleValue", 0.0);
      v18 = pow(v19, a5);
    }
    v13 = v13 * v18;
    v20 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
      sub_100079AD8((uint64_t)v15, (uint64_t)v8, v20);
  }
  else
  {
    v21 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
      sub_100079A64((uint64_t)v8, v21);
  }

  return v13;
}

- (double)ctrForTagID:(id)a3 withAggregate:(id)a4 baselineAggregate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation whitelist](self, "whitelist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultScoringConfig"));
  objc_msgSend(v14, "baselineRatePrior");
  FCPersonalizationBaselineClicksMultiplerForTagID(v10, v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  objc_msgSend(v15, "decayRate");
  objc_msgSend(v9, "personalizationValueWithBaseline:decayRate:baselineClicksMultiplier:", v8);
  v17 = v16;

  return v17;
}

- (BOOL)shouldAcceptAggregate:(id)a3 withCtr:(double)a4 minEvents:(double)a5 minClicks:(double)a6 minRate:(double)a7 baseRate:(double)a8 multiplier:(double)a9
{
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  BOOL v21;

  v15 = a3;
  v16 = (double)(unint64_t)objc_msgSend(v15, "eventCount");
  objc_msgSend(v15, "clicks");
  v18 = v17;

  v19 = a4 * a9;
  v20 = v16 * a9 >= a5;
  if (v18 * a9 < a6)
    v20 = 0;
  v21 = v19 >= a7;
  if (v19 < a8)
    v21 = 0;
  return v21 && v20;
}

- (BOOL)shouldRejectTagID:(id)a3 withAggregate:(id)a4 baseline:(id)a5 currentDate:(id)a6 addedDate:(id)a7 maxIdleTime:(double)a8 minEvents:(double)a9 minRate:(double)a10 baseRate:(double)a11 multiplier:(double)a12
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  unsigned __int8 v30;
  void *v31;
  double v32;

  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = v26;
  if (v22)
  {
    if (v23)
    {
      v28 = (double)(unint64_t)objc_msgSend(v23, "eventCount");
      -[FRPersonalizationAutoFavoritesOperation ctrForTagID:withAggregate:baselineAggregate:](self, "ctrForTagID:withAggregate:baselineAggregate:", v22, v23, v24);
      if (a9 * a12 <= v28)
      {
        v32 = v29 * a12;
        LOBYTE(v31) = v32 < a11 || v32 < a10;
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastModified"));
        v30 = objc_msgSend(v25, "fc_isWithinTimeInterval:ofDate:", v31, a8);

        LOBYTE(v31) = v30 ^ 1;
      }
    }
    else if (v26)
    {
      LODWORD(v31) = objc_msgSend(v25, "fc_isWithinTimeInterval:ofDate:", v26, a8) ^ 1;
    }
    else
    {
      LOBYTE(v31) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079B5C();
    LOBYTE(v31) = 1;
  }

  return (char)v31;
}

- (id)auditCandidates:(id)a3 autoSubscriptionAddedDateByTagId:(id)a4 multiplierProvider:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;

  v38 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation configurableValues](self, "configurableValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "autoFavoriteMaxIdleTime");
  v13 = v12;
  objc_msgSend(v10, "autoFavoriteMinEvents");
  v15 = v14;
  objc_msgSend(v10, "autoFavoriteMinRate");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "baselineAggregateWithConfigurableValues:", v10));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  objc_msgSend(v20, "decayRate");
  v22 = v21;

  objc_msgSend(v10, "autoFavoriteMinRelativeRate");
  v24 = v23;
  objc_msgSend(v19, "personalizationValueWithBaseline:decayRate:", 0, v22);
  v26 = v24 * v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesOperation aggregateStore](self, "aggregateStore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[FCTagIDFeature featuresFromTagIDs:](FCTagIDFeature, "featuresFromTagIDs:", v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "aggregatesForFeatures:", v29));

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000270A8;
  v39[3] = &unk_1000DA040;
  v39[4] = self;
  v40 = v30;
  v41 = v19;
  v42 = v11;
  v45 = v13;
  v46 = v15;
  v47 = v17;
  v48 = v26;
  v43 = v38;
  v44 = v8;
  v31 = v8;
  v32 = v38;
  v33 = v11;
  v34 = v19;
  v35 = v30;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fc_setByTransformingWithBlock:", v39));

  return v36;
}

- (FRPersonalizationAutoFavoritesCursor)cursor
{
  return self->_cursor;
}

- (FCPersonalizationTreatment)configurableValues
{
  return self->_configurableValues;
}

- (FCPersonalizationURLMapping)urlMapping
{
  return self->_urlMapping;
}

- (FCPersonalizationBundleIDMapping)bundleIDMapping
{
  return self->_bundleIDMapping;
}

- (FCPersonalizationWhitelist)whitelist
{
  return self->_whitelist;
}

- (FCPersonalizationFavorabilityScores)favorabilityScores
{
  return self->_favorabilityScores;
}

- (double)signalProcessingTimeInterval
{
  return self->_signalProcessingTimeInterval;
}

- (BOOL)disregardCache
{
  return self->_disregardCache;
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (FCTagRanking)tagRanker
{
  return self->_tagRanker;
}

- (FCReadonlyPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (TSLocationDetectionManagerType)locationManager
{
  return self->_locationManager;
}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (FCLocalAreasManager)localAreasManager
{
  return self->_localAreasManager;
}

- (id)autoFavoritesCompletionHandler
{
  return self->_autoFavoritesCompletionHandler;
}

- (FRPersonalizationAutoFavorites)resultAutoFavorites
{
  return self->_resultAutoFavorites;
}

- (void)setResultAutoFavorites:(id)a3
{
  objc_storeStrong((id *)&self->_resultAutoFavorites, a3);
}

- (FRPersonalizationAutoFavoritesCursor)resultCursor
{
  return self->_resultCursor;
}

- (void)setResultCursor:(id)a3
{
  objc_storeStrong((id *)&self->_resultCursor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCursor, 0);
  objc_storeStrong((id *)&self->_resultAutoFavorites, 0);
  objc_storeStrong(&self->_autoFavoritesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_localAreasManager, 0);
  objc_storeStrong((id *)&self->_appConfiguration, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_aggregateStore, 0);
  objc_storeStrong((id *)&self->_tagRanker, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_favorabilityScores, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_bundleIDMapping, 0);
  objc_storeStrong((id *)&self->_urlMapping, 0);
  objc_storeStrong((id *)&self->_configurableValues, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
}

@end
