@implementation ODDLayout

- (ODDLayout)init
{
  ODDLayout *v2;
  ODDLayoutNode *v3;
  ODDLayoutNode *mRootNode;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDLayout;
  v2 = -[ODDLayout init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ODDLayoutNode);
    mRootNode = v2->mRootNode;
    v2->mRootNode = v3;

  }
  return v2;
}

- (id)rootNode
{
  return self->mRootNode;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDLayout;
  -[ODDLayout description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRootNode, 0);
}

@end
