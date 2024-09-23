@implementation VUIJSMetadataInterface

uint64_t __99__VUIJSMetadataInterface_getMediaItemMetadataForCanonicalId_entityType_isSportingEvent_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __99__VUIJSMetadataInterface_getMediaItemMetadataForCanonicalId_entityType_isSportingEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("UTSMetadataInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    v15[0] = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15[1] = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v6;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __99__VUIJSMetadataInterface_getMediaItemMetadataForCanonicalId_entityType_isSportingEvent_completion___block_invoke_2;
    v13 = &unk_1E9F9BA48;
    v14 = *(id *)(a1 + 48);
    v7 = _Block_copy(&v10);
    v15[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getMediaItemMetadata"), v8);

    if (!v4)
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (void)getMediaItemMetadataForCanonicalId:(id)a3 entityType:(id)a4 isSportingEvent:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__VUIJSMetadataInterface_getMediaItemMetadataForCanonicalId_entityType_isSportingEvent_completion___block_invoke;
  v18[3] = &unk_1E9FA3A40;
  v19 = v9;
  v20 = v10;
  v22 = a5;
  v21 = v11;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v14, "evaluate:", v18);

}

@end
