@implementation MOMediaStats

- (MOMediaStats)initWithKeyword:(id)a3 value:(double)a4
{
  id v7;
  MOMediaStats *v8;
  MOMediaStats *v9;
  NSMutableArray *v10;
  NSMutableArray *members;
  NSString *bundleId;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MOMediaStats;
  v8 = -[MOMediaStats init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_keyword, a3);
    v9->_value = a4;
    v10 = objc_opt_new(NSMutableArray);
    members = v9->_members;
    v9->_members = v10;

    bundleId = v9->_bundleId;
    v9->_bundleId = 0;

  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", self->_keyword));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("keyword, %@, value, %f, memeber.count, %lu"), v3, *(_QWORD *)&self->_value, -[NSMutableArray count](self->_members, "count")));

  return v4;
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSMutableArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
  objc_storeStrong((id *)&self->_members, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

@end
