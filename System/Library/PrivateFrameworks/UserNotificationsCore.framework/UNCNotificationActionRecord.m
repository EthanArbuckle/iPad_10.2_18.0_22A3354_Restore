@implementation UNCNotificationActionRecord

- (UNCNotificationActionRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  UNCNotificationActionRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)UNCNotificationActionRecord;
  v5 = -[UNCNotificationActionRecord init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ActionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setActionType:](v5, "setActionType:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("Identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("AuthenticationRequired"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setAuthenticationRequired:](v5, "setAuthenticationRequired:", objc_msgSend(v8, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Destructive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setDestructive:](v5, "setDestructive:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Foreground"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setForeground:](v5, "setForeground:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("HasSystemIcon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setHasSystemIcon:](v5, "setHasSystemIcon:", objc_msgSend(v11, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("IconImageName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setIconImageName:](v5, "setIconImageName:", v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("ShouldPreventNotificationDismiss"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setShouldPreventNotificationDismiss:](v5, "setShouldPreventNotificationDismiss:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("TextInputButtonTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTextInputButtonTitle:](v5, "setTextInputButtonTitle:", v14);

    objc_msgSend(v4, "objectForKey:", CFSTR("TextInputButtonTitleLocalizationArguments"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTextInputButtonTitleLocalizationArguments:](v5, "setTextInputButtonTitleLocalizationArguments:", v15);

    objc_msgSend(v4, "objectForKey:", CFSTR("TextInputButtonTitleLocalizationKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTextInputButtonTitleLocalizationKey:](v5, "setTextInputButtonTitleLocalizationKey:", v16);

    objc_msgSend(v4, "objectForKey:", CFSTR("TextInputPlaceholder"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTextInputPlaceholder:](v5, "setTextInputPlaceholder:", v17);

    objc_msgSend(v4, "objectForKey:", CFSTR("TextInputPlaceholderLocalizationArguments"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTextInputPlaceholderLocalizationArguments:](v5, "setTextInputPlaceholderLocalizationArguments:", v18);

    objc_msgSend(v4, "objectForKey:", CFSTR("TextInputPlaceholderLocalizationKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTextInputPlaceholderLocalizationKey:](v5, "setTextInputPlaceholderLocalizationKey:", v19);

    objc_msgSend(v4, "objectForKey:", CFSTR("Title"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTitle:](v5, "setTitle:", v20);

    objc_msgSend(v4, "objectForKey:", CFSTR("TitleLocalizationArguments"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTitleLocalizationArguments:](v5, "setTitleLocalizationArguments:", v21);

    objc_msgSend(v4, "objectForKey:", CFSTR("TitleLocalizationKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationActionRecord setTitleLocalizationKey:](v5, "setTitleLocalizationKey:", v22);

    objc_msgSend(v4, "objectForKey:", CFSTR("URL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v4, "objectForKey:", CFSTR("URL"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URLWithString:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCNotificationActionRecord setUrl:](v5, "setUrl:", v26);

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationActionRecord actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v4, CFSTR("ActionType"));

  -[UNCNotificationActionRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v5, CFSTR("Identifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationActionRecord hasSystemIcon](self, "hasSystemIcon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v6, CFSTR("HasSystemIcon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationActionRecord isAuthenticationRequired](self, "isAuthenticationRequired"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v7, CFSTR("AuthenticationRequired"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationActionRecord isDestructive](self, "isDestructive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v8, CFSTR("Destructive"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationActionRecord isForeground](self, "isForeground"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v9, CFSTR("Foreground"));

  -[UNCNotificationActionRecord iconImageName](self, "iconImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v10, CFSTR("IconImageName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCNotificationActionRecord shouldPreventNotificationDismiss](self, "shouldPreventNotificationDismiss"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v11, CFSTR("ShouldPreventNotificationDismiss"));

  -[UNCNotificationActionRecord textInputButtonTitle](self, "textInputButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v12, CFSTR("TextInputButtonTitle"));

  -[UNCNotificationActionRecord textInputButtonTitleLocalizationArguments](self, "textInputButtonTitleLocalizationArguments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v13, CFSTR("TextInputButtonTitleLocalizationArguments"));

  -[UNCNotificationActionRecord textInputButtonTitleLocalizationKey](self, "textInputButtonTitleLocalizationKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v14, CFSTR("TextInputButtonTitleLocalizationKey"));

  -[UNCNotificationActionRecord textInputPlaceholder](self, "textInputPlaceholder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v15, CFSTR("TextInputPlaceholder"));

  -[UNCNotificationActionRecord textInputPlaceholderLocalizationArguments](self, "textInputPlaceholderLocalizationArguments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v16, CFSTR("TextInputPlaceholderLocalizationArguments"));

  -[UNCNotificationActionRecord textInputPlaceholderLocalizationKey](self, "textInputPlaceholderLocalizationKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v17, CFSTR("TextInputPlaceholderLocalizationKey"));

  -[UNCNotificationActionRecord title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v18, CFSTR("Title"));

  -[UNCNotificationActionRecord titleLocalizationArguments](self, "titleLocalizationArguments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v19, CFSTR("TitleLocalizationArguments"));

  -[UNCNotificationActionRecord titleLocalizationKey](self, "titleLocalizationKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v20, CFSTR("TitleLocalizationKey"));

  -[UNCNotificationActionRecord url](self, "url");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "absoluteString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v22, CFSTR("URL"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationActionRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Identifier"));

  -[UNCNotificationActionRecord actionType](self, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("ActionType"));

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord hasSystemIcon](self, "hasSystemIcon"), CFSTR("HasSystemIcon"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord isAuthenticationRequired](self, "isAuthenticationRequired"), CFSTR("AuthenticationRequired"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord isDestructive](self, "isDestructive"), CFSTR("Destructive"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord isForeground](self, "isForeground"), CFSTR("Foreground"));
  -[UNCNotificationActionRecord iconImageName](self, "iconImageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v12, CFSTR("IconImageName"));

  v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord shouldPreventNotificationDismiss](self, "shouldPreventNotificationDismiss"), CFSTR("ShouldPreventNotificationDismiss"));
  -[UNCNotificationActionRecord textInputButtonTitle](self, "textInputButtonTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("textInputButtonTitle"));

  -[UNCNotificationActionRecord textInputButtonTitleLocalizationArguments](self, "textInputButtonTitleLocalizationArguments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("textInputButtonTitleLocalizationArguments"));

  -[UNCNotificationActionRecord textInputButtonTitleLocalizationKey](self, "textInputButtonTitleLocalizationKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("textInputButtonTitleLocalizationKey"));

  -[UNCNotificationActionRecord textInputPlaceholder](self, "textInputPlaceholder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "appendObject:withName:", v20, CFSTR("textInputPlaceholder"));

  -[UNCNotificationActionRecord textInputPlaceholderLocalizationArguments](self, "textInputPlaceholderLocalizationArguments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v3, "appendObject:withName:", v22, CFSTR("textInputPlaceholderLocalizationArguments"));

  -[UNCNotificationActionRecord textInputPlaceholderLocalizationKey](self, "textInputPlaceholderLocalizationKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v3, "appendObject:withName:", v24, CFSTR("textInputPlaceholderLocalizationKey"));

  -[UNCNotificationActionRecord title](self, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v3, "appendObject:withName:", v26, CFSTR("Title"));

  -[UNCNotificationActionRecord titleLocalizationArguments](self, "titleLocalizationArguments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v3, "appendObject:withName:", v28, CFSTR("TitleLocalizationArguments"));

  -[UNCNotificationActionRecord titleLocalizationKey](self, "titleLocalizationKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v3, "appendObject:withName:", v30, CFSTR("TitleLocalizationKey"));

  -[UNCNotificationActionRecord url](self, "url");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v3, "appendObject:withName:", v32, CFSTR("URL"));

  objc_msgSend(v3, "build");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  char v49;

  v4 = a3;
  if (!v4)
    goto LABEL_21;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_21;
  -[UNCNotificationActionRecord identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNEqualObjects();

  if (!v8)
    goto LABEL_21;
  -[UNCNotificationActionRecord actionType](self, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = UNEqualObjects();

  if (!v11)
    goto LABEL_21;
  v12 = -[UNCNotificationActionRecord isAuthenticationRequired](self, "isAuthenticationRequired");
  if (v12 != objc_msgSend(v4, "isAuthenticationRequired"))
    goto LABEL_21;
  v13 = -[UNCNotificationActionRecord isDestructive](self, "isDestructive");
  if (v13 != objc_msgSend(v4, "isDestructive"))
    goto LABEL_21;
  v14 = -[UNCNotificationActionRecord isForeground](self, "isForeground");
  if (v14 != objc_msgSend(v4, "isForeground"))
    goto LABEL_21;
  v15 = -[UNCNotificationActionRecord hasSystemIcon](self, "hasSystemIcon");
  if (v15 != objc_msgSend(v4, "hasSystemIcon"))
    goto LABEL_21;
  v16 = -[UNCNotificationActionRecord shouldPreventNotificationDismiss](self, "shouldPreventNotificationDismiss");
  if (v16 != objc_msgSend(v4, "shouldPreventNotificationDismiss"))
    goto LABEL_21;
  -[UNCNotificationActionRecord iconImageName](self, "iconImageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImageName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = UNEqualObjects();

  if (!v19)
    goto LABEL_21;
  -[UNCNotificationActionRecord textInputButtonTitle](self, "textInputButtonTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputButtonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = UNEqualObjects();

  if (!v22)
    goto LABEL_21;
  -[UNCNotificationActionRecord textInputButtonTitleLocalizationArguments](self, "textInputButtonTitleLocalizationArguments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputButtonTitleLocalizationArguments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = UNEqualObjects();

  if (!v25)
    goto LABEL_21;
  -[UNCNotificationActionRecord textInputButtonTitleLocalizationKey](self, "textInputButtonTitleLocalizationKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputButtonTitleLocalizationKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = UNEqualObjects();

  if (!v28)
    goto LABEL_21;
  -[UNCNotificationActionRecord textInputPlaceholder](self, "textInputPlaceholder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputPlaceholder");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = UNEqualObjects();

  if (!v31)
    goto LABEL_21;
  -[UNCNotificationActionRecord textInputPlaceholderLocalizationArguments](self, "textInputPlaceholderLocalizationArguments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputPlaceholderLocalizationArguments");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = UNEqualObjects();

  if (!v34)
    goto LABEL_21;
  -[UNCNotificationActionRecord textInputPlaceholderLocalizationKey](self, "textInputPlaceholderLocalizationKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputPlaceholderLocalizationKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = UNEqualObjects();

  if (!v37)
    goto LABEL_21;
  -[UNCNotificationActionRecord title](self, "title");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = UNEqualObjects();

  if (!v40)
    goto LABEL_21;
  -[UNCNotificationActionRecord titleLocalizationArguments](self, "titleLocalizationArguments");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLocalizationArguments");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = UNEqualObjects();

  if (!v43)
    goto LABEL_21;
  -[UNCNotificationActionRecord titleLocalizationKey](self, "titleLocalizationKey");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLocalizationKey");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = UNEqualObjects();

  if (v46)
  {
    -[UNCNotificationActionRecord url](self, "url");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = UNEqualObjects();

  }
  else
  {
LABEL_21:
    v49 = 0;
  }

  return v49;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  unint64_t v35;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord isAuthenticationRequired](self, "isAuthenticationRequired"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord isDestructive](self, "isDestructive"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord isForeground](self, "isForeground"));
  v7 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord hasSystemIcon](self, "hasSystemIcon"));
  v8 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord shouldPreventNotificationDismiss](self, "shouldPreventNotificationDismiss"));
  -[UNCNotificationActionRecord identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  -[UNCNotificationActionRecord actionType](self, "actionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:", v11);

  -[UNCNotificationActionRecord iconImageName](self, "iconImageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:", v13);

  -[UNCNotificationActionRecord textInputButtonTitle](self, "textInputButtonTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:", v15);

  -[UNCNotificationActionRecord textInputButtonTitleLocalizationArguments](self, "textInputButtonTitleLocalizationArguments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:", v17);

  -[UNCNotificationActionRecord textInputButtonTitleLocalizationKey](self, "textInputButtonTitleLocalizationKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendObject:", v19);

  -[UNCNotificationActionRecord textInputPlaceholder](self, "textInputPlaceholder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendObject:", v21);

  -[UNCNotificationActionRecord textInputPlaceholderLocalizationArguments](self, "textInputPlaceholderLocalizationArguments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v3, "appendObject:", v23);

  -[UNCNotificationActionRecord textInputPlaceholderLocalizationKey](self, "textInputPlaceholderLocalizationKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v3, "appendObject:", v25);

  -[UNCNotificationActionRecord title](self, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v3, "appendObject:", v27);

  -[UNCNotificationActionRecord titleLocalizationArguments](self, "titleLocalizationArguments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendObject:", v29);

  -[UNCNotificationActionRecord titleLocalizationKey](self, "titleLocalizationKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v3, "appendObject:", v31);

  -[UNCNotificationActionRecord url](self, "url");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v3, "appendObject:", v33);

  v35 = objc_msgSend(v3, "hash");
  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCNotificationActionRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

- (UNCNotificationActionRecord)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UNCNotificationActionRecord *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UNCNotificationActionRecord initWithDictionaryRepresentation:]([UNCNotificationActionRecord alloc], "initWithDictionaryRepresentation:", v8);
  return v9;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasSystemIcon
{
  return self->_hasSystemIcon;
}

- (void)setHasSystemIcon:(BOOL)a3
{
  self->_hasSystemIcon = a3;
}

- (BOOL)isAuthenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_authenticationRequired = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (BOOL)shouldPreventNotificationDismiss
{
  return self->_shouldPreventNotificationDismiss;
}

- (void)setShouldPreventNotificationDismiss:(BOOL)a3
{
  self->_shouldPreventNotificationDismiss = a3;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (void)setIconImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)textInputButtonTitle
{
  return self->_textInputButtonTitle;
}

- (void)setTextInputButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)textInputButtonTitleLocalizationArguments
{
  return self->_textInputButtonTitleLocalizationArguments;
}

- (void)setTextInputButtonTitleLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)textInputButtonTitleLocalizationKey
{
  return self->_textInputButtonTitleLocalizationKey;
}

- (void)setTextInputButtonTitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)textInputPlaceholder
{
  return self->_textInputPlaceholder;
}

- (void)setTextInputPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)textInputPlaceholderLocalizationArguments
{
  return self->_textInputPlaceholderLocalizationArguments;
}

- (void)setTextInputPlaceholderLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)textInputPlaceholderLocalizationKey
{
  return self->_textInputPlaceholderLocalizationKey;
}

- (void)setTextInputPlaceholderLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)titleLocalizationArguments
{
  return self->_titleLocalizationArguments;
}

- (void)setTitleLocalizationArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (void)setTitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholderLocalizationKey, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholderLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholder, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitle, 0);
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

@end
