@implementation UIMutableTransformer

- (void)addTransform:(id)a3 reason:(id)a4
{
  id v7;
  NSMutableArray *transformReasonAssociations;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITransform.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

  }
  -[UIMutableTransformer _ensureTransformsStructuresExists](self, "_ensureTransformsStructuresExists");
  -[NSMutableArray addObject:](self->super._transforms, "addObject:", v11);
  transformReasonAssociations = self->super._transformReasonAssociations;
  +[_UITransformToReasonAssociation association:reason:](_UITransformToReasonAssociation, "association:reason:", v11, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](transformReasonAssociations, "addObject:", v9);

  -[UIMutableTransformer _updateTransform](self, "_updateTransform");
}

- (void)replaceTransform:(id)a3 withTransform:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  NSMutableArray *transformReasonAssociations;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITransform.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("priorTransform"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITransform.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newTransform"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_8;
LABEL_3:
  v11 = -[NSMutableArray indexOfObject:](self->super._transforms, "indexOfObject:", v17);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    if (v11 < -[NSMutableArray count](self->super._transforms, "count"))
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->super._transforms, "replaceObjectAtIndex:withObject:", v12, v9);
      transformReasonAssociations = self->super._transformReasonAssociations;
      +[_UITransformToReasonAssociation association:reason:](_UITransformToReasonAssociation, "association:reason:", v9, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray replaceObjectAtIndex:withObject:](transformReasonAssociations, "replaceObjectAtIndex:withObject:", v12, v14);

      -[UIMutableTransformer _updateTransform](self, "_updateTransform");
    }
  }

}

- (void)removeTransform:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITransform.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

    v5 = 0;
  }
  v6 = -[NSMutableArray indexOfObject:](self->super._transforms, "indexOfObject:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    if (v6 < -[NSMutableArray count](self->super._transforms, "count"))
    {
      -[NSMutableArray removeObjectAtIndex:](self->super._transforms, "removeObjectAtIndex:", v7);
      -[NSMutableArray removeObjectAtIndex:](self->super._transformReasonAssociations, "removeObjectAtIndex:", v7);
      -[UIMutableTransformer _updateTransform](self, "_updateTransform");
    }
  }

}

- (void)removeAll
{
  if (-[NSMutableArray count](self->super._transforms, "count"))
  {
    -[NSMutableArray removeAllObjects](self->super._transforms, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->super._transformReasonAssociations, "removeAllObjects");
    -[UIMutableTransformer _updateTransform](self, "_updateTransform");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UITransformer _initWithTransformer:]([UITransformer alloc], "_initWithTransformer:", self);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UIMutableTransformer *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIMutableTransformer;
  -[UITransformer descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__UIMutableTransformer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

void __62__UIMutableTransformer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", WeakRetained, CFSTR("delegate"));

}

- (void)_ensureTransformsStructuresExists
{
  NSMutableArray *v3;
  NSMutableArray *transforms;
  NSMutableArray *v5;
  NSMutableArray *transformReasonAssociations;

  if (!self->super._transforms)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transforms = self->super._transforms;
    self->super._transforms = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transformReasonAssociations = self->super._transformReasonAssociations;
    self->super._transformReasonAssociations = v5;

  }
}

- (void)_updateTransform
{
  __int128 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  id WeakRetained;
  CGAffineTransform v13;
  CGAffineTransform t1;
  CGAffineTransform t2;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v20.c = v3;
  *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->super._transforms;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        if (v9)
          objc_msgSend(v9, "transform");
        else
          memset(&t2, 0, sizeof(t2));
        t1 = v20;
        CGAffineTransformConcat(&v20, &t1, &t2);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v6);
  }

  v10 = *(_OWORD *)&self->super.super._transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->super.super._transform.a;
  *(_OWORD *)&t1.c = v10;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->super.super._transform.tx;
  v13 = v20;
  if (!CGAffineTransformEqualToTransform(&t1, &v13))
  {
    v11 = *(_OWORD *)&v20.c;
    *(_OWORD *)&self->super.super._transform.a = *(_OWORD *)&v20.a;
    *(_OWORD *)&self->super.super._transform.c = v11;
    *(_OWORD *)&self->super.super._transform.tx = *(_OWORD *)&v20.tx;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "transformsDidChange:", self);

  }
}

- (UIMutableTransformerDelegate)_delegate
{
  return (UIMutableTransformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
