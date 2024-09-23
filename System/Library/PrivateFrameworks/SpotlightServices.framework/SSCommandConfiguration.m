@implementation SSCommandConfiguration

- (SSCommandConfiguration)initWithTitle:(id)a3 symbol:(id)a4 command:(id)a5
{
  id v8;
  id v9;
  id v10;
  SSCommandConfiguration *v11;
  SSCommandConfiguration *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SSCommandConfiguration;
  v11 = -[SSCommandConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SSCommandConfiguration setTitle:](v11, "setTitle:", v8);
    -[SSCommandConfiguration setCommand:](v12, "setCommand:", v10);
    -[SSCommandConfiguration setSymbol:](v12, "setSymbol:", v9);
  }

  return v12;
}

- (id)createSFCommandButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[SSCommandConfiguration command](self, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCommand:", v4);

  -[SSCommandConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_opt_new();
  -[SSCommandConfiguration symbol](self, "symbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSymbolName:", v7);

  objc_msgSend(v6, "setIsTemplate:", 1);
  objc_msgSend(v3, "setImage:", v6);

  return v3;
}

+ (id)valueWithPrimaryCommand:(id)a3 copyString:(id)a4 copyTitle:(id)a5 previewCommandConfigurations:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  v25 = v9;
  objc_msgSend(v12, "setCopyableString:", v9);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setCopyableItem:", v12);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setCommand:", v13);
  if (v10)
    objc_msgSend(v14, "setTitle:", v10);
  v15 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "createSFCommandButtonItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

  objc_msgSend(v26, "createSFCommandButtonItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setImage:", 0);
  if (isMacOS())
  {
    objc_msgSend(v22, "setCommand:", 0);
  }
  else
  {
    objc_msgSend(v22, "command");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCommand:", v23);

  }
  objc_msgSend(v15, "addObject:", v14);
  objc_msgSend(v22, "setPreviewButtonItems:", v15);

  return v22;
}

+ (id)valueWithPrimaryCommand:(id)a3 copyString:(id)a4 copyTitle:(id)a5 previewCommandTitle:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SSCommandConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  SSCommandConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [SSCommandConfiguration alloc];
  objc_msgSend(v12, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "symbol");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "command");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SSCommandConfiguration initWithTitle:symbol:command:](v13, "initWithTitle:symbol:command:", v14, v15, v16);

  -[SSCommandConfiguration setTitle:](v17, "setTitle:", v9);
  v18 = (void *)objc_opt_class();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueWithPrimaryCommand:copyString:copyTitle:previewCommandConfigurations:", v12, v11, v10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)punchoutCommandWithScheme:(id)a3 host:(id)a4 path:(id)a5 queryItems:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setScheme:", v12);

  objc_msgSend(v13, "setHost:", v11);
  objc_msgSend(v13, "setPath:", v10);

  objc_msgSend(v13, "setQueryItems:", v9);
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPunchout:", v16);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)dialRequestURLWithPhoneNumber:(id)a3 contact:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DBD1E0]);
  objc_msgSend(v7, "telephonyProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithProvider:", v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2F8]), "initWithType:value:", 2, v5);
    objc_msgSend(v9, "setHandle:", v10);

    if (objc_msgSend(v6, "hasBeenPersisted"))
    {
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContactIdentifier:", v11);

    }
    objc_msgSend(v9, "setVideo:", 0);
    objc_msgSend(v9, "setTtyType:", 0);
    objc_msgSend(v9, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLog(CFSTR("SSContactResultBuilder: Failed to create TUDialRequest, manager = %@, provider = %@"), v7, 0);
    v12 = 0;
  }

  return v12;
}

+ (id)commandButtonItemForPhoneNumber:(id)a3 contact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  SSCommandConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SSCommandConfiguration *v16;
  void *v17;
  void *v18;
  void *v19;
  SSCommandConfiguration *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SSCommandConfiguration *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  SSCommandConfiguration *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "dialRequestURLWithPhoneNumber:contact:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v34[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUrls:", v9);

    v10 = objc_opt_new();
    -[NSObject setPunchout:](v10, "setPunchout:", v7);
    v32 = v7;
    v31 = -[SSCommandConfiguration initWithTitle:symbol:command:]([SSCommandConfiguration alloc], "initWithTitle:symbol:command:", v5, CFSTR("phone"), v10);
    v11 = [SSCommandConfiguration alloc];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MENU_COMMAND_CALL_PHONE_NUMBER"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SSCommandConfiguration initWithTitle:symbol:command:](v11, "initWithTitle:symbol:command:", v15, CFSTR("phone"), v10);

    v17 = (void *)objc_opt_class();
    objc_msgSend(v5, "stringByRemovingWhitespace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "punchoutCommandWithScheme:host:path:queryItems:", CFSTR("sms"), 0, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [SSCommandConfiguration alloc];
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MENU_COMMAND_MESSAGE_PHONE_NUMBER"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v23, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SSCommandConfiguration initWithTitle:symbol:command:](v20, "initWithTitle:symbol:command:", v24, CFSTR("message"), v19);

    v26 = objc_opt_class();
    v33[0] = v16;
    v33[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v26;
    v7 = v32;
    objc_msgSend(v28, "valueWithPrimaryCommand:copyString:copyTitle:previewCommandConfigurations:", v31, v5, 0, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PRSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SSCommandConfiguration commandButtonItemForPhoneNumber:contact:].cold.1((uint64_t)v5, v10);
    v29 = 0;
  }

  return v29;
}

+ (id)commandButtonItemForEmail:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "punchoutCommandWithScheme:host:path:queryItems:", CFSTR("mailto"), 0, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend((id)objc_opt_new(), "initWithTitle:symbol:command:", v3, CFSTR("envelope"), v4);
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MENU_COMMAND_SEND_EMAIL"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithPrimaryCommand:copyString:copyTitle:previewCommandTitle:", v5, v3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)commandButtonItemForAddressLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("q"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutCommandWithScheme:host:path:queryItems:", CFSTR("maps"), 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend((id)objc_opt_new(), "initWithTitle:symbol:command:", v3, CFSTR("location"), v7);
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MENU_COMMAND_OPEN_ADDRESS_IN_MAPS"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithPrimaryCommand:copyString:copyTitle:previewCommandTitle:", v8, v3, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)commandButtonItemForBirthday:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  +[SSDateFormatManager stringFromBirthdayComponents:](SSDateFormatManager, "stringFromBirthdayComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSDateFormatManager nextUpcomingDateForDateComponents:fromDate:](SSDateFormatManager, "nextUpcomingDateForDateComponents:fromDate:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "numberWithInteger:", (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend(v9, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "punchoutCommandWithScheme:host:path:queryItems:", CFSTR("calshow"), 0, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend((id)objc_opt_new(), "initWithTitle:symbol:command:", v4, CFSTR("calendar"), v12);
  v14 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MENU_COMMAND_SHOW_IN_CALENDAR"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueWithPrimaryCommand:copyString:copyTitle:previewCommandTitle:", v13, v4, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (SFCommand)command
{
  return (SFCommand *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCommand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSymbol:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

+ (void)commandButtonItemForPhoneNumber:(uint64_t)a1 contact:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "Failed to generate dialRequestURL for phoneNumber: %@", (uint8_t *)&v2, 0xCu);
}

@end
