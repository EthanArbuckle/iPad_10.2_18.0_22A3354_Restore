@implementation _UISpringBehavior

- (_UISpringBehavior)initWithItem:(id)a3 anchorPoint:(CGPoint)a4
{
  double y;
  double x;
  id v8;
  _UISpringBehavior *v9;
  UIAttachmentBehavior *v10;
  UIAttachmentBehavior *topLeft;
  UIAttachmentBehavior *v12;
  UIAttachmentBehavior *v13;
  UIAttachmentBehavior *v14;
  UIAttachmentBehavior *topRight;
  UIAttachmentBehavior *v16;
  UIAttachmentBehavior *v17;
  UIAttachmentBehavior *v18;
  UIAttachmentBehavior *bottomRight;
  UIAttachmentBehavior *v20;
  UIAttachmentBehavior *v21;
  UIAttachmentBehavior *v22;
  UIAttachmentBehavior *bottomLeft;
  _UISpringBehavior *v24;
  void *v26;
  objc_super v27;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISpringBehavior.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  v27.receiver = self;
  v27.super_class = (Class)_UISpringBehavior;
  v9 = -[UIDynamicBehavior init](&v27, sel_init);
  if (v9)
  {
    v10 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:]([UIAttachmentBehavior alloc], "initWithItem:attachedToAnchor:", v8, x, y);
    -[UIAttachmentBehavior setDamping:](v10, "setDamping:", 0.75);
    -[UIAttachmentBehavior setFrequency:](v10, "setFrequency:", 4.5);
    -[UIDynamicBehavior addChildBehavior:](v9, "addChildBehavior:", v10);
    topLeft = v9->_topLeft;
    v9->_topLeft = v10;
    v12 = v10;

    v13 = [UIAttachmentBehavior alloc];
    v14 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v13, "initWithItem:attachedToAnchor:", v8, x, y);
    -[UIAttachmentBehavior setDamping:](v14, "setDamping:", 0.75);
    -[UIAttachmentBehavior setFrequency:](v14, "setFrequency:", 4.5);
    -[UIDynamicBehavior addChildBehavior:](v9, "addChildBehavior:", v14);
    topRight = v9->_topRight;
    v9->_topRight = v14;
    v16 = v14;

    v17 = [UIAttachmentBehavior alloc];
    v18 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v17, "initWithItem:attachedToAnchor:", v8, x, y);
    -[UIAttachmentBehavior setDamping:](v18, "setDamping:", 0.75);
    -[UIAttachmentBehavior setFrequency:](v18, "setFrequency:", 4.5);
    -[UIDynamicBehavior addChildBehavior:](v9, "addChildBehavior:", v18);
    bottomRight = v9->_bottomRight;
    v9->_bottomRight = v18;
    v20 = v18;

    v21 = [UIAttachmentBehavior alloc];
    v22 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v21, "initWithItem:attachedToAnchor:", v8, x, y);
    -[UIAttachmentBehavior setDamping:](v22, "setDamping:", 0.75);
    -[UIAttachmentBehavior setFrequency:](v22, "setFrequency:", 4.5);
    -[UIDynamicBehavior addChildBehavior:](v9, "addChildBehavior:", v22);
    bottomLeft = v9->_bottomLeft;
    v9->_bottomLeft = v22;

    -[_UISpringBehavior setAnchorPoint:](v9, "setAnchorPoint:", x, y);
    v24 = v9;
  }

  return v9;
}

- (_UISpringBehavior)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItem_anchorPoint_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISpringBehavior.m"), 66, CFSTR("Use %@ to instantiate an instance of %@."), v5, v7);

  return 0;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;

  y = a3.y;
  x = a3.x;
  v6 = a3.x + -100.0;
  v7 = a3.y + -100.0;
  -[UIAttachmentBehavior setAnchorPoint:](self->_topLeft, "setAnchorPoint:", a3.x + -100.0, a3.y + -100.0);
  -[UIAttachmentBehavior setAnchorPoint:](self->_topRight, "setAnchorPoint:", x + 100.0, v7);
  -[UIAttachmentBehavior setAnchorPoint:](self->_bottomRight, "setAnchorPoint:", x + 100.0, y + 100.0);
  -[UIAttachmentBehavior setAnchorPoint:](self->_bottomLeft, "setAnchorPoint:", v6, y + 100.0);
  self->_anchorPoint.x = x;
  self->_anchorPoint.y = y;
}

- (void)setDamping:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_damping = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIDynamicBehavior childBehaviors](self, "childBehaviors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setDamping:", self->_damping);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setFrequency:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_frequency = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIDynamicBehavior childBehaviors](self, "childBehaviors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setFrequency:", self->_frequency);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)damping
{
  return self->_damping;
}

- (double)frequency
{
  return self->_frequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLeft, 0);
  objc_storeStrong((id *)&self->_bottomRight, 0);
  objc_storeStrong((id *)&self->_topRight, 0);
  objc_storeStrong((id *)&self->_topLeft, 0);
}

@end
