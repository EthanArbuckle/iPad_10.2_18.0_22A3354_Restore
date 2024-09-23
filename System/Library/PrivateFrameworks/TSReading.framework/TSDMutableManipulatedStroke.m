@implementation TSDMutableManipulatedStroke

- (void)setWidth:(double)a3
{
  -[TSDStroke setI_width:](self, "setI_width:");
  -[TSDStroke setI_actualWidth:](self, "setI_actualWidth:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDManipulatedStroke *v4;
  NSString *v5;
  TSUColor *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  TSDStrokePattern *v11;
  double v12;

  v4 = [TSDManipulatedStroke alloc];
  v5 = -[TSDSmartStroke strokeName](self, "strokeName");
  v6 = -[TSDMutableManipulatedStroke color](self, "color");
  -[TSDMutableManipulatedStroke width](self, "width");
  v8 = v7;
  v9 = -[TSDMutableManipulatedStroke cap](self, "cap");
  v10 = -[TSDMutableManipulatedStroke join](self, "join");
  v11 = -[TSDMutableManipulatedStroke pattern](self, "pattern");
  -[TSDMutableManipulatedStroke miterLimit](self, "miterLimit");
  return -[TSDManipulatedStroke initWithName:color:width:cap:join:pattern:miterLimit:](v4, "initWithName:color:width:cap:join:pattern:miterLimit:", v5, v6, v9, v10, v11, v8, v12);
}

@end
