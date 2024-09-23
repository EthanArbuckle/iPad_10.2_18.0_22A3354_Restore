@implementation TSDMutableCalligraphyStroke

- (void)setWidth:(double)a3
{
  -[TSDStroke setI_width:](self, "setI_width:");
  -[TSDStroke setI_actualWidth:](self, "setI_actualWidth:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDCalligraphyStroke *v4;
  TSUColor *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  TSDStrokePattern *v10;
  double v11;

  v4 = +[TSDCalligraphyStroke allocWithZone:](TSDCalligraphyStroke, "allocWithZone:", a3);
  v5 = -[TSDMutableCalligraphyStroke color](self, "color");
  -[TSDMutableCalligraphyStroke width](self, "width");
  v7 = v6;
  v8 = -[TSDMutableCalligraphyStroke cap](self, "cap");
  v9 = -[TSDMutableCalligraphyStroke join](self, "join");
  v10 = -[TSDMutableCalligraphyStroke pattern](self, "pattern");
  -[TSDMutableCalligraphyStroke miterLimit](self, "miterLimit");
  return -[TSDCalligraphyStroke initWithColor:width:cap:join:pattern:miterLimit:](v4, "initWithColor:width:cap:join:pattern:miterLimit:", v5, v8, v9, v10, v7, v11);
}

@end
