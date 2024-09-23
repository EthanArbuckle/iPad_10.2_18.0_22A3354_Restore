@implementation CKShareParticipant(WBSUICKShareParticipantExtras)

- (id)safari_contact
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;

  objc_msgSend(a1, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temporaryContactForIdentity:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "safari_shareParticipantIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_setShareParticipantIdentifier:", v6);
    goto LABEL_11;
  }
  if (safari_contact_onceToken != -1)
    dispatch_once(&safari_contact_onceToken, &__block_literal_global_58);
  objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "unifiedContactWithIdentifier:keysToFetch:error:", v3, safari_contact_keyDescriptors, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (!v5)
  {
    if (v6)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXSharedTabGroups();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CKShareParticipant(WBSUICKShareParticipantExtras) safari_contact].cold.1(v8, v6);
    }

    goto LABEL_10;
  }
  objc_msgSend(a1, "safari_shareParticipantIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_setShareParticipantIdentifier:", v7);

LABEL_11:
  return v5;
}

- (void)safari_contact
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch contact: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
