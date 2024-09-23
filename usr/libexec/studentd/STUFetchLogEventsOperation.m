@implementation STUFetchLogEventsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchLogEventsOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchLogEventsRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2AE8);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (id)effectiveCursorDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned __int8 v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchLogEventsOperation request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cursorDate"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionToken"));
    v9 = v5;
    v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend((id)v9, "isEqual:", v10);

      if ((v12 & 1) == 0)
      {
        v4 = 0;
        goto LABEL_7;
      }
    }
    else
    {

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cursorDate"));
  }
LABEL_7:

  return v4;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseFirstSeenDate"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateProvider"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentDate"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchLogEventsOperation effectiveCursorDate](self, "effectiveCursorDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "daemon"));
  v23 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventLogSinceDate:error:", v11, &v23));
  v15 = v23;

  if (v14)
  {
    v16 = (void *)objc_opt_new(CRKFetchLogEventsResultObject);
    objc_msgSend(v16, "setEventLog:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateProvider"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentDate"));
    objc_msgSend(v16, "setCurrentDate:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dateProvider"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sessionToken"));
    objc_msgSend(v16, "setSessionToken:", v22);

    -[STUFetchLogEventsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v16);
  }
  else
  {
    -[STUFetchLogEventsOperation endOperationWithError:](self, "endOperationWithError:", v15);
  }

}

@end
