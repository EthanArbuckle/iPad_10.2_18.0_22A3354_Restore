@implementation TUISingleModelContainerWithRole

- (TUISingleModelContainerWithRole)initWithRole:(id)a3
{
  id v5;
  TUISingleModelContainerWithRole *v6;
  TUISingleModelContainerWithRole *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISingleModelContainerWithRole;
  v6 = -[TUISingleModelContainerWithRole init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_role, a3);

  return v7;
}

- (NSString)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
}

@end
