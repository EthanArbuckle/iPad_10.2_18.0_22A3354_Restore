@implementation SKIVoiceShortcutsInvocation

+ (id)startVoiceShortcutInCarPlayUsingTriggerId:(id)a3 withTriggerName:(id)a4 fromApp:(id)a5
{
  id v7;
  id v8;
  id v9;
  SKIDirectInvocationPayload *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.RunVoiceShortcut"));
  v17[0] = CFSTR("triggerId");
  +[SKIVoiceShortcutsInvocation cleanseTriggerIdIfNeeded:](SKIVoiceShortcutsInvocation, "cleanseTriggerIdIfNeeded:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = v8;
  v17[1] = CFSTR("triggerName");
  v17[2] = CFSTR("appBundleId");
  v18[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKIDirectInvocationPayload setUserData:](v10, "setUserData:", v12);

  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)cleanseTriggerIdIfNeeded:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("prompt:")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("prompt:"), "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

@end
