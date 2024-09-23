@implementation PLSqliteQueryPlanNode

- (PLSqliteQueryPlanNode)initWithIdentifier:(int)a3 parentIdentifier:(int)a4 unused:(int)a5 nodeDescription:(id)a6
{
  id v10;
  PLSqliteQueryPlanNode *v11;
  PLSqliteQueryPlanNode *v12;
  uint64_t v13;
  NSString *nodeDescription;
  PLSqliteQueryPlanNode *v15;
  objc_super v17;

  v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PLSqliteQueryPlanNode;
  v11 = -[PLSqliteQueryPlanNode init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_identifier = a3;
    v11->_parentIdentifier = a4;
    v11->_unused = a5;
    v13 = objc_msgSend(v10, "copy");
    nodeDescription = v12->_nodeDescription;
    v12->_nodeDescription = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

- (int)identifier
{
  return self->_identifier;
}

- (int)parentIdentifier
{
  return self->_parentIdentifier;
}

- (int)unused
{
  return self->_unused;
}

- (NSString)nodeDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeDescription, 0);
}

@end
