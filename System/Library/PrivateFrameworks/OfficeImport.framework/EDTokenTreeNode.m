@implementation EDTokenTreeNode

+ (id)tokenTreeNodeWithIndexAndType:(unsigned int)a3 type:(int)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexAndType:type:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (EDTokenTreeNode)initWithIndexAndType:(unsigned int)a3 type:(int)a4
{
  EDTokenTreeNode *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDTokenTreeNode;
  result = -[EDTokenTreeNode init](&v7, sel_init);
  if (result)
  {
    result->mTokenIndex = a3;
    result->mTokenType = a4;
  }
  return result;
}

- (unsigned)tokenIndex
{
  return self->mTokenIndex;
}

- (void)setFirstChild:(id)a3
{
  EDTokenTreeNode *v5;
  EDTokenTreeNode **p_mFirstChild;
  EDTokenTreeNode *mFirstChild;
  EDTokenTreeNode *v8;

  v5 = (EDTokenTreeNode *)a3;
  mFirstChild = self->mFirstChild;
  p_mFirstChild = &self->mFirstChild;
  if (mFirstChild != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mFirstChild, a3);
    v5 = v8;
  }

}

- (void)setSibling:(id)a3
{
  EDTokenTreeNode *v5;
  EDTokenTreeNode **p_mSibling;
  EDTokenTreeNode *mSibling;
  EDTokenTreeNode *v8;

  v5 = (EDTokenTreeNode *)a3;
  mSibling = self->mSibling;
  p_mSibling = &self->mSibling;
  if (mSibling != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mSibling, a3);
    v5 = v8;
  }

}

- (id)firstChild
{
  return self->mFirstChild;
}

- (id)sibling
{
  return self->mSibling;
}

- (EDTokenTreeNode)init
{
  EDTokenTreeNode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTokenTreeNode;
  result = -[EDTokenTreeNode init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->mTokenIndex = 0xFFFFFFFFLL;
  return result;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTokenTreeNode;
  -[EDTokenTreeNode description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSibling, 0);
  objc_storeStrong((id *)&self->mFirstChild, 0);
}

@end
