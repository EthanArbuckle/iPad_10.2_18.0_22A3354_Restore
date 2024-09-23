@implementation STUJoinControlGroupOperation

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
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  _UNKNOWN **v19;
  uint64_t v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___STUJoinControlGroupOperation;
  if (!objc_msgSendSuper2(&v22, "validateRequest:error:", v6, a4))
    goto LABEL_22;
  v7 = objc_opt_class(CRKJoinControlGroupRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (!a4)
      goto LABEL_22;
    v19 = &off_1000D3D30;
LABEL_21:
    v20 = CATErrorWithCodeAndUserInfo(2, v19);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v20);
    goto LABEL_23;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_22;
    v19 = &off_1000D3D58;
    goto LABEL_21;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "courseIdentifier"));

  if (!v10)
  {
    if (!a4)
      goto LABEL_22;
    v19 = &off_1000D3D80;
    goto LABEL_21;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courseName"));

  if (!v12)
  {
    if (!a4)
      goto LABEL_22;
    v19 = &off_1000D3DA8;
    goto LABEL_21;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "instructorName"));

  if (!v14)
  {
    if (!a4)
      goto LABEL_22;
    v19 = &off_1000D3DD0;
    goto LABEL_21;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anchorCertificateDatas"));
  v17 = objc_msgSend(v16, "count");

  if (!v17)
  {
    if (a4)
    {
      v19 = &off_1000D3DF8;
      goto LABEL_21;
    }
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  v18 = 1;
LABEL_23:

  return v18;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  STUControlGroupEnrollmentRecord *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  STUJoinControlGroupOperation *v45;
  STUControlGroupEnrollmentRecord *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  STUJoinControlGroupOperation *v59;
  void *v60;
  id v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[4];
  STUJoinControlGroupOperation *v65;
  __int16 v66;
  void *v67;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "invitation"));
  v5 = sub_10005B570();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v65 = self;
    v66 = 2114;
    v67 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: Invitation received for class %{public}@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUJoinControlGroupOperation keychain](self, "keychain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchorCertificateDatas"));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10005B5B0;
  v57[3] = &unk_1000CB700;
  v9 = v7;
  v58 = v9;
  v59 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crk_mapUsingBlock:", v57));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configurationManager"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "adHocDefaultStudentInformation"));
  v14 = objc_msgSend(v13, "mutableCopy");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "adHocUserIdentifierForCourseWithIdentifier:", v15));
  v17 = kCRKAdHocConfigurationStudentIdentifierKey;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, kCRKAdHocConfigurationStudentIdentifierKey);

  v18 = kCRKAdHocConfigurationStudentDisplayNameKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentDisplayNameKey));

  if (v19)
  {
    v51 = v12;
    v54 = v10;
    v50 = v14;
    v53 = objc_msgSend(objc_alloc((Class)CRKUser), "initWithDictionary:", v14);
    v62[0] = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "organizationUUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    v62[1] = v18;
    v63[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructorName"));
    v63[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 2));
    v52 = objc_msgSend(v24, "mutableCopy");

    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructorImageData"));
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructorImageData"));
      v56 = 0;
      v12 = v51;
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "storeUserImageData:error:", v26, &v56));
      v25 = v56;

      if (!v27)
      {
        -[STUJoinControlGroupOperation endOperationWithError:](self, "endOperationWithError:", v25);
        v14 = v50;
LABEL_14:

        v30 = v53;
        goto LABEL_15;
      }
      v49 = v9;
      v28 = v52;
      v48 = (void *)v27;
      objc_msgSend(v52, "setObject:forKeyedSubscript:", v27, kCRKAdHocConfigurationStudentImageIdentifierKey);
    }
    else
    {
      v48 = 0;
      v49 = v9;
      v28 = v52;
    }
    v44 = v25;
    v31 = objc_msgSend(objc_alloc((Class)CRKUser), "initWithDictionary:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v45 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[STUJoinControlGroupOperation identitySetForCourseIdentifier:](self, "identitySetForCourseIdentifier:", v32));

    v46 = [STUControlGroupEnrollmentRecord alloc];
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseName"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseDescription"));
    v37 = objc_msgSend(v4, "courseMascotType");
    v38 = objc_msgSend(v4, "courseColorType");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "userIdentifier"));
    v60 = v39;
    v61 = v31;
    v47 = v31;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
    LOBYTE(v43) = 0;
    LOBYTE(v42) = 0;
    v41 = -[STUControlGroupEnrollmentRecord initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:](v46, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:", v34, v35, v36, v37, v38, v33, v40, v54, v53, v42, 0, 1, v43);

    v55 = v44;
    v12 = v51;
    LOBYTE(v37) = objc_msgSend(v51, "upsertEnrollmentRecord:error:", v41, &v55);
    v25 = v55;

    if ((v37 & 1) != 0)
      -[STUJoinControlGroupOperation endOperationWithResultObject:](v45, "endOperationWithResultObject:", 0);
    else
      -[STUJoinControlGroupOperation endOperationWithError:](v45, "endOperationWithError:", v25);
    v9 = v49;
    v14 = v50;

    v10 = v54;
    goto LABEL_14;
  }
  v29 = CRKErrorWithCodeAndUserInfo(104, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[STUJoinControlGroupOperation endOperationWithError:](self, "endOperationWithError:", v30);
LABEL_15:

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

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUJoinControlGroupOperation keychain](self, "keychain"));
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

@end
