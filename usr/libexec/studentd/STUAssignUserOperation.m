@implementation STUAssignUserOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___STUAssignUserOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___STUAssignUserRequest) & 1) == 0)
  {
    if (a4)
    {
      v8 = CATErrorWithCodeAndUserInfo(2, &off_1000D2D68);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v8);
      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUAssignUserOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUAssignUserOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "loginDidCompleteWithError:", 0, 0);
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation sharediPadPrimitives](self, "sharediPadPrimitives", a3));

  if (v4)
  {
    -[STUTaskOperation requestToBecomeExclusive](self, "requestToBecomeExclusive");
  }
  else
  {
    v5 = CRKErrorWithCodeAndUserInfo(39, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    -[STUAssignUserOperation endOperationWithError:](self, "endOperationWithError:", v6);

  }
}

- (void)exclusivityRequestDidComplete:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _UNKNOWN **v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  NSMutableDictionary *v41;

  v4 = a3;
  if (-[STUAssignUserOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUAssignUserOperation isCancelled](self, "isCancelled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STUAssignUserOperation endOperationWithError:](self, "endOperationWithError:", v6);
LABEL_33:

      goto LABEL_34;
    }
    if (v4)
    {
      -[STUAssignUserOperation endOperationWithError:](self, "endOperationWithError:", v4);
      goto LABEL_34;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation assignRequest](self, "assignRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configurationManager"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupNameWithBeaconID:", v9));

    if (!v10)
      objc_msgSend(v6, "setGroupID:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));

    if (!v11)
    {
      -[STUAssignUserOperation assignUserWithRetriesLeft:](self, "assignUserWithRetriesLeft:", &off_1000D40E0);
LABEL_32:

      goto LABEL_33;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userDictionaryWithIdentifier:", v12));

    if (!v13
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("isAuxilary"))),
          v15 = objc_msgSend(v14, "BOOLValue"),
          v14,
          v15))
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
      if (v16
        && (v17 = (void *)v16,
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleID")),
            v18,
            v17,
            v18))
      {
        v19 = objc_opt_new(NSMutableDictionary);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v20, kCRKEDUUserIdentifierKey);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, kCRKEDUUserNameKey);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleID"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v22, kCRKEDUUserAppleIDKey);

        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isAuxilary"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "givenName"));

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "givenName"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v24, kCRKEDUUserGivenNameKey);

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "familyName"));

        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "familyName"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v26, kCRKEDUUserFamilyNameKey);

        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageURL"));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageURL"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v28, kCRKEDUUserImageURLKey);

        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullScreenImageURL"));

        if (v29)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullScreenImageURL"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v30, kCRKEDUUserFullScreenImageURLKey);

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passcodeType"));

        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passcodeType"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v32, kCRKEDUUserPasscodeType);

        }
        if (objc_msgSend(v8, "upsertUserDictionary:", v19))
        {
          notify_post("com.apple.studentd.configuration.didchange");

          v33 = &off_1000D40F8;
LABEL_28:
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stu_enrolledGroupIdentifiers"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));
          objc_msgSend(v8, "addEnrolledControlGroupIdentifiers:forUserWithIdentifier:", v37, v38);

          -[STUAssignUserOperation assignUserWithRetriesLeft:](self, "assignUserWithRetriesLeft:", v33);
LABEL_31:

          goto LABEL_32;
        }
        v39 = CRKErrorWithCodeAndUserInfo(105, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v39);
        -[STUAssignUserOperation endOperationWithError:](self, "endOperationWithError:", v34);
      }
      else
      {
        v40 = CFSTR("kCRKInvalidIdentifierErrorKey");
        v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));
        v41 = v19;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        v35 = CRKErrorWithCodeAndUserInfo(104, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        -[STUAssignUserOperation endOperationWithError:](self, "endOperationWithError:", v36);

      }
      goto LABEL_31;
    }
    v33 = &off_1000D40E0;
    goto LABEL_28;
  }
LABEL_34:

}

- (void)assignUserWithRetriesLeft:(id)a3
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
  id v13;
  _QWORD v14[4];
  id v15;
  STUAssignUserOperation *v16;
  uint8_t buf[4];
  STUAssignUserOperation *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation assignRequest](self, "assignRequest"));
  v6 = sub_100012A38();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userIdentifier"));
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v8;
    v21 = 2114;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Assigning user %{public}@ with retries left %{public}@", buf, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation sharediPadPrimitives](self, "sharediPadPrimitives"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100012A78;
  v14[3] = &unk_1000C9DA0;
  v15 = v4;
  v16 = self;
  v13 = v4;
  objc_msgSend(v9, "chooseUserWithIdentifier:inClassWithID:password:completion:", v10, v11, v12, v14);

}

- (void)loginDidCompleteWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];

  v4 = a3;
  if (-[STUAssignUserOperation isExecuting](self, "isExecuting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation assignRequest](self, "assignRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userIdentifier"));

    if (!v6)
    {
      v7 = dispatch_time(0, 3000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012D8C;
      block[3] = &unk_1000C97E8;
      block[4] = self;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    if (-[STUAssignUserOperation isCanceled](self, "isCanceled"))
    {
      v8 = CATErrorWithCodeAndUserInfo(404, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[STUAssignUserOperation endOperationWithError:](self, "endOperationWithError:", v9);

    }
    else if (v4)
    {
      -[STUAssignUserOperation endOperationWithError:](self, "endOperationWithError:", v4);
    }
    else
    {
      -[STUAssignUserOperation undimScreen](self, "undimScreen");
      -[STUAssignUserOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

- (void)undimScreen
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation screenDimmingPrimitives](self, "screenDimmingPrimitives"));
  objc_msgSend(v2, "undimScreenWithReason:", CFSTR("Classroom assigning a user to the device"));

}

- (id)assignRequest
{
  void *v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation request](self, "request"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___STUAssignUserRequest);

  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUAssignUserOperation request](self, "request"));
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAssignUserOperation.m"), 166, CFSTR("expected view model to conform to %@, “%@” does not"), CFSTR("STUAssignUserRequest"), v11);

  }
  return -[STUAssignUserOperation request](self, "request");
}

- (id)sharediPadPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharediPadPrimitives"));

  return v4;
}

- (id)screenDimmingPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screenDimmingPrimitives"));

  return v4;
}

@end
