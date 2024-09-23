@implementation STUSetVolumeOperation

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
  v12.super_class = (Class)&OBJC_METACLASS___STUSetVolumeOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(DMFSetVolumeRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKSetVolumeRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D3E98);
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

- (void)runWithRequest:(id)a3
{
  -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", 0, 0);
}

- (void)askOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[STUSetVolumeOperation isCanceled](self, "isCanceled"))
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

    if (v6)
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
    }
    else
    {
      if (!_AXSVoiceOverTouchEnabled())
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetVolumeOperation request](self, "request"));
        -[STUSetVolumeOperation performRequest:](self, "performRequest:", v8);
        goto LABEL_8;
      }
      v7 = CRKErrorWithCodeAndUserInfo(21, 0);
      v5 = objc_claimAutoreleasedReturnValue(v7);
    }
  }
  v8 = (void *)v5;
  -[STUSetVolumeOperation endOperationWithError:](self, "endOperationWithError:", v5);
LABEL_8:

}

- (void)performRequest:(id)a3
{
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  unsigned int v13;
  void *v14;
  int v15;
  STUSetVolumeOperation *v16;
  __int16 v17;
  void *v18;

  -[STUSetVolumeOperation volume](self, "volume", a3);
  if (v4 == 0.0)
  {
    -[STUSetVolumeOperation performMute](self, "performMute");
  }
  else
  {
    v5 = v4;
    if (qword_1000FC600 != -1)
      dispatch_once(&qword_1000FC600, &stru_1000CBA98);
    v6 = (void *)qword_1000FC5F8;
    if (os_log_type_enabled((os_log_t)qword_1000FC5F8, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
      v15 = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: volume:%{public}@", (uint8_t *)&v15, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "volumeCategoryForAudioCategory:", CFSTR("Audio/Video")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    *(float *)&v12 = v5;
    v13 = objc_msgSend(v11, "setVolumeTo:forCategory:", v10, v12);

    if (v13)
    {
      -[STUSetVolumeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetVolumeOperation makeFailedToSetVolumeError](self, "makeFailedToSetVolumeError"));
      -[STUSetVolumeOperation endOperationWithError:](self, "endOperationWithError:", v14);

    }
  }
}

- (void)performMute
{
  STUSetMuteStateOperation *v3;
  void *v4;
  void *v5;
  STUSetMuteStateOperation *v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new(CRKSetMuteStateRequest);
  objc_msgSend(v8, "setMute:", 1);
  v3 = [STUSetMuteStateOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation delegate](self, "delegate"));
  v6 = -[STUTaskOperation initWithRequest:context:delegate:](v3, "initWithRequest:context:delegate:", v8, v4, v5);

  -[STUSetMuteStateOperation addTarget:selector:forOperationEvents:](v6, "addTarget:selector:forOperationEvents:", self, "muteOperationDidFinish:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v7, "addOperation:", v6);

}

- (void)muteOperationDidFinish:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

    -[STUSetVolumeOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultObject"));

    -[STUSetVolumeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);
  }

}

- (id)makeFailedToSetVolumeError
{
  uint64_t v2;

  if (-[STUSetVolumeOperation isRequestDMF](self, "isRequestDMF"))
    v2 = DMFErrorWithCodeAndUserInfo(103, 0);
  else
    v2 = CRKErrorWithCodeAndUserInfo(125, 0);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isRequestDMF
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetVolumeOperation request](self, "request"));
  v3 = objc_opt_class(DMFSetVolumeRequest);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (double)volume
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  float v13;
  float v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetVolumeOperation request](self, "request"));
  v4 = objc_opt_class(CRKSetVolumeRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "volume");
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetVolumeOperation request](self, "request"));
    v10 = objc_opt_class(DMFSetVolumeRequest);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "volume");
    v14 = v13;

    v8 = v14;
  }

  return v8;
}

@end
