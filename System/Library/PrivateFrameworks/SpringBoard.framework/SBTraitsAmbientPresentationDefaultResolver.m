@implementation SBTraitsAmbientPresentationDefaultResolver

uint64_t __97__SBTraitsAmbientPresentationDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "currentZOrderLevel");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "currentZOrderLevel");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  char v16;
  id obj;
  _QWORD v18[4];
  id v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "acquiredParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_83);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "role");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", self->_thresholdRole);

        v10 |= v15;
        if ((v10 & 1) != 0)
        {
          v16 = 0;
        }
        else
        {
          if (objc_msgSend(v13, "currentAmbientPresentedFlag") == 0x7FFFFFFFFFFFFFFFLL)
            continue;
          v16 = 1;
        }
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __97__SBTraitsAmbientPresentationDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke_2;
        v18[3] = &unk_1E8EA7598;
        v20 = v16;
        v19 = v5;
        objc_msgSend(v13, "updateAmbientPresentationSettingsWithBlock:", v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

}

- (SBTraitsAmbientPresentationDefaultResolver)initWithThresholdRole:(id)a3 componentOrder:(id)a4
{
  id v7;
  SBTraitsAmbientPresentationDefaultResolver *v8;
  SBTraitsAmbientPresentationDefaultResolver *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBTraitsAmbientPresentationDefaultResolver;
  v8 = -[SBTraitsAmbientPresentationStageComponent initWithComponentOrder:](&v11, sel_initWithComponentOrder_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_thresholdRole, a3);

  return v9;
}

- (SBTraitsAmbientPresentationDefaultResolver)initWithComponentOrder:(id)a3
{
  return -[SBTraitsAmbientPresentationDefaultResolver initWithThresholdRole:componentOrder:](self, "initWithThresholdRole:componentOrder:", 0, a3);
}

- (SBTraitsAmbientPresentationDefaultResolver)init
{
  return -[SBTraitsAmbientPresentationDefaultResolver initWithThresholdRole:componentOrder:](self, "initWithThresholdRole:componentOrder:", 0, &unk_1E91D0818);
}

void __97__SBTraitsAmbientPresentationDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
  {
    v5 = a2;
    objc_msgSend(v5, "setAmbientPresentationInputs:", 0);
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "validatedInputs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ambientPresentationInputs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAmbientPresentationInputs:", v4);

  }
}

- (NSString)thresholdRole
{
  return self->_thresholdRole;
}

- (void)setThresholdRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdRole, 0);
}

@end
