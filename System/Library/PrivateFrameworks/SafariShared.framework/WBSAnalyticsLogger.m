@implementation WBSAnalyticsLogger

id __111__WBSAnalyticsLogger_WBSAnalyticsLoggerExtras__reportNumberOfFlaggedPasswordsUsingSavedAccountAuditorIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "savedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "savedAccountsWithPasswords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "duplicatePasswordsInPasswords:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v21 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0D89C80], "standardPasswordEvaluator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v12, "userIsNeverSaveMarker") & 1) == 0
          && (objc_msgSend(v4, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v12, "password");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "evaluatePassword:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "userShouldBeShownPassiveWarning");

          v5 += v15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  v26[0] = CFSTR("numberOfFlaggedPasswords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = CFSTR("totalNumberOfPasswords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  v26[2] = CFSTR("percentageOfFlaggedPasswords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)((double)v5 * 100.0 / (double)v21));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
