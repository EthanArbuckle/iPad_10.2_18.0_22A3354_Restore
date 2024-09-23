@implementation STUFetchUserImageOperation

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
  v14.super_class = (Class)&OBJC_METACLASS___STUFetchUserImageOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_13;
  v7 = objc_opt_class(CRKFetchUserImageRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (!a4)
      goto LABEL_13;
    v11 = &off_1000D3448;
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
    v11 = &off_1000D3470;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentifier"));

  if (!v9)
  {
    if (a4)
    {
      v11 = &off_1000D3498;
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
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString **v16;
  const __CFString **v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enrollmentRecordWithIdentifier:", v7));

  if (!v8)
  {
    v28 = CFSTR("kCRKItemNameErrorKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
    v14 = (void *)v13;
    v15 = CFSTR("request.courseIdentifier.stringValue");
    if (v13)
      v15 = (const __CFString *)v13;
    v29 = v15;
    v16 = &v29;
    v17 = &v28;
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupUser"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIdentifier"));
  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupUser"));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instructorsByIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));

  }
  if (!v12)
  {
    v26 = CFSTR("kCRKItemNameErrorKey");
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIdentifier"));
    v14 = (void *)v21;
    v22 = CFSTR("request.userIdentifier");
    if (v21)
      v22 = (const __CFString *)v21;
    v27 = v22;
    v16 = &v27;
    v17 = &v26;
LABEL_13:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v17, 1));
    v23 = CRKErrorWithCodeAndUserInfo(12, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[STUFetchUserImageOperation endOperationWithError:](self, "endOperationWithError:", v24);

    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "daemon"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000348B0;
  v25[3] = &unk_1000CA1B0;
  v25[4] = self;
  objc_msgSend(v20, "fetchImageDataForUser:completion:", v12, v25);
LABEL_14:

}

@end
