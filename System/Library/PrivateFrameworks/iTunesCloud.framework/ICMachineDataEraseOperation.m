@implementation ICMachineDataEraseOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[ICMachineDataOperation requestContext](self, "requestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__ICMachineDataEraseOperation_execute__block_invoke;
  v6[3] = &unk_1E438E900;
  v6[4] = self;
  objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v6);

}

void __38__ICMachineDataEraseOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "protocolVersion") != 2)
  {
    objc_msgSend(v3, "DSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unsignedLongLongValue");

  }
  p435tmhbla();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "failed to erase machine data provisioning. err=%{public}@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);

}

@end
