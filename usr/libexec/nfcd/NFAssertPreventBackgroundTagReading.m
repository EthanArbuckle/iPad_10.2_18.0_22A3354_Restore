@implementation NFAssertPreventBackgroundTagReading

- (BOOL)isEntitled:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_whitelistChecker"));
  v4 = objc_msgSend(v3, "bgTagReadingAssertion");

  return v4;
}

- (BOOL)isSupported
{
  return 1;
}

- (void)onAssertWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v7 = (id)v4;
  if (v4)
    v5 = *(void **)(v4 + 408);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "queueSuspend");

  v3[2](v3, 0);
}

- (void)onDeassertWithCompletion:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  v3 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 408);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "queueResume");

  if (v7)
    v7[2](v7, 0);

}

@end
