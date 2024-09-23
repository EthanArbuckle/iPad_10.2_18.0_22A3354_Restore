@implementation TSDMutableBrushStroke

- (void)setWidth:(double)a3
{
  -[TSDStroke setI_width:](self, "setI_width:");
  -[TSDStroke setI_actualWidth:](self, "setI_actualWidth:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDBrushStroke *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  TSDBrushStroke *v13;

  v4 = [TSDBrushStroke alloc];
  -[TSDSmartStroke strokeName](self, "strokeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDMutableBrushStroke color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDMutableBrushStroke width](self, "width");
  v8 = v7;
  v9 = -[TSDMutableBrushStroke cap](self, "cap");
  v10 = -[TSDMutableBrushStroke join](self, "join");
  -[TSDMutableBrushStroke pattern](self, "pattern");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDMutableBrushStroke miterLimit](self, "miterLimit");
  v13 = -[TSDBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v4, "initWithName:color:width:cap:join:pattern:miterLimit:", v5, v6, v9, v10, v11, v8, v12);

  return v13;
}

@end
