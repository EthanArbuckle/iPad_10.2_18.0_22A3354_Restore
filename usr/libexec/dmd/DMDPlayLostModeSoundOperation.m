@implementation DMDPlayLostModeSoundOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFPlayLostModeSoundRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2E98;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance", a3));
  if ((objc_msgSend(v4, "isManagedLostModeActive") & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005A8F0;
    v6[3] = &unk_1000B9B40;
    v6[4] = self;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDPlayLostModeSoundOperation: run")));
    v5 = v7;
    objc_msgSend(v4, "playSoundWithOptions:completion:", 0, v6);

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 601);
  }

}

@end
