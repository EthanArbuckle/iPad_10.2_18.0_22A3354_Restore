@implementation SBSRemoteAlertHandleContext

- (SBSRemoteAlertHandleContext)initWithHandleID:(id)a3
{
  id v5;
  SBSRemoteAlertHandleContext *v6;
  SBSRemoteAlertHandleContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSRemoteAlertHandleContext;
  v6 = -[SBSRemoteAlertHandleContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handleID, a3);

  return v7;
}

- (SBSRemoteAlertHandleContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SBSRemoteAlertHandleContext *v6;
  SBSRemoteAlertHandleContext *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[SBSRemoteAlertHandleContext initWithHandleID:](self, "initWithHandleID:", v5);
    if (v6)
      v6->_active = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("active"));
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handleID;
  id v5;

  handleID = self->_handleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handleID, CFSTR("handleID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_active, CFSTR("active"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleID, 0);
}

@end
