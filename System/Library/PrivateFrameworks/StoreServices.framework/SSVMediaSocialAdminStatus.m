@implementation SSVMediaSocialAdminStatus

- (SSVMediaSocialAdminStatus)initWithAdminStatus:(BOOL)a3 dateUpdated:(id)a4
{
  id v6;
  SSVMediaSocialAdminStatus *v7;
  SSVMediaSocialAdminStatus *v8;
  NSDate *v9;
  NSDate *dateUpdated;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVMediaSocialAdminStatus;
  v7 = -[SSVMediaSocialAdminStatus init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_admin = a3;
    if (v6)
    {
      v9 = (NSDate *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    dateUpdated = v8->_dateUpdated;
    v8->_dateUpdated = v9;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v4 = a3;
  -[SSVMediaSocialAdminStatus dateUpdated](self, "dateUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateUpdated);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[SSVMediaSocialAdminStatus isAdmin](self, "isAdmin");
  NSStringFromSelector(sel_isAdmin);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

}

- (SSVMediaSocialAdminStatus)initWithCoder:(id)a3
{
  id v4;
  SSVMediaSocialAdminStatus *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDate *dateUpdated;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSVMediaSocialAdminStatus;
  v5 = -[SSVMediaSocialAdminStatus init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_dateUpdated);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    dateUpdated = v5->_dateUpdated;
    v5->_dateUpdated = (NSDate *)v8;

    NSStringFromSelector(sel_isAdmin);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_admin = objc_msgSend(v4, "decodeBoolForKey:", v10);

  }
  return v5;
}

- (NSDate)dateUpdated
{
  return self->_dateUpdated;
}

- (BOOL)isAdmin
{
  return self->_admin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateUpdated, 0);
}

@end
