@implementation BTAVRCP_Syncifier

- (BTAVRCP_Syncifier)init
{
  BTAVRCP_Syncifier *v2;
  NSCondition *v3;
  NSCondition *condition;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTAVRCP_Syncifier;
  v2 = -[BTAVRCP_Syncifier init](&v6, "init");
  if (v2)
  {
    v3 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    condition = v2->_condition;
    v2->_condition = v3;

    v2->_pendingSwitchers = 0;
  }
  return v2;
}

- (id)createSwitcher
{
  _QWORD v4[5];

  -[BTAVRCP_Syncifier setPendingSwitchers:](self, "setPendingSwitchers:", (char *)-[BTAVRCP_Syncifier pendingSwitchers](self, "pendingSwitchers") + 1);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003870;
  v4[3] = &unk_1000187A8;
  v4[4] = self;
  return objc_retainBlock(v4);
}

- (BOOL)wait:(double)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier condition](self, "condition"));
  objc_msgSend(v5, "lock");

  while (1)
  {
    v6 = -[BTAVRCP_Syncifier pendingSwitchers](self, "pendingSwitchers");
    if (!v6)
      break;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier condition](self, "condition"));
    v8 = objc_msgSend(v7, "waitUntilDate:", v4);

    if ((v8 & 1) == 0)
    {
      -[BTAVRCP_Syncifier setPendingSwitchers:](self, "setPendingSwitchers:", 0);
      break;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier condition](self, "condition"));
  objc_msgSend(v9, "unlock");

  return v6 == 0;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (unint64_t)pendingSwitchers
{
  return self->_pendingSwitchers;
}

- (void)setPendingSwitchers:(unint64_t)a3
{
  self->_pendingSwitchers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
