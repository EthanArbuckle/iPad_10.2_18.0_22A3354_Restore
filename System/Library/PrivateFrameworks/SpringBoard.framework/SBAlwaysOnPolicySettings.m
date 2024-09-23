@implementation SBAlwaysOnPolicySettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAlwaysOnPolicySettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  self->_focusStrategy = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E91CED58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlwaysOnPolicySettings setAlwaysOnDisablingFocusSemanticTypes:](self, "setAlwaysOnDisablingFocusSemanticTypes:", v3);

}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Strategy"), CFSTR("focusStrategy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E91CED88, &unk_1E91CED70);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(&unk_1E91D2670, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0D83100];
        objc_msgSend(a1, "_keyPathForSemanticTypeName:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rowWithTitle:valueKeyPath:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "conditionFormat:", CFSTR("focusStrategy = %@"), &unk_1E91D18B0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v15);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }

  v16 = (void *)MEMORY[0x1E0D83070];
  v31 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:", v18, CFSTR("Disabling By Focus Modes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83070];
  v30 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "moduleWithTitle:contents:", CFSTR("Always-On Policies"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)_keyPathForSemanticTypeName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("semanticType%@"), a3);
}

- (NSSet)alwaysOnDisablingFocusSemanticTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(&unk_1E91D2698, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SBAlwaysOnPolicySettings_alwaysOnDisablingFocusSemanticTypes__block_invoke;
  v8[3] = &unk_1E8E9DE38;
  v8[4] = self;
  objc_msgSend(v3, "bs_filter:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_294);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

uint64_t __63__SBAlwaysOnPolicySettings_alwaysOnDisablingFocusSemanticTypes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_keyPathForSemanticTypeName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

uint64_t __63__SBAlwaysOnPolicySettings_alwaysOnDisablingFocusSemanticTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(&unk_1E91D26C0, "objectForKeyedSubscript:", a2);
}

- (void)setAlwaysOnDisablingFocusSemanticTypes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(&unk_1E91D26E8, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(&unk_1E91D2710, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "containsObject:", v10);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_keyPathForSemanticTypeName:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBAlwaysOnPolicySettings setValue:forKey:](self, "setValue:forKey:", v12, v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (int64_t)focusStrategy
{
  return self->_focusStrategy;
}

- (void)setFocusStrategy:(int64_t)a3
{
  self->_focusStrategy = a3;
}

- (BOOL)semanticTypeCustom
{
  return self->_semanticTypeCustom;
}

- (void)setSemanticTypeCustom:(BOOL)a3
{
  self->_semanticTypeCustom = a3;
}

- (BOOL)semanticTypeDefault
{
  return self->_semanticTypeDefault;
}

- (void)setSemanticTypeDefault:(BOOL)a3
{
  self->_semanticTypeDefault = a3;
}

- (BOOL)semanticTypeSleep
{
  return self->_semanticTypeSleep;
}

- (void)setSemanticTypeSleep:(BOOL)a3
{
  self->_semanticTypeSleep = a3;
}

- (BOOL)semanticTypeDriving
{
  return self->_semanticTypeDriving;
}

- (void)setSemanticTypeDriving:(BOOL)a3
{
  self->_semanticTypeDriving = a3;
}

- (BOOL)semanticTypeExercise
{
  return self->_semanticTypeExercise;
}

- (void)setSemanticTypeExercise:(BOOL)a3
{
  self->_semanticTypeExercise = a3;
}

- (BOOL)semanticTypeWork
{
  return self->_semanticTypeWork;
}

- (void)setSemanticTypeWork:(BOOL)a3
{
  self->_semanticTypeWork = a3;
}

- (BOOL)semanticTypePersonal
{
  return self->_semanticTypePersonal;
}

- (void)setSemanticTypePersonal:(BOOL)a3
{
  self->_semanticTypePersonal = a3;
}

- (BOOL)semanticTypeReading
{
  return self->_semanticTypeReading;
}

- (void)setSemanticTypeReading:(BOOL)a3
{
  self->_semanticTypeReading = a3;
}

- (BOOL)semanticTypeGaming
{
  return self->_semanticTypeGaming;
}

- (void)setSemanticTypeGaming:(BOOL)a3
{
  self->_semanticTypeGaming = a3;
}

- (BOOL)semanticTypeMindfulness
{
  return self->_semanticTypeMindfulness;
}

- (void)setSemanticTypeMindfulness:(BOOL)a3
{
  self->_semanticTypeMindfulness = a3;
}

@end
