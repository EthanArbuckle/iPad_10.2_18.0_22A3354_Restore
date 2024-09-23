@implementation SKIMapsInvocation

+ (id)shareETARequestInApp:(id)a3
{
  id v3;
  SKIDirectInvocationPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.geo.shareETA"));
  if (objc_msgSend(v3, "length"))
  {
    v10 = CFSTR("appBundleId");
    v11[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKIDirectInvocationPayload setUserData:](v4, "setUserData:", v5);

  }
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)searchLocationRequestInApp:(id)a3
{
  id v3;
  SKIDirectInvocationPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.geo.search"));
  if (objc_msgSend(v3, "length"))
  {
    v10 = CFSTR("appBundleId");
    v11[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKIDirectInvocationPayload setUserData:](v4, "setUserData:", v5);

  }
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
