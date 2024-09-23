@implementation STKClass0SMSSessionAction

- (STKClass0SMSSessionAction)initWithInputData:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  STKClass0SMSSessionAction *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v13[1] = 3221225472;
  v13[2] = __56__STKClass0SMSSessionAction_initWithInputData_response___block_invoke;
  v13[3] = &unk_24D562FA0;
  v14 = v6;
  v12.receiver = self;
  v12.super_class = (Class)STKClass0SMSSessionAction;
  v13[0] = MEMORY[0x24BDAC760];
  v9 = v6;
  v10 = -[STKSessionAction initWithBehavior:data:responseBlock:](&v12, sel_initWithBehavior_data_responseBlock_, v8, v7, v13);

  return v10;
}

uint64_t __56__STKClass0SMSSessionAction_initWithInputData_response___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (STKClass0SMSSessionData)sessionData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKClass0SMSSessionAction;
  -[STKSessionAction sessionData](&v3, sel_sessionData);
  return (STKClass0SMSSessionData *)(id)objc_claimAutoreleasedReturnValue();
}

@end
