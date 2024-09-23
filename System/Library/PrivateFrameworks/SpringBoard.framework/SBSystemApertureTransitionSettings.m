@implementation SBSystemApertureTransitionSettings

- (SBFFluidBehaviorSettings)defaultBehaviorSettings
{
  return self->_defaultBehaviorSettings;
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(a1, "_moduleWithSectionTitle:", CFSTR("Transition Behavior"));
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:action:", CFSTR("Restore Defaults"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  objc_msgSend(a1, "_childSettingsKeyPathsToTitles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_rowForKeyPath:title:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(v5, "addObject:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }
  objc_msgSend(MEMORY[0x1E0D83070], "moduleWithTitle:contents:", v4, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_childSettings
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend((id)objc_opt_class(), "_childSettingsKeyPathsToTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SBSystemApertureTransitionSettings__childSettings__block_invoke;
  v7[3] = &unk_1E8EB6290;
  v7[4] = self;
  objc_msgSend(v4, "bs_mapNoNulls:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __52__SBSystemApertureTransitionSettings__childSettings__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
}

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SBSystemApertureTransitionSettings;
  -[PTSettings setDefaultValues](&v17, sel_setDefaultValues);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBSystemApertureTransitionSettings _childSettings](self, "_childSettings", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = objc_opt_class();
        v10 = v8;
        if (v9)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = v11;

        if (v12)
          -[SBSystemApertureTransitionSettings _setDefaultValuesForBehaviorSettings:](self, "_setDefaultValuesForBehaviorSettings:", v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }

}

- (void)setChildBehaviorSettingsNamePrefix:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend((id)objc_opt_class(), "_childSettingsKeyPathsToTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[SBSystemApertureTransitionSettings valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10;
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v14 = v13;

        if (v14)
        {
          objc_msgSend(v4, "objectForKey:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - (%@)"), v18, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setName:", v16);

          -[SBSystemApertureTransitionSettings _setDefaultValuesForBehaviorSettings:](self, "_setDefaultValuesForBehaviorSettings:", v14);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

- (void)setDefaultBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBehaviorSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBehaviorSettings, 0);
}

+ (id)_childSettingsKeyPathsToTitles
{
  return &unk_1E91D2620;
}

+ (id)_rowForKeyPath:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasSuffix:", CFSTR("BehaviorSettings")))
  {
    v7 = (void *)MEMORY[0x1E0D83070];
    objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submoduleWithModule:childSettingsKeyPath:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setDefaultValuesForBehaviorSettings:(id)a3
{
  id v3;
  CAFrameRateRange v4;

  v3 = a3;
  objc_msgSend(v3, "setDefaultValues");
  objc_msgSend(v3, "setBehaviorType:", 2);
  objc_msgSend(v3, "setDampingRatio:", 0.816);
  objc_msgSend(v3, "setResponse:", 0.512);
  objc_msgSend(v3, "setRetargetImpulse:", 0.008);
  objc_msgSend(v3, "setTrackingDampingRatio:", 0.456);
  objc_msgSend(v3, "setTrackingResponse:", 0.35);
  objc_msgSend(v3, "setTrackingRetargetImpulse:", 0.016);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);

}

@end
