@implementation RCNetworkActivity

+ (RCNetworkActivity)activityWithDomain:(unsigned int)a3 label:(unsigned int)a4 parentToken:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  RCNetworkActivity *v8;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = -[RCNetworkActivity initWithDomain:label:parentToken:]([RCNetworkActivity alloc], "initWithDomain:label:parentToken:", v6, v5, v7);

  return v8;
}

- (RCNetworkActivity)initWithDomain:(unsigned int)a3 label:(unsigned int)a4 parentToken:(id)a5
{
  id v9;
  RCNetworkActivity *v10;
  RCNetworkActivity *v11;
  uint64_t v12;
  OS_nw_activity *activity;
  void *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RCNetworkActivity;
  v10 = -[RCNetworkActivity init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_domain = a3;
    v10->_label = a4;
    objc_storeStrong((id *)&v10->_parentToken, a5);
    v12 = nw_activity_create();
    activity = v11->_activity;
    v11->_activity = (OS_nw_activity *)v12;

    if (v9)
    {
      v17[0] = 0;
      v17[1] = 0;
      objc_msgSend(v9, "getUUIDBytes:", v17);
      v14 = (void *)nw_activity_create_from_token();
      nw_activity_set_parent_activity();

    }
  }

  return v11;
}

- (void)startActivity
{
  nw_activity_activate();
}

- (void)completeActivityWithSuccess:(BOOL)a3
{
  nw_activity_complete_with_reason();
}

- (void)attachActivityToTask:(id)a3
{
  objc_msgSend(a3, "set_nw_activity:", self->_activity);
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)setDomain:(unsigned int)a3
{
  self->_domain = a3;
}

- (unsigned)label
{
  return self->_label;
}

- (void)setLabel:(unsigned int)a3
{
  self->_label = a3;
}

- (NSUUID)parentToken
{
  return self->_parentToken;
}

- (void)setParentToken:(id)a3
{
  objc_storeStrong((id *)&self->_parentToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentToken, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
