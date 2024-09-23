@implementation SearchUIUpdateSportsFollowingStatusHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  char v12;

  v5 = a3;
  objc_msgSend(v5, "sportsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "follow");

  v8 = objc_msgSend(v6, "type");
  if ((v8 - 1) > 1)
  {
    if (v8 == 3)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2;
      aBlock[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
      v12 = v7;
      v9 = _Block_copy(aBlock);
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v7)
        +[SearchUISportsKitWrapper createSessionWithCanonicalId:completionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "createSessionWithCanonicalId:completionBlock:", v10, v9);
      else
        +[SearchUISportsKitWrapper destroySessionWithCanonicalId:completionBlock:](_TtC8SearchUI24SearchUISportsKitWrapper, "destroySessionWithCanonicalId:completionBlock:", v10, v9);

    }
  }
  else
  {
    +[SearchUITVUtilities updateSportsItemFavoriteStatusWithSportsItem:shouldBeFavorite:completionHandler:](_TtC8SearchUI19SearchUITVUtilities, "updateSportsItemFavoriteStatusWithSportsItem:shouldBeFavorite:completionHandler:", v6, v7, &__block_literal_global_7);
  }

}

void __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  }
}

void __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("follow");
  if (!*(_BYTE *)(a1 + 32))
    v3 = CFSTR("unfollow");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "SearchUIUpdateSportsFollowingStatusHandler: SportsKit %@ command error : %@", (uint8_t *)&v4, 0x16u);
}

@end
