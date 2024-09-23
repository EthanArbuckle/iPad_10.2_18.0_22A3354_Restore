@implementation NFAssertPreventConnectionHandover

- (BOOL)isEntitled:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_whitelistChecker"));
  v4 = objc_msgSend(v3, "chAssertion");

  return v4;
}

- (BOOL)isSupported
{
  return 1;
}

- (void)onAssertWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  NSString *clientInfo;
  id v9;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v9 = (id)v5;
  if (v5)
    v6 = *(void **)(v5 + 408);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "queueSuspend");

  if (self)
    clientInfo = self->_clientInfo;
  else
    clientInfo = 0;
  sub_10016FD64((uint64_t)v9, clientInfo);
  v4[2](v4, 0);

}

- (void)onDeassertWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSString *clientInfo;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a3;
  v4 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 408);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "queueResume");

  if (self)
    clientInfo = self->_clientInfo;
  else
    clientInfo = 0;
  sub_100170134((uint64_t)v5, clientInfo);
  if (v9)
    v9[2](v9, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end
