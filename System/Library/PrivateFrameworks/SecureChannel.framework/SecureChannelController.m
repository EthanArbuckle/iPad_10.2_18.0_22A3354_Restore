@implementation SecureChannelController

+ (void)actionForURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("https://auth.apple.com/"));

  if ((v8 & 1) != 0)
  {
    +[SecureChannelServiceProxy sharedInstance](SecureChannelServiceProxy, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__SecureChannelController_actionForURL_completion___block_invoke;
    v10[3] = &unk_24E5961B0;
    v11 = v6;
    objc_msgSend(v9, "actionForURL:completion:", v5, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __51__SecureChannelController_actionForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)runApproverFlowForURL:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[SecureChannelServiceProxy sharedInstance](SecureChannelServiceProxy, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "runApproverFlowForURL:completion:", v6, v5);

}

@end
