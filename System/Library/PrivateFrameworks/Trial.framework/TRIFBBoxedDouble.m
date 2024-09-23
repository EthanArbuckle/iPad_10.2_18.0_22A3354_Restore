@implementation TRIFBBoxedDouble

- (unint64_t)hash
{
  void *v3;
  double v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  -[TRIFBBoxedDouble val](self, "val");
  v5 = (unint64_t)v4;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1AC6B8C]();
      -[TRIFBBoxedDouble val](self, "val");
      v9 = v8;
      objc_msgSend(v6, "val");
      v11 = v9 == v10;
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (TRIFBBoxedDouble)initWithVal:(double)a3
{
  TRIFBMutableBoxedDouble *v4;
  TRIFBBoxedDouble *p_super;

  v4 = -[TRIFBMutableBoxedDouble initWithVal:]([TRIFBMutableBoxedDouble alloc], "initWithVal:", a3);
  p_super = &v4->super;
  if (v4)
    v4->_allowMutation = 0;

  return p_super;
}

- (id)init_
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIFBBoxedDouble;
  return -[TRIFBBoxedDouble init](&v3, sel_init);
}

@end
