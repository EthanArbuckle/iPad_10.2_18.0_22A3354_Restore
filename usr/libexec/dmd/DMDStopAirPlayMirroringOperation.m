@implementation DMDStopAirPlayMirroringOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFStopAirPlayMirroringRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3210;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSErrorUserInfoKey v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAirPlayManager shared](DMDAirPlayManager, "shared", a3));
  v11 = 0;
  v5 = objc_msgSend(v4, "stopAirPlaySessionOfType:error:", 3, &v11);
  v6 = v11;

  if ((v5 & 1) != 0)
  {
    -[DMDStopAirPlayMirroringOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    if (v6)
    {
      v12 = NSUnderlyingErrorKey;
      v13 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
      v8 = DMFErrorWithCodeAndUserInfo(114, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[DMDStopAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v9);

    }
    else
    {
      v10 = DMFErrorWithCodeAndUserInfo(114, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[DMDStopAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v7);
    }

  }
}

@end
