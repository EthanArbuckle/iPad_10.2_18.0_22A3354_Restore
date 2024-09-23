@implementation PSNotificationSettingsController

- (id)allSectionInfoIdentifiers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[BBSettingsGateway allSectionInfo](self->_gateway, "allSectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "sectionID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_27);
  return (id)sharedInstance___instance_0;
}

void __50__PSNotificationSettingsController_sharedInstance__block_invoke()
{
  PSNotificationSettingsController *v0;
  void *v1;

  v0 = objc_alloc_init(PSNotificationSettingsController);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

- (PSNotificationSettingsController)init
{
  PSNotificationSettingsController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  BBSettingsGateway *gateway;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)PSNotificationSettingsController;
  v2 = -[PSNotificationSettingsController init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.preferences.BBSettingsGateway", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getBBSettingsGatewayClass_softClass;
    v15 = getBBSettingsGatewayClass_softClass;
    if (!getBBSettingsGatewayClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getBBSettingsGatewayClass_block_invoke;
      v11[3] = &unk_1E4A65650;
      v11[4] = &v12;
      __getBBSettingsGatewayClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = objc_msgSend([v6 alloc], "initWithQueue:", v2->_queue);
    gateway = v2->_gateway;
    v2->_gateway = (BBSettingsGateway *)v7;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BBSettingsGateway invalidate](self->_gateway, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PSNotificationSettingsController;
  -[PSNotificationSettingsController dealloc](&v3, sel_dealloc);
}

- (id)sectionInfoForIdentifier:(id)a3
{
  return (id)-[BBSettingsGateway sectionInfoForSectionID:](self->_gateway, "sectionInfoForSectionID:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
