@implementation SBFloatingApplicationTestRecipe

- (SBFloatingApplicationTestRecipe)init
{
  SBFloatingApplicationTestRecipe *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFloatingApplicationTestRecipe;
  result = -[SBFloatingApplicationTestRecipe init](&v3, sel_init);
  if (result)
  {
    result->_mode = 0;
    result->_addSide = 0;
  }
  return result;
}

- (id)title
{
  return CFSTR("Floating Application");
}

- (void)handleVolumeIncrease
{
  unint64_t v3;

  -[SBFloatingApplicationTestRecipe _perform](self, "_perform");
  v3 = self->_mode + 1;
  self->_mode = v3;
  if (v3 >= 0xB)
  {
    self->_mode = 0;
    self->_addSide ^= 1u;
  }
}

- (void)handleVolumeDecrease
{
  self->_mode = 0;
  self->_addSide = 0;
  -[SBFloatingApplicationTestRecipe _perform](self, "_perform");
}

- (void)_perform
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  __43__SBFloatingApplicationTestRecipe__perform__block_invoke((uint64_t)self, CFSTR("com.apple.mobilecal"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_addSide)
    __43__SBFloatingApplicationTestRecipe__perform__block_invoke(v3, CFSTR("com.apple.Music"));
  else
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __43__SBFloatingApplicationTestRecipe__perform__block_invoke((uint64_t)v5, CFSTR("com.apple.mobiletimer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SBFloatingApplicationTestRecipe__perform__block_invoke_2;
  v11[3] = &unk_1E8EA5A20;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v7, "requestTransitionWithOptions:builder:validator:", 0, v11, &__block_literal_global_8_0);

}

SBDeviceApplicationSceneEntity *__43__SBFloatingApplicationTestRecipe__perform__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SBDeviceApplicationSceneEntity *v3;
  void *v4;
  void *v5;
  SBDeviceApplicationSceneEntity *v6;

  v2 = a2;
  v3 = [SBDeviceApplicationSceneEntity alloc];
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v3, "initWithApplicationForMainDisplay:", v5);
  return v6;
}

void __43__SBFloatingApplicationTestRecipe__perform__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SBFloatingApplicationTestRecipe__perform__block_invoke_3;
  v5[3] = &unk_1E8EA59F8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(a2, "modifyApplicationContext:", v5);

}

void __43__SBFloatingApplicationTestRecipe__perform__block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  switch(*(_QWORD *)(a1[4] + 8))
  {
    case 0:
    case 2:
    case 4:
      objc_msgSend(v3, "setEntity:forLayoutRole:", a1[5], 1);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[6], 2);
      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEntity:forLayoutRole:", v4, 3);

      goto LABEL_8;
    case 1:
    case 6:
      objc_msgSend(v3, "setEntity:forLayoutRole:", a1[5], 1);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[6], 2);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[7], 3);
      v5 = v7;
      v6 = 2;
      goto LABEL_7;
    case 3:
    case 7:
    case 9:
      objc_msgSend(v3, "setEntity:forLayoutRole:", a1[5], 1);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[6], 2);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[7], 3);
      v5 = v7;
      v6 = 1;
      goto LABEL_7;
    case 5:
    case 8:
      objc_msgSend(v3, "setEntity:forLayoutRole:", a1[5], 1);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[6], 2);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[7], 3);
      v5 = v7;
      v6 = 4;
      goto LABEL_7;
    case 0xALL:
      objc_msgSend(v3, "setEntity:forLayoutRole:", a1[5], 1);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[6], 2);
      objc_msgSend(v7, "setEntity:forLayoutRole:", a1[7], 3);
      v5 = v7;
      v6 = 3;
LABEL_7:
      objc_msgSend(v5, "setRequestedFloatingConfiguration:", v6);
LABEL_8:
      v3 = v7;
      break;
    default:
      break;
  }

}

uint64_t __43__SBFloatingApplicationTestRecipe__perform__block_invoke_4()
{
  return 1;
}

@end
