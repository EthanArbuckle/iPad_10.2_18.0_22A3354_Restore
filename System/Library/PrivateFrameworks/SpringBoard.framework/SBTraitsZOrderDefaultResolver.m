@implementation SBTraitsZOrderDefaultResolver

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a3, "acquiredParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "zOrderLevelPreferences");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "preferredZOrderLevel");
        v13 = v12;

        objc_msgSend(v10, "zOrderLevelPreferences");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v10, "currentZOrderLevel");
          v17 = v16;

          if (v17 != v13)
          {
            v18[0] = v8;
            v18[1] = 3221225472;
            v18[2] = __84__SBTraitsZOrderDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke;
            v18[3] = &__block_descriptor_40_e39_v16__0__TRAMutableSettingsZOrderLevel_8l;
            *(double *)&v18[4] = v13;
            objc_msgSend(v10, "updateZOrderLevelSettingsWithBlock:", v18);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

uint64_t __84__SBTraitsZOrderDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZOrderLevel:", *(double *)(a1 + 32));
}

@end
