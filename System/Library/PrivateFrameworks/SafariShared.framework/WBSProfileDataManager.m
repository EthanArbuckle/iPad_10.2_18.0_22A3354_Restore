@implementation WBSProfileDataManager

- (WBSProfileDataManager)initWithProfileProvider:(id)a3
{
  id v5;
  WBSProfileDataManager *v6;
  WBSProfileDataManager *v7;
  WBSProfileDataManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSProfileDataManager;
  v6 = -[WBSProfileDataManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profileProvider, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSProfileDataManager)init
{

  return 0;
}

- (void)ensureProfileDirectoriesExistForProfileWithServerID:(id)a3 profileIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "safari_profileDirectoryURLWithID:createIfNeeded:", v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "safari_profileDirectoryURLWithID:createIfNeeded:", v10, 1);

}

- (void)didRemoveProfileWithServerID:(id)a3 profileIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_profileDirectoryURLWithID:createIfNeeded:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v7, "removeItemAtURL:error:", v9, &v19);
    v10 = v19;

    if (!v10)
    {
      if (v6)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = 0;
  }
  v14 = WBS_LOG_CHANNEL_PREFIXProfiles();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[WBSProfileDataManager didRemoveProfileWithServerID:profileIdentifier:].cold.2((uint64_t)v5, v14, v10);

  if (v6)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_profileDirectoryURLWithID:createIfNeeded:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v7, "removeItemAtURL:error:", v12, &v18);
    v13 = v18;

    if (!v13)
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_10:
  v13 = 0;
LABEL_11:
  v15 = WBS_LOG_CHANNEL_PREFIXProfiles();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[WBSProfileDataManager didRemoveProfileWithServerID:profileIdentifier:].cold.1((uint64_t)v6, v15, v13);
LABEL_13:
  +[WBSSiriIntelligenceDonor sharedInstance](WBSSiriIntelligenceDonor, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier:", v6);

  +[WBSIgnoredSiriSuggestedSitesController sharedController](WBSIgnoredSiriSuggestedSitesController, "sharedController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeIgnoredSiriSuggestedSitesInProfile:", v6);

}

- (void)didRemoveProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "serverID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSProfileDataManager didRemoveProfileWithServerID:profileIdentifier:](self, "didRemoveProfileWithServerID:profileIdentifier:", v6, v5);
}

- (WBSProfileProviding)profileProvider
{
  return self->_profileProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileProvider, 0);
}

- (void)didRemoveProfileWithServerID:(void *)a3 profileIdentifier:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A3D90000, v6, v7, "Failed to remove profile directory with identifier %{public}@ with error %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

- (void)didRemoveProfileWithServerID:(void *)a3 profileIdentifier:.cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A3D90000, v6, v7, "Failed to remove profile directory with server id %{public}@ with error %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

@end
