@implementation _UIActivityUserDefaults

- (_UIActivityUserDefaults)initWithUnderlyingUserDefaults:(id)a3 activityDefaultsKey:(id)a4
{
  id v6;
  id v7;
  _UIActivityUserDefaults *v8;
  _UIActivityUserDefaults *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIActivityUserDefaults *v14;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIActivityUserDefaults;
  v8 = -[_UIActivityUserDefaults init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_UIActivityUserDefaults setActivityDefaultsKey:](v8, "setActivityDefaultsKey:", v7);
    -[_UIActivityUserDefaults setUnderlyingUserDefaults:](v9, "setUnderlyingUserDefaults:", v6);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("UIActivityCategoryShare");
    v18[0] = CFSTR("com.apple.UIKit.activity.AirDrop");
    v18[1] = CFSTR("com.apple.UIKit.activity.Message");
    v18[2] = CFSTR("com.apple.UIKit.activity.Mail");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("UIActivityCategoryAction");
    v20[0] = v11;
    v17[0] = CFSTR("com.apple.UIKit.activity.CopyToPasteboard");
    v17[1] = CFSTR("com.apple.UIKit.activity.Share");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerDefaults:", v13);

    v14 = v9;
  }

  return v9;
}

- (BOOL)canHideActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_UIActivityUserDefaults applicationExtensionForActivity:](self, "applicationExtensionForActivity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.AssetViewer.Picasso")) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_opt_class();
      v7 = objc_opt_isKindOfClass() ^ 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)activityIsHidden:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  char v10;

  v4 = a3;
  -[_UIActivityUserDefaults applicationExtensionForActivity:](self, "applicationExtensionForActivity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "optedIn");
    objc_opt_class();
    v8 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0 && (v7 & 1) == 0)
    {
      objc_opt_class();
      v8 = (objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v4, "activityType"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = _UIShouldExcludeExtensionWithActivityType(v9),
            v9,
            (v10 & 1) != 0)
        || _UIExtensionElectionStateIsIgnore(v4);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setActivity:(id)a3 asHidden:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  id v15;

  v4 = a4;
  v6 = a3;
  -[_UIActivityUserDefaults applicationExtensionForActivity:](self, "applicationExtensionForActivity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "optedIn"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v6, "activityType"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = _UIShouldExcludeExtensionWithActivityType(v11),
          v11,
          !v12))
    {
      if (_UIExtensionElectionStateIsIgnore(v6) == v4)
        goto LABEL_14;
      if (v4)
      {
LABEL_3:
        v14 = 0;
        v8 = objc_msgSend(v7, "attemptOptOut:", &v14);
        v9 = v14;
        if ((v8 & 1) == 0)
        {
          share_sheet_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[_UIActivityUserDefaults setActivity:asHidden:].cold.1(v7);
LABEL_12:

          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if (v4)
    {
      goto LABEL_14;
    }
    v15 = 0;
    v13 = objc_msgSend(v7, "attemptOptIn:", &v15);
    v9 = v15;
    if ((v13 & 1) == 0)
    {
      share_sheet_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_UIActivityUserDefaults setActivity:asHidden:].cold.2(v7);
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v4)
    goto LABEL_3;
LABEL_14:
  -[_UIActivityUserDefaults postActivityUserDefaultsDidChangeNotification](self, "postActivityUserDefaultsDidChangeNotification");

}

- (id)activitiesBySortingActivities:(id)a3 byIdentifierWithDefaultActivityIdentifierOrdering:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[_UIActivityUserDefaults identifierForActivity:](self, "identifierForActivity:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v7, "indexOfObject:", v15);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "addObject:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
          v17 = v7;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v18);

          v7 = v17;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_49);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertObject:atIndex:", v26, 0);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v23);
  }

  v27 = (void *)objc_msgSend(v9, "copy");
  return v27;
}

- (id)migrateSortOrderIfNeededForBuiltInActivityType:(id)a3 activityIdentifierOrdering:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  unint64_t v11;
  unint64_t v12;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "count")
    || objc_msgSend(v6, "containsObject:", v5)
    || (objc_msgSend((id)objc_opt_class(), "builtinActivityOrder"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "indexOfObject:", v5),
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v6;
  }
  else
  {
    v9 = (id)objc_msgSend(v6, "mutableCopy");
    v11 = objc_msgSend(v9, "count");
    if (v8 >= v11)
      v12 = v11;
    else
      v12 = v8;
    objc_msgSend(v9, "insertObject:atIndex:", v5, v12);
  }

  return v9;
}

- (id)activitiesOrderedByUserActivityOrderForActivities:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIActivityUserDefaults activityIdentifiersInUserOrder](self, "activityIdentifiersInUserOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaults activitiesBySortingActivities:byIdentifierWithDefaultActivityIdentifierOrdering:](self, "activitiesBySortingActivities:byIdentifierWithDefaultActivityIdentifierOrdering:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateUserActivityOrderWithOrderedPartialActivities:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UIActivityUserDefaults mutableActivityIdentifiersArrayForActivitiesArray:](self, "mutableActivityIdentifiersArrayForActivitiesArray:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", CFSTR("com.apple.UIKit.activity.UserDefaults"));
  -[_UIActivityUserDefaults activityIdentifiersInUserOrder](self, "activityIdentifiersInUserOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityUserDefaults updatedActivityIdentifiersUserOrderWithPreviousOrder:someSortedActivityIdentifiers:](_UIActivityUserDefaults, "updatedActivityIdentifiersUserOrderWithPreviousOrder:someSortedActivityIdentifiers:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActivityUserDefaults setActivityIdentifiersInUserOrder:](self, "setActivityIdentifiersInUserOrder:", v5);
}

- (void)removeActivityTypeFromDefaults:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIActivityUserDefaults activityIdentifiersInUserOrder](self, "activityIdentifiersInUserOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v4);
  -[_UIActivityUserDefaults setActivityIdentifiersInUserOrder:](self, "setActivityIdentifiersInUserOrder:", v6);

}

+ (id)builtinActivityOrder
{
  if (builtinActivityOrder_once != -1)
    dispatch_once(&builtinActivityOrder_once, &__block_literal_global_21_0);
  return (id)builtinActivityOrder_builtinActivityOrder;
}

- (id)activityIdentifiersInUserOrder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_UIActivityUserDefaults underlyingUserDefaults](self, "underlyingUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaults activityDefaultsKey](self, "activityDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v6 = v5;
  v7 = v6;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          share_sheet_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            -[_UIActivityUserDefaults activityIdentifiersInUserOrder].cold.1((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);

          -[_UIActivityUserDefaults underlyingUserDefaults](self, "underlyingUserDefaults", v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIActivityUserDefaults activityDefaultsKey](self, "activityDefaultsKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", 0, v22);

          v13 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_15;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }

  v13 = v8;
LABEL_15:

  return v13;
}

- (void)setActivityIdentifiersInUserOrder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIActivityUserDefaults underlyingUserDefaults](self, "underlyingUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaults activityDefaultsKey](self, "activityDefaultsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

  -[_UIActivityUserDefaults _userEditedActivityDefaults](self, "_userEditedActivityDefaults");
  -[_UIActivityUserDefaults postActivityUserDefaultsDidChangeNotification](self, "postActivityUserDefaultsDidChangeNotification");
}

- (BOOL)hasUserEditedActivityOrder
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIActivityUserDefaults activityDefaultsKey](self, "activityDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("EditedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActivityUserDefaults underlyingUserDefaults](self, "underlyingUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "BOOLForKey:", v4);

  return (char)v3;
}

- (void)_userEditedActivityDefaults
{
  void *v3;
  void *v4;
  id v5;

  -[_UIActivityUserDefaults activityDefaultsKey](self, "activityDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("EditedKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIActivityUserDefaults underlyingUserDefaults](self, "underlyingUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", 1, v5);

}

+ (id)updatedActivityIdentifiersUserOrderWithPreviousOrder:(id)a3 someSortedActivityIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = objc_msgSend(v6, "count");
  v9 = v7;
  if (v8)
  {
    v10 = v8;
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v6);
    v13 = (void *)objc_msgSend(v7, "mutableCopy");
    v14 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke;
    v38[3] = &unk_1E4003DF8;
    v15 = v12;
    v39 = v15;
    v16 = v11;
    v40 = v16;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v38);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v37 = objc_msgSend(v7, "count");
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v22 = v14;
    v23 = 3221225472;
    v24 = __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke_2;
    v25 = &unk_1E4003E20;
    v17 = v13;
    v26 = v17;
    v18 = v6;
    v27 = v18;
    v28 = &v30;
    v29 = &v34;
    objc_msgSend(v16, "enumerateIndexesUsingBlock:", &v22);
    while (1)
    {
      v19 = v31[3];
      if (v19 >= v10)
        break;
      v31[3] = v19 + 1;
      objc_msgSend(v18, "objectAtIndexedSubscript:", v22, v23, v24, v25, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ++v35[3];
      objc_msgSend(v17, "insertObject:atIndex:", v20);

    }
    v9 = (void *)objc_msgSend(v17, "copy", v22, v23, v24, v25);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

  }
  return v9;
}

- (id)mutableActivityIdentifiersArrayForActivitiesArray:(id)a3
{
  id v4;
  void *v5;
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

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
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
        -[_UIActivityUserDefaults identifierForActivity:](self, "identifierForActivity:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
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

- (void)postActivityUserDefaultsDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIActivityUserDefaultsDidChangeNotification"), self, 0);

}

- (id)identifierForActivity:(id)a3
{
  return (id)objc_msgSend(a3, "_activityTypeUsingFallbackActivityTypeIfNecessary");
}

- (id)applicationExtensionForActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "applicationExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (NSClassFromString(CFSTR("PUEditPluginActivity")) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("plugin"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("extension"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)migrateUserActivityOrderIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerForKey:", CFSTR("_UIActivityUserDefaultsMigrationVersionKey")) <= 0)
  {
    v7[0] = CFSTR("com.apple.UIKit.activity.AirDrop");
    v7[1] = CFSTR("com.apple.UIKit.activity.Message");
    v7[2] = CFSTR("com.apple.UIKit.activity.Mail");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_migrateUserActivityOrderforKey:userDefaults:defaultOrder:", CFSTR("UIActivityCategoryShare"), v3, v4);

    v6[0] = CFSTR("com.apple.UIKit.activity.CopyToPasteboard");
    v6[1] = CFSTR("com.apple.UIKit.activity.Share");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_migrateUserActivityOrderforKey:userDefaults:defaultOrder:", CFSTR("UIActivityCategoryAction"), v3, v5);

    objc_msgSend(v3, "setInteger:forKey:", 1, CFSTR("_UIActivityUserDefaultsMigrationVersionKey"));
  }

}

+ (void)_migrateUserActivityOrderforKey:(id)a3 userDefaults:(id)a4 defaultOrder:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dictionaryForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("order"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      +[_UIActivityUserDefaults _migrateUserActivityOrderforKey:userDefaults:defaultOrder:].cold.1((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_7;
  }
  if (objc_msgSend(v11, "isEqualToArray:", v9))
  {
LABEL_7:
    objc_msgSend(v8, "setObject:forKey:", 0, v7);
    goto LABEL_8;
  }
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("EditedKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", 1, v12);
  objc_msgSend(v8, "setObject:forKey:", v11, v7);

LABEL_8:
}

- (NSString)activityDefaultsKey
{
  return self->_activityDefaultsKey;
}

- (void)setActivityDefaultsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUserDefaults)underlyingUserDefaults
{
  return self->_underlyingUserDefaults;
}

- (void)setUnderlyingUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingUserDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingUserDefaults, 0);
  objc_storeStrong((id *)&self->_activityDefaultsKey, 0);
}

- (void)setActivity:(void *)a1 asHidden:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_6(&dword_19E419000, v2, v3, "Error opting out extension with identifier \"%{public}@\" (%{public}@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)setActivity:(void *)a1 asHidden:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_6(&dword_19E419000, v2, v3, "Error opting in extension with identifier \"%{public}@\" (%{public}@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)activityIdentifiersInUserOrder
{
  OUTLINED_FUNCTION_4(&dword_19E419000, a2, a3, "Found a non string value in our user defaults array! %@", a5, a6, a7, a8, 2u);
}

+ (void)_migrateUserActivityOrderforKey:(uint64_t)a3 userDefaults:(uint64_t)a4 defaultOrder:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19E419000, a2, a3, "Found a non array value when migrating user defaults! %@", a5, a6, a7, a8, 2u);
}

@end
