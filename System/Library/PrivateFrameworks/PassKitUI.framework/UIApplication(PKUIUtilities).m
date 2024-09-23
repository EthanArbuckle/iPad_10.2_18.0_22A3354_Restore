@implementation UIApplication(PKUIUtilities)

- (void)pkui_resetSharedRootAuthenticationContext
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = MEMORY[0x1E0C809B0];
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke;
  v5[3] = &unk_1E3E62060;
  v5[4] = &v6;
  v3 = objc_msgSend(a1, "beginBackgroundTaskWithExpirationHandler:", v5);
  v7[3] = v3;
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_2;
  v4[3] = &unk_1E3E66238;
  v4[4] = a1;
  v4[5] = &v6;
  objc_msgSend(MEMORY[0x1E0D6BFD8], "resetSharedRootContextWithCompletion:", v4);
  _Block_object_dispose(&v6, 8);
}

@end
