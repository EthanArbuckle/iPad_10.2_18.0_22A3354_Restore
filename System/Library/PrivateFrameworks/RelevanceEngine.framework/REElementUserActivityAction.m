@implementation REElementUserActivityAction

- (REElementUserActivityAction)initWithUserActivity:(id)a3 applicationID:(id)a4
{
  id v7;
  id v8;
  REElementUserActivityAction *v9;
  REElementUserActivityAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REElementUserActivityAction;
  v9 = -[REElementUserActivityAction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userActivity, a3);
    objc_storeStrong((id *)&v10->_applicationID, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REElementUserActivityAction;
  v4 = (id *)-[REElementUserActivityAction copy](&v6, sel_copy, a3);
  objc_storeStrong(v4 + 3, self->_userActivity);
  objc_storeStrong(v4 + 4, self->_applicationID);
  return v4;
}

- (void)_performWithContext:(id)a3
{
  NSUserActivity *userActivity;
  NSString *applicationID;
  _QWORD v6[5];

  userActivity = self->_userActivity;
  if (userActivity)
  {
    applicationID = self->_applicationID;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__REElementUserActivityAction__performWithContext___block_invoke;
    v6[3] = &unk_24CF8B160;
    v6[4] = self;
    REOpenUserActivity(userActivity, applicationID, v6);
  }
}

uint64_t __51__REElementUserActivityAction__performWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 v3;

  v3 = a2 == 0;
  objc_msgSend(*(id *)(a1 + 32), "_didFinish:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "_submitMetricsWithSuccess:", v3);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REElementUserActivityAction;
  -[REElementUserActivityAction description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" userActivity=%@, applicationId=%@"), self->_userActivity, self->_applicationID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUserActivity hash](self->_userActivity, "hash");
  return -[NSString hash](self->_applicationID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  NSUserActivity *userActivity;
  NSUserActivity *v7;
  NSUserActivity *v8;
  NSUserActivity *v9;
  int v10;
  char v11;
  NSString *applicationID;
  NSString *v13;
  NSString *v14;
  NSString *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    userActivity = self->_userActivity;
    v7 = (NSUserActivity *)v5[3];
    if (userActivity == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = userActivity;
      v10 = -[NSUserActivity isEqual:](v9, "isEqual:", v8);

      if (!v10)
      {
        v11 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    applicationID = self->_applicationID;
    v13 = (NSString *)v5[4];
    v14 = applicationID;
    v15 = v14;
    if (v14 == v13)
      v11 = 1;
    else
      v11 = -[NSString isEqual:](v14, "isEqual:", v13);

    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
