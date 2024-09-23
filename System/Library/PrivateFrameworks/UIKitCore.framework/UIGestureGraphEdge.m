@implementation UIGestureGraphEdge

- (UIGestureGraphNode)sourceNode
{
  return self->_sourceNode;
}

- (UIGestureGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6
{
  UIGestureGraphEdge *v12;
  UIGestureGraphEdge *v13;
  void *v15;
  void *v16;
  objc_super v17;

  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIGestureGraphEdge.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceNode"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIGestureGraphEdge.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetNode"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)UIGestureGraphEdge;
  v12 = -[UIGestureGraphElement initWithLabel:](&v17, sel_initWithLabel_, a3);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceNode, a4);
    objc_storeStrong((id *)&v13->_targetNode, a5);
    v13->_directed = a6;
  }
  return v13;
}

- (BOOL)isLoop
{
  return self->_sourceNode == self->_targetNode;
}

- (UIGestureGraphNode)targetNode
{
  return self->_targetNode;
}

- (BOOL)isDirected
{
  return self->_directed;
}

- (id)oppositeNode:(id)a3
{
  UIGestureGraphNode *targetNode;

  targetNode = self->_targetNode;
  if (self->_sourceNode != a3)
  {
    if (targetNode != a3)
      return 0;
    targetNode = self->_sourceNode;
  }
  return targetNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
}

- (id)commonNode:(id)a3
{
  id *p_sourceNode;
  UIGestureGraphNode *sourceNode;
  void *v7;
  id v8;
  void *v9;
  UIGestureGraphNode *targetNode;
  id v11;
  id v13;
  void *v14;

  p_sourceNode = (id *)&self->_sourceNode;
  sourceNode = self->_sourceNode;
  objc_msgSend(a3, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UIGestureGraphNode isEqual:](sourceNode, "isEqual:", v7) & 1) != 0)
    goto LABEL_4;
  v8 = *p_sourceNode;
  objc_msgSend(a3, "targetNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    p_sourceNode = (id *)&self->_targetNode;
    targetNode = self->_targetNode;
    objc_msgSend(a3, "sourceNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[UIGestureGraphNode isEqual:](targetNode, "isEqual:", v7) & 1) != 0)
    {
LABEL_4:

      goto LABEL_5;
    }
    v13 = *p_sourceNode;
    objc_msgSend(a3, "targetNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v13, "isEqual:", v14);

    if ((v13 & 1) == 0)
    {
      v11 = 0;
      return v11;
    }
  }
LABEL_5:
  v11 = *p_sourceNode;
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIGestureGraphEdge isDirected](self, "isDirected");
  v12.receiver = self;
  v12.super_class = (Class)UIGestureGraphEdge;
  -[UIGestureGraphElement description](&v12, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureGraphEdge sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureGraphEdge targetNode](self, "targetNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[<%@ %p>] directed:[%d] %@\n\tsourceNode:%@\n\ttargetNode:%@"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
