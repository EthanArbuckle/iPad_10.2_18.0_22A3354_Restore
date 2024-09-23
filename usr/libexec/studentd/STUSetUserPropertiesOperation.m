@implementation STUSetUserPropertiesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _UNKNOWN **v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STUSetUserPropertiesOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_13;
  v7 = objc_opt_class(CRKSetUserPropertiesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (!a4)
      goto LABEL_13;
    v11 = &off_1000D3290;
LABEL_12:
    v12 = CRKErrorWithCodeAndUserInfo(2, v11);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_13;
    v11 = &off_1000D32B8;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseIdentifier"));

  if (!v9)
  {
    if (a4)
    {
      v11 = &off_1000D32E0;
      goto LABEL_12;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v10 = 1;
LABEL_14:

  return v10;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  STUSetUserPropertiesOperation *v25;
  void *v26;
  uint64_t v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  STUSetUserPropertiesOperation *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  NSMutableDictionary *v81;
  void *v82;
  void *v83;
  STUSetUserPropertiesOperation *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSMutableDictionary *v95;
  NSMutableDictionary *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  uint8_t buf[4];
  STUSetUserPropertiesOperation *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  const __CFString *v109;
  const __CFString *v110;
  const __CFString *v111;
  const __CFString *v112;

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
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupUser"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIdentifier"));
      v99 = v4;
      if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupUser"));
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instructorsByIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIdentifier"));
        v23 = v9;
        v24 = v7;
        v25 = self;
        v26 = v6;
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));

        v13 = (void *)v27;
        v6 = v26;
        self = v25;
        v7 = v24;
        v9 = v23;
      }

      if (v13)
      {
        v28 = objc_opt_new(NSMutableDictionary);
        v4 = v99;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "imageData"));

        if (!v29)
        {
          v97 = 0;
LABEL_37:
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "displayName"));

          if (v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "displayName"));
            v49 = objc_opt_class(NSNull);
            if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0)
              v50 = 0;
            else
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "displayName"));

            objc_msgSend(v13, "setDisplayName:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "displayName"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v51, CRKDeviceUserDisplayNameKey);

          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "givenName"));

          if (v52)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "givenName"));
            v54 = objc_opt_class(NSNull);
            if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0)
              v55 = 0;
            else
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "givenName"));

            objc_msgSend(v13, "setGivenName:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "givenName"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v56, CRKDeviceUserGivenNameKey);

          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "familyName"));

          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "familyName"));
            v59 = objc_opt_class(NSNull);
            if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0)
              v60 = 0;
            else
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "familyName"));

            objc_msgSend(v13, "setFamilyName:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "familyName"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v61, CRKDeviceUserFamilyNameKey);

          }
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticGivenName"));

          if (v62)
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticGivenName"));
            v64 = objc_opt_class(NSNull);
            if ((objc_opt_isKindOfClass(v63, v64) & 1) != 0)
              v65 = 0;
            else
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticGivenName"));

            objc_msgSend(v13, "setPhoneticGivenName:", v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticGivenName"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v66, CRKDeviceUserPhoneticGivenNameKey);

          }
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticFamilyName"));

          if (v67)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticFamilyName"));
            v69 = objc_opt_class(NSNull);
            if ((objc_opt_isKindOfClass(v68, v69) & 1) != 0)
              v70 = 0;
            else
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticFamilyName"));

            objc_msgSend(v13, "setPhoneticFamilyName:", v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "phoneticFamilyName"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v71, CRKDeviceUserPhoneticFamilyNameKey);

          }
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "userSource"));

          if (v72)
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "userSource"));
            v74 = objc_opt_class(NSNull);
            if ((objc_opt_isKindOfClass(v73, v74) & 1) != 0)
              v75 = 0;
            else
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "userSource"));

            objc_msgSend(v13, "setUserSource:", v75);
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "userSource"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v76, CRKDeviceUserSourceKey);

          }
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "useMeCardIfAvailable"));

          if (v77)
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "useMeCardIfAvailable"));
            objc_msgSend(v13, "setUseMeCardIfAvailable:", objc_msgSend(v78, "BOOLValue"));

            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "useMeCardIfAvailable"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v79, CRKDeviceUseMeCardIfAvailableKey);

          }
          if (-[NSMutableDictionary count](v28, "count"))
          {
            v100 = v97;
            v80 = objc_msgSend(v6, "upsertEnrollmentRecord:error:", v9, &v100);
            v33 = v100;

            if (!v80)
            {
              -[STUSetUserPropertiesOperation endOperationWithError:](self, "endOperationWithError:", v33);
              goto LABEL_75;
            }
            v81 = objc_opt_new(NSMutableDictionary);
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupIdentifier"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v81, "setObject:forKeyedSubscript:", v82, CFSTR("CourseIdentifier"));

            v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupUser"));
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "userIdentifier"));
            v96 = v28;
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userIdentifier"));
            v84 = self;
            v85 = v6;
            v86 = v13;
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v94, "isEqualToString:", v83)));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v81, "setObject:forKeyedSubscript:", v87, CFSTR("UserIsStudent"));

            v13 = v86;
            v6 = v85;
            self = v84;

            v28 = v96;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v81, "setObject:forKeyedSubscript:", v96, CFSTR("PropertiesByKey"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
            objc_msgSend(v88, "postNotificationName:object:userInfo:", CFSTR("STUUserPropertiesDidChangeNotificationName"), self, v81);

          }
          else
          {
            v33 = v97;
          }
          -[STUSetUserPropertiesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
LABEL_75:

          goto LABEL_76;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "imageData"));
        v31 = objc_opt_class(NSNull);
        if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
        {

LABEL_23:
          v93 = 0;
          v39 = 0;
          v33 = 0;
          goto LABEL_24;
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "imageData"));

        if (!v36)
          goto LABEL_23;
        v102 = 0;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeUserImageData:error:", v36, &v102));
        v33 = v102;
        if (v39)
        {
          v93 = v36;
LABEL_24:
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageIdentifier"));

          if (v40)
          {
            v95 = v28;
            v41 = v13;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageIdentifier"));
            v101 = v33;
            v92 = v6;
            v43 = objc_msgSend(v6, "deleteUserImageDataWithIdentifier:error:", v42, &v101);
            v44 = v101;

            v97 = v44;
            if ((v43 & 1) != 0)
            {
              v13 = v41;
            }
            else
            {
              if (qword_1000FC238 != -1)
                dispatch_once(&qword_1000FC238, &stru_1000CA518);
              v13 = v41;
              v45 = (void *)qword_1000FC230;
              if (os_log_type_enabled((os_log_t)qword_1000FC230, OS_LOG_TYPE_ERROR))
              {
                v89 = v45;
                v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "imageIdentifier"));
                v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "verboseDescription"));
                *(_DWORD *)buf = 138543874;
                v104 = self;
                v105 = 2114;
                v106 = v90;
                v107 = 2114;
                v108 = v91;
                _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove existing user image with identifier %{public}@: %{public}@", buf, 0x20u);

                v13 = v41;
              }
            }
            v6 = v92;
            v28 = v95;
          }
          else
          {
            v97 = v33;
          }
          objc_msgSend(v13, "setImageIdentifier:", v39);
          if (v39)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v39, CFSTR("imageIdentifier"));
          }
          else
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v46, CFSTR("imageIdentifier"));

          }
          goto LABEL_37;
        }
        v37 = self;
        v38 = v33;
      }
      else
      {
        v109 = CFSTR("kCRKItemNameErrorKey");
        v4 = v99;
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "userIdentifier"));
        v33 = (id)v32;
        v34 = CFSTR("request.userIdentifier");
        if (v32)
          v34 = (const __CFString *)v32;
        v110 = v34;
        v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1));
        v35 = CRKErrorWithCodeAndUserInfo(12, v28);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v37 = self;
        v38 = v36;
      }
      -[STUSetUserPropertiesOperation endOperationWithError:](v37, "endOperationWithError:", v38);

      goto LABEL_75;
    }
    v20 = CRKErrorWithCodeAndUserInfo(5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[STUSetUserPropertiesOperation endOperationWithError:](self, "endOperationWithError:", v15);
  }
  else
  {
    v111 = CFSTR("kCRKItemNameErrorKey");
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    v15 = (void *)v14;
    v16 = CFSTR("courseIdentifier.stringValue");
    if (v14)
      v16 = (const __CFString *)v14;
    v112 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1));
    v18 = CRKErrorWithCodeAndUserInfo(12, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[STUSetUserPropertiesOperation endOperationWithError:](self, "endOperationWithError:", v19);

  }
LABEL_76:

}

@end
