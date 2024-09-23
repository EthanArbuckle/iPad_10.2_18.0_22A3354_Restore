@implementation SBHIconStateBuilder

+ (id)iconStateWithIconLists:(id)a3 dock:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("iconLists");
  v10[1] = CFSTR("buttonBar");
  v11[0] = a3;
  v11[1] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)iconStateWithIconLists:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("iconLists");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)iconStateFolderWithName:(id)a3 iconLists:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("listType");
  v10[1] = CFSTR("displayName");
  v11[0] = CFSTR("folder");
  v11[1] = a3;
  v10[2] = CFSTR("iconLists");
  v11[2] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)iconStateByReplacingTodayListsInIconState:(id)a3 withTodayListsFromIconState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "objectForKey:", CFSTR("today"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("today"));
  objc_msgSend(v5, "objectForKey:", CFSTR("favoriteToday"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("favoriteToday"));

  return v6;
}

@end
