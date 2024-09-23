@implementation TRIFBBoxedInt64

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  v4 = -[TRIFBBoxedInt64 val](self, "val");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1AC6B8C]();
      v8 = -[TRIFBBoxedInt64 val](self, "val");
      v9 = v8 == objc_msgSend(v6, "val");
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (TRIFBBoxedInt64)initWithVal:(int64_t)a3
{
  TRIFBMutableBoxedInt64 *v4;
  TRIFBBoxedInt64 *p_super;

  v4 = -[TRIFBMutableBoxedInt64 initWithVal:]([TRIFBMutableBoxedInt64 alloc], "initWithVal:", a3);
  p_super = &v4->super;
  if (v4)
    v4->_allowMutation = 0;

  return p_super;
}

- (id)init_
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIFBBoxedInt64;
  return -[TRIFBBoxedInt64 init](&v3, sel_init);
}

@end
