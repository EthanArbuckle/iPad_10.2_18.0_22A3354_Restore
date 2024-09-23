@implementation DMDTriggerDiagnosticsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFTriggerDiagnosticsRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3258;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDTriggerDiagnosticsOperation: run")));
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100069F94;
  v8[3] = &unk_1000B9BA8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

@end
