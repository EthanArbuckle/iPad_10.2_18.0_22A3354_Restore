@implementation SMActivityManager

+ (id)shared
{
  return +[SMActivityManagerInternal shared](SMActivityManagerInternal, "shared");
}

+ (void)startActivityWithState:(id)a3 localState:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[SMActivityManager shared](SMActivityManager, "shared");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startActivityWith:localState:", v6, v5);

}

+ (void)updateActivityWithState:(id)a3 localState:(id)a4 shouldNotify:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  +[SMActivityManager shared](SMActivityManager, "shared");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateActivityWith:localState:shouldNotify:", v8, v7, v5);

}

+ (void)endActivities
{
  id v2;

  +[SMActivityManager shared](SMActivityManager, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endActivities");

}

+ (BOOL)hasActivity
{
  void *v2;
  char v3;

  +[SMActivityManager shared](SMActivityManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActivity");

  return v3;
}

@end
