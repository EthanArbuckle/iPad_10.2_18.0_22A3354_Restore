@implementation PSSpecifierAction

+ (id)actionWithGetter:(id)a3 setter:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setGetter:", v6);

  objc_msgSend(v7, "setSetter:", v5);
  return v7;
}

+ (id)actionWithTarget:(id)a3 getterSelector:(SEL)a4 setterSelector:(SEL)a5
{
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12[2];
  _QWORD v13[4];
  id v14[2];
  id location;

  objc_initWeak(&location, a3);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke;
  v13[3] = &unk_1E4A65948;
  v14[1] = (id)a4;
  objc_copyWeak(v14, &location);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke_2;
  v11[3] = &unk_1E4A65970;
  v12[1] = (id)a5;
  objc_copyWeak(v12, &location);
  objc_msgSend(a1, "actionWithGetter:setter:", v13, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v12);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  return v9;
}

id __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SFPerformSelector();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (id)SFPerformSelector2();

}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend((id)objc_opt_class(), "actionWithGetter:setter:", self->_getter, self->_setter);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getter
{
  return self->_getter;
}

- (void)setGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)setter
{
  return self->_setter;
}

- (void)setSetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setter, 0);
  objc_storeStrong(&self->_getter, 0);
}

+ (id)actionWithBoolDetailClass:(Class)a3
{
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE7197D0))
  {
    v7[4] = a3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke;
    v8[3] = &__block_descriptor_40_e21__16__0__PSSpecifier_8lu32l8;
    v8[4] = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke_2;
    v7[3] = &__block_descriptor_40_e24_v24__0__PSSpecifier_8_16lu32l8;
    objc_msgSend(a1, "actionWithGetter:setter:", v8, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
}

uint64_t __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(a3, "BOOLValue"));
}

@end
