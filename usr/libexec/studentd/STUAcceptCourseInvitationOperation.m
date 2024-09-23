@implementation STUAcceptCourseInvitationOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STUAcceptCourseInvitationOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKAcceptCourseInvitationRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v10 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3EE8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_9:
      v9 = 0;
      *a4 = v11;
      goto LABEL_11;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseIdentifier"));

  if (!v8)
  {
    if (a4)
    {
      v12 = CATErrorWithCodeAndUserInfo(2, &off_1000D3F10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)runWithRequest:(id)a3
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
  unsigned int v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSBundle *v31;
  NSBundle *v32;
  void *v33;
  NSBundle *v34;
  void *v35;
  NSBundle *v36;
  void *v37;
  void *v38;
  NSBundle *v39;
  void *v40;
  void *v41;
  STUShowUserNotificationOperation *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  STUShowUserNotificationOperation *v49;
  void *v50;
  STUShowUserNotificationOperation *v51;
  id v52;
  NSObject *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  STUAcceptCourseInvitationOperation *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  _QWORD v85[8];
  _QWORD v86[8];
  const __CFString *v87;
  void *v88;
  uint8_t v89[128];
  uint8_t buf[4];
  STUAcceptCourseInvitationOperation *v91;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "studentInformation"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "adHocDefaultStudentInformation"));

    if (!v5)
    {
      v55 = sub_100068018();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_10007D900();
      v5 = 0;
      goto LABEL_33;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentDisplayNameKey));
  if (v8
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentGivenNameKey))) != 0)
  {

    goto LABEL_6;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentFamilyNameKey));

  if (!v57)
  {
    v58 = sub_100068018();
    v56 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_10007D960();
LABEL_33:

    v59 = CATErrorWithCodeAndUserInfo(2, &off_1000D3F38);
    v16 = (id)objc_claimAutoreleasedReturnValue(v59);
LABEL_34:
    -[STUAcceptCourseInvitationOperation endOperationWithError:](self, "endOperationWithError:", v16);
    goto LABEL_40;
  }
LABEL_6:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pin"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daemon"));
  v12 = v11;
  if (!v9)
  {
    v78 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "courseInvitations"));

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v16 = v20;
    v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    if (v21)
    {
      v22 = v21;
      v79 = self;
      v23 = 0;
      v24 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v81 != v24)
            objc_enumerationMutation(v16);
          v26 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "courseIdentifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
          v29 = objc_msgSend(v27, "isEqual:", v28);

          if (v29)
          {
            v30 = v26;

            v23 = v30;
          }
        }
        v22 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      }
      while (v22);

      self = v79;
      if (v23)
      {
        v85[0] = kCFUserNotificationAlertHeaderKey;
        v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
        v75 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("Enroll in %@"), &stru_1000CDD50, 0));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "courseName"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v73, v71));
        v86[0] = v70;
        v85[1] = kCFUserNotificationAlertMessageKey;
        v32 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Enrolling in this class allows %@ to manage this device while you are attending class. Enter the pincode to enroll in this class:"), &stru_1000CDD50, 0));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "instructorName"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v69, v68));
        v86[1] = v67;
        v85[2] = kCFUserNotificationTextFieldTitlesKey;
        v34 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
        v66 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("Pincode"), &stru_1000CDD50, 0));
        v86[2] = v35;
        v85[3] = kCFUserNotificationDefaultButtonTitleKey;
        v36 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Enroll"), &stru_1000CDD50, 0));
        v86[3] = v38;
        v85[4] = kCFUserNotificationAlternateButtonTitleKey;
        v39 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000CDD50, 0));
        v86[4] = v41;
        v86[5] = &__kCFBooleanTrue;
        v85[5] = kCFUserNotificationAlertTopMostKey;
        v85[6] = SBUserNotificationDismissOnLock;
        v85[7] = SBUserNotificationDontDismissOnUnlock;
        v86[6] = &__kCFBooleanFalse;
        v86[7] = &__kCFBooleanTrue;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 8));

        v42 = [STUShowUserNotificationOperation alloc];
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](v79, "context"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "primitives"));
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "lockScreenPrimitives"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](v79, "context"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "primitives"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "userNotificationPrimitives"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](v79, "context"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "primitives"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "globalNotificationPrimitives"));
        v49 = v42;
        v50 = (void *)v43;
        v51 = -[STUShowUserNotificationOperation initWithLockScreenPrimitives:userNotificationPrimitives:globalNotificationPrimitives:options:timeout:flags:](v49, "initWithLockScreenPrimitives:userNotificationPrimitives:globalNotificationPrimitives:options:timeout:flags:", v43, v45, v48, v77, 65539, 0.0);

        -[STUShowUserNotificationOperation addTarget:selector:forOperationEvents:](v51, "addTarget:selector:forOperationEvents:", v79, "promptOperationDidFinish:", 6);
        v52 = sub_100068058();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Prompting user for pin code to enroll in course", buf, 2u);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
        objc_msgSend(v54, "addOperation:", v51);

LABEL_39:
        v5 = v78;

        goto LABEL_40;
      }
    }
    else
    {

    }
    v60 = sub_100068018();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_10007D9C0();

    v87 = CFSTR("kCRKItemNameErrorKey");
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "stringValue"));
    v88 = v63;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
    v65 = CRKErrorWithCodeAndUserInfo(12, v64);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v65);

    -[STUAcceptCourseInvitationOperation endOperationWithError:](self, "endOperationWithError:", v23);
    goto LABEL_39;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pin"));
  v84 = 0;
  v15 = objc_msgSend(v12, "acceptCourseInvitationWithIdentifier:pin:studentInformation:error:", v13, v14, v5, &v84);
  v16 = v84;

  v17 = sub_100068018();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (!v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10007DA20((uint64_t)self, v16, v19);

    goto LABEL_34;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v91 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@: Accepted course invitation with provided pin code", buf, 0xCu);
  }

  -[STUAcceptCourseInvitationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
LABEL_40:

}

- (void)promptOperationDidFinish:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t v25[8];
  id v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resultObject"));
  if (objc_msgSend(v4, "selectedResponse"))
  {
    v5 = sub_100068018();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10007DB60();

    v7 = CATErrorWithCodeAndUserInfo(404, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    -[STUAcceptCourseInvitationOperation endOperationWithError:](self, "endOperationWithError:", v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseDictionary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kCFUserNotificationTextFieldValuesKey));

    v11 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      v12 = v10;
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configurationManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "adHocDefaultStudentInformation"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUAcceptCourseInvitationOperation request](self, "request"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "courseIdentifier"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daemon"));
    v26 = 0;
    v21 = objc_msgSend(v20, "acceptCourseInvitationWithIdentifier:pin:studentInformation:error:", v18, v13, v16, &v26);
    v8 = v26;

    v22 = sub_100068058();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Successfully enrolled in course with pin the user entered", v25, 2u);
      }

      -[STUAcceptCourseInvitationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10007DAD0(v8, v24);

      -[STUAcceptCourseInvitationOperation endOperationWithError:](self, "endOperationWithError:", v8);
    }

  }
}

@end
