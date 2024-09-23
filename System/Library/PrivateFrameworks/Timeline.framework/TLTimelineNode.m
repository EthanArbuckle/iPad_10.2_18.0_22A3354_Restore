@implementation TLTimelineNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  TLTimelineNode *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[TLTimelineNode leftNode](v4, "leftNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("leftNode"));

  -[TLTimelineNode rightNode](v4, "rightNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("rightNode"));

  objc_sync_exit(v4);
}

- (TLTimelineNode)initWithCoder:(id)a3
{
  id v4;
  TLTimelineNode *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTimelineNode;
  v5 = -[TLTimelineNode init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leftNode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineNode setLeftNode:](v5, "setLeftNode:", v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rightNode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineNode setRightNode:](v5, "setRightNode:", v7);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TLTimelineNode copyWithZone:copyLeftNodes:copyRightNodes:](self, "copyWithZone:copyLeftNodes:copyRightNodes:", a3, 1, 1);
}

- (id)copyWithZone:(_NSZone *)a3 copyLeftNodes:(BOOL)a4 copyRightNodes:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  TLTimelineNode *v10;
  id v11;
  id v12;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v10 = self;
  objc_sync_enter(v10);
  if (!v6)
  {
    v11 = 0;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = -[TLTimelineNode copyWithZone:copyLeftNodes:copyRightNodes:](v10->_leftNode, "copyWithZone:copyLeftNodes:copyRightNodes:", a3, 1, 0);
  objc_msgSend(v11, "setRightNode:", v9);
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v12 = -[TLTimelineNode copyWithZone:copyLeftNodes:copyRightNodes:](v10->_rightNode, "copyWithZone:copyLeftNodes:copyRightNodes:", a3, 0, 1);
  objc_msgSend(v12, "setLeftNode:", v9);
LABEL_6:
  objc_sync_exit(v10);

  objc_msgSend(v9, "setLeftNode:", v11);
  objc_msgSend(v9, "setRightNode:", v12);

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[TLTimelineNode leftNode](self, "leftNode");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TLTimelineNode rightNode](self, "rightNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v3 = 0;
    else
      v3 = 4112;
  }
  -[TLTimelineNode leftNode](self, "leftNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[TLTimelineNode rightNode](self, "rightNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v3 = 4097;
  }
  -[TLTimelineNode leftNode](self, "leftNode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TLTimelineNode rightNode](self, "rightNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      return 4113;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return -[TLTimelineNode isEqualToObject:includingLeftNodes:includingRightNodes:](self, "isEqualToObject:includingLeftNodes:includingRightNodes:", a3, 1, 1);
}

- (BOOL)isEqualToObject:(id)a3 includingLeftNodes:(BOOL)a4 includingRightNodes:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
    {
      -[TLTimelineNode leftNode](self, "leftNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leftNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10
        && !objc_msgSend(v9, "isEqualToObject:includingLeftNodes:includingRightNodes:", v10, 1, 0))
      {
        v11 = 0;
LABEL_13:

        goto LABEL_14;
      }

    }
    if (v5)
    {
      -[TLTimelineNode rightNode](self, "rightNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
        v11 = 1;
      else
        v11 = objc_msgSend(v9, "isEqualToObject:includingLeftNodes:includingRightNodes:", v10, 0, 1);
      goto LABEL_13;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (TLTimelineNode)leftNode
{
  TLTimelineNode *v2;
  TLTimelineNode *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_leftNode;
  objc_sync_exit(v2);

  return v3;
}

- (TLTimelineNode)rightNode
{
  TLTimelineNode *v2;
  TLTimelineNode *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_rightNode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLeftNode:(id)a3
{
  TLTimelineNode *v5;
  TLTimelineNode *v6;

  v6 = (TLTimelineNode *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_leftNode != v6 && !-[TLTimelineNode isEqual:](v6, "isEqual:"))
    objc_storeStrong((id *)&v5->_leftNode, a3);
  objc_sync_exit(v5);

}

- (void)setRightNode:(id)a3
{
  TLTimelineNode *v5;
  TLTimelineNode *v6;

  v6 = (TLTimelineNode *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_rightNode != v6 && !-[TLTimelineNode isEqual:](v6, "isEqual:"))
    objc_storeStrong((id *)&v5->_rightNode, a3);
  objc_sync_exit(v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNode, 0);
  objc_storeStrong((id *)&self->_leftNode, 0);
}

@end
