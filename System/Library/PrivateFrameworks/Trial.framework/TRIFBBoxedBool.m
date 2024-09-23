@implementation TRIFBBoxedBool

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  v4 = -[TRIFBBoxedBool val](self, "val");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1AC6B8C]();
      v8 = -[TRIFBBoxedBool val](self, "val");
      v9 = objc_msgSend(v6, "val");
      objc_autoreleasePoolPop(v7);
      v10 = v8 ^ v9 ^ 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (TRIFBBoxedBool)initWithVal:(BOOL)a3
{
  TRIFBMutableBoxedBool *v4;
  TRIFBBoxedBool *p_super;

  v4 = -[TRIFBMutableBoxedBool initWithVal:]([TRIFBMutableBoxedBool alloc], "initWithVal:", a3);
  p_super = &v4->super;
  if (v4)
    v4->_allowMutation = 0;

  return p_super;
}

- (id)init_
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIFBBoxedBool;
  return -[TRIFBBoxedBool init](&v3, sel_init);
}

@end
