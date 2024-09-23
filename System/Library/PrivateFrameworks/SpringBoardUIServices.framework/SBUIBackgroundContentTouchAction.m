@implementation SBUIBackgroundContentTouchAction

- (SBUIBackgroundContentTouchAction)initWithLocation:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;
  SBUIBackgroundContentTouchAction *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v7, 1);

  v10.receiver = self;
  v10.super_class = (Class)SBUIBackgroundContentTouchAction;
  v8 = -[SBUIBackgroundContentTouchAction initWithInfo:responder:](&v10, sel_initWithInfo_responder_, v6, 0);

  return v8;
}

- (CGPoint)location
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[SBUIBackgroundContentTouchAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGPointValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("location");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  CGPoint v8;

  if (a5 != 1)
    return 0;
  objc_msgSend(a4, "CGPointValue", a3, v5, v6);
  NSStringFromCGPoint(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
