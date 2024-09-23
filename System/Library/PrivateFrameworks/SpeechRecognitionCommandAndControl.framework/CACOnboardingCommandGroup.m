@implementation CACOnboardingCommandGroup

- (CACOnboardingCommandGroup)initWithGroupTitle:(id)a3 commands:(id)a4
{
  id v7;
  id v8;
  CACOnboardingCommandGroup *v9;
  CACOnboardingCommandGroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CACOnboardingCommandGroup;
  v9 = -[CACOnboardingCommandGroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_groupTitle, a3);
    objc_storeStrong((id *)&v10->_commands, a4);
  }

  return v10;
}

+ (id)groupWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  CACOnboardingCommandGroup *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "builtInCommandsTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OverviewSections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "builtInCommandsTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("OrderedOverviewSectionIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("OverviewSectionTitle.%@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v3))
        {
          v33 = v17;
          v34 = v16;
          v35 = v10;
          v36 = v3;
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", CFSTR("CommandIdentifiers"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          obj = v21;
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v39 != v24)
                  objc_enumerationMutation(obj);
                v26 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "primaryStringForCommandIdentifier:", v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Onboarding.Command.Format.Title"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                +[CACOnboardingFeature featureWithTitleText:helperText:](CACOnboardingFeature, "featureWithTitleText:helperText:", v30, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v31);

              }
              v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v23);
          }

          v18 = -[CACOnboardingCommandGroup initWithGroupTitle:commands:]([CACOnboardingCommandGroup alloc], "initWithGroupTitle:commands:", v33, v19);
          v3 = v36;
          v10 = v35;
          goto LABEL_18;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v12)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_18:

  return v18;
}

+ (id)groupsFromIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[CACOnboardingCommandGroup groupWithIdentifier:](CACOnboardingCommandGroup, "groupWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)allCommandGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builtInCommandsTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("OrderedOverviewSectionIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACOnboardingCommandGroup groupsFromIdentifiers:](CACOnboardingCommandGroup, "groupsFromIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)setGroupTitle:(id)a3
{
  objc_storeStrong((id *)&self->_groupTitle, a3);
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_storeStrong((id *)&self->_commands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_groupTitle, 0);
}

@end
