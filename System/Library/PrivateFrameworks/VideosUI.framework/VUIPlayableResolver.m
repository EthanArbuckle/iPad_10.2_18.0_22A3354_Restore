@implementation VUIPlayableResolver

+ (id)appContext
{
  void *v2;
  void *v3;
  void *v4;

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)trailerPlayableForCanonicalID:(id)a3 entityType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[5];

  v31[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "appContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_2;
    v23[3] = &unk_1E9F99598;
    v24 = v8;
    v25 = v9;
    v26 = v10;
    v13 = v10;
    objc_msgSend(v12, "evaluate:", v23);

    v14 = v24;
  }
  else
  {
    v30[0] = CFSTR("title");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v16;
    v30[1] = CFSTR("message");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorMessage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v18;
    v30[2] = CFSTR("primaryActionTitle");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorAction"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIPlayableResolverErrorDomain"), 0, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke;
    block[3] = &unk_1E9F99420;
    v28 = v21;
    v29 = v10;
    v22 = v10;
    v14 = v21;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VideoURLRouterInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v5;
  v6 = *(void **)(a1 + 40);
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = MEMORY[0x1E0C809B0];
  v17[1] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_3;
  aBlock[3] = &unk_1E9F9BA48;
  v16 = *(id *)(a1 + 48);
  v9 = _Block_copy(aBlock);
  v17[2] = v9;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_5;
  v13[3] = &unk_1E9F9BA48;
  v14 = *(id *)(a1 + 48);
  v10 = _Block_copy(v13);
  v17[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getTrailerPlayableForCanonicalID"), v11);

  if (!v6)
  {

    if (v4)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_9;
LABEL_7:

}

void __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  VUIVideosPlayable *v4;
  id v5;
  VUIVideosPlayable *v6;
  _QWORD v7[4];
  VUIVideosPlayable *v8;
  id v9;

  v3 = a2;
  v4 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:]([VUIVideosPlayable alloc], "initWithDictionary:andMetadataDictionary:", v3, 0);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_4;
  v7[3] = &unk_1E9F99420;
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIPlayableResolverErrorDomain"), 1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_6;
  v6[3] = &unk_1E9F99420;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __75__VUIPlayableResolver_trailerPlayableForCanonicalID_entityType_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

+ (void)playableForAdamID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_2;
    v20[3] = &unk_1E9F9BA70;
    v21 = v6;
    v22 = v7;
    v10 = v7;
    objc_msgSend(v9, "evaluate:", v20);

    v11 = v21;
  }
  else
  {
    v26[0] = CFSTR("title");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v26[1] = CFSTR("message");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorMessage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v15;
    v26[2] = CFSTR("primaryActionTitle");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorAction"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIPlayableResolverErrorDomain"), 0, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke;
    block[3] = &unk_1E9F99420;
    v24 = v18;
    v25 = v7;
    v19 = v7;
    v11 = v18;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VideoURLRouterInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v17[0] = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_3;
  aBlock[3] = &unk_1E9F9BA48;
  v16 = v4;
  v6 = _Block_copy(aBlock);
  v17[1] = v6;
  v10 = v5;
  v11 = 3221225472;
  v12 = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_5;
  v13 = &unk_1E9F9BA48;
  v14 = *(id *)(a1 + 40);
  v7 = _Block_copy(&v10);
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getPlayableForAdamID"), v8);

}

void __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  VUIVideosPlayable *v4;
  id v5;
  VUIVideosPlayable *v6;
  _QWORD v7[4];
  VUIVideosPlayable *v8;
  id v9;

  v3 = a2;
  v4 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:]([VUIVideosPlayable alloc], "initWithDictionary:andMetadataDictionary:", v3, 0);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_4;
  v7[3] = &unk_1E9F99420;
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIPlayableResolverErrorDomain"), 1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_6;
  v6[3] = &unk_1E9F99420;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

+ (void)playableForCanonicalID:(id)a3 showID:(id)a4 mediaType:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v11)
    {
      v15 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v15;
    objc_msgSend(a1, "appContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_2;
    v29[3] = &unk_1E9F9BA98;
    v30 = v10;
    v31 = v26;
    v32 = v12;
    v33 = v13;
    v25 = v13;
    v22 = v26;
    objc_msgSend(v27, "evaluate:", v29);

    v24 = v30;
  }
  else
  {
    v37[0] = CFSTR("title");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorTitle"));
    v28 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v17;
    v37[1] = CFSTR("message");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorMessage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v19;
    v37[2] = CFSTR("primaryActionTitle");
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorAction"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v28;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIPlayableResolverErrorDomain"), 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke;
    block[3] = &unk_1E9F99420;
    v35 = v23;
    v36 = v13;
    v24 = v13;
    v25 = v23;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VideoURLRouterInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 48);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_3;
  aBlock[3] = &unk_1E9F9BA48;
  v16 = v4;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v10 = v5;
  v11 = 3221225472;
  v12 = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_5;
  v13 = &unk_1E9F9BA48;
  v14 = *(id *)(a1 + 56);
  v7 = _Block_copy(&v10);
  v20 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 5, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getPlayableForCanonicalID"), v8);

}

void __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  VUIVideosPlayable *v4;
  id v5;
  VUIVideosPlayable *v6;
  _QWORD v7[4];
  VUIVideosPlayable *v8;
  id v9;

  v3 = a2;
  v4 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:]([VUIVideosPlayable alloc], "initWithDictionary:andMetadataDictionary:", v3, 0);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_4;
  v7[3] = &unk_1E9F99420;
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIPlayableResolverErrorDomain"), 1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_6;
  v6[3] = &unk_1E9F99420;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

@end
