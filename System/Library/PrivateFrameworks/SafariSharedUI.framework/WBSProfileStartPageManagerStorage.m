@implementation WBSProfileStartPageManagerStorage

- (NSArray)startPageSectionDescriptors
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[WBSProfileStartPageManagerStorage startPageSectionsDataRepresentation](self, "startPageSectionsDataRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0D8A1E8], "decodeSectionsFromData:expectedFormat:allowingFallbackFormats:error:", v2, 1, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSProfileStartPageManagerStorage startPageSectionDescriptors].cold.1(v5, v4);
  }

  return (NSArray *)v3;
}

- (void)setStartPageSectionDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSString *profileIdentifier;
  WBTabGroupManager *tabGroupManager;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[WBSProfileStartPageManagerStorage startPageSectionsDataRepresentation](self, "startPageSectionsDataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0D8A1E8], "encodeSectionsAsSyncableData:existingSyncableData:error:", v4, v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v15;
  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSProfileStartPageManagerStorage setStartPageSectionDescriptors:].cold.1(v8, v7);
  }
  tabGroupManager = self->_tabGroupManager;
  profileIdentifier = self->_profileIdentifier;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__WBSProfileStartPageManagerStorage_setStartPageSectionDescriptors___block_invoke;
  v13[3] = &unk_1E5445640;
  v14 = v6;
  v11 = v6;
  v12 = (id)-[WBTabGroupManager updateProfileWithIdentifier:persist:usingBlock:completionHandler:](tabGroupManager, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", profileIdentifier, 1, v13, 0);

}

- (id)startPageSectionsDataRepresentation
{
  void *v2;
  void *v3;

  -[WBTabGroupManager profileWithIdentifier:](self->_tabGroupManager, "profileWithIdentifier:", self->_profileIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPageSectionsDataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WBTabGroupManager removeTabGroupObserver:](self->_tabGroupManager, "removeTabGroupObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WBSProfileStartPageManagerStorage;
  -[WBSProfileStartPageManagerStorage dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
}

- (WBSProfileStartPageManagerStorage)initWithProfileIdentifier:(id)a3 tabGroupManager:(id)a4
{
  id v7;
  id v8;
  WBSProfileStartPageManagerStorage *v9;
  WBSProfileStartPageManagerStorage *v10;
  WBSProfileStartPageManagerStorage *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSProfileStartPageManagerStorage;
  v9 = -[WBSProfileStartPageManagerStorage init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profileIdentifier, a3);
    objc_storeStrong((id *)&v10->_tabGroupManager, a4);
    objc_msgSend(v8, "addTabGroupObserver:", v10);
    v11 = v10;
  }

  return v10;
}

uint64_t __68__WBSProfileStartPageManagerStorage_setStartPageSectionDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStartPageSectionsDataRepresentation:", *(_QWORD *)(a1 + 32));
}

- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5
{
  uint64_t v6;

  if (objc_msgSend(a4, "isEqualToString:", self->_profileIdentifier))
  {
    v6 = *MEMORY[0x1E0D8A670];
    -[WBSProfileStartPageManagerStorage willChangeValueForKey:](self, "willChangeValueForKey:", *MEMORY[0x1E0D8A670]);
    -[WBSProfileStartPageManagerStorage didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)startPageSectionDescriptors
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Failed to decode section data: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)setStartPageSectionDescriptors:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Failed to serialize section data: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
