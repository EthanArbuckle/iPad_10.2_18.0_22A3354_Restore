@implementation SVXActivationUtils

- (BOOL)wantsActivation:(id)a3
{
  return 1;
}

- (id)createActivationContextWithRequestInfo:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "speechRequestOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activationEventMachAbsoluteTime");
  if (!v8)
  {
    v8 = objc_msgSend(v5, "timestamp");
    if (!v8)
    {
      v8 = objc_msgSend(v6, "timestamp");
      if (!v8)
        v8 = mach_absolute_time();
    }
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__SVXActivationUtils_createActivationContextWithRequestInfo_context___block_invoke;
  v13[3] = &unk_24D24D3B8;
  v14 = v5;
  v15 = v6;
  v16 = v8;
  v9 = v6;
  v10 = v5;
  v11 = +[SVXActivationContext newWithBuilder:](SVXActivationContext, "newWithBuilder:", v13);

  return v11;
}

- (id)createDeactivationContextWithReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  uint64_t v14;

  v6 = a5;
  v7 = objc_msgSend(v6, "timestamp");
  if (!v7)
    v7 = mach_absolute_time();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__SVXActivationUtils_createDeactivationContextWithReason_options_context___block_invoke;
  v11[3] = &unk_24D24D3E0;
  v13 = a3;
  v14 = v7;
  v12 = v6;
  v8 = v6;
  v9 = +[SVXDeactivationContext newWithBuilder:](SVXDeactivationContext, "newWithBuilder:", v11);

  return v9;
}

void __74__SVXActivationUtils_createDeactivationContextWithReason_options_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = v4;
  if (v3 == 3)
    v6 = 5;
  else
    v6 = 2;
  objc_msgSend(v4, "setSource:", v6);
  objc_msgSend(v5, "setTimestamp:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfo:", v7);

}

void __69__SVXActivationUtils_createActivationContextWithRequestInfo_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  SVXButtonEvent *v6;
  SVXButtonEvent *v7;
  id v8;

  v8 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3 && !objc_msgSend(v3, "isSpeechRequest"))
  {
    v5 = 7;
    goto LABEL_14;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "event");
  if (v4 > 7)
  {
    switch(v4)
    {
      case 17:
        v5 = 8;
        goto LABEL_14;
      case 9:
        v7 = -[SVXButtonEvent initWithType:timestamp:]([SVXButtonEvent alloc], "initWithType:timestamp:", 2, *(_QWORD *)(a1 + 48));
        objc_msgSend(v8, "setButtonEvent:", v7);

        v5 = 1;
        goto LABEL_14;
      case 8:
        v5 = 1;
        v6 = -[SVXButtonEvent initWithType:timestamp:]([SVXButtonEvent alloc], "initWithType:timestamp:", 1, *(_QWORD *)(a1 + 48));
        objc_msgSend(v8, "setButtonEvent:", v6);

        goto LABEL_14;
    }
LABEL_12:
    v5 = 2;
    goto LABEL_14;
  }
  if ((unint64_t)(v4 - 2) >= 3)
    goto LABEL_12;
  v5 = 6;
LABEL_14:
  objc_msgSend(v8, "setSource:", v5);
  objc_msgSend(v8, "setTimestamp:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "setRequestInfo:", *(_QWORD *)(a1 + 32));

}

@end
