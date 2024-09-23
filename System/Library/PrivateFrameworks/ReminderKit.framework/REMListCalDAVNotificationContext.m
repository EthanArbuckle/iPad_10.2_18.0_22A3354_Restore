@implementation REMListCalDAVNotificationContext

- (REMListCalDAVNotificationContext)initWithList:(id)a3
{
  id v5;
  REMListCalDAVNotificationContext *v6;
  REMListCalDAVNotificationContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListCalDAVNotificationContext;
  v6 = -[REMListCalDAVNotificationContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_list, a3);

  return v7;
}

- (NSArray)calDAVNotifications
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[REMListCalDAVNotificationContext list](self, "list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calDAVNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (REMList)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

@end
