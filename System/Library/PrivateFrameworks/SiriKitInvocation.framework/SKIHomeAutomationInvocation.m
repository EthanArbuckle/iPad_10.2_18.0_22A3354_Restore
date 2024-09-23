@implementation SKIHomeAutomationInvocation

+ (id)generateAsyncDialogResponse:(id)a3 reportingDomain:(id)a4
{
  id v5;
  id v6;
  SKIDirectInvocationPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.homeAutomation.async"));
  v13[0] = CFSTR("reportingIdentifier");
  v13[1] = CFSTR("reportingDomain");
  v14[0] = v6;
  v14[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKIDirectInvocationPayload setUserData:](v7, "setUserData:", v8);

  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
