@implementation SearchUISportsFollowButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  SearchUISportsFollowButtonItem *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  SearchUISportsFollowButtonItem *v14;
  void (**v15)(id, _QWORD, uint64_t);
  _QWORD v16[4];
  id v17;
  SearchUISportsFollowButtonItem *v18;
  SearchUISportsFollowButtonItemGenerator *v19;
  id v20;
  void (**v21)(id, _QWORD, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v8 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUISportsFollowButtonItem alloc], "initWithSFButtonItem:", v6);
  objc_msgSend(v6, "sportsItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");
  if ((v10 - 1) > 1)
  {
    if (v10 != 3)
    {
      v7[2](v7, 0, 1);
      goto LABEL_7;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_3;
    v12[3] = &unk_1EA1F6BE0;
    v13 = v9;
    v14 = v8;
    v15 = v7;
    +[SearchUISportsKitWrapper liveActivitiesEnabledWithCompletionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "liveActivitiesEnabledWithCompletionBlock:", v12);

    v11 = v13;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
    v16[3] = &unk_1EA1F6B90;
    v17 = v9;
    v18 = v8;
    v21 = v7;
    v19 = self;
    v20 = v6;
    +[SearchUITVUtilities fetchSportsFavoritesEnabledStatusWithCompletionHandler:](_TtC8SearchUI19SearchUITVUtilities, "fetchSportsFavoritesEnabledStatusWithCompletionHandler:", v16);

    v11 = v17;
  }

LABEL_7:
}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SearchUIButtonItem *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2;
    v19[3] = &unk_1EA1F6B68;
    v6 = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v21 = *(id *)(a1 + 64);
    +[SearchUITVUtilities fetchSportsItemIsFavoritedWithSportsItem:completionHandler:](_TtC8SearchUI19SearchUITVUtilities, "fetchSportsItemIsFavoritedWithSportsItem:completionHandler:", v6, v19);

  }
  else if (objc_msgSend(*(id *)(a1 + 48), "isUserSignedIntoStore")
         && (+[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 23), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = +[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v7), v7, v8))
  {
    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x1E0D8C5E0];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://apple.news/mysports?onboard=before&campaign_id=internal_siri_sports_onboarding"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "punchoutWithURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPunchout:", v12);

    v13 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIButtonItem setTitle:](v13, "setTitle:", v14);

    objc_msgSend(*(id *)(a1 + 40), "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[SearchUIButtonItem setImage:](v13, "setImage:", v15);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "fallbackImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIButtonItem setImage:](v13, "setImage:", v16);

    }
    -[SearchUIButtonItem setCommand:](v13, "setCommand:", v9);
    v17 = *(_QWORD *)(a1 + 64);
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v17 + 16))(v17, v18, 1);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", a2);
  v5 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v5 + 16))(*(_QWORD *)(a1 + 40), 0, 1);
  }
  else
  {
    v7[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, 1);

  }
}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_3(id *a1, int a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    objc_msgSend(a1[4], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_4;
    v4[3] = &unk_1EA1F6BB8;
    v5 = a1[5];
    v6 = a1[6];
    +[SearchUISportsKitWrapper checkForSessionWithCanonicalId:completionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "checkForSessionWithCanonicalId:completionBlock:", v3, v4);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __98__SearchUISportsFollowButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_4(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", a2);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, 1);

}

- (BOOL)isUserSignedIntoStore
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = *MEMORY[0x1E0C8F170];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithAccountTypeIdentifiers:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {

    goto LABEL_16;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if ((objc_msgSend(v11, "isActive", (_QWORD)v18) & 1) != 0)
      {
LABEL_7:
        v12 = v11;

        v8 = v12;
        continue;
      }
      if (!v8)
      {
        if (objc_msgSend(v11, "ams_isLocalAccount"))
          goto LABEL_7;
        v8 = 0;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);

  if (!v8)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore", (_QWORD)v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_localiTunesAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "ams_DSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  return v16;
}

@end
