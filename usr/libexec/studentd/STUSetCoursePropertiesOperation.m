@implementation STUSetCoursePropertiesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___STUSetCoursePropertiesOperation;
  if (!objc_msgSendSuper2(&v20, "validateRequest:error:", v6, a4))
    goto LABEL_16;
  v7 = objc_opt_class(CRKSetCoursePropertiesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v14 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2E30);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
LABEL_15:
      v13 = 0;
      *a4 = v15;
      goto LABEL_17;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseIdentifier"));

  if (!v8)
  {
    if (a4)
    {
      v16 = CATErrorWithCodeAndUserInfo(2, &off_1000D2E58);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseName"));
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "length"))
  {
    if (a4)
    {
      v18 = CATErrorWithCodeAndUserInfo(2, &off_1000D2E80);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchorCertificates"));
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "count"))
    {
      if (a4)
      {
        v19 = CATErrorWithCodeAndUserInfo(2, &off_1000D2EA8);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v19);
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 1;
    }

  }
LABEL_17:

  return v13;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  int v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  STUSetCoursePropertiesOperation *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  STUSetCoursePropertiesOperation *v43;
  unsigned __int8 v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  STUSetCoursePropertiesOperation *v54;
  void *v55;
  id obj;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  const __CFString *v63;
  const __CFString *v64;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enrollmentRecordWithIdentifier:", v7));
  v9 = objc_msgSend(v8, "copy");

  if (v9)
  {
    if ((objc_msgSend(v9, "isModifiable") & 1) != 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseName"));
      if (v10
        && (v11 = (void *)v10,
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupName")),
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseName")),
            v14 = objc_msgSend(v12, "isEqualToString:", v13),
            v13,
            v12,
            v11,
            (v14 & 1) == 0))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseName"));
        objc_msgSend(v9, "setGroupName:", v24);

        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseDescription"));

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseDescription"));
        v27 = objc_opt_class(NSNull);
        if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
        {
          objc_msgSend(v9, "setGroupDescription:", 0);
        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseDescription"));
          objc_msgSend(v9, "setGroupDescription:", v28);

        }
        v15 = 1;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchorCertificates"));

      if (v29)
      {
        v55 = v9;
        v30 = objc_opt_new(NSMutableArray);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchorCertificates"));
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v59;
          v52 = v6;
          v53 = v4;
          v54 = self;
          while (2)
          {
            for (i = 0; i != v32; i = (char *)i + 1)
            {
              if (*(_QWORD *)v59 != v33)
                objc_enumerationMutation(obj);
              v35 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
              v36 = objc_autoreleasePoolPush();
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "keychain"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "makeCertificateWithData:", v35));

              if (!v39)
              {
                v46 = sub_100015294();
                v47 = objc_claimAutoreleasedReturnValue(v46);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  sub_10007AE30();

LABEL_38:
                v48 = sub_100015294();
                v49 = objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  sub_10007ADCC();

                v50 = CRKErrorWithCodeAndUserInfo(20, 0);
                v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                -[STUSetCoursePropertiesOperation endOperationWithError:](v54, "endOperationWithError:", v51);

                objc_autoreleasePoolPop(v36);
                v6 = v52;
                v4 = v53;
                v9 = v55;
                goto LABEL_12;
              }
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "keychain"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "addCertificate:toAccessGroup:", v39, CFSTR("com.apple.studentd")));

              if (!v42)
                goto LABEL_38;
              -[NSMutableArray addObject:](v30, "addObject:", v42);

              objc_autoreleasePoolPop(v36);
            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
            v6 = v52;
            v4 = v53;
            self = v54;
            if (v32)
              continue;
            break;
          }
        }

        v9 = v55;
        objc_msgSend(v55, "setTrustedAnchorCertificatePersistentIDs:", v30);

      }
      else if (!v15)
      {
LABEL_33:
        -[STUSetCoursePropertiesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
        goto LABEL_12;
      }
      v43 = self;
      v57 = 0;
      v44 = objc_msgSend(v6, "upsertEnrollmentRecord:error:", v9, &v57);
      v45 = v57;
      v17 = v45;
      if ((v44 & 1) != 0)
      {

        self = v43;
        goto LABEL_33;
      }
      v23 = v43;
    }
    else
    {
      v22 = CRKErrorWithCodeAndUserInfo(5, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v23 = self;
    }
    -[STUSetCoursePropertiesOperation endOperationWithError:](v23, "endOperationWithError:", v17);
  }
  else
  {
    v63 = CFSTR("kCRKItemNameErrorKey");
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    v17 = (void *)v16;
    v18 = CFSTR("courseIdentifier.stringValue");
    if (v16)
      v18 = (const __CFString *)v16;
    v64 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    v20 = CRKErrorWithCodeAndUserInfo(12, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[STUSetCoursePropertiesOperation endOperationWithError:](self, "endOperationWithError:", v21);

  }
LABEL_12:

}

@end
