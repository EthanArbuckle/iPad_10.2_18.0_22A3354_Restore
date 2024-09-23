@implementation SXComponentInsert

- (SXComponentInsert)initWithComponent:(id)a3 componentLayout:(id)a4
{
  id v7;
  id v8;
  SXComponentInsert *v9;
  SXComponentInsert *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentInsert;
  v9 = -[SXComponentInsert init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeStrong((id *)&v10->_componentLayout, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentInsert component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("component: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentLayout, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
