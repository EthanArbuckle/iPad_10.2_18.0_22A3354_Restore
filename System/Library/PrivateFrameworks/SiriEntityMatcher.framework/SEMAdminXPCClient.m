@implementation SEMAdminXPCClient

- (SEMAdminXPCClient)init
{
  return (SEMAdminXPCClient *)MEMORY[0x24BEDD108](self, sel_initWithServiceProtocol_machServiceName_clientId_interruptionCode_invalidationCode_, &unk_25756EF10);
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2462E1018;
  v9[3] = &unk_25175EF78;
  v10 = v6;
  v7 = v6;
  objc_msgSend_serviceRequest_completion_usingBlock_(self, v8, 0, a4, v9);

}

- (void)endEvaluation:(id)a3
{
  objc_msgSend_serviceRequest_completion_usingBlock_(self, a2, 0, a3, &unk_25175EFB8);
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_2462E1098;
  v4[3] = &unk_25175EFD8;
  v5 = a3;
  objc_msgSend_serviceRequest_completion_usingBlock_(self, a2, 0, a4, v4);
}

@end
