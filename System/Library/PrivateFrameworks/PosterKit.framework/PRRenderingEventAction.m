@implementation PRRenderingEventAction

- (PRRenderingEventAction)initWithType:(id)a3 location:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  PRRenderingEventAction *v11;
  objc_super v13;
  _QWORD v14[2];

  y = a4.y;
  x = a4.x;
  v7 = (objc_class *)MEMORY[0x1E0D017D0];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setObject:forSetting:", v8, 0);

  *(CGFloat *)v14 = x;
  *(CGFloat *)&v14[1] = y;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v14, "{CGPoint=dd}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v10, 1);

  v13.receiver = self;
  v13.super_class = (Class)PRRenderingEventAction;
  v11 = -[PRRenderingEventAction initWithInfo:responder:](&v13, sel_initWithInfo_responder_, v9, 0);

  return v11;
}

+ (id)newActionWithType:(id)a3 location:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:location:", v7, x, y);

  return v8;
}

- (NSString)eventType
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[PRRenderingEventAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return (NSString *)v7;
}

- (CGPoint)location
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  -[PRRenderingEventAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "bs_CGPointValue");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

@end
