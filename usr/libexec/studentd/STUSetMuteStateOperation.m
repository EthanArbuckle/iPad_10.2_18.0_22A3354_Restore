@implementation STUSetMuteStateOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUSetMuteStateOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKSetMuteStateRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D3BA0);
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
  if (-[STUSetMuteStateOperation isCanceled](self, "isCanceled"))
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
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetMuteStateOperation request](self, "request"));
        -[STUSetMuteStateOperation performRequest:](self, "performRequest:", v8);
        goto LABEL_8;
      }
      v7 = CRKErrorWithCodeAndUserInfo(21, 0);
      v5 = objc_claimAutoreleasedReturnValue(v7);
    }
  }
  v8 = (void *)v5;
  -[STUSetMuteStateOperation endOperationWithError:](self, "endOperationWithError:", v5);
LABEL_8:

}

- (void)performRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v6 = objc_msgSend(v4, "shouldMute");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  v11 = 0;
  LODWORD(v6) = objc_msgSend(v5, "setAttribute:forKey:error:", v7, AVSystemController_FullMuteAttribute, &v11);
  v8 = v11;

  if ((_DWORD)v6)
  {
    -[STUSetMuteStateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else if (v8)
  {
    -[STUSetMuteStateOperation endOperationWithError:](self, "endOperationWithError:", v8);
  }
  else
  {
    v9 = DMFErrorWithCodeAndUserInfo(103, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[STUSetMuteStateOperation endOperationWithError:](self, "endOperationWithError:", v10);

  }
}

@end
