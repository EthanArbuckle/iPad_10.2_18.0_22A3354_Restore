@implementation STUFetchScreenshotOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___STUFetchScreenshotOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(DMFFetchScreenshotRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKFetchScreenshotRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D37E0);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
        goto LABEL_8;
      }
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (BOOL)supportsAlwaysAllow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primitives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentPrimitives"));
  if (objc_msgSend(v5, "isRunningOnInternalOS"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primitives"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userDefaultsPrimitives"));
    v9 = objc_msgSend(v8, "shouldAutoAcceptRemoteInvitations");

  }
  else
  {
    v9 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sessionInfo"));
  v12 = objc_msgSend(v11, "isIDSSession") ^ 1;

  return v12 | v9;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  STUScreenObserveFeature *v5;
  void *v6;
  void *v7;
  STUScreenObserveFeature *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentRecord"));

  if (v15)
  {
    v5 = [STUScreenObserveFeature alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationManager"));
    v8 = -[STUScreenObserveFeature initWithEnrollmentRecord:configurationManager:](v5, "initWithEnrollmentRecord:configurationManager:", v15, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[STUAskAlertModelFactory sharedFactory](STUAskAlertModelFactory, "sharedFactory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation instructorName](self, "instructorName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screenObserveTextWithInstructorName:isLocalNetworkConnection:", v10, objc_msgSend(v12, "isLocalNetworkSession")));

    -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", v8, v13);
  }
  else
  {
    v14 = CRKErrorWithCodeAndUserInfo(16, 0);
    v8 = (STUScreenObserveFeature *)objc_claimAutoreleasedReturnValue(v14);
    -[STUFetchScreenshotOperation endOperationWithError:](self, "endOperationWithError:", v8);
  }

}

- (void)askOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[STUFetchScreenshotOperation isCanceled](self, "isCanceled"))
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchScreenshotOperation request](self, "request"));
      -[STUFetchScreenshotOperation performRequest:](self, "performRequest:", v7);
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
  }
  v7 = (void *)v5;
  -[STUFetchScreenshotOperation endOperationWithError:](self, "endOperationWithError:", v5);
LABEL_7:

}

- (void)performRequest:(id)a3
{
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  STUFetchScreenshotOperation *v15;

  if (!-[STUFetchScreenshotOperation usesPixels](self, "usesPixels", a3))
  {
    if (qword_1000FC378 != -1)
      dispatch_once(&qword_1000FC378, &stru_1000CAB60);
    v4 = qword_1000FC370;
    if (os_log_type_enabled((os_log_t)qword_1000FC370, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Request contains usesPixels = NO. Ignoring and using pixels anyway.", buf, 0xCu);
    }
  }
  -[STUFetchScreenshotOperation maxSize](self, "maxSize");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screenshotServiceProxy"));

  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003E7A0;
    v13[3] = &unk_1000CA1B0;
    v13[4] = self;
    objc_msgSend(v10, "fetchScreenshotDataWithMaximumSizeInPixels:completion:", v13, v6, v8);
  }
  else
  {
    v11 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3808);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[STUFetchScreenshotOperation endOperationWithError:](self, "endOperationWithError:", v12);

  }
}

- (BOOL)usesPixels
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchScreenshotOperation request](self, "request"));
  v3 = objc_opt_class(DMFFetchScreenshotRequest);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "usesPixels");
  else
    v6 = 1;

  return v6;
}

- (CGSize)maxSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchScreenshotOperation request](self, "request"));
  v4 = objc_opt_class(DMFFetchScreenshotRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchScreenshotOperation request](self, "request"));
  v8 = objc_opt_class(CRKFetchScreenshotRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (v6)
  {
    v11 = objc_msgSend(v6, "maxWidth");
    v12 = v6;
  }
  else
  {
    v11 = objc_msgSend(v10, "maxWidth");
    v12 = v10;
  }
  v13 = (double)(unint64_t)objc_msgSend(v12, "maxHeight");

  v14 = (double)(unint64_t)v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)makeResultObjectWithData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchScreenshotOperation request](self, "request"));
  v6 = objc_opt_class(DMFFetchScreenshotRequest);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_msgSend(objc_alloc((Class)DMFFetchScreenshotResultObject), "initWithData:", v4);
  }
  else
  {
    v8 = (id)objc_opt_new(CRKFetchScreenshotResultObject);
    objc_msgSend(v8, "setScreenshotData:", v4);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[STUFetchScreenshotOperation studentIdentifier](self, "studentIdentifier"));
    objc_msgSend(v8, "setStudentIdentifier:", v4);
  }

  return v8;
}

- (id)studentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enrollmentRecord"));

  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allStudentIdentifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_naturallySortedArray"));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupUser"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userIdentifier"));
  }
  v10 = (void *)v9;

  return v10;
}

@end
