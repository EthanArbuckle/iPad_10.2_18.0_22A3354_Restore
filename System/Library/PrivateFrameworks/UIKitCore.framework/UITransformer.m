@implementation UITransformer

- (id)_initWithTransformer:(id)a3
{
  id *v4;
  UITransformer *v5;
  uint64_t v6;
  NSMutableArray *transforms;
  uint64_t v8;
  NSMutableArray *transformReasonAssociations;
  objc_super v11;

  v4 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)UITransformer;
  v5 = -[UITransform init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4[7], "mutableCopy");
    transforms = v5->_transforms;
    v5->_transforms = (NSMutableArray *)v6;

    v8 = objc_msgSend(v4[8], "mutableCopy");
    transformReasonAssociations = v5->_transformReasonAssociations;
    v5->_transformReasonAssociations = (NSMutableArray *)v8;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  -[NSMutableArray firstObject](self->_transforms, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSMutableArray hash](self->_transforms, "hash");
  -[NSMutableArray firstObject](self->_transformReasonAssociations, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = -[NSMutableArray hash](self->_transformReasonAssociations, "hash") * v7 + v5 * v4 + 3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  UITransformer *v4;
  UITransformer *v5;
  char v6;

  v4 = (UITransformer *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects())
    v6 = BSEqualObjects();
  else
LABEL_6:
    v6 = 0;
LABEL_8:

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UITransformer _initWithTransformer:]([UIMutableTransformer alloc], "_initWithTransformer:", self);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UITransformer *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UITransformer;
  -[UITransform descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__UITransformer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

uint64_t __55__UITransformer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("transforms"), 1);
}

- (NSArray)transforms
{
  return &self->_transforms->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformReasonAssociations, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
}

@end
