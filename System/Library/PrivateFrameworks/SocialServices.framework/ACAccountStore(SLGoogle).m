@implementation ACAccountStore(SLGoogle)

- (void)sl_openGoogleAuthenticationSheetWithAccountDescription:()SLGoogle completion:
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = *MEMORY[0x24BDB4068];
  v8 = a3;
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v9);
  objc_msgSend(v10, "setAccountDescription:", v8);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetWithAccountDescription_completion___block_invoke;
  v12[3] = &unk_24F34E4A0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:completion:", v10, 0, v12);

}

- (uint64_t)sl_openGoogleAuthenticationSheetForAccount:()SLGoogle shouldConfirm:completion:
{
  return objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:delegateClassName:completion:", a3, a4, CFSTR("SLGoogleAuthFlowController"), a5);
}

- (void)sl_openYouTubeAuthenticationSheetWithAccountDescription:()SLGoogle completion:
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = *MEMORY[0x24BDB4068];
  v8 = a3;
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v9);
  objc_msgSend(v10, "setAccountDescription:", v8);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithAccountDescription_completion___block_invoke;
  v12[3] = &unk_24F34E4A0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:delegateClassName:completion:", v10, 0, CFSTR("SLYouTubeAuthFlowController"), v12);

}

- (void)sl_openYouTubeAuthenticationSheetWithUsername:()SLGoogle accountDescription:completion:
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = *MEMORY[0x24BDB4068];
  v10 = a4;
  v11 = a3;
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v12);
  objc_msgSend(v13, "setUsername:", v11);

  objc_msgSend(v13, "setAccountDescription:", v10);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __104__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithUsername_accountDescription_completion___block_invoke;
  v15[3] = &unk_24F34E4A0;
  v16 = v8;
  v14 = v8;
  objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:delegateClassName:completion:", v13, 1, CFSTR("SLYouTubeAuthFlowController"), v15);

}

- (void)sl_openGoogleAuthenticationSheetForAccount:()SLGoogle shouldConfirm:delegateClassName:completion:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  CPSystemRootDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("System/Library/Frameworks/Social.framework"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __114__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetForAccount_shouldConfirm_delegateClassName_completion___block_invoke;
  v16[3] = &unk_24F34E4A0;
  v17 = v10;
  v15 = v10;
  objc_msgSend(a1, "openAuthenticationURLForAccount:withDelegateClassName:fromBundleAtPath:shouldConfirm:completion:", v12, v11, v14, a4, v16);

}

@end
