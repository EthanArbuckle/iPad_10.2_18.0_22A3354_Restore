@implementation _RCUIViewNamedConstraints

- (_RCUIViewNamedConstraints)initWithName:(id)a3 constraints:(id)a4 stalenessToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  _RCUIViewNamedConstraints *v12;
  _RCUIViewNamedConstraints *v13;
  id v14;
  id stalenessToken;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_RCUIViewNamedConstraints;
  v12 = -[_RCUIViewNamedConstraints init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_constraints, a4);
    if (v11)
      v14 = v11;
    else
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    stalenessToken = v13->_stalenessToken;
    v13->_stalenessToken = v14;

  }
  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (id)stalenessToken
{
  return self->_stalenessToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stalenessToken, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
