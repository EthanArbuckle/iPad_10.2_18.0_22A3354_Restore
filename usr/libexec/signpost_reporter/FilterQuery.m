@implementation FilterQuery

- (FilterQuery)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  FilterQuery *v12;
  FilterQuery *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FilterQuery;
  v12 = -[FilterQuery init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_subsystem, a3);
    objc_storeStrong((id *)&v13->_category, a4);
    objc_storeStrong((id *)&v13->_name, a5);
  }

  return v13;
}

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
