@implementation STKUSSDSessionAction

- (STKUSSDSessionAction)initWithInputData:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  STKUSSDSessionAction *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v13[1] = 3221225472;
  v13[2] = __51__STKUSSDSessionAction_initWithInputData_response___block_invoke;
  v13[3] = &unk_24D562FA0;
  v14 = v6;
  v12.receiver = self;
  v12.super_class = (Class)STKUSSDSessionAction;
  v13[0] = MEMORY[0x24BDAC760];
  v9 = v6;
  v10 = -[STKSessionAction initWithBehavior:data:responseBlock:](&v12, sel_initWithBehavior_data_responseBlock_, v8, v7, v13);

  return v10;
}

void __51__STKUSSDSessionAction_initWithInputData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (STKUSSDSessionData)sessionData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKUSSDSessionAction;
  -[STKSessionAction sessionData](&v3, sel_sessionData);
  return (STKUSSDSessionData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)sendSuccessWithResponse:(id)a3
{
  -[STKSessionAction sendResponse:withContext:](self, "sendResponse:withContext:", 0, a3);
}

@end
