@implementation DMDRequestAirPlayMirroringOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRequestAirPlayMirroringRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3000;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSErrorUserInfoKey v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAirPlayManager shared](DMDAirPlayManager, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationDeviceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "password"));
  objc_msgSend(v4, "scanWaitInterval");
  v10 = v9;
  v11 = objc_msgSend(v4, "force");

  v17 = 0;
  LOBYTE(v4) = objc_msgSend(v5, "startAirPlaySessionWithDestinationName:destinationDeviceID:password:scanWaitTime:sessionType:force:error:", v6, v7, v8, 3, v11, &v17, v10);
  v12 = v17;

  if ((v4 & 1) != 0)
  {
    -[DMDRequestAirPlayMirroringOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    if (v12)
    {
      v18 = NSUnderlyingErrorKey;
      v19 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v14 = DMFErrorWithCodeAndUserInfo(113, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[DMDRequestAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v15);

    }
    else
    {
      v16 = DMFErrorWithCodeAndUserInfo(113, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[DMDRequestAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v13);
    }

  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DMDRequestAirPlayMirroringOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationName"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationDeviceID"));

    if (v8)
      goto LABEL_5;
    if (a4)
    {
      v10 = DMFErrorWithCodeAndUserInfo(1300, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }

LABEL_5:
  v9 = 1;
LABEL_9:

  return v9;
}

@end
