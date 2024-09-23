@implementation TMLReference

- (TMLReference)initWithTarget:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  TMLReference *v9;
  TMLReference *v10;
  uint64_t v11;
  id block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TMLReference;
  v9 = -[TMLReference init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_target, a3);
    v11 = MEMORY[0x22E2E7E44](v8);
    block = v10->_block;
    v10->_block = (id)v11;

  }
  return v10;
}

+ (id)referenceForTarget:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithTarget_block_(v5, v6, v7, v4, 0);

  return v8;
}

+ (id)referenceWithBlock:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithTarget_block_(v5, v6, v7, 0, v4);

  return v8;
}

- (id)value
{
  void (**block)(id, SEL);
  void *v4;
  id target;
  id v6;
  const char *v7;
  char isKindOfClass;
  double v9;
  id v10;
  id v11;

  block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    target = self->_target;
    self->_target = v4;

    v6 = self->_block;
    self->_block = 0;

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = self->_target;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_object(v10, v7, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v10;
  }
  return v11;
}

- (unint64_t)valueType
{
  return 16;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend_tmlIdentifier(self->_target, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, v9, CFSTR("%@:%@"), v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
