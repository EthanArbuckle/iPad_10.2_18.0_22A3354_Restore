@implementation TSDSmartStroke

- (NSString)strokeName
{
  return self->mStrokeName;
}

+ (Class)classForName:(id)a3
{
  const __CFString *v5;
  const __CFString *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("Chalk2");
  v7[1] = CFSTR("Dry Brush");
  v7[2] = CFSTR("Feathered Brush");
  v7[3] = CFSTR("Pen");
  v7[4] = CFSTR("Pencil");
  v7[5] = CFSTR("Crayon");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 6), "containsObject:", a3) & 1) == 0)
  {
    v6 = CFSTR("Calligraphy");
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1), "containsObject:", a3) & 1) == 0)
    {
      v5 = CFSTR("Doodles");
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v5, 1), "containsObject:", a3);
    }
  }
  return (Class)objc_opt_class();
}

+ (id)strokeWithName:(id)a3 color:(id)a4 width:(double)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:color:width:cap:join:pattern:miterLimit:", a3, a4, 0, 0, +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"), a5, 4.0);
}

- (TSDSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9
{
  TSDSmartStroke *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDSmartStroke;
  v10 = -[TSDStroke initWithColor:width:cap:join:pattern:miterLimit:](&v12, sel_initWithColor_width_cap_join_pattern_miterLimit_, a4, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, a5, a9);
  if (v10)
    v10->mStrokeName = (NSString *)objc_msgSend(a3, "copy");
  return v10;
}

- (TSDSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8
{
  return -[TSDSmartStroke initWithName:color:width:cap:join:pattern:miterLimit:](self, "initWithName:color:width:cap:join:pattern:miterLimit:", a3, a4, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, a5, 4.0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDSmartStroke;
  -[TSDSmartStroke dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSmartStroke copyWithZone:]");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSmartStroke.mm");
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 101, CFSTR("%@ is an abstract superclass. Subclasses must inherit %@"), v8, NSStringFromSelector(a2));
  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSmartStroke mutableCopyWithZone:]");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSmartStroke.mm");
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 106, CFSTR("%@ is an abstract superclass. Subclasses must inherit %@"), v8, NSStringFromSelector(a2));
  return 0;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  return !-[TSDStroke shouldRender](self, "shouldRender");
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    LODWORD(v4) = objc_msgSend((id)objc_msgSend(v4, "strokeName"), "isEqualToString:", -[TSDSmartStroke strokeName](self, "strokeName"));
    if ((_DWORD)v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSDSmartStroke;
      LOBYTE(v4) = -[TSDStroke isEqual:](&v7, sel_isEqual_, v5);
    }
  }
  return (char)v4;
}

- (BOOL)canDrawWithOtherStroke:(id)a3
{
  uint64_t v4;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
    LOBYTE(v4) = -[TSDSmartStroke isEqual:](self, "isEqual:", v4);
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDSmartStroke;
  v3 = -[TSDStroke hash](&v5, sel_hash);
  return -[NSString hash](self->mStrokeName, "hash") ^ v3;
}

- (BOOL)shouldAntialiasDefeat
{
  return 0;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDSmartStroke;
  v4 = -[TSDStroke mixingTypeWithObject:](&v9, sel_mixingTypeWithObject_);
  objc_opt_class();
  v5 = TSUDynamicCast();
  if (!v5)
    return 2;
  v6 = (void *)v5;
  v7 = -[TSDSmartStroke strokeName](self, "strokeName");
  if (v7 != (NSString *)objc_msgSend(v6, "strokeName")
    && !-[NSString isEqualToString:](-[TSDSmartStroke strokeName](self, "strokeName"), "isEqualToString:", objc_msgSend(v6, "strokeName")))
  {
    return TSDMixingTypeBestFromMixingTypes((uint64_t)v4, 2);
  }
  return (int64_t)v4;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  TSDSmartStroke *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSString *v10;
  uint64_t v11;
  double v12;
  double v13;
  TSDSmartStroke *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  objc_opt_class();
  v6 = (TSDSmartStroke *)TSUDynamicCast();
  if (!v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSmartStroke mixedObjectWithFraction:ofObject:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSmartStroke.mm"), 168, CFSTR("nil object after cast"));
  }
  v9 = objc_alloc((Class)objc_opt_class());
  v10 = -[TSDSmartStroke strokeName](self, "strokeName");
  v11 = -[TSUColor blendedColorWithFraction:ofColor:](-[TSDStroke color](self, "color"), "blendedColorWithFraction:ofColor:", -[TSDStroke color](v6, "color"), a3);
  -[TSDStroke width](self, "width");
  -[TSDStroke width](v6, "width");
  TSUMix();
  v13 = v12;
  if (a3 >= 0.5)
    v14 = v6;
  else
    v14 = self;
  v15 = -[TSDStroke cap](v14, "cap");
  v16 = -[TSDStroke join](v14, "join");
  v17 = TSDMixingMixedObjectWithFractionEx(-[TSDStroke pattern](self, "pattern"), (unint64_t)-[TSDStroke pattern](v6, "pattern"), a3);
  -[TSDStroke miterLimit](self, "miterLimit");
  -[TSDStroke miterLimit](v6, "miterLimit");
  TSUMix();
  return (id)objc_msgSend(v9, "initWithName:color:width:cap:join:pattern:miterLimit:", v10, v11, v15, v16, v17, v13, v18);
}

- (double)deprecatedPatternOffsetDistance
{
  return self->mDeprecatedPatternOffsetDistance;
}

@end
