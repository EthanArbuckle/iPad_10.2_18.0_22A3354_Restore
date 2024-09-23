@implementation VUILibraryFamilyMembersDataSource

void __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

void __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  VUIFamilyMembersRequestResponseParser *v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    VUIDefaultLogObject();
    v9 = (VUIFamilyMembersRequestResponseParser *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_cold_1((uint64_t)v6, &v9->super);
  }
  else
  {
    v9 = objc_alloc_init(VUIFamilyMembersRequestResponseParser);
    -[VUIFamilyMembersRequestResponseParser parseAMSURLResult:](v9, "parseAMSURLResult:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setFamilyMembers:", v10);
    objc_msgSend(WeakRetained, "_orderFamilyMembersByFirstName");

  }
  objc_msgSend(WeakRetained, "setHasCompletedInitialFetch:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_3;
  v14 = &unk_1E9F99C98;
  objc_copyWeak(&v15, v7);
  v11 = v12;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v13((uint64_t)v11);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v15);
}

- (void)startFetch
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  +[VUIMediaAPIRequestFactory familyMembersRequest](VUIMediaAPIRequestFactory, "familyMembersRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[VUILibraryFamilyMembersDataSource mediaClient](self, "mediaClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke;
  v5[3] = &unk_1E9F9A338;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "fetchContentForUrl:completion:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (VUIMediaAPIClient)mediaClient
{
  return self->_mediaClient;
}

- (VUILibraryFamilyMembersDataSource)init
{
  VUILibraryFamilyMembersDataSource *v2;
  uint64_t v3;
  VUIMediaAPIClient *mediaClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryFamilyMembersDataSource;
  v2 = -[VUILibraryFamilyMembersDataSource init](&v6, sel_init);
  if (v2)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier](VUIMediaAPIClient, "initializeWithAppleTVClientIdentifier");
    +[VUIMediaAPIClient sharedInstance](VUIMediaAPIClient, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    mediaClient = v2->_mediaClient;
    v2->_mediaClient = (VUIMediaAPIClient *)v3;

  }
  return v2;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)_orderFamilyMembersByFirstName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[VUILibraryFamilyMembersDataSource familyMembers](self, "familyMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("firstName"), 1, sel_localizedCaseInsensitiveCompare_);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingDescriptors:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  -[VUILibraryFamilyMembersDataSource setFamilyMembers:](self, "setFamilyMembers:", v7);

}

- (void)setMediaClient:(id)a3
{
  objc_storeStrong((id *)&self->_mediaClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaClient, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
}

void __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "Fetching family members failed with error:%@", (uint8_t *)&v2, 0xCu);
}

@end
