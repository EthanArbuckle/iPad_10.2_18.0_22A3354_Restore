@implementation STAskForTimeRequestReceivedUserNotificationContext

- (STAskForTimeRequestReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 childName:(id)a4 childDSID:(id)a5 requestedResourceName:(id)a6
{
  id v11;
  id v12;
  id v13;
  STAskForTimeRequestReceivedUserNotificationContext *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  v14 = -[STUserNotificationContext initWithIdentifier:](&v17, sel_initWithIdentifier_, a3);
  if (v14)
  {
    v18[0] = v11;
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUserNotificationContext setLocalizedUserNotificationBodyArguments:](v14, "setLocalizedUserNotificationBodyArguments:", v15);

    objc_storeStrong((id *)&v14->_childDSID, a5);
    objc_storeStrong((id *)&v14->_childName, a4);
  }

  return v14;
}

- (STAskForTimeRequestReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 familyMember:(id)a4 requestedResourceName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  STAskForTimeRequestReceivedUserNotificationContext *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dsid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[STAskForTimeRequestReceivedUserNotificationContext initWithAskForTimeRequestIdentifier:childName:childDSID:requestedResourceName:](self, "initWithAskForTimeRequestIdentifier:childName:childDSID:requestedResourceName:", v10, v11, v12, v8);
  return v13;
}

- (STAskForTimeRequestReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  STAskForTimeRequestReceivedUserNotificationContext *v5;
  uint64_t v6;
  NSNumber *childDSID;
  uint64_t v8;
  NSString *childName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  v5 = -[STUserNotificationContext initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    childDSID = v5->_childDSID;
    v5->_childDSID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childName"));
    v8 = objc_claimAutoreleasedReturnValue();
    childName = v5->_childName;
    v5->_childName = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  v4 = a3;
  -[STUserNotificationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_childDSID, CFSTR("childDSID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_childName, CFSTR("childName"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  STAskForTimeRequestReceivedUserNotificationContext *v11;
  id v12;

  v9[1] = 3221225472;
  v9[2] = __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370AC8;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v12;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

void __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("AskForTimeRequestReceivedNotificationTitle"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTitle:", v2);

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1[5], "localizedUserNotificationBodyArguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUserNotificationStringForKey:arguments:", CFSTR("AskForTimeRequestReceivedNotificationBody"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setBody:", v5);

  objc_msgSend(a1[4], "setCategoryIdentifier:", CFSTR("com.apple.screentime.ask-request"));
  objc_msgSend(a1[5], "childDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setScheme:", CFSTR("prefs"));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@&path=CHILD_%@"), CFSTR("root=SCREEN_TIME"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPath:", v11);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ASK_%@"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFragment:", v12);

    }
  }
  else
  {
    objc_msgSend(v10, "setPath:", CFSTR("root=SCREEN_TIME"));
  }
  objc_msgSend(v10, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "setDefaultActionURL:", v13);
  objc_msgSend(a1[4], "setInterruptionLevel:", 2);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2;
  v15[3] = &unk_1E9370CA0;
  v14 = a1[5];
  v16 = a1[4];
  v17 = a1[6];
  objc_msgSend(v14, "_fetchAndWriteFamilyPhotoURLIfNeeded:", v15);

}

uint64_t __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = a2;
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CEC718];
    v14 = *MEMORY[0x1E0CEC7E8];
    v15[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v6, "attachmentWithIdentifier:URL:options:error:", v5, v3, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v12;
    if (v8)
    {
      v13 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setAttachments:", v10);
    }
    else
    {
      +[STLog ask](STLog, "ask");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2_cold_1();
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchAndWriteFamilyPhotoURLIfNeeded:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[STAskForTimeRequestReceivedUserNotificationContext childDSID](self, "childDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("remotemanagement-%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STLocations familyPhotosCacheDirectory](STLocations, "familyPhotosCacheDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("png"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
    {
      v4[2](v4, v9);
    }
    else
    {
      +[STLog ask](STLog, "ask");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[STAskForTimeRequestReceivedUserNotificationContext _fetchAndWriteFamilyPhotoURLIfNeeded:].cold.1();

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20EC0]), "initWithFamilyMemberDSID:size:localFallback:", v5, 1, 1);
      objc_msgSend(v11, "setBackgroundType:", 1);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke;
      v12[3] = &unk_1E9370CC8;
      v13 = v5;
      v16 = v4;
      v14 = v7;
      v15 = v9;
      objc_msgSend(v11, "startRequestWithCompletionHandler:", v12);

    }
  }
  else
  {
    v4[2](v4, 0);
  }

}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;
  int v14;
  id v15;
  void (*v16)(void);
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;

  v6 = a2;
  v7 = a4;
  if (v7)
  {
    +[STLog ask](STLog, "ask");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_3((uint64_t)a1, (uint64_t)v7, v8);

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[5];
    v20 = 0;
    v11 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v20);
    v12 = v20;

    if (v11)
    {
      v13 = a1[6];
      v19 = v12;
      v14 = objc_msgSend(v6, "writeToURL:options:error:", v13, 1, &v19);
      v15 = v19;

      if (v14)
      {
        v16 = *(void (**)(void))(a1[7] + 16);
      }
      else
      {
        +[STLog ask](STLog, "ask");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_1();

        v16 = *(void (**)(void))(a1[7] + 16);
      }
      v16();
    }
    else
    {
      +[STLog ask](STLog, "ask");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_2();

      (*(void (**)(void))(a1[7] + 16))();
      v15 = v12;
    }

  }
}

- (NSString)childName
{
  return self->_childName;
}

- (void)setChildName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)childDSID
{
  return self->_childDSID;
}

- (void)setChildDSID:(id)a3
{
  objc_storeStrong((id *)&self->_childDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childDSID, 0);
  objc_storeStrong((id *)&self->_childName, 0);
}

void __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not create thumbnail attachment: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchAndWriteFamilyPhotoURLIfNeeded:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEBUG, "Fetching photo for %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not write family photo data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not create family photo directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "Could not fetch family photo for %@: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
