@implementation FMFFenceSequencer

- (void)setFencesFromResponseDictionary:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceDictionariesFromResponseDictionary:](self, "fenceDictionariesFromResponseDictionary:", a3));
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[FMFFenceSequencer setFencesFromResponseDictionary:withCompletion:]";
    v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: fenceDictionaries: %@", buf, 0x16u);
  }

  if (v7)
  {
    v10 = objc_msgSend((id)objc_opt_class(self), "fencesFromFenceDictionaries:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[FMFFenceSequencer setFencesFromResponseDictionary:withCompletion:]";
      v21 = 2112;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: fences: %@", buf, 0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fm_map:", &stru_10009B0A8));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
    objc_msgSend(v15, "setFencesWithoutCKData:", v14);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100052A10;
    v18[3] = &unk_10009B0D0;
    v18[4] = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fm_map:", v18));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
    objc_msgSend(v17, "setFences:", v16);

    v6[2](v6, 1, 0);
  }
  else
  {
    v6[2](v6, 0, 0);
  }

}

- (id)fenceDictionariesFromResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("myFencesISet")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v5 == v6)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("myFencesISet")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("myFencesOthersSet")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v8 == v9)
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("myFencesOthersSet")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friendFencesISet")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v11 == v12)
    v13 = 0;
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friendFencesISet")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friendFencesOthersSet")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v14 == v15)
    v16 = 0;
  else
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friendFencesOthersSet")));

  if (v7)
  {
    -[FMFFenceSequencer setFencesOnMeByMe:](self, "setFencesOnMeByMe:", v7);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnMeByMe](self, "fencesOnMeByMe"));
    -[FMFFenceSequencer setFencesOnMeByMe:](self, "setFencesOnMeByMe:", v17);

  }
  if (v10)
  {
    -[FMFFenceSequencer setFencesOnMeByOthers:](self, "setFencesOnMeByOthers:", v10);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnMeByOthers](self, "fencesOnMeByOthers"));
    -[FMFFenceSequencer setFencesOnMeByOthers:](self, "setFencesOnMeByOthers:", v18);

  }
  if (v13)
  {
    -[FMFFenceSequencer setFencesOnOthersByMe:](self, "setFencesOnOthersByMe:", v13);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnOthersByMe](self, "fencesOnOthersByMe"));
    -[FMFFenceSequencer setFencesOnOthersByMe:](self, "setFencesOnOthersByMe:", v19);

  }
  if (v16)
  {
    -[FMFFenceSequencer setFencesOnOthersByOthers:](self, "setFencesOnOthersByOthers:", v16);
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnOthersByOthers](self, "fencesOnOthersByOthers"));
    -[FMFFenceSequencer setFencesOnOthersByOthers:](self, "setFencesOnOthersByOthers:", v25);

    if (!v7 && !v10 && !v13)
    {
      v20 = 0;
      goto LABEL_29;
    }
  }
  v20 = objc_opt_new(NSMutableArray);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnMeByMe](self, "fencesOnMeByMe"));
  -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnMeByOthers](self, "fencesOnMeByOthers"));
  -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnOthersByMe](self, "fencesOnOthersByMe"));
  -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fencesOnOthersByOthers](self, "fencesOnOthersByOthers"));
  -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v24);

LABEL_29:
  return v20;
}

- (NSSet)fences
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fences"));

  return (NSSet *)v3;
}

- (FMFFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (void)setFencesOnOthersByOthers:(id)a3
{
  objc_storeStrong((id *)&self->_fencesOnOthersByOthers, a3);
}

- (void)setFencesOnOthersByMe:(id)a3
{
  objc_storeStrong((id *)&self->_fencesOnOthersByMe, a3);
}

- (void)setFencesOnMeByOthers:(id)a3
{
  objc_storeStrong((id *)&self->_fencesOnMeByOthers, a3);
}

- (void)setFencesOnMeByMe:(id)a3
{
  objc_storeStrong((id *)&self->_fencesOnMeByMe, a3);
}

- (NSArray)fencesOnOthersByOthers
{
  return self->_fencesOnOthersByOthers;
}

- (NSArray)fencesOnOthersByMe
{
  return self->_fencesOnOthersByMe;
}

- (NSArray)fencesOnMeByOthers
{
  return self->_fencesOnMeByOthers;
}

- (NSArray)fencesOnMeByMe
{
  return self->_fencesOnMeByMe;
}

- (FMFFenceSequencer)initWithFenceManager:(id)a3
{
  id v5;
  FMFFenceSequencer *v6;
  FMFFenceSequencer *v7;
  NSArray *fencesOnMeByMe;
  NSArray *fencesOnMeByOthers;
  NSArray *fencesOnOthersByMe;
  NSArray *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMFFenceSequencer;
  v6 = -[FMFFenceSequencer init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fenceManager, a3);
    -[FMFFenceManager setDelegate:](v7->_fenceManager, "setDelegate:", v7);
    fencesOnMeByMe = v7->_fencesOnMeByMe;
    v7->_fencesOnMeByMe = (NSArray *)&__NSArray0__struct;

    fencesOnMeByOthers = v7->_fencesOnMeByOthers;
    v7->_fencesOnMeByOthers = (NSArray *)&__NSArray0__struct;

    fencesOnOthersByMe = v7->_fencesOnOthersByMe;
    v7->_fencesOnOthersByMe = (NSArray *)&__NSArray0__struct;

    v11 = v7->_fencesOnOthersByMe;
    v7->_fencesOnOthersByMe = (NSArray *)&__NSArray0__struct;

  }
  return v7;
}

- (void)reset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
  objc_msgSend(v2, "reset");

}

- (void)updateFenceInCK:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  FMFFenceSequencer *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (objc_msgSend(v6, "shouldUseCloudKitStore") && objc_msgSend(v6, "isFromMe"))
    {
      v8 = (void *)objc_opt_class(self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100050590;
      v19[3] = &unk_10009AF00;
      v20 = v6;
      v21 = self;
      v22 = v7;
      objc_msgSend(v8, "ckUpdateRecordForFence:withCompletion:", v20, v19);

    }
    else
    {
      -[FMFFenceSequencer _addFence:clientSession:ckShare:completion:](self, "_addFence:clientSession:ckShare:completion:", v6, 0, 0, v7);
    }
  }
  else
  {
    v9 = sub_100011D0C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100065A4C(v10, v11, v12, v13, v14, v15, v16, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFFenceErrorDomain, 10, 0));
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A1230);
  }

}

- (void)addFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  FMFFenceSequencer *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  _QWORD v34[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if ((objc_msgSend(v8, "isRegionAllowed") & 1) != 0)
    {
      if (objc_msgSend(v8, "shouldUseCloudKitStore") && objc_msgSend(v8, "isFromMe"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recipients"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100050A70;
        v28[3] = &unk_10009AF78;
        v29 = v8;
        v32 = v10;
        v30 = self;
        v31 = v9;
        objc_msgSend(v11, "hasIDSFenceCapabilityForHandle:withCompletion:", v13, v28);

      }
      else
      {
        -[FMFFenceSequencer _addFence:clientSession:ckShare:completion:](self, "_addFence:clientSession:ckShare:completion:", v8, v9, 0, v10);
      }
    }
    else
    {
      v33[0] = CFSTR("fenceType");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "type"));
      v34[0] = v24;
      v33[1] = CFSTR("fenceTriggerType");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trigger"));
      v34[1] = v25;
      v34[2] = &off_1000A0FF0;
      v33[2] = CFSTR("addFenceSuccess");
      v33[3] = CFSTR("addFenceError");
      v34[3] = CFSTR("FMFFenceErrorRegionUnavailable");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 4));
      AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFFenceErrorDomain, 6, 0));
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v27);

    }
  }
  else
  {
    v14 = sub_100011D0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100065B28(v15, v16, v17, v18, v19, v20, v21, v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFFenceErrorDomain, 10, 0));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v23);

    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A1258);
  }

}

- (void)_addFence:(id)a3 clientSession:(id)a4 ckShare:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FMFFenceSequencer *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000511AC;
  v19[3] = &unk_10009AFA0;
  v20 = v10;
  v21 = self;
  v23 = v11;
  v24 = v13;
  v22 = v12;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v10;
  objc_msgSend(v14, "updateFence:clientSession:completion:", v18, v15, v19);

}

- (void)triggerRepeatedFence:(id)a3 clientSesssion:(id)a4 afterAccpetanceWithCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isRecurring"))
  {
    if (objc_msgSend(v8, "isOnMe"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "acceptanceStatus"));
      v12 = FMFFenceAcceptanceStatusAccepted;
      v13 = objc_msgSend(v11, "isEqualToString:", FMFFenceAcceptanceStatusAccepted);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "triggerForRepeatedFenceBeforeAcceptanceWithFence:", v8));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("FMFPreAcceptanceFenceTriggerStatus")));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("FMFPreAcceptanceFenceTriggerDate")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("FMFPreAcceptanceFenceTriggerLocation")));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          objc_msgSend(v19, "timeIntervalSinceDate:", v17);
          v21 = v20;

          v22 = sub_100011D0C();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v21 <= 3600.0)
          {
            v33 = v18;
            v34 = v16;
            if (v24)
            {
              *(_DWORD *)buf = 136315138;
              v39 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Invite was sent less than an hour ago. Show fence trigger notification.", buf, 0xCu);
            }

            v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100051AD4;
            v35[3] = &unk_10009AB58;
            v35[4] = self;
            v36 = v8;
            v37 = v10;
            objc_msgSend(v28, "triggerAfterAcceptanceWithUUID:forFencewithID:withStatus:withAcceptanceStatus:atDate:triggerLocation:clientSession:completion:", v29, v30, v34, v12, v17, v33, v9, v35);

            v18 = v33;
            v16 = v34;

          }
          else
          {
            if (v24)
            {
              *(_DWORD *)buf = 136315138;
              v39 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Invite was sent over an hour ago, do not show stale fence trigger notification.", buf, 0xCu);
            }

            (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
          }

        }
        else
        {
          v25 = sub_100011D0C();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
            *(_DWORD *)buf = 136315394;
            v39 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
            v40 = 2112;
            v41 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: No trigger information for fence: %@", buf, 0x16u);

          }
          (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
        }

      }
    }
  }
  v31 = sub_100011D0C();
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[FMFFenceSequencer triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: Conditions not met for triggering repeated fence after acceptance.", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
}

- (void)removeFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  FMFFenceSequencer *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "setActive:", 0);
    if (objc_msgSend(v8, "shouldUseCloudKitStore") && objc_msgSend(v8, "isFromMe"))
    {
      v11 = (void *)objc_opt_class(self);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100051CD4;
      v22[3] = &unk_10009AFC8;
      v23 = v8;
      v26 = v10;
      v24 = self;
      v25 = v9;
      objc_msgSend(v11, "ckDeleteRecordForFence:withCompletion:", v23, v22);

    }
    else
    {
      -[FMFFenceSequencer _removeFence:clientSession:completion:](self, "_removeFence:clientSession:completion:", v8, v9, v10);
    }
  }
  else
  {
    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100065D4C(v13, v14, v15, v16, v17, v18, v19, v20);

    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A1280);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFFenceErrorDomain, 10, 0));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v21);

  }
}

- (void)_removeFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  FMFFenceSequencer *v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100051F44;
  v14[3] = &unk_10009AB58;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "updateFence:clientSession:completion:", v13, v10, v14);

}

- (void)cleanupRemovedFenceInformationWithFenceID:(id)a3 ckRecordID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
  objc_msgSend(v8, "clearStaleStatusForRemovedFenceID:", v7);

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100052318;
    v10[3] = &unk_10009AFF0;
    v11 = v6;
    objc_msgSend(v9, "deleteRecordWithRecordID:inDatabaseWithScope:withCompletion:", v11, 2, v10);

  }
}

+ (void)ckCheckForStaleZonesForFence:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ckRecordID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordWithID:inScope:", v8, 2));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000524A4;
    v12[3] = &unk_10009B018;
    v12[4] = v9;
    v13 = v5;
    objc_msgSend(v10, "deleteRecordWithRecordID:inDatabaseWithScope:withCompletion:", v11, 2, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

+ (void)ckDeleteRecordForFence:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ckRecordID"));

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordWithID:inScope:", v8, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
  objc_msgSend(v9, "deleteRecordWithRecordID:inDatabaseWithScope:withCompletion:", v10, 2, v5);

}

+ (void)ckUpdateRecordForFence:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100052694;
  v8[3] = &unk_10009B040;
  v9 = a3;
  v10 = a4;
  v6 = v9;
  v7 = v10;
  objc_msgSend(a1, "ckCreateRecordForFence:withCompletion:", v6, v8);

}

+ (void)ckCreateRecordForFence:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000527DC;
  v8[3] = &unk_10009B068;
  v9 = a3;
  v10 = a4;
  v6 = v9;
  v7 = v10;
  objc_msgSend(a1, "ckCreateRecordIDForFence:withCompletion:", v6, v8);

}

+ (void)ckCreateRecordIDForFence:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  v8 = (void *)objc_opt_class(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ckRecordZoneNameForRecordName:", v11));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  objc_msgSend(v10, "createIDForRecordWithName:inZoneWithName:withCompletion:", v11, v9, v5);

}

- (void)setFences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
  objc_msgSend(v5, "setFences:", v4);

}

- (id)updatedFenceForFence:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;

  v3 = a3;
  if ((objc_msgSend(v3, "isSupported") & 1) != 0)
  {
    if ((objc_msgSend(v3, "shouldUseCloudKitStore") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ckRecordID"));
      if (v4)
      {
        if (objc_msgSend(v3, "isFromMe"))
          v5 = 2;
        else
          v5 = 3;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordWithID:inScope:", v4, v5));

        if (v7)
        {
          objc_msgSend(v3, "updateFromRecord:", v7);
          v8 = v3;
LABEL_20:

          goto LABEL_21;
        }
        v18 = sub_100011D0C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100066048();

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type", CFSTR("fenceType")));
        v23[0] = v16;
        v22[1] = CFSTR("fenceTriggerType");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trigger"));
        v22[2] = CFSTR("receiveFenceError");
        v23[1] = v17;
        v23[2] = CFSTR("FMFErrorFenceNoRecordFound");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
        AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v20);

      }
      else
      {
        v14 = sub_100011D0C();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_100065FDC();

        v24[0] = CFSTR("fenceType");
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
        v25[0] = v7;
        v24[1] = CFSTR("fenceTriggerType");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trigger"));
        v24[2] = CFSTR("receiveFenceError");
        v25[1] = v16;
        v25[2] = CFSTR("FMFErrorFenceNoRecordID");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3));
        AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v17);
      }

      v8 = 0;
      goto LABEL_20;
    }
    v8 = v3;
  }
  else
  {
    v9 = sub_100011D0C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[FMFFenceSequencer updatedFenceForFence:]";
      v30 = 2112;
      v31 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: unsupported fence %@", buf, 0x16u);
    }

    v26[0] = CFSTR("fenceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
    v27[0] = v11;
    v26[1] = CFSTR("fenceTriggerType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trigger"));
    v26[2] = CFSTR("receiveFenceError");
    v27[1] = v12;
    v27[2] = CFSTR("FMFErrorFenceNotSupported");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 3));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v13);

    v8 = 0;
  }
LABEL_21:

  return v8;
}

+ (id)fencesFromFenceDictionaries:(id)a3
{
  id v3;
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dsid"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12);
        v14 = objc_alloc((Class)FMFFence);
        v15 = objc_msgSend(v14, "initWithDictionary:", v13, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "createdByIdentifier"));
        v17 = objc_msgSend(v16, "isEqualToString:", v7);

        if (v17)
          objc_msgSend(v15, "setFromMe:", 1);
        if (v15)
          -[NSMutableSet addObject:](v4, "addObject:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v4;
}

- (id)fencesForHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fencesForHandles:", v4));

  return v6;
}

- (id)recurringAndScheduledFencesForHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recurringAndScheduledFencesForHandles:", v4));

  return v6;
}

- (void)removeUnrecoverableManateeFences:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void (**v16)(_QWORD);
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];

  v6 = a3;
  v16 = (void (**)(_QWORD))a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "shouldUseCloudKitStore");
        v13 = sub_100011D0C();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[FMFFenceSequencer removeUnrecoverableManateeFences:withCompletion:]";
            v24 = 2112;
            v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Remove fence due to keychain loss %@, ", buf, 0x16u);
          }

          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100053214;
          v17[3] = &unk_10009AD30;
          v17[4] = v11;
          -[FMFFenceSequencer removeFence:clientSession:completion:](self, "removeFence:clientSession:completion:", v11, 0, v17);
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[FMFFenceSequencer removeUnrecoverableManateeFences:withCompletion:]";
            v24 = 2112;
            v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: No need to remove fence. This fence does not use CloudKit. Fence: %@, ", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v8);
  }
  v16[2](v16);

}

- (void)handleIdentityLossWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceSequencer fenceManager](self, "fenceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fences"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000533A4;
  v8[3] = &unk_10009B0F8;
  v9 = v4;
  v7 = v4;
  -[FMFFenceSequencer removeUnrecoverableManateeFences:withCompletion:](self, "removeUnrecoverableManateeFences:withCompletion:", v6, v8);

}

- (void)fenceManager:(id)a3 didModifyFence:(id)a4 clientSession:(id)a5 withCompletion:(id)a6
{
  -[FMFFenceSequencer addFence:clientSession:completion:](self, "addFence:clientSession:completion:", a4, a5, a6);
}

- (void)fenceManager:(id)a3 didModifyFence:(id)a4 withCompletion:(id)a5
{
  -[FMFFenceSequencer updateFenceInCK:completion:](self, "updateFenceInCK:completion:", a4, a5);
}

- (id)FMFErrorAsString:(int64_t)a3
{
  id result;

  result = CFSTR("FMFErrorUnknown");
  if (a3 <= 999)
  {
    switch(a3)
    {
      case 'e':
        result = CFSTR("FMFErrorFriendNotFound");
        break;
      case 'f':
        result = CFSTR("FMFErrorFollowerNotFound");
        break;
      case 'g':
        result = CFSTR("FMFErrorMaxFriendsLimitReached");
        break;
      case 'h':
        result = CFSTR("FMFErrorMaxFollowersLimitReached");
        break;
      case 'i':
        result = CFSTR("FMFErrorThisDeviceIsRestricted");
        break;
      case 'j':
        result = CFSTR("FMFErrorThisDeviceShareMyLocationSystemServiceDisabled");
        break;
      case 'k':
        result = CFSTR("FMFErrorThisDeviceGlobalLocationServicesDisabled");
        break;
      case 'l':
        result = CFSTR("FMFErrorThisDeviceIsAlreadyMeDevice");
        break;
      default:
        switch(a3)
        {
          case 201:
            result = CFSTR("FMFErrorMappingPacketImportFailed");
            break;
          case 202:
            result = CFSTR("FMFErrorMappingPacketSendFailed");
            break;
          case 203:
            result = CFSTR("FMFErrorHideFromFollowersIsEnabled");
            break;
          case 204:
            result = CFSTR("FMFErrorNoMappingPacketReturned");
            break;
          case 205:
            result = CFSTR("FMFErrorMappingPacketImportNotSupported");
            break;
          default:
            if (a3 == 503)
              result = CFSTR("FMFErrorServer");
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1000:
        result = CFSTR("FMFErrorNoAccount");
        break;
      case 1001:
        result = CFSTR("FMFErrorNoAuthToken");
        break;
      case 1002:
        result = CFSTR("FMFErroriCloudAccountChanged");
        break;
      case 1003:
        result = CFSTR("FMFErrorServerErrorUnauthorized");
        break;
      case 1004:
        result = CFSTR("FMFErrorServerErrorInvalidCredentials");
        break;
      case 1005:
        result = CFSTR("FMFErrorServerForbiddenRegion");
        break;
      case 1006:
        result = CFSTR("FMFErrorServerErrorInternal");
        break;
      case 1007:
        result = CFSTR("FMFErrorServerErrorServiceUnavailable");
        break;
      case 1008:
        result = CFSTR("FMFErrorServerErrorTimeout");
        break;
      case 1009:
        result = CFSTR("FMFErrorNoNetwork");
        break;
      case 1010:
        result = CFSTR("FMFErrorNotFirstUnlocked");
        break;
      case 1011:
        result = CFSTR("FMFErrorInitCommandFailed");
        break;
      case 1012:
        result = CFSTR("FMFErrorPayloadDecryptionFailed");
        break;
      case 1013:
        result = CFSTR("FMFErrorNoContactMatching");
        break;
      case 1014:
        result = CFSTR("FMFErrorPayloadLengthUnsupported");
        break;
      case 1015:
        result = CFSTR("FMFErrorMinRefreshingCallback");
        break;
      case 1016:
        result = CFSTR("FMFErrorModelNotInitialized");
        break;
      case 1017:
        result = CFSTR("FMFErrorNoIDSAccount");
        break;
      case 1018:
        result = CFSTR("FMFErrorCloudKitOtherError");
        break;
      case 1019:
        result = CFSTR("FMFErrorXPCConnectionInterrupted");
        break;
      case 1020:
        result = CFSTR("FMFErrorXPCConnectionInvalidated");
        break;
      default:
        return result;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fencesOnOthersByOthers, 0);
  objc_storeStrong((id *)&self->_fencesOnOthersByMe, 0);
  objc_storeStrong((id *)&self->_fencesOnMeByOthers, 0);
  objc_storeStrong((id *)&self->_fencesOnMeByMe, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
}

@end
