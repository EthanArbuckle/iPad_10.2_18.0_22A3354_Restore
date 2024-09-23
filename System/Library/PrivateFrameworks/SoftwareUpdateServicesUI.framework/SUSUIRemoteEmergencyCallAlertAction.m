@implementation SUSUIRemoteEmergencyCallAlertAction

- (SUSUIRemoteEmergencyCallAlertAction)initWithCompletionBlock:(id)a3
{
  SUSUIRemoteEmergencyCallAlertAction *v4;
  id v5;
  SUSUIRemoteEmergencyCallAlertAction *v6;
  objc_super v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *, void *);
  void *v12;
  id v13;
  id location[2];
  SUSUIRemoteEmergencyCallAlertAction *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v15;
  v5 = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __63__SUSUIRemoteEmergencyCallAlertAction_initWithCompletionBlock___block_invoke;
  v12 = &unk_24DA407C0;
  v13 = location[0];
  v15 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)SUSUIRemoteEmergencyCallAlertAction;
  v15 = -[SUSUIRemoteEmergencyCallAlertAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v7, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, 0, v5, 0.0);
  objc_storeStrong((id *)&v15, v15);

  v6 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v6;
}

void __63__SUSUIRemoteEmergencyCallAlertAction_initWithCompletionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v2;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = (id)objc_msgSend(location[0], "info");
  objc_msgSend(v2, "flagForSetting:", SUSUIEmergencyCallAlertActionOutputSuccess);
  BSSettingFlagIsYes();

  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)fireCompletionIfNecessaryForResult:(BOOL)a3
{
  SUSUIRemoteEmergencyCallAlertAction *v3;
  id v4;
  id v5;
  BOOL v6;
  SEL v7;
  SUSUIRemoteEmergencyCallAlertAction *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  if ((-[SUSUIRemoteEmergencyCallAlertAction canSendResponse](self, "canSendResponse") & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE0BE40]);
    objc_msgSend(v5, "setFlag:forSetting:", BSSettingFlagForBool(), SUSUIEmergencyCallAlertActionOutputSuccess);
    v3 = v8;
    v4 = (id)objc_msgSend(MEMORY[0x24BE0BD90], "responseWithInfo:", v5);
    -[SUSUIRemoteEmergencyCallAlertAction sendResponse:](v3, "sendResponse:");

    objc_storeStrong(&v5, 0);
  }
}

@end
