@implementation TSDManipulatedStroke

- (void)p_setupDoodlesManipulation
{
  TSDVaryWidthPathManipulation *v3;

  v3 = -[TSDPathManipulation initWithProperties:bundle:dataManager:precedingManipulation:]([TSDVaryWidthPathManipulation alloc], "initWithProperties:bundle:dataManager:precedingManipulation:", 0, 0, 0, 0);
  -[TSDManipulatedStroke setPathManipulation:](self, "setPathManipulation:", v3);

}

- (TSDManipulatedStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9
{
  TSDManipulatedStroke *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDManipulatedStroke;
  v10 = -[TSDSmartStroke initWithName:color:width:cap:join:pattern:miterLimit:](&v12, sel_initWithName_color_width_cap_join_pattern_miterLimit_, a3, a4, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, a5, a9);
  if (v10 && objc_msgSend(a3, "isEqualToString:", CFSTR("Doodles")))
    -[TSDManipulatedStroke p_setupDoodlesManipulation](v10, "p_setupDoodlesManipulation");
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDManipulatedStroke;
  -[TSDSmartStroke dealloc](&v3, sel_dealloc);
}

- (BOOL)drawsOutsideStrokeBounds
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableManipulatedStroke *v4;
  NSString *v5;
  TSUColor *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  TSDStrokePattern *v11;
  double v12;
  TSDMutableManipulatedStroke *v13;

  v4 = [TSDMutableManipulatedStroke alloc];
  v5 = -[TSDSmartStroke strokeName](self, "strokeName");
  v6 = -[TSDStroke color](self, "color");
  -[TSDStroke width](self, "width");
  v8 = v7;
  v9 = -[TSDStroke cap](self, "cap");
  v10 = -[TSDStroke join](self, "join");
  v11 = -[TSDStroke pattern](self, "pattern");
  -[TSDStroke miterLimit](self, "miterLimit");
  v13 = -[TSDManipulatedStroke initWithName:color:width:cap:join:pattern:miterLimit:](v4, "initWithName:color:width:cap:join:pattern:miterLimit:", v5, v6, v9, v10, v11, v8, v12);
  -[TSDManipulatedStroke setRandomSeed:](v13, "setRandomSeed:", -[TSDManipulatedStroke randomSeed](self, "randomSeed"));
  return v13;
}

- (void)applyInteriorWrapPropertiesInContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDManipulatedStroke;
  -[TSDStroke applyToContext:insideStroke:](&v4, sel_applyToContext_insideStroke_, a3, a4);
}

- (void)seedRandom
{
  srandom(self->mRandomSeed);
}

- (id)strokeLineEnd:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v3 = a3;
  v5 = (void *)objc_msgSend(a3, "identifier");
  if (v3
    && (objc_msgSend(v5, "hasPrefix:", -[TSDSmartStroke strokeName](self, "strokeName")) & 1) == 0
    && self->mArrows)
  {
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR(":"));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      v5 = (void *)objc_msgSend(v5, "substringFromIndex:", v6 + v7);
    return (id)-[NSMutableDictionary objectForKey:](self->mArrows, "objectForKey:", v5);
  }
  else
  {
    if ((objc_msgSend(v5, "hasPrefix:", -[TSDSmartStroke strokeName](self, "strokeName")) & 1) == 0)
    {
      v9.receiver = self;
      v9.super_class = (Class)TSDManipulatedStroke;
      return -[TSDStroke strokeLineEnd:](&v9, sel_strokeLineEnd_, v3);
    }
    return v3;
  }
}

- (CGPath)manipulatePath:(CGPath *)a3 withLineWidth:(double)a4
{
  TSDPathManipulation *mManipulation;

  -[TSDManipulatedStroke seedRandom](self, "seedRandom");
  mManipulation = self->mManipulation;
  if (mManipulation)
    return -[TSDPathManipulation manipulatePath:withLineWidth:](mManipulation, "manipulatePath:withLineWidth:", a3, a4);
  else
    return a3;
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v12;
  objc_super v15;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v12 = a4;
  -[TSDStroke width](self, "width");
  v15.receiver = self;
  v15.super_class = (Class)TSDManipulatedStroke;
  -[TSDStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](&v15, sel_paintPath_wantsInteriorStroke_inContext_useFastDrawing_parameterized_shouldReverseDrawOrder_, -[TSDManipulatedStroke manipulatePath:withLineWidth:](self, "manipulatePath:withLineWidth:", a3), v12, a5, v10, v9, v8);
}

- (BOOL)canApplyToShapeRenderable
{
  return 1;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3
{
  -[TSDStroke width](self, "width");
  return -[TSDManipulatedStroke manipulatePath:withLineWidth:](self, "manipulatePath:withLineWidth:", a3);
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (double)renderedWidth
{
  double v2;
  double result;
  objc_super v4;

  if (self->mManipulation)
  {
    -[TSDStroke i_width](self, "i_width");
    return v2 * 4.0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDManipulatedStroke;
    -[TSDStroke width](&v4, sel_width);
  }
  return result;
}

- (unsigned)randomSeed
{
  return self->mRandomSeed;
}

- (void)setRandomSeed:(unsigned int)a3
{
  self->mRandomSeed = a3;
}

- (TSDPathManipulation)pathManipulation
{
  return self->mManipulation;
}

- (void)setPathManipulation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
