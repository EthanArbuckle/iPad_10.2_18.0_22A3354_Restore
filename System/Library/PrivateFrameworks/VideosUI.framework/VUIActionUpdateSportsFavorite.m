@implementation VUIActionUpdateSportsFavorite

- (VUIActionUpdateSportsFavorite)initWithContextData:(id)a3
{
  id v4;
  VUIActionUpdateSportsFavorite *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIActionUpdateSportsFavorite;
  v5 = -[VUIActionUpdateSportsFavorite init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("sportsTeamID"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E9FF3598;
    objc_storeStrong((id *)&v5->_sportsTeamID, v8);

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("sportsTeamName"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E9FF3598;
    objc_storeStrong((id *)&v5->_sportsTeamName, v11);

    v5->isFavorite = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("sportsTeamIsFavorite"), 0);
    v5->confirmsRemoval = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("confirmsRemoval"), 0);
    v5->firesBackgroundEvent = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("firesBackgroundEvent"), 0);
  }

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  id v11;
  BOOL isFavorite;
  BOOL confirmsRemoval;
  BOOL firesBackgroundEvent;
  void *v15;
  id v16;
  NSString *v17;
  NSString *v18;
  id v19;
  _QWORD block[2];
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  NSString *v24;
  NSString *v25;
  id v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;

  v6 = a3;
  v7 = a4;
  v8 = self->_sportsTeamID;
  v9 = self->_sportsTeamName;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v6;
  else
    v10 = 0;
  v11 = v10;
  isFavorite = self->isFavorite;
  confirmsRemoval = self->confirmsRemoval;
  firesBackgroundEvent = self->firesBackgroundEvent;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v21 = __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke;
  v22 = &unk_1E9FA0A50;
  v27 = isFavorite;
  v23 = v11;
  v24 = v8;
  v28 = confirmsRemoval;
  v29 = firesBackgroundEvent;
  v25 = v9;
  v26 = v7;
  v15 = (void *)MEMORY[0x1E0CB3978];
  v16 = v7;
  v17 = v9;
  v18 = v8;
  v19 = v11;
  if (objc_msgSend(v15, "isMainThread"))
    v21((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "applySelectionImage");
  v2 = *(unsigned __int8 *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 65);
  v6 = *(unsigned __int8 *)(a1 + 66);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_2;
  v8[3] = &unk_1E9F9B4F8;
  v9 = *(id *)(a1 + 32);
  +[VUIActionUpdateSportsFavorite performFavoritesOperation:teamId:teamName:confirmRemoval:fireBackgroundEvent:requestExecutionHandler:](VUIActionUpdateSportsFavorite, "performFavoritesOperation:teamId:teamName:confirmRemoval:fireBackgroundEvent:requestExecutionHandler:", v2, v4, v3, v5, v6, v8);
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);

}

void __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD block[2];
  uint64_t (*v3)(uint64_t);
  void *v4;
  id v5;

  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v3 = __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_3;
    v4 = &unk_1E9F98DF0;
    v5 = *(id *)(a1 + 32);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v3((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __78__VUIActionUpdateSportsFavorite_performWithTargetResponder_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restoreOriginalImage");
}

- (BOOL)isAccountRequired
{
  return 1;
}

+ (void)performFavoritesOperation:(BOOL)a3 teamId:(id)a4 teamName:(id)a5 confirmRemoval:(BOOL)a6 fireBackgroundEvent:(BOOL)a7 requestExecutionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  BOOL v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  BOOL v35;
  BOOL v36;

  v13 = a4;
  v14 = a5;
  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke;
  aBlock[3] = &unk_1E9FA0A78;
  v35 = a3;
  v32 = v13;
  v17 = v14;
  v33 = v17;
  v36 = a7;
  v18 = v15;
  v34 = v18;
  v19 = v13;
  v20 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC8848], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_2;
  v25[3] = &unk_1E9FA0AF0;
  v29 = a3;
  v30 = a6;
  v26 = v17;
  v27 = v20;
  v28 = v18;
  v22 = v18;
  v23 = v17;
  v24 = v20;
  objc_msgSend(v21, "isOnboarded:", v25);

}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 56);
  +[VUIFavoritesRequestManager sharedInstance](VUIFavoritesRequestManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendRequestForEntityID:teamName:action:fireBackgroundEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v2, *(unsigned __int8 *)(a1 + 57));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;
  id v9;
  char v10;
  char v11;
  char v12;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_3;
  v6 = &unk_1E9FA0AC8;
  v10 = *(_BYTE *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v11 = *(_BYTE *)(a1 + 57);
  v7 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v12 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v4[0], 3221225472))
    v5((uint64_t)v4);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  if (*(_BYTE *)(a1 + 56))
  {
    if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
    {
LABEL_7:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return;
    }
    if (*(_BYTE *)(a1 + 56))
    {
      if (*(_BYTE *)(a1 + 57))
      {
        v2 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "localizedStringForKey:", CFSTR("FAVORITES_REMOVE_TEAM"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, *(_QWORD *)(a1 + 32));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:", CFSTR("CANCEL"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = MEMORY[0x1E0C809B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_4;
        v22[3] = &unk_1E9F9A088;
        v23 = *(id *)(a1 + 48);
        objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 1, v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addAction:", v11);
        v12 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:", CFSTR("FAVORITES_REMOVE_TEAM_BUTTON"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v10;
        v20[1] = 3221225472;
        v20[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_5;
        v20[3] = &unk_1E9F9A088;
        v21 = *(id *)(a1 + 40);
        objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addAction:", v15);
        +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "presentViewController:animated:completion:", v6, 1, 0);

        return;
      }
      goto LABEL_7;
    }
  }
  if (*(_BYTE *)(a1 + 58))
    goto LABEL_7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_6;
  v17[3] = &unk_1E9FA0AA0;
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  +[VideosUI presentSportsFavoriteSyncSheetWithCompletion:](_TtC8VideosUI8VideosUI, "presentSportsFavoriteSyncSheetWithCompletion:", v17);

}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __134__VUIActionUpdateSportsFavorite_performFavoritesOperation_teamId_teamName_confirmRemoval_fireBackgroundEvent_requestExecutionHandler___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (void)performFavoritesOperation:(BOOL)a3 teamId:(id)a4 teamName:(id)a5 requestExecutionHandler:(id)a6
{
  objc_msgSend(a1, "performFavoritesOperation:teamId:teamName:confirmRemoval:fireBackgroundEvent:requestExecutionHandler:", a3, a4, a5, 1, 0, a6);
}

- (NSString)sportsTeamID
{
  return self->_sportsTeamID;
}

- (void)setSportsTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sportsTeamName
{
  return self->_sportsTeamName;
}

- (void)setSportsTeamName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsTeamName, 0);
  objc_storeStrong((id *)&self->_sportsTeamID, 0);
}

@end
