@implementation REShortcutFilter

+ (unint64_t)filterVersion
{
  return 1;
}

- (REShortcutFilter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REShortcutFilter;
  return -[REShortcutFilter init](&v3, sel_init);
}

- (id)intentByFilteringIntent:(id)a3 withLevel:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = v5;
  if (!a4)
  {
    REIntentBySimplifyingParametersForIntent(v5);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = v5;
  if (a4 == 1)
  {
    objc_msgSend(v5, "_emptyCopy");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v8;

  }
  return v7;
}

- (id)userActivityByFilteringUserActivity:(id)a3 withLevel:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    v7 = objc_alloc(MEMORY[0x24BDC1598]);
    objc_msgSend(v5, "activityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithActivityType:", v8);

  }
  return v6;
}

- (unint64_t)_actionIdentifierForIntent:(id)a3
{
  void *v3;
  unint64_t v4;

  REParametersForIntent(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "re_actionIdentifierHashValue");

  return v4;
}

- (id)identifierForIntent:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = -[REShortcutFilter _actionIdentifierForIntent:](self, "_actionIdentifierForIntent:", a3);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = v6;
  objc_msgSend(v9, "numberWithUnsignedLongLong:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)_actionIdentifierForUserActivity:(id)a3
{
  void *v3;
  unint64_t v4;

  REExtractUserActivity(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "re_actionIdentifierHashValue");

  return v4;
}

- (id)identifierForUserActivity:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = -[REShortcutFilter _actionIdentifierForUserActivity:](self, "_actionIdentifierForUserActivity:", a3);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = v6;
  objc_msgSend(v9, "numberWithUnsignedLongLong:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
