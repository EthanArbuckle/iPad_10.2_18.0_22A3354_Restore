@implementation NCMigrationGatewayFromCAtoC2

+ (void)performWithoutAnimation:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(a1, "_localAnimationsEnabled"))
    objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v4);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);

}

+ (void)animateWithDuration:(double)a3 orUsingSpringWithTension:(double)a4 friction:(double)a5 interactive:(BOOL)a6 animations:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  int v16;
  void *v17;
  id *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = objc_msgSend(a1, "_localAnimationsEnabled");
  v17 = (void *)MEMORY[0x1E0DC3F10];
  if (v16)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __120__NCMigrationGatewayFromCAtoC2_animateWithDuration_orUsingSpringWithTension_friction_interactive_animations_completion___block_invoke;
    v23[3] = &unk_1E8D1B148;
    v18 = &v24;
    v24 = v14;
    v19 = v14;
    objc_msgSend(v17, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", v9, v15, v23, a4, a5);
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __120__NCMigrationGatewayFromCAtoC2_animateWithDuration_orUsingSpringWithTension_friction_interactive_animations_completion___block_invoke_2;
    v21[3] = &unk_1E8D1B170;
    v18 = &v22;
    v22 = v14;
    v20 = v14;
    objc_msgSend(v17, "animateWithDuration:delay:options:animations:completion:", 0, v15, v21, a3, 0.0);
  }

}

uint64_t __120__NCMigrationGatewayFromCAtoC2_animateWithDuration_orUsingSpringWithTension_friction_interactive_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __120__NCMigrationGatewayFromCAtoC2_animateWithDuration_orUsingSpringWithTension_friction_interactive_animations_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

+ (id)_shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NCMigrationGatewayFromCAtoC2__shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_shared_onceToken != -1)
    dispatch_once(&_shared_onceToken, block);
  return (id)_shared_shared;
}

void __39__NCMigrationGatewayFromCAtoC2__shared__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)_shared_shared;
  _shared_shared = v1;

}

- (id)_init
{
  NCMigrationGatewayFromCAtoC2 *v2;
  uint64_t v3;
  NCUNUIKitPrototypeSettings *animationSettings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCMigrationGatewayFromCAtoC2;
  v2 = -[NCMigrationGatewayFromCAtoC2 init](&v6, sel_init);
  if (v2)
  {
    +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    animationSettings = v2->_animationSettings;
    v2->_animationSettings = (NCUNUIKitPrototypeSettings *)v3;

  }
  return v2;
}

- (BOOL)_localAnimationsEnabled
{
  int v3;
  void *v4;
  char v5;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    -[NCUNUIKitPrototypeSettings listAnimationSettings](self->_animationSettings, "listAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "onlyC2");

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (BOOL)_localAnimationsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_localAnimationsEnabled");

  return v3;
}

- (BOOL)isC2Enabled
{
  return self->_c2Enabled;
}

- (void)setC2Enabled:(BOOL)a3
{
  self->_c2Enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
