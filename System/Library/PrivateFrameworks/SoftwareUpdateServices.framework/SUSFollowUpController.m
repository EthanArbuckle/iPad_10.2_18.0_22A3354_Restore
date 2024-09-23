@implementation SUSFollowUpController

- (BOOL)isBadgeOnlyFollowUpCurrentlyBeingPresented
{
  return -[SUSFollowUpController isCurrentlyPresentingFollowUpType:](self, "isCurrentlyPresentingFollowUpType:", 0);
}

void __41__SUSFollowUpController_sharedController__block_invoke()
{
  SUSFollowUpController *v0;
  void *v1;

  v0 = objc_alloc_init(SUSFollowUpController);
  v1 = (void *)sharedController_sharedInstance;
  sharedController_sharedInstance = (uint64_t)v0;

}

- (SUSFollowUpController)init
{
  SUSFollowUpController *v2;
  uint64_t v3;
  FLFollowUpController *followUpController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUSFollowUpController;
  v2 = -[SUSFollowUpController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.SoftwareUpdateServices.followup"));
    followUpController = v2->_followUpController;
    v2->_followUpController = (FLFollowUpController *)v3;

  }
  return v2;
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  return (id)sharedController_sharedInstance;
}

- (BOOL)isCurrentlyPresentingFollowUpType:(unint64_t)a3
{
  void *v5;

  -[SUSFollowUpController getCurrentSUSFollowUpItems](self, "getCurrentSUSFollowUpItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[SUSFollowUpController _isCurrentlyPresentingFollowUpType:currentFollowUps:](self, "_isCurrentlyPresentingFollowUpType:currentFollowUps:", a3, v5);

  return a3;
}

- (id)getCurrentSUSFollowUpItems
{
  FLFollowUpController *followUpController;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  followUpController = self->_followUpController;
  v18 = 0;
  -[FLFollowUpController pendingFollowUpItems:](followUpController, "pendingFollowUpItems:", &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (-[SUSFollowUpController isfollowUpSUSRelated:](self, "isfollowUpSUSRelated:", v12, (_QWORD)v14))
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isCurrentlyPresentingFollowUpType:(unint64_t)a3 currentFollowUps:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[SUSFollowUpController identifierForSUFollowUpType:](self, "identifierForSUFollowUpType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = v7;
    v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v8);

          if (v14)
          {
            SULogFollowUp();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            SULogInfoForSubsystem(v10, CFSTR("FollowUp with identifier \"%@\" is currently presented"), v22, v23, v24, v25, v26, v27, (uint64_t)v8);

            LOBYTE(v10) = 1;
            goto LABEL_14;
          }
        }
        v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    SULogFollowUp();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v15, CFSTR("No SUS followup is currently presented"), v16, v17, v18, v19, v20, v21, v29);

    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (BOOL)isCurrentlyPresentingFollowUpTypes:(id)a3 presentationOption:(unint64_t)a4
{
  BOOL v4;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[SUSFollowUpController getCurrentSUSFollowUpItems](self, "getCurrentSUSFollowUpItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v4 = -[SUSFollowUpController _isCurrentlyPresentingFollowUpType:currentFollowUps:](self, "_isCurrentlyPresentingFollowUpType:currentFollowUps:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "integerValue", (_QWORD)v15), v8);
        if (v4)
        {
          if (a4 == 1)
          {
            LOBYTE(a4) = 0;
            goto LABEL_13;
          }
        }
        else if (!a4)
        {
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  LOBYTE(a4) = 1;
LABEL_13:

  return (v4 | a4) & 1;
}

- (BOOL)isfollowUpSUSRelated:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SUSFollowUpBadgeOnly identifier](SUSFollowUpBadgeOnly, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[SUSFollowUpUpdateAvailable identifier](SUSFollowUpUpdateAvailable, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  +[SUSFollowUpAutoUpdate identifier](SUSFollowUpAutoUpdate, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  +[SUSFollowUpInsufficientDiskSpace identifier](SUSFollowUpInsufficientDiskSpace, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v8, "containsObject:", v9);
  return (char)v3;
}

- (void)dismissAllSUFollowUps
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SUSFollowUpController getCurrentSUSFollowUpItems](self, "getCurrentSUSFollowUpItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[SUSFollowUpController dismissFollowUpWithIdentifiers:](self, "dismissFollowUpWithIdentifiers:", v3);
}

- (void)dismissFollowUpType:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[SUSFollowUpController identifierForSUFollowUpType:](self, "identifierForSUFollowUpType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSFollowUpController dismissFollowUpWithIdentifiers:](self, "dismissFollowUpWithIdentifiers:", v5);

}

- (void)dismissFollowUpTypes:(id)a3
{
  id v4;

  -[SUSFollowUpController identifiersForSUFollowUpTypes:](self, "identifiersForSUFollowUpTypes:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUSFollowUpController dismissFollowUpWithIdentifiers:](self, "dismissFollowUpWithIdentifiers:", v4);

}

- (void)dismissFollowUpWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v4 = a3;
  SULogFollowUp();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v5, CFSTR("Dismissing FollowUps with identifiers: %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v4);

  -[SUSFollowUpController followUpController](self, "followUpController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v12, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v4, &v21);

  v13 = v21;
  if (v13)
  {
    SULogFollowUp();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v14, CFSTR("error clearing pending followUp item: %@"), v15, v16, v17, v18, v19, v20, (uint64_t)v13);

  }
}

- (id)identifiersForSUFollowUpTypes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[SUSFollowUpController identifierForSUFollowUpType:](self, "identifierForSUFollowUpType:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "integerValue", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)identifierForSUFollowUpType:(unint64_t)a3
{
  __objc2_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  switch(a3)
  {
    case 0uLL:
      v4 = SUSFollowUpBadgeOnly;
      goto LABEL_7;
    case 1uLL:
      v4 = SUSFollowUpUpdateAvailable;
      goto LABEL_7;
    case 2uLL:
      v4 = SUSFollowUpAutoUpdate;
      goto LABEL_7;
    case 3uLL:
      v4 = SUSFollowUpInsufficientDiskSpace;
LABEL_7:
      -[__objc2_class identifier](v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      SULogFollowUp();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v5, CFSTR("Unknown SUSFollowUpType: %ld"), v6, v7, v8, v9, v10, v11, a3);

      v12 = 0;
      break;
  }
  return v12;
}

- (void)postFollowUpOfType:(unint64_t)a3 withUpdate:(id)a4 userInfo:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __objc2_class **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;

  v53 = a4;
  v8 = a5;
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "disableFollowUps");

  if (v10)
  {
    SULogFollowUp();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUSFollowUpController stringForSUSFollowUpType:](SUSFollowUpController, "stringForSUSFollowUpType:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v11, CFSTR("Skipping post of %@ followup item because preference is set"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);

LABEL_11:
    goto LABEL_12;
  }
  switch(a3)
  {
    case 0uLL:
      SULogFollowUp();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v19, CFSTR("Attempting to post SUSFollowUpBadgeOnly item"), v20, v21, v22, v23, v24, v25, v52);
      v26 = off_24CE3AA30;
      break;
    case 1uLL:
      SULogFollowUp();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v19, CFSTR("Attempting to post SUSFollowUpUpdateAvailable item"), v33, v34, v35, v36, v37, v38, v52);
      v26 = off_24CE3AA48;
      break;
    case 2uLL:
      SULogFollowUp();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v19, CFSTR("Attempting to post SUSFollowUpAutoUpdate item"), v39, v40, v41, v42, v43, v44, v52);
      v26 = off_24CE3AA28;
      break;
    case 3uLL:
      SULogFollowUp();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v19, CFSTR("Attempting to post SUSFollowUpTypeInsufficientDiskSpace item"), v45, v46, v47, v48, v49, v50, v52);
      v26 = off_24CE3AA40;
      break;
    default:
      SULogFollowUp();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v11, CFSTR("Unknown SUSFollowUpType (%ld). Unable to create FollowUp"), v27, v28, v29, v30, v31, v32, a3);
      goto LABEL_11;
  }

  -[__objc2_class generateFollowUpWithDescriptor:userInfo:](*v26, "generateFollowUpWithDescriptor:userInfo:", v53, v8);
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v11 = (void *)v51;
    -[SUSFollowUpController postFollowUpItem:](self, "postFollowUpItem:", v51);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)postFollowUpItem:(id)a3
{
  id v4;
  FLFollowUpController *followUpController;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  if (v4)
  {
    -[SUSFollowUpController dismissAllSUFollowUps](self, "dismissAllSUFollowUps");
    followUpController = self->_followUpController;
    v23 = 0;
    v6 = -[FLFollowUpController postFollowUpItem:error:](followUpController, "postFollowUpItem:error:", v4, &v23);
    v7 = v23;
    SULogFollowUp();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    if (v6)
      SULogInfoForSubsystem(v8, CFSTR("Successfully posted FollowUp item: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v4);
    else
      SULogInfoForSubsystem(v8, CFSTR("Failed to post FollowUp item: %@ Error: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v4);

  }
  else
  {
    SULogFollowUp();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v7, CFSTR("Unable to post null FollowUp item"), v16, v17, v18, v19, v20, v21, v22);
  }

}

+ (id)stringForSUSFollowUpType:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknonw Type");
  else
    return off_24CE3B570[a3];
}

- (void)SUSFollowUpControllerBadgeSettings:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  SULogFollowUp();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v4, CFSTR("Got request to badge settings via followUp"), v5, v6, v7, v8, v9, v10, v11);

  -[SUSFollowUpController dismissAllSUFollowUps](self, "dismissAllSUFollowUps");
  -[SUSFollowUpController postFollowUpOfType:withUpdate:userInfo:](self, "postFollowUpOfType:withUpdate:userInfo:", 0, v12, 0);

}

- (void)SUSFollowUpControllerUnbadgeSettings
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  SULogFollowUp();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v3, CFSTR("Got request to unbadge settings via followUp"), v4, v5, v6, v7, v8, v9, v10);

  -[SUSFollowUpController dismissFollowUpType:](self, "dismissFollowUpType:", 0);
}

- (void)dismissLegacyFollowUps
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = SUSFollowUpUniqueIdentifierLegacy;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSFollowUpController dismissFollowUpWithIdentifiers:](self, "dismissFollowUpWithIdentifiers:", v3);

}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end
