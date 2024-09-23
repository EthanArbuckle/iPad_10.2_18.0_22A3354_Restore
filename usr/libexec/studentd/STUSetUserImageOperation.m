@implementation STUSetUserImageOperation

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
  v14.super_class = (Class)&OBJC_METACLASS___STUSetUserImageOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_13;
  v7 = objc_opt_class(CRKSetUserImageRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (!a4)
      goto LABEL_13;
    v11 = &off_1000D3C90;
LABEL_12:
    v12 = CRKErrorWithCodeAndUserInfo(2, v11);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseIdentifier"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_13;
    v11 = &off_1000D3CB8;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));

  if (!v9)
  {
    if (a4)
    {
      v11 = &off_1000D3CE0;
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
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  uint64_t v18;
  void *v19;
  STUSetUserImageOperation *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  STUSetUserImageOperation *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enrollmentRecordWithIdentifier:", v8));
  v10 = objc_msgSend(v9, "copy");

  if (!v10)
  {
    v59 = CFSTR("kCRKItemNameErrorKey");
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    v14 = (void *)v15;
    v16 = CFSTR("courseIdentifier.stringValue");
    if (v15)
      v16 = (const __CFString *)v15;
    v60 = v16;
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    v18 = CRKErrorWithCodeAndUserInfo(12, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = self;
    v21 = v19;
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupUser"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIdentifier"));
  v52 = v4;
  if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupUser"));
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instructorsByIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIdentifier"));
    v24 = v10;
    v25 = self;
    v26 = v7;
    v27 = v6;
    v28 = (void *)v23;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v23));

    v6 = v27;
    v7 = v26;
    self = v25;
    v10 = v24;

  }
  if (v14)
  {
    v4 = v52;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userImageData"));
    if (!v19)
    {
      v51 = v7;
      v17 = 0;
      v29 = 0;
      goto LABEL_17;
    }
    v54 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeUserImageData:error:", v19, &v54));
    v17 = v54;
    if (v29)
    {
      v51 = v7;
LABEL_17:
      v34 = v17;
      objc_msgSend(v14, "setImageIdentifier:", v29);
      v53 = v17;
      v35 = objc_msgSend(v6, "upsertEnrollmentRecord:error:", v10, &v53);
      v17 = v53;

      if ((v35 & 1) != 0)
      {
        v48 = v29;
        v49 = v6;
        v36 = objc_opt_new(NSMutableDictionary);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v37, CFSTR("CourseIdentifier"));

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupUser"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "userIdentifier"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userIdentifier"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v38, "isEqualToString:", v39)));
        v50 = v36;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v40, CFSTR("UserIsStudent"));

        v55 = CFSTR("imageIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageIdentifier"));
        v42 = v41;
        if (!v41)
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        v56 = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v43, CFSTR("PropertiesByKey"));

        if (!v41)
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v44, "postNotificationName:object:userInfo:", CFSTR("STUUserPropertiesDidChangeNotificationName"), self, v50);

        v45 = (void *)objc_opt_new(CRKSetUserImageResultObject);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageIdentifier"));
        objc_msgSend(v45, "setImageIdentifier:", v46);

        -[STUSetUserImageOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v45);
        v6 = v49;
      }
      else
      {
        -[STUSetUserImageOperation endOperationWithError:](self, "endOperationWithError:", v17);

      }
      v7 = v51;
      goto LABEL_25;
    }
    v20 = self;
    v21 = v17;
LABEL_7:
    -[STUSetUserImageOperation endOperationWithError:](v20, "endOperationWithError:", v21);
    goto LABEL_25;
  }
  v57 = CFSTR("kCRKItemNameErrorKey");
  v4 = v52;
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userIdentifier"));
  v17 = (id)v30;
  v31 = CFSTR("request.userIdentifier");
  if (v30)
    v31 = (const __CFString *)v30;
  v58 = v31;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v32 = CRKErrorWithCodeAndUserInfo(12, v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  -[STUSetUserImageOperation endOperationWithError:](self, "endOperationWithError:", v33);

LABEL_25:
}

@end
