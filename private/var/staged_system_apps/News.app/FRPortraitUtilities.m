@implementation FRPortraitUtilities

+ (id)candidatePortraitSignalsWithPortraitResults:(id)a3 disbabledTagIDs:(id)a4 globalThreshold:(double)a5 multiplierProvider:(id)a6 logBlock:(id)a7
{
  id v11;
  id v12;
  Block_layout *v13;
  id v14;
  Block_layout *v15;
  Block_layout *v16;
  id v17;
  id v18;
  Block_layout *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  Block_layout *v26;
  id v27;
  double v28;

  v11 = a3;
  v12 = a4;
  if (!a6)
    a6 = &stru_1000DA080;
  v13 = (Block_layout *)a7;
  v14 = objc_retainBlock(a6);
  if (v13)
    v15 = v13;
  else
    v15 = &stru_1000DA0A0;
  v16 = objc_retainBlock(v15);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000278CC;
  v23[3] = &unk_1000DA0F0;
  v28 = a5;
  v24 = v11;
  v25 = v12;
  v26 = v16;
  v27 = v14;
  v17 = v14;
  v18 = v12;
  v19 = v16;
  v20 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet fc_set:](NSSet, "fc_set:", v23));

  return v21;
}

+ (void)submitPortraitFeedbackForExplicitEngagementWithArticleID:(id)a3 topicIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = FRPortraitLog;
      if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v17 = v5;
        v18 = 2114;
        v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for explicit engagement with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[PPTopicStore defaultStore](PPTopicStore, "defaultStore"));
      objc_msgSend(v9, "setClientIdentifier:", CFSTR("news"));
      v10 = objc_msgSend(objc_alloc((Class)PPMappedFeedback), "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:mappingId:", v7, 0, 0, 0, CFSTR("news-topics"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100027EB4;
      v11[3] = &unk_1000DA118;
      v12 = v5;
      v13 = v7;
      objc_msgSend(v9, "registerFeedback:completion:", v10, v11);

    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100027E10;
      v14[3] = &unk_1000D9758;
      v14[4] = v5;
      sub_100027E10((uint64_t)v14);
    }
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100027D6C;
    v15[3] = &unk_1000D9758;
    v15[4] = v5;
    sub_100027D6C((uint64_t)v15);
  }

}

+ (void)submitPortraitFeedbackForExplicitRejectionWithArticleID:(id)a3 topicIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = FRPortraitLog;
      if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v17 = v5;
        v18 = 2114;
        v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for explicit rejection with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[PPTopicStore defaultStore](PPTopicStore, "defaultStore"));
      objc_msgSend(v9, "setClientIdentifier:", CFSTR("news"));
      v10 = objc_msgSend(objc_alloc((Class)PPMappedFeedback), "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:mappingId:", 0, v7, 0, 0, CFSTR("news-topics"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000282F0;
      v11[3] = &unk_1000DA118;
      v12 = v5;
      v13 = v7;
      objc_msgSend(v9, "registerFeedback:completion:", v10, v11);

    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10002824C;
      v14[3] = &unk_1000D9758;
      v14[4] = v5;
      sub_10002824C((uint64_t)v14);
    }
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000281A8;
    v15[3] = &unk_1000D9758;
    v15[4] = v5;
    sub_1000281A8((uint64_t)v15);
  }

}

+ (void)submitPortraitFeedbackForImplicitEngagementWithArticleID:(id)a3 topicIDs:(id)a4 portraitAutofavoriteCandidates:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = FRPortraitLog;
      if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v18 = v7;
        v19 = 2114;
        v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for implicit engagement with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PPTopicStore defaultStore](PPTopicStore, "defaultStore"));
      objc_msgSend(v11, "setClientIdentifier:", CFSTR("news"));
      v12 = objc_msgSend(objc_alloc((Class)PPMappedFeedback), "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:mappingId:", 0, 0, v8, 0, CFSTR("news-topics"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100028660;
      v13[3] = &unk_1000DA118;
      v14 = v7;
      v15 = v8;
      objc_msgSend(v11, "registerFeedback:completion:", v12, v13);

    }
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000285BC;
    v16[3] = &unk_1000D9758;
    v16[4] = v7;
    sub_1000285BC((uint64_t)v16);
  }

}

+ (void)submitPortraitFeedbackForImplicitRejectionWithArticleID:(id)a3 topicIDs:(id)a4 portraitAutofavoriteCandidates:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = FRPortraitLog;
      if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v18 = v7;
        v19 = 2114;
        v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for implicit rejection with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PPTopicStore defaultStore](PPTopicStore, "defaultStore"));
      objc_msgSend(v11, "setClientIdentifier:", CFSTR("news"));
      v12 = objc_msgSend(objc_alloc((Class)PPMappedFeedback), "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:mappingId:", 0, 0, 0, v8, CFSTR("news-topics"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000289D0;
      v13[3] = &unk_1000DA118;
      v14 = v7;
      v15 = v8;
      objc_msgSend(v11, "registerFeedback:completion:", v12, v13);

    }
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002892C;
    v16[3] = &unk_1000D9758;
    v16[4] = v7;
    sub_10002892C((uint64_t)v16);
  }

}

@end
