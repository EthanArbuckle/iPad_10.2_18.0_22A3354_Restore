@implementation SBTraitsUserInterfaceStyleDefaultResolver

void __96__SBTraitsUserInterfaceStyleDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "validatedInputs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfaceStyleInputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInterfaceStyleInputs:", v4);

}

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "acquiredParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __96__SBTraitsUserInterfaceStyleDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke;
        v12[3] = &unk_1E8EA5F88;
        v13 = v4;
        objc_msgSend(v11, "updateUserInterfaceOrientationSettingsWithBlock:", v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

@end
