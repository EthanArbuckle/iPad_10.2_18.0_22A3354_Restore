@implementation TSDMutableStroke

- (void)setWidth:(double)a3
{
  -[TSDStroke setI_width:](self, "setI_width:");
  -[TSDStroke setI_actualWidth:](self, "setI_actualWidth:", a3);
}

+ (id)stroke
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSDMutableStroke;
  return objc_msgSendSuper2(&v3, sel_i_newStroke);
}

+ (id)emptyStroke
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSDMutableStroke;
  return objc_msgSendSuper2(&v3, sel_i_newEmptyStroke);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDStroke *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  TSDStroke *v12;

  v4 = [TSDStroke alloc];
  -[TSDMutableStroke color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDMutableStroke width](self, "width");
  v7 = v6;
  v8 = -[TSDMutableStroke cap](self, "cap");
  v9 = -[TSDMutableStroke join](self, "join");
  -[TSDMutableStroke pattern](self, "pattern");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDMutableStroke miterLimit](self, "miterLimit");
  v12 = -[TSDStroke initWithColor:width:cap:join:pattern:miterLimit:](v4, "initWithColor:width:cap:join:pattern:miterLimit:", v5, v8, v9, v10, v7, v11);

  -[TSDMutableStroke actualWidth](self, "actualWidth");
  -[TSDStroke setI_actualWidth:](v12, "setI_actualWidth:");
  return v12;
}

- (void)setDontClearBackground:(BOOL)a3
{
  TSTStrokeAssociatedObject *value;

  if (a3)
  {
    value = objc_alloc_init(TSTStrokeAssociatedObject);
    -[TSTStrokeAssociatedObject setDontClearBackground:](value, "setDontClearBackground:", 1);
    objc_setAssociatedObject(self, "TSTStrokeAssociatedObject", value, (void *)1);

  }
  else
  {
    objc_setAssociatedObject(self, "TSTStrokeAssociatedObject", 0, (void *)1);
  }
}

@end
