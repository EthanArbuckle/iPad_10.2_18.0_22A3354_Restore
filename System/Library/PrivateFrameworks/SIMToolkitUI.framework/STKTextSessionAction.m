@implementation STKTextSessionAction

- (STKTextSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5
{
  id v8;
  STKTextSessionAction *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v12[1] = 3221225472;
  v12[2] = __60__STKTextSessionAction_initWithBehavior_inputData_response___block_invoke;
  v12[3] = &unk_24D562FA0;
  v13 = a5;
  v11.receiver = self;
  v11.super_class = (Class)STKTextSessionAction;
  v12[0] = MEMORY[0x24BDAC760];
  v8 = v13;
  v9 = -[STKSessionAction initWithBehavior:data:responseBlock:](&v11, sel_initWithBehavior_data_responseBlock_, a3, a4, v12);

  return v9;
}

uint64_t __60__STKTextSessionAction_initWithBehavior_inputData_response___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (STKTextSessionData)sessionData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKTextSessionAction;
  -[STKSessionAction sessionData](&v3, sel_sessionData);
  return (STKTextSessionData *)(id)objc_claimAutoreleasedReturnValue();
}

@end
