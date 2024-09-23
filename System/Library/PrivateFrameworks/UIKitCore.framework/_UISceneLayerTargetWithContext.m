@implementation _UISceneLayerTargetWithContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_context, 0);
}

- (_UISceneLayerTargetWithContext)initWithContext:(id)a3 equalityType:(unint64_t)a4 matchingBlock:(id)a5
{
  id v10;
  id v11;
  void *v12;
  _UISceneLayerTargetWithContext *v13;
  _UISceneLayerTargetWithContext *v14;
  void *v15;
  id block;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerTargetWithContext.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerTargetWithContext.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)_UISceneLayerTargetWithContext;
  v13 = -[_UISceneLayerTargetWithContext init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_context, a3);
    v14->_equalityType = a4;
    v15 = _Block_copy(v12);
    block = v14->_block;
    v14->_block = v15;

  }
  return v14;
}

- (unint64_t)hash
{
  id context;
  id *p_context;

  p_context = &self->_context;
  context = self->_context;
  if (p_context[1])
    return objc_msgSend(context, "hash");
  else
    return 7 * (_QWORD)context;
}

- (BOOL)isEqual:(id)a3
{
  _UISceneLayerTargetWithContext *v4;
  id context;
  id v6;
  char v7;

  v4 = (_UISceneLayerTargetWithContext *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      context = self->_context;
      v6 = v4->_context;
      if (self->_equalityType == 1)
        v7 = objc_msgSend(context, "isEqual:", v6);
      else
        v7 = context == v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)matchesLayer:(id)a3
{
  return (*((uint64_t (**)(id, id, id))self->_block + 2))(self->_block, self->_context, a3);
}

- (NSString)description
{
  return (NSString *)-[_UISceneLayerTargetWithContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UISceneLayerTargetWithContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UISceneLayerTargetWithContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UISceneLayerTargetWithContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p>"), v7, self->_context);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("context"));

  return v4;
}

@end
