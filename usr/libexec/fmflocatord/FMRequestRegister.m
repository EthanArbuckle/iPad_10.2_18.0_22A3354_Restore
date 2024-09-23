@implementation FMRequestRegister

- (void)deinitializeRequest
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FMRequestRegister;
  -[FMRequest deinitializeRequest](&v2, "deinitializeRequest");
}

- (FMRequestRegister)initWithProvider:(id)a3 andCause:(id)a4
{
  id v6;
  FMRequestRegister *v7;
  FMRequestRegister *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMRequestRegister;
  v7 = -[FMRequest initWithProvider:](&v14, "initWithProvider:", a3);
  v8 = v7;
  if (v7)
  {
    -[FMRequestRegister setCause:](v7, "setCause:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v6));
    -[FMRequestRegister setRegisteredCauses:](v8, "setRegisteredCauses:", v9);

    v10 = -[FMRequestRegister newRequestBody](v8, "newRequestBody");
    -[FMRequestRegister setRequestBody:](v8, "setRequestBody:", v10);

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("wristStateChanged")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
      v12 = objc_msgSend(v11, "wristRegisterRetryCount");
LABEL_6:
      -[FMRequestRegister setNonEssentialRetryCount:](v8, "setNonEssentialRetryCount:", v12);

      goto LABEL_7;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("networkStateChanged")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
      v12 = objc_msgSend(v11, "networkRegisterRetryCount");
      goto LABEL_6;
    }
  }
LABEL_7:

  return v8;
}

- (id)requestUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formattedURLForTemplate:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/register")));

  return v3;
}

- (id)newRequestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMRequestRegister;
  v3 = -[FMRequest requestBody](&v13, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "registerDeviceContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister cause](self, "cause"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("cause"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister registeredCauses](self, "registeredCauses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("registeredCauses"), v9);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fullDeviceInfo"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("deviceInfo"));

  return v4;
}

- (double)maxRetryInterval
{
  return 3600.0;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return -1;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return -1;
}

- (BOOL)canRequestBeRetriedNow
{
  uint64_t v3;
  objc_super v5;

  v3 = -[FMRequestRegister nonEssentialRetryCount](self, "nonEssentialRetryCount");
  -[FMRequestRegister setNonEssentialRetryCount:](self, "setNonEssentialRetryCount:", v3 - 1);
  if (v3 < 1)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)FMRequestRegister;
  return -[FMRequest canRequestBeRetriedNow](&v5, "canRequestBeRetriedNow");
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t v24[16];
  uint8_t buf[16];

  v4 = a3;
  v6 = objc_opt_class(FMRequestRegister, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    || (v8 = objc_opt_class(FMRequestQueueCheck, v7), (objc_opt_isKindOfClass(v4, v8) & 1) != 0))
  {
    v9 = objc_opt_class(FMRequestRegister, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
    {
LABEL_14:
      v16 = objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
      v17 = v16 == v22;

      goto LABEL_15;
    }
    v10 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister registeredCauses](self, "registeredCauses"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "registeredCauses"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
    objc_msgSend(v11, "addObjectsFromArray:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister registeredCauses](self, "registeredCauses"));
    if (objc_msgSend(v14, "containsObject:", CFSTR("wristStateChanged")))
    {

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister registeredCauses](self, "registeredCauses"));
      v19 = objc_msgSend(v18, "containsObject:", CFSTR("networkStateChanged"));

      if (!v19)
      {
LABEL_11:
        v20 = sub_10001C4E8();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Replaced FMRequestRegister with new register.", v24, 2u);
        }

        goto LABEL_14;
      }
    }
    -[FMRequestRegister setNonEssentialRetryCount:](self, "setNonEssentialRetryCount:", objc_msgSend(v10, "nonEssentialRetryCount"));
    goto LABEL_11;
  }
  v15 = sub_10001C4E8();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request not FMRequestRegister or FMRequestQueueCheck. Not replacing.", buf, 2u);
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (id)retryCauseExclusions
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[2];

  v2 = objc_alloc((Class)NSSet);
  v6[0] = CFSTR("wristStateChanged");
  v6[1] = CFSTR("networkStateChanged");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  v4 = objc_msgSend(v2, "initWithArray:", v3);

  return v4;
}

- (id)registrationInformationDigestIncludingKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister requestBody](self, "requestBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceInfo")));

  v8[0] = CFSTR("lastActiveTime");
  v8[1] = CFSTR("processId");
  v8[2] = CFSTR("unlockState");
  v8[3] = CFSTR("lastOnWristTime");
  v8[4] = CFSTR("wristStatus");
  v8[5] = CFSTR("connectionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 6));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister _informationDigestForDeviceInfoDictionary:keysToExclude:](self, "_informationDigestForDeviceInfoDictionary:keysToExclude:", v4, v5));

  return v6;
}

- (id)_informationDigestForDeviceInfoDictionary:(id)a3 keysToExclude:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v35;
  FMRequestRegister *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  unsigned __int8 md[20];

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v9, "removeObjectsForKeys:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("otherDevices")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000252B0;
  v42[3] = &unk_100056330;
  v39 = v7;
  v43 = v39;
  v12 = v11;
  v44 = v12;
  v40 = v10;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v42);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("otherDevices"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister flattenedArrayFromObject:parentIndices:](self, "flattenedArrayFromObject:parentIndices:", v9, &off_10005B158));
  v14 = objc_msgSend(v13, "mutableCopy");

  v36 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastForcedRegisterTimePrefKey"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dateForKey:inDomain:](FMPreferencesUtil, "dateForKey:inDomain:", v16, CFSTR("com.apple.icloud.fmflocatord.notbackedup")));
  objc_msgSend(v14, "addObject:", CFSTR("lastForcedTime"));
  if (!v17)
  {
    objc_msgSend(v14, "addObject:", CFSTR("null"));
    if (v14)
      goto LABEL_3;
LABEL_13:
    v26 = 0;
    goto LABEL_14;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v17));
  objc_msgSend(v14, "addObject:", v18);

  if (!v14)
    goto LABEL_13;
LABEL_3:
  v37 = v12;
  v38 = v16;
  v19 = v6;
  v20 = v8;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", ")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("authToken.*,"), 1, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByReplacingMatchesInString:options:range:withTemplate:", v21, 0, 0, objc_msgSend(v21, "length"), CFSTR("authToken_redacted,")));
  v24 = sub_10001C4E8();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    sub_100035518((uint64_t)v23, v25);

  v41 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v14, 0, &v41));
  v27 = v41;
  if (v27)
  {
    v35 = v20;
    v28 = sub_10001C4E8();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10003546C(v36, (uint64_t)v27, v29);

    v30 = sub_10001C5C8();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1000353F8((uint64_t)v23, v31);

    v20 = v35;
  }

  v8 = v20;
  v6 = v19;
  v12 = v37;
  v16 = v38;
LABEL_14:
  v32 = objc_retainAutorelease(v26);
  CC_SHA1(objc_msgSend(v32, "bytes"), (CC_LONG)objc_msgSend(v32, "length"), md);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 20));

  objc_autoreleasePoolPop(v8);
  return v33;
}

- (id)flattenedArrayFromObject:(id)a3 parentIndices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void **v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10002555C;
  v30 = sub_10002556C;
  v9 = &__NSArray0__struct;
  if (v7)
    v9 = v7;
  v31 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = objc_opt_class(NSDictionary, v11);
  v14 = objc_opt_class(NSArray, v13);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v15 = v6;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100025574;
    v24[3] = &unk_100056358;
    v25[3] = v12;
    v25[4] = v14;
    v25[0] = v10;
    v25[1] = self;
    v25[2] = &v26;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v24);
    v16 = (void **)v25;
  }
  else
  {
    if ((objc_opt_isKindOfClass(v6, v14) & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "componentsJoinedByString:", CFSTR("_")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v19, v6));
      objc_msgSend(v10, "addObject:", v18);
      goto LABEL_9;
    }
    v17 = v6;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100025698;
    v22[3] = &unk_100056380;
    v23[2] = &v26;
    v23[0] = v10;
    v23[1] = self;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v22);
    v16 = (void **)v23;
  }
  v18 = *v16;
  v19 = v6;
LABEL_9:

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingSelector:", "compare:"));
  _Block_object_dispose(&v26, 8);

  return v20;
}

- (NSMutableDictionary)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
  objc_storeStrong((id *)&self->_requestBody, a3);
}

- (int64_t)nonEssentialRetryCount
{
  return self->_nonEssentialRetryCount;
}

- (void)setNonEssentialRetryCount:(int64_t)a3
{
  self->_nonEssentialRetryCount = a3;
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_storeStrong((id *)&self->_cause, a3);
}

- (NSMutableSet)registeredCauses
{
  return self->_registeredCauses;
}

- (void)setRegisteredCauses:(id)a3
{
  objc_storeStrong((id *)&self->_registeredCauses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredCauses, 0);
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
}

@end
