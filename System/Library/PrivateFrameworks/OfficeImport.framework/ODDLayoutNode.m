@implementation ODDLayoutNode

- (id)variableList
{
  return self->mVariableList;
}

- (void)setVariableList:(id)a3
{
  objc_storeStrong((id *)&self->mVariableList, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDLayoutNode;
  -[ODDLayoutObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mVariableList, 0);
}

@end
