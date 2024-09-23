@implementation SUICKPAudioPlaybackCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken_1 != -1)
    dispatch_once(&cardSectionClasses_onceToken_1, &__block_literal_global_1);
  return (id)cardSectionClasses_cardSectionClasses_1;
}

void __66__SUICKPAudioPlaybackCardSectionViewController_cardSectionClasses__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cardSectionClasses_cardSectionClasses_1;
  cardSectionClasses_cardSectionClasses_1 = v0;

}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SUICKPAudioPlaybackCardSectionViewController;
  -[CRKCardSectionViewController cardEventDidOccur:withIdentifier:userInfo:](&v35, sel_cardEventDidOccur_withIdentifier_userInfo_, a3, v8, a5);
  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v26 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SUICKPAudioPlaybackCardSectionViewController cardEventDidOccur:withIdentifier:userInfo:].cold.2(v26, self);
    goto LABEL_26;
  }
  -[SUICKPAudioPlaybackCardSectionViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2554996F0);

  if ((v12 & 1) == 0)
  {
    v27 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SUICKPAudioPlaybackCardSectionViewController cardEventDidOccur:withIdentifier:userInfo:].cold.1(v27, self);
    goto LABEL_26;
  }
  if (a3 == 2)
  {
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "state");

    if (!v29)
      goto LABEL_26;
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = 0;
LABEL_23:
    objc_msgSend(v30, "setState:", v32);

    -[SUICKPAudioPlaybackCardSectionViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateStateFromCardSection:", v33);

LABEL_25:
    goto LABEL_26;
  }
  if (a3 != 1)
    goto LABEL_26;
  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playCommands");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = v14;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v18)
  {

    goto LABEL_25;
  }
  v19 = v18;
  v34 = v13;
  v20 = *(_QWORD *)v37;
  while (2)
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v37 != v20)
        objc_enumerationMutation(v17);
      objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "referentialCommand");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "referenceIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "isEqualToString:", v15);
      if ((v25 & 1) != 0)
      {

LABEL_22:
        -[CRKCardSectionViewController cardSection](self, "cardSection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = 2;
        goto LABEL_23;
      }
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v19)
      continue;
    break;
  }

  if ((v25 & 1) != 0)
    goto LABEL_22;
LABEL_26:

}

- (void)didEngageCardSection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v4, "cardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSectionWithSFCardSection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionView:willProcessEngagementFeedback:", v10, v4);

  }
  -[CRKCardSectionViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userDidEngageCardSection:withEngagementFeedback:", v14, v4);

  }
  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      v19 = objc_msgSend(v4, "actionTarget");
      -[CRKCardSectionViewController cardSection](self, "cardSection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19 == 4)
      {
        v22 = objc_msgSend(v20, "state");

        -[CRKCardSectionViewController cardSection](self, "cardSection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (!v22)
        {
          objc_msgSend(v23, "stopCommands");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUICKPAudioPlaybackCardSectionViewController _performCommands:applyingUserInfo:](self, "_performCommands:applyingUserInfo:", v35, 0);

          -[CRKCardSectionViewController cardSection](self, "cardSection");
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "playCommands");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = CFSTR("CRKAudioPlaybackCardSectionIgnoresMuteSwitch");
          v38[0] = MEMORY[0x24BDBD1C8];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUICKPAudioPlaybackCardSectionViewController _performCommands:applyingUserInfo:](self, "_performCommands:applyingUserInfo:", v27, v36);

          goto LABEL_18;
        }
        v25 = objc_msgSend(v23, "state");

        if (v25 == 2)
        {
          -[CRKCardSectionViewController cardSection](self, "cardSection");
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stopCommands");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUICKPAudioPlaybackCardSectionViewController _performCommands:applyingUserInfo:](self, "_performCommands:applyingUserInfo:", v27, 0);
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        objc_msgSend(v20, "backingCardSection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "nextCard");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v26 = objc_alloc_init(MEMORY[0x24BE154F0]);
          -[CRKCardSectionViewController cardSection](self, "cardSection");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "backingCardSection");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "nextCard");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setNextCard:", v34);

          -[CRKCardSectionViewController _performCommand:](self, "_performCommand:", v26);
LABEL_19:

        }
      }
    }
    else
    {
      v29 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
        -[SUICKPAudioPlaybackCardSectionViewController didEngageCardSection:].cold.1(v29);
    }
  }
  else
  {
    v28 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SUICKPAudioPlaybackCardSectionViewController cardEventDidOccur:withIdentifier:userInfo:].cold.2(v28, self);
  }

}

- (void)_performCommands:(id)a3 applyingUserInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "setUserInfo:", v7);
        -[CRKCardSectionViewController _performCommand:](self, "_performCommand:", v12);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)cardEventDidOccur:(void *)a1 withIdentifier:(void *)a2 userInfo:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_4(a1);
  objc_msgSend(a2, "view");
  objc_claimAutoreleasedReturnValue();
  v4 = (void *)OUTLINED_FUNCTION_3();
  v5 = OUTLINED_FUNCTION_2_0(v4);
  OUTLINED_FUNCTION_0_0(&dword_21ECF4000, v6, v7, "SUICKPAudioPlaybackCardSectionViewController view is %@. Expecting SearchUICardSectionViewUpdatable", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_0();
}

- (void)cardEventDidOccur:(void *)a1 withIdentifier:(void *)a2 userInfo:.cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_4(a1);
  objc_msgSend(a2, "cardSection");
  objc_claimAutoreleasedReturnValue();
  v4 = (void *)OUTLINED_FUNCTION_3();
  v5 = OUTLINED_FUNCTION_2_0(v4);
  OUTLINED_FUNCTION_0_0(&dword_21ECF4000, v6, v7, "SUICKPAudioPlaybackCardSectionViewController using %@. Expecting SFAudioPlaybackCardSection", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_0();
}

- (void)didEngageCardSection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21ECF4000, log, OS_LOG_TYPE_ERROR, "[SUICKPAudioPlaybackCardSectionViewController delegate] does not repsond to performCommand:forCardSectionViewController:", v1, 2u);
}

@end
