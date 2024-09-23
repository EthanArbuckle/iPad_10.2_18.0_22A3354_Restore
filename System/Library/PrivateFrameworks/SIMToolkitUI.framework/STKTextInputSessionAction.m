@implementation STKTextInputSessionAction

- (STKTextInputSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5
{
  id v8;
  STKTextInputSessionAction *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v12[1] = 3221225472;
  v12[2] = __65__STKTextInputSessionAction_initWithBehavior_inputData_response___block_invoke;
  v12[3] = &unk_24D562FA0;
  v13 = a5;
  v11.receiver = self;
  v11.super_class = (Class)STKTextInputSessionAction;
  v12[0] = MEMORY[0x24BDAC760];
  v8 = v13;
  v9 = -[STKSessionAction initWithBehavior:data:responseBlock:](&v11, sel_initWithBehavior_data_responseBlock_, a3, a4, v12);

  return v9;
}

void __65__STKTextInputSessionAction_initWithBehavior_inputData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v6;
  else
    v5 = 0;
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, v5);

}

- (STKTextInputSessionData)sessionData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKTextInputSessionAction;
  -[STKSessionAction sessionData](&v3, sel_sessionData);
  return (STKTextInputSessionData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)sendSuccessWithResponse:(id)a3
{
  -[STKSessionAction sendResponse:withContext:](self, "sendResponse:withContext:", 0, a3);
}

@end
