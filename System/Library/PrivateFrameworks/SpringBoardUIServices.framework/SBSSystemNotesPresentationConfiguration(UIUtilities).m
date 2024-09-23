@implementation SBSSystemNotesPresentationConfiguration(UIUtilities)

- (id)_uiActivityContinuationAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userActivityData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, &unk_1E4C7AC98);

  objc_msgSend(a1, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, &unk_1E4C7ACB0);

  objc_msgSend(a1, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, &unk_1E4C7ACC8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, &unk_1E4C7ACE0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C0]), "initWithSettings:", v2);
  return v9;
}

@end
