@implementation SBSADefaultsContext

- (id)copyBySettingSuppressDynamicIslandCompletely:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SBSADefaultsContext_copyBySettingSuppressDynamicIslandCompletely___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  v5 = a3;
  return -[SBSADefaultsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSADefaultsContext copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithDefaultsContext:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

uint64_t __77__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureOnClonedDisplays___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlwaysShowSystemApertureOnClonedDisplays:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __72__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureInSnapshots___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlwaysShowSystemApertureInSnapshots:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __72__SBSADefaultsContext_copyBySettingAlwaysRenderSystemApertureFillOnGPU___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlwaysRenderSystemApertureFillOnGPU:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __71__SBSADefaultsContext_copyBySettingNeverRenderSystemApertureFillOnGPU___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeverRenderSystemApertureFillOnGPU:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __68__SBSADefaultsContext_copyBySettingSuppressDynamicIslandCompletely___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSuppressDynamicIslandCompletely:", *(unsigned __int8 *)(a1 + 32));
}

- (SBSADefaultsContext)initWithDefaultsContext:(id)a3
{
  _BYTE *v4;
  SBSADefaultsContext *v5;
  SBSADefaultsContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSADefaultsContext;
  v5 = -[SBSADefaultsContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_suppressDynamicIslandCompletely = v4[8];
    v5->_alwaysShowSystemApertureOnClonedDisplays = v4[9];
    v5->_alwaysShowSystemApertureInSnapshots = v4[10];
    v5->_alwaysRenderSystemApertureFillOnGPU = v4[11];
    v5->_neverRenderSystemApertureFillOnGPU = v4[12];
    v5->_enableSystemApertureStateCollection = v4[13];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultsContext:", self);
}

- (void)_setSuppressDynamicIslandCompletely:(BOOL)a3
{
  self->_suppressDynamicIslandCompletely = a3;
}

- (void)_setNeverRenderSystemApertureFillOnGPU:(BOOL)a3
{
  self->_neverRenderSystemApertureFillOnGPU = a3;
}

- (void)_setAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3
{
  self->_alwaysShowSystemApertureOnClonedDisplays = a3;
}

- (void)_setAlwaysShowSystemApertureInSnapshots:(BOOL)a3
{
  self->_alwaysShowSystemApertureInSnapshots = a3;
}

- (void)_setAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3
{
  self->_alwaysRenderSystemApertureFillOnGPU = a3;
}

- (BOOL)neverRenderSystemApertureFillOnGPU
{
  return self->_neverRenderSystemApertureFillOnGPU;
}

- (id)copyBySettingNeverRenderSystemApertureFillOnGPU:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__SBSADefaultsContext_copyBySettingNeverRenderSystemApertureFillOnGPU___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  v5 = a3;
  return -[SBSADefaultsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

- (id)copyBySettingAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureOnClonedDisplays___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  v5 = a3;
  return -[SBSADefaultsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

- (id)copyBySettingAlwaysShowSystemApertureInSnapshots:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__SBSADefaultsContext_copyBySettingAlwaysShowSystemApertureInSnapshots___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  v5 = a3;
  return -[SBSADefaultsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

- (id)copyBySettingAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__SBSADefaultsContext_copyBySettingAlwaysRenderSystemApertureFillOnGPU___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  v5 = a3;
  return -[SBSADefaultsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

- (BOOL)alwaysRenderSystemApertureFillOnGPU
{
  return self->_alwaysRenderSystemApertureFillOnGPU;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL8 suppressDynamicIslandCompletely;
  uint64_t v6;
  id v7;
  void *v8;
  _BOOL8 alwaysShowSystemApertureOnClonedDisplays;
  id v10;
  void *v11;
  _BOOL8 alwaysShowSystemApertureInSnapshots;
  id v13;
  void *v14;
  _BOOL8 alwaysRenderSystemApertureFillOnGPU;
  id v16;
  void *v17;
  _BOOL8 neverRenderSystemApertureFillOnGPU;
  id v19;
  void *v20;
  _BOOL8 enableSystemApertureStateCollection;
  id v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  suppressDynamicIslandCompletely = self->_suppressDynamicIslandCompletely;
  v6 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __31__SBSADefaultsContext_isEqual___block_invoke;
  v36[3] = &unk_1E8EA3E78;
  v7 = v4;
  v37 = v7;
  objc_msgSend(v25, "appendBool:counterpart:", suppressDynamicIslandCompletely, v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  alwaysShowSystemApertureOnClonedDisplays = self->_alwaysShowSystemApertureOnClonedDisplays;
  v34[0] = v6;
  v34[1] = 3221225472;
  v34[2] = __31__SBSADefaultsContext_isEqual___block_invoke_2;
  v34[3] = &unk_1E8EA3E78;
  v10 = v7;
  v35 = v10;
  objc_msgSend(v8, "appendBool:counterpart:", alwaysShowSystemApertureOnClonedDisplays, v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  alwaysShowSystemApertureInSnapshots = self->_alwaysShowSystemApertureInSnapshots;
  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __31__SBSADefaultsContext_isEqual___block_invoke_3;
  v32[3] = &unk_1E8EA3E78;
  v13 = v10;
  v33 = v13;
  objc_msgSend(v11, "appendBool:counterpart:", alwaysShowSystemApertureInSnapshots, v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  alwaysRenderSystemApertureFillOnGPU = self->_alwaysRenderSystemApertureFillOnGPU;
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __31__SBSADefaultsContext_isEqual___block_invoke_4;
  v30[3] = &unk_1E8EA3E78;
  v16 = v13;
  v31 = v16;
  objc_msgSend(v14, "appendBool:counterpart:", alwaysRenderSystemApertureFillOnGPU, v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  neverRenderSystemApertureFillOnGPU = self->_neverRenderSystemApertureFillOnGPU;
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __31__SBSADefaultsContext_isEqual___block_invoke_5;
  v28[3] = &unk_1E8EA3E78;
  v19 = v16;
  v29 = v19;
  objc_msgSend(v17, "appendBool:counterpart:", neverRenderSystemApertureFillOnGPU, v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  enableSystemApertureStateCollection = self->_enableSystemApertureStateCollection;
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __31__SBSADefaultsContext_isEqual___block_invoke_6;
  v26[3] = &unk_1E8EA3E78;
  v27 = v19;
  v22 = v19;
  objc_msgSend(v20, "appendBool:counterpart:", enableSystemApertureStateCollection, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v23, "isEqual");

  return (char)v19;
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suppressDynamicIslandCompletely");
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alwaysShowSystemApertureOnClonedDisplays");
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alwaysShowSystemApertureInSnapshots");
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alwaysRenderSystemApertureFillOnGPU");
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "neverRenderSystemApertureFillOnGPU");
}

uint64_t __31__SBSADefaultsContext_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableSystemApertureStateCollection");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBool:", self->_suppressDynamicIslandCompletely);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendBool:", self->_alwaysShowSystemApertureOnClonedDisplays);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBool:", self->_alwaysShowSystemApertureInSnapshots);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendBool:", self->_alwaysRenderSystemApertureFillOnGPU);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendBool:", self->_neverRenderSystemApertureFillOnGPU);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBool:", self->_enableSystemApertureStateCollection);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  return v10;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

- (id)copyBySettingEnableSystemApertureStateCollection:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__SBSADefaultsContext_copyBySettingEnableSystemApertureStateCollection___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  v5 = a3;
  return -[SBSADefaultsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

uint64_t __72__SBSADefaultsContext_copyBySettingEnableSystemApertureStateCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnableSystemApertureStateCollection:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)suppressDynamicIslandCompletely
{
  return self->_suppressDynamicIslandCompletely;
}

- (BOOL)alwaysShowSystemApertureOnClonedDisplays
{
  return self->_alwaysShowSystemApertureOnClonedDisplays;
}

- (BOOL)alwaysShowSystemApertureInSnapshots
{
  return self->_alwaysShowSystemApertureInSnapshots;
}

- (BOOL)enableSystemApertureStateCollection
{
  return self->_enableSystemApertureStateCollection;
}

- (void)_setEnableSystemApertureStateCollection:(BOOL)a3
{
  self->_enableSystemApertureStateCollection = a3;
}

@end
