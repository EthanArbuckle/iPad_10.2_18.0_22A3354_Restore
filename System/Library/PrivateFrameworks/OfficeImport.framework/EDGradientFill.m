@implementation EDGradientFill

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDegree:(double)a3
{
  self->mDegree = a3;
}

- (void)setFocusRect:(CGRect)a3
{
  self->mFocusRect = a3;
}

- (void)setStops:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  v5 = (NSMutableDictionary *)a3;
  if (self->mStops != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mStops, a3);
    v5 = v6;
  }

}

- (void)setStopColor:(id)a3 atPosition:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mStops, "setObject:forKey:", a3, a4);
}

- (EDGradientFill)initWithResources:(id)a3
{
  id v4;
  EDGradientFill *v5;
  EDGradientFill *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *mStops;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDGradientFill;
  v5 = -[EDFill initWithResources:](&v10, sel_initWithResources_, v4);
  v6 = v5;
  if (v5)
  {
    v5->mType = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mStops = v6->mStops;
    v6->mStops = v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EDGradientFill;
  v4 = -[EDFill copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSMutableDictionary mutableCopy](self->mStops, "mutableCopy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (BOOL)isEqualToGradientFill:(id)a3
{
  char *v4;
  _QWORD *v5;
  char v6;

  v4 = (char *)a3;
  v5 = v4;
  if (self->mType == *((_DWORD *)v4 + 4)
    && self->mDegree == *((double *)v4 + 4)
    && CGRectEqualToRect(self->mFocusRect, *(CGRect *)(v4 + 40)))
  {
    v6 = -[NSMutableDictionary isEqual:](self->mStops, "isEqual:", v5[3]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  EDGradientFill *v4;
  EDGradientFill *v5;
  BOOL v6;

  v4 = (EDGradientFill *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDGradientFill isEqualToGradientFill:](self, "isEqualToGradientFill:", v5);

  return v6;
}

- (unint64_t)hash
{
  int v2;

  v2 = self->mType << 8;
  return -[NSMutableDictionary count](self->mStops, "count") + v2;
}

- (BOOL)isEmpty
{
  return 0;
}

- (int)type
{
  return self->mType;
}

- (double)degree
{
  return self->mDegree;
}

- (id)stops
{
  return self->mStops;
}

- (CGRect)focusRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mFocusRect.origin.x;
  y = self->mFocusRect.origin.y;
  width = self->mFocusRect.size.width;
  height = self->mFocusRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)colorForStopAtPosition:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mStops, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStops, 0);
}

- (EDGradientFill)initWithType:(int)a3 degree:(double)a4 top:(double)a5 bottom:(double)a6 right:(double)a7 left:(double)a8 stops:(id)a9 resources:(id)a10
{
  uint64_t v16;
  id v18;
  id v19;
  EDGradientFill *v20;
  EDGradientFill *v21;

  v16 = *(_QWORD *)&a3;
  v18 = a9;
  v19 = a10;
  v20 = -[EDGradientFill initWithResources:](self, "initWithResources:", v19);
  v21 = v20;
  if (v20)
  {
    -[EDGradientFill setType:](v20, "setType:", v16);
    -[EDGradientFill setFocusRect:](v21, "setFocusRect:", a8, a5, a7, a6);
    -[EDGradientFill setStops:](v21, "setStops:", v18);
    -[EDGradientFill setDegree:](v21, "setDegree:", a4);
  }

  return v21;
}

+ (id)gradientWithType:(int)a3 degree:(double)a4 top:(double)a5 bottom:(double)a6 right:(double)a7 left:(double)a8 stops:(id)a9 resources:(id)a10
{
  uint64_t v16;
  id v18;
  id v19;
  void *v20;

  v16 = *(_QWORD *)&a3;
  v18 = a9;
  v19 = a10;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:degree:top:bottom:right:left:stops:resources:", v16, v18, v19, a4, a5, a6, a7, a8);

  return v20;
}

- (EDGradientFill)initWithType:(int)a3 degree:(double)a4 focusRect:(CGRect)a5 stops:(id)a6 resources:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v13;
  id v15;
  id v16;
  EDGradientFill *v17;
  EDGradientFill *v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = *(_QWORD *)&a3;
  v15 = a6;
  v16 = a7;
  v17 = -[EDGradientFill initWithResources:](self, "initWithResources:", v16);
  v18 = v17;
  if (v17)
  {
    -[EDGradientFill setType:](v17, "setType:", v13);
    -[EDGradientFill setFocusRect:](v18, "setFocusRect:", x, y, width, height);
    -[EDGradientFill setStops:](v18, "setStops:", v15);
    -[EDGradientFill setDegree:](v18, "setDegree:", a4);
  }

  return v18;
}

+ (id)gradientWithType:(int)a3 degree:(double)a4 focusRect:(CGRect)a5 stops:(id)a6 resources:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v13;
  id v15;
  id v16;
  void *v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = *(_QWORD *)&a3;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:degree:focusRect:stops:resources:", v13, v15, v16, a4, x, y, width, height);

  return v17;
}

@end
