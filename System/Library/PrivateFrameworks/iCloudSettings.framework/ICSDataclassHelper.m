@implementation ICSDataclassHelper

+ (id)localizedTitleForDataclass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "dataclassTitleDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localizedSubTitleForDataclass:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  LogSubsystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2048;
    v17 = a5;
    _os_log_impl(&dword_24B4C1000, v10, OS_LOG_TYPE_DEFAULT, "localizedSubTitleForDataclass idmsAccount: %@, securityLevel: %lu", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(a1, "dataclassSubTitleDictionary:idmsAccount:securityLevel:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)attributedLinkForDataclass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "dataclassAttributedLinkDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dataclassTitleDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICSDataclassHelper_dataclassTitleDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dataclassTitleDictionary_onceToken != -1)
    dispatch_once(&dataclassTitleDictionary_onceToken, block);
  return (id)dataclassTitleDictionary_dataclassTitleMap;
}

void __46__ICSDataclassHelper_dataclassTitleDictionary__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
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
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;

  v32 = objc_alloc_init(MEMORY[0x24BE04958]);
  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTES_DATACLASS_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deviceClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDB3E68]);

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MESSAGES_DATACLASS_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deviceClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDB3E48]);

  objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDB3E18];
  LODWORD(v7) = objc_msgSend(v11, "appIsNeitherInstalledOrPlaceholder:", *MEMORY[0x24BDB3E18]);

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)v7)
    v16 = CFSTR("HEALTH_DATA_DATACLASS_TITLE");
  else
    v16 = CFSTR("HEALTH_DATACLASS_TITLE");
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deviceClass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v19, v12);

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_DATACLASS_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deviceClass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDB3E30]);

  v25 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("ICLOUD_DRIVE_DATACLASS_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deviceClass");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDB3EC8]);

  v30 = objc_msgSend(v0, "copy");
  v31 = (void *)dataclassTitleDictionary_dataclassTitleMap;
  dataclassTitleDictionary_dataclassTitleMap = v30;

}

+ (id)dataclassSubTitleDictionary:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5
{
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDB3E18]);
  if (a4 && v8)
  {
    objc_msgSend(a1, "healthDataclassSubtitleForSecurityLevel:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v10, OS_LOG_TYPE_DEFAULT, "IdMS account is nil. Proceeding with default subtitles for Health dataclass.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("HEALTH_DATACLASS_SUBTITLE_DEFAULT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__ICSDataclassHelper_dataclassSubTitleDictionary_idmsAccount_securityLevel___block_invoke;
  v17[3] = &unk_251C61688;
  v18 = v9;
  v19 = a1;
  v13 = dataclassSubTitleDictionary_idmsAccount_securityLevel__onceToken;
  v14 = v9;
  if (v13 != -1)
    dispatch_once(&dataclassSubTitleDictionary_idmsAccount_securityLevel__onceToken, v17);
  v15 = (id)dataclassSubTitleDictionary_idmsAccount_securityLevel__dataclassSubTitleMap;

  return v15;
}

void __76__ICSDataclassHelper_dataclassSubTitleDictionary_idmsAccount_securityLevel___block_invoke(uint64_t a1)
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
  id v12;

  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTES_DATACLASS_SUBTITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDB3E68]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGES_DATACLASS_SUBTITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDB3E48]);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDB3E18]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_DATACLASS_SUBTITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDB3E30]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ICLOUD_DRIVE_DATACLASS_SUBTITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDB3EC8]);

  v10 = objc_msgSend(v12, "copy");
  v11 = (void *)dataclassSubTitleDictionary_idmsAccount_securityLevel__dataclassSubTitleMap;
  dataclassSubTitleDictionary_idmsAccount_securityLevel__dataclassSubTitleMap = v10;

}

+ (id)healthDataclassSubtitleForSecurityLevel:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  switch(objc_msgSend(a1, "currentSecurityLevel:", a3))
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BEBD538];
      v5 = CFSTR("HEALTH_DATACLASS_SUBTITLE_DEFAULT");
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BEBD538];
      v5 = CFSTR("HEALTH_DATACLASS_SUBTITLE_PASSCODE_HSA2");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BEBD538];
      v5 = CFSTR("HEALTH_DATACLASS_SUBTITLE_PASSCODE");
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BEBD538];
      v5 = CFSTR("HEALTH_DATACLASS_SUBTITLE_NO_PASSCODE_HSA2");
LABEL_7:
      objc_msgSend(v4, "modelSpecificLocalizedStringKeyForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", v7, &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (unint64_t)currentSecurityLevel:(unint64_t)a3
{
  void *v4;
  int v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasLocalSecret");

  v6 = 1;
  if (a3 != 4)
    v6 = 2;
  v7 = 3;
  if (a3 != 4)
    v7 = 0;
  if (v5)
    return v6;
  else
    return v7;
}

+ (id)dataclassAttributedLinkDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ICSDataclassHelper_dataclassAttributedLinkDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dataclassAttributedLinkDictionary_onceToken != -1)
    dispatch_once(&dataclassAttributedLinkDictionary_onceToken, block);
  return (id)dataclassAttributedLinkDictionary_dataclassAttributedLinksMap;
}

void __55__ICSDataclassHelper_dataclassAttributedLinkDictionary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("NOTES_LEARN_MORE_LINK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v1, *MEMORY[0x24BDB3E68]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MESSAGES_LEARN_MORE_LINK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDB3E48]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH_LEARN_MORE_LINK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDB3E18]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ICLOUD_DRIVE_LEARN_MORE_LINK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDB3EC8]);

  v8 = objc_msgSend(v10, "copy");
  v9 = (void *)dataclassAttributedLinkDictionary_dataclassAttributedLinksMap;
  dataclassAttributedLinkDictionary_dataclassAttributedLinksMap = v8;

}

@end
