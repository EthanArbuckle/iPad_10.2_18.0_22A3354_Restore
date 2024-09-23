@implementation STKListItemsSessionAction

- (STKListItemsSessionAction)initWithBehavior:(id)a3 inputData:(id)a4 response:(id)a5
{
  id v8;
  STKListItemsSessionAction *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v12[1] = 3221225472;
  v12[2] = __65__STKListItemsSessionAction_initWithBehavior_inputData_response___block_invoke;
  v12[3] = &unk_24D562FA0;
  v13 = a5;
  v11.receiver = self;
  v11.super_class = (Class)STKListItemsSessionAction;
  v12[0] = MEMORY[0x24BDAC760];
  v8 = v13;
  v9 = -[STKSessionAction initWithBehavior:data:responseBlock:](&v11, sel_initWithBehavior_data_responseBlock_, a3, a4, v12);

  return v9;
}

void __65__STKListItemsSessionAction_initWithBehavior_inputData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char isKindOfClass;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    v6 = a2;
    v7 = v8;
  }
  else
  {
    v6 = a2;
    v7 = 0;
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, v7);

}

- (STKListItemsSessionData)sessionData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKListItemsSessionAction;
  -[STKTextSessionAction sessionData](&v3, sel_sessionData);
  return (STKListItemsSessionData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)sendSuccessWithSelectedItemIndex:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STKSessionAction sendResponse:withContext:](self, "sendResponse:withContext:", 0, v4);

}

@end
