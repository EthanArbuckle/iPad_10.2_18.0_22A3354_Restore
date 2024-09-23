@implementation SSEngagementHandler

+ (void)userEngagedResultWithIdentifier:(id)a3 forQueryString:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "mainBundle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSEngagementHandler userEngagedResultWithIdentifier:forQueryString:bundle:](SSEngagementHandler, "userEngagedResultWithIdentifier:forQueryString:bundle:", v7, v6, v8);

}

+ (void)userEngagedResultWithIdentifier:(id)a3 forQueryString:(id)a4 bundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[PRSAnonymousPipelineManagerSession sharedManager](PRSAnonymousPipelineManagerSession, "sharedManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userEngagedItemWithIdentifier:forBundle:forQuery:", v9, v7, v8);

}

@end
