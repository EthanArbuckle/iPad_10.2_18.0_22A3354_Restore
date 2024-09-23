@implementation STUInviteToCourseOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  objc_super v21;

  v6 = a3;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___STUInviteToCourseOperation;
  if (!objc_msgSendSuper2(&v21, "validateRequest:error:", v6, a4))
    goto LABEL_20;
  v7 = objc_opt_class(CRKInviteToCourseRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v16 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3100);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
LABEL_19:
      v15 = 0;
      *a4 = v17;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_20;
    v18 = &off_1000D3128;
LABEL_18:
    v19 = CATErrorWithCodeAndUserInfo(2, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_19;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "courseIdentifier"));

  if (!v10)
  {
    if (!a4)
      goto LABEL_20;
    v18 = &off_1000D3150;
    goto LABEL_18;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courseName"));

  if (!v12)
  {
    if (!a4)
      goto LABEL_20;
    v18 = &off_1000D3178;
    goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "instructorName"));

  if (!v14)
  {
    if (a4)
    {
      v18 = &off_1000D31A0;
      goto LABEL_18;
    }
LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  v15 = 1;
LABEL_21:

  return v15;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
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
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  STUInviteToCourseOperation *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = objc_msgSend(v5, "supportsConnectedInstructor");

  v7 = sub_1000241C0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((v6 & 1) != 0)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "invitation"));
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Invitation received for course %{public}@", buf, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation request](self, "request"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "invitation"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "courseIdentifier"));

    v22 = CRKCourseInvitationIdentifiersFoundUserInfoKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringValue](v8, "stringValue"));
    v21 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v23 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "postNotificationName:object:userInfo:", CRKCourseInvitationsUpdatedNotificationName, 0, v15);

  }
  else if (v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "instructorClassroomAppVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "instructorPlatform")));
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 2114;
    v27 = v18;
    v28 = 2114;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Blocking invitation from an unsupported instructor. Classroom App (%{public}@), Platform (%{public}@)", buf, 0x20u);

  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUInviteToCourseOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUInviteToCourseOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
}

- (void)cancelIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (-[STUInviteToCourseOperation isExecuting](self, "isExecuting"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRKUser imageIdentifier](self->mStudentUser, "imageIdentifier"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurationManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRKUser imageIdentifier](self->mStudentUser, "imageIdentifier"));
      objc_msgSend(v5, "deleteUserImageDataWithIdentifier:error:", v6, 0);

    }
    v7 = CATErrorWithCodeAndUserInfo(404, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    -[STUInviteToCourseOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
}

- (void)processNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  NSBundle *v20;
  NSBundle *v21;
  NSBundle *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  void *v38;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation request](self, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "invitation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "courseIdentifier"));

  if (!objc_msgSend(v6, "isEqualToString:", CRKInviteToCourseDidSucceedNotificationName))
  {
    if (!objc_msgSend(v6, "isEqualToString:", CRKInviteToCourseDidFailNotificationName))
      goto LABEL_15;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CRKInviteToCourseReasonUserInfoKey));
    if (objc_msgSend(v15, "isEqualToString:", CRKInviteToCourseFailureReasonInvalidPin))
    {
      v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      v19 = CFSTR("The code that was entered is invalid. Verify the code is correct and try again.");
    }
    else if (objc_msgSend(v15, "isEqualToString:", CRKInviteToCourseFailureReasonInvalidConfiguration))
    {
      v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v18 = v17;
      v19 = CFSTR("Invalid configuration");
    }
    else if (objc_msgSend(v15, "isEqualToString:", CRKInviteToCourseFailureReasonEnrollmentDenied))
    {
      v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v18 = v17;
      v19 = CFSTR("Teacher rejected request to join course");
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CRKInviteToCourseFailureReasonStudentNotSupported))
      {
LABEL_14:

        goto LABEL_15;
      }
      v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v18 = v17;
      v19 = CFSTR("The version of iOS on this iPad is not supported by the version of Classroom app on the teacher’s iPad");
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1000CDD50, 0));

    if (v23)
    {
      -[STUInviteToCourseOperation setAccepted:](self, "setAccepted:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v25 = CRKCourseInvitationDidFailNotificationName;
      v35[0] = CRKCourseInvitationIdentifierUserInfoKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
      v35[1] = CRKCourseInvitationLocalizedReasonUserInfoKey;
      v36[0] = v26;
      v36[1] = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
      objc_msgSend(v24, "postNotificationName:object:userInfo:", v25, 0, v27);

      v33 = CRKCourseInvitationAcceptanceFailedUserInfoKey;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
      v32 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
      v34 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v31, "postNotificationName:object:userInfo:", CRKCourseInvitationsUpdatedNotificationName, 0, v30);

    }
    goto LABEL_14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = CRKCourseInvitationDidSucceedNotificationName;
  v37 = CRKCourseInvitationIdentifierUserInfoKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  v38 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  objc_msgSend(v11, "postNotificationName:object:userInfo:", v12, 0, v14);

  -[STUInviteToCourseOperation joinCourse](self, "joinCourse");
LABEL_15:

}

- (void)operationDidFinish
{
  void *v3;
  unsigned int v4;
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
  objc_super v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v16.receiver = self;
  v16.super_class = (Class)STUInviteToCourseOperation;
  -[STUInviteToCourseOperation operationDidFinish](&v16, "operationDidFinish");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = objc_msgSend(v3, "supportsConnectedInstructor");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation request](self, "request"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseIdentifier"));

    v18 = CRKCourseInvitationIdentifiersLostUserInfoKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v19 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CRKCourseInvitationsUpdatedNotificationName, 0, v10);

    if (-[STUInviteToCourseOperation isAccepted](self, "isAccepted"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "daemon"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endpoint"));
      objc_msgSend(v13, "releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:", v15);

    }
  }
}

- (void)acceptInvitationWithPin:(id)a3 studentInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CRKUser *v38;
  CRKUser *mStudentUser;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  STUInviteToCourseOperation *v50;
  __int16 v51;
  void *v52;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configurationManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation request](self, "request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "invitation"));

  v12 = objc_msgSend(v7, "mutableCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courseIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "adHocUserIdentifierForCourseWithIdentifier:", v13));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, kCRKAdHocConfigurationStudentIdentifierKey);

  v15 = sub_1000241C0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courseIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
    *(_DWORD *)buf = 138543618;
    v50 = self;
    v51 = 2114;
    v52 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@: Accepted course invitation %{public}@", buf, 0x16u);

  }
  -[STUInviteToCourseOperation setAccepted:](self, "setAccepted:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daemon"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endpoint"));
  objc_msgSend(v20, "acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:", v22);

  v42 = kCRKAdHocConfigurationStudentImageDataKey;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:"));
  if (v23)
  {
    v43 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeUserImageData:error:", v23, &v43));
    v25 = v43;
    if (v24)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, kCRKAdHocConfigurationStudentImageIdentifierKey);
    }
    else
    {
      v26 = sub_1000241C0();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10007B3E0((uint64_t)self, v25, v27);

    }
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courseIdentifier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userDictionaryForCourseWithIdentifier:studentInformation:", v28, v12));

  v47[0] = CRKInviteToCourseStudentInformationUserInfoKey;
  v47[1] = CRKInviteToCoursePinUserInfoKey;
  v48[0] = v29;
  v48[1] = v6;
  v41 = v6;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
  -[STUInviteToCourseOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", CRKInviteToCourseDidAcceptNotificationName, v30);
  v45 = CRKCourseInvitationAcceptedUserInfoKey;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courseIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringValue"));
  v44 = v32;
  v40 = v11;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v46 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v35, "postNotificationName:object:userInfo:", CRKCourseInvitationsUpdatedNotificationName, 0, v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "adHocConfiguration"));
  v37 = objc_msgSend(v36, "mutableCopy");

  objc_msgSend(v37, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCRKAdHocConfigurationEnabledKey);
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v12, kCRKAdHocConfigurationDefaultStudentInformationKey);
  objc_msgSend(v9, "setAdHocConfiguration:", v37);
  objc_msgSend(v12, "removeObjectForKey:", v42);
  v38 = (CRKUser *)objc_msgSend(objc_alloc((Class)CRKUser), "initWithDictionary:", v12);
  mStudentUser = self->mStudentUser;
  self->mStudentUser = v38;

}

- (void)joinCourse
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  STUControlGroupEnrollmentRecord *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  STUControlGroupEnrollmentRecord *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  void *v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  STUInviteToCourseOperation *v54;
  __int16 v55;
  void *v56;

  if (-[STUInviteToCourseOperation isExecuting](self, "isExecuting"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation request](self, "request"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "invitation"));

    v5 = sub_1000241C0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      *(_DWORD *)buf = 138543618;
      v54 = self;
      v55 = 2114;
      v56 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: Joining course %{public}@", buf, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation keychain](self, "keychain"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchorCertificateDatas"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100025278;
    v47[3] = &unk_1000CA3C0;
    v11 = v9;
    v48 = v11;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crk_mapUsingBlock:", v47));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configurationManager"));

    v51[0] = kCRKAdHocConfigurationStudentIdentifierKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "organizationUUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    v52[0] = v16;
    v51[1] = kCRKAdHocConfigurationStudentDisplayNameKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructorName"));
    v52[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
    v43 = objc_msgSend(v18, "mutableCopy");

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructorImageData"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructorImageData"));
      v46 = 0;
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storeUserImageData:error:", v20, &v46));
      v22 = v46;

      if (!v21)
      {
        -[STUInviteToCourseOperation endOperationWithError:](self, "endOperationWithError:", v22);
LABEL_13:

        return;
      }
      v41 = v13;
      v42 = v11;
      v23 = v43;
      objc_msgSend(v43, "removeObjectForKey:", kCRKAdHocConfigurationStudentImageDataKey);
      v40 = (void *)v21;
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v21, kCRKAdHocConfigurationStudentImageIdentifierKey);
    }
    else
    {
      v41 = v13;
      v42 = v11;
      v40 = 0;
      v22 = 0;
      v23 = v43;
    }
    v38 = v22;
    v24 = objc_msgSend(objc_alloc((Class)CRKUser), "initWithDictionary:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation identitySetForCourseIdentifier:](self, "identitySetForCourseIdentifier:", v25));

    v26 = [STUControlGroupEnrollmentRecord alloc];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseName"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseDescription"));
    v30 = objc_msgSend(v4, "courseMascotType");
    v31 = objc_msgSend(v4, "courseColorType");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "userIdentifier"));
    v49 = v32;
    v39 = v24;
    v50 = v24;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
    LOBYTE(v36) = 0;
    LOBYTE(v35) = 0;
    v34 = -[STUControlGroupEnrollmentRecord initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:](v26, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:", v27, v28, v29, v30, v31, v37, v33, v44, self->mStudentUser, v35, 0, 1, v36);

    v45 = v38;
    v13 = v41;
    LOBYTE(v29) = objc_msgSend(v41, "upsertEnrollmentRecord:error:", v34, &v45);
    v22 = v45;

    if ((v29 & 1) != 0)
      -[STUInviteToCourseOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    else
      -[STUInviteToCourseOperation endOperationWithError:](self, "endOperationWithError:", v22);
    v11 = v42;

    goto LABEL_13;
  }
}

- (id)identitySetForCourseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  STURollingCourseIdentitySet *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "studentIdentity"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUInviteToCourseOperation keychain](self, "keychain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addIdentity:toAccessGroup:", v6, CFSTR("com.apple.studentd")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configurationManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "adHocBaseUserIdentifier"));

  v12 = -[STURollingCourseIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:]([STURollingCourseIdentitySet alloc], "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:", v8, 0, v11, v4);
  return v12;
}

- (id)keychain
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keychain"));

  return v3;
}

- (BOOL)isAccepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStudentUser, 0);
}

@end
