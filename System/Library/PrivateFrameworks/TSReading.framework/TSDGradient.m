@implementation TSDGradient

+ (void)enableInflections
{
  sUseInflections = 0;
}

+ (void)disableInflections
{
  sUseInflections = 1;
}

+ (BOOL)useInflections
{
  return (sUseInflections & 1) == 0;
}

- (TSDGradient)init
{
  TSDGradient *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDGradient;
  v2 = -[TSDGradient init](&v4, sel_init);
  if (v2)
    v2->mStops = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  return v2;
}

- (TSDGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5
{
  TSDGradient *v8;
  TSDGradient *v9;
  NSMutableArray *mStops;

  v8 = -[TSDGradient init](self, "init");
  v9 = v8;
  if (v8)
  {
    mStops = v8->mStops;
    if (mStops)
      -[NSMutableArray setArray:](mStops, "setArray:", a3);
    else
      v9->mStops = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    v9->mType = a4;
    v9->mOpacity = a5;
  }
  return v9;
}

- (TSDGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  return -[TSDGradient initWithGradientStops:type:opacity:](self, "initWithGradientStops:type:opacity:", a3, a4, 1.0);
}

- (TSDGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  return -[TSDGradient initWithGradientStops:type:](self, "initWithGradientStops:type:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", a3, 0.0), +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", a4, 1.0), 0), a5);
}

- (void)dealloc
{
  objc_super v3;

  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
  v3.receiver = self;
  v3.super_class = (Class)TSDGradient;
  -[TSDGradient dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSDGradient<%p>: type=%lu opacity=%f \n\tstops<%p>=%@"), self, self->mType, *(_QWORD *)&self->mOpacity, self->mStops, self->mStops);
}

- (unint64_t)hash
{
  -[NSMutableArray hash](self->mStops, "hash");
  TSUHashWithSeed();
  TSUHashWithSeed();
  return TSUHashWithSeed();
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  char v7;

  if (a3 == self)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      if (objc_msgSend(v4, "gradientType") == self->mType && (objc_msgSend(v5, "opacity"), v6 == self->mOpacity))
      {
        LODWORD(v4) = -[NSMutableArray isEqualToArray:](self->mStops, "isEqualToArray:", objc_msgSend(v5, "gradientStops"));
        if ((_DWORD)v4)
        {
          v7 = objc_msgSend(v5, "isAdvancedGradient");
          LOBYTE(v4) = v7 ^ -[TSDGradient isAdvancedGradient](self, "isAdvancedGradient") ^ 1;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return (char)v4;
}

+ (BOOL)useQuartzShadings
{
  return 1;
}

+ (void)sortStopsArray:(id)a3
{
  objc_msgSend(a3, "sortUsingFunction:context:", gradientStopCompare, 0);
}

+ (id)linearGradientWithStartColor:(id)a3 endColor:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartColor:endColor:type:", a3, a4, 0);
}

+ (id)linearGradientWithGradientStops:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGradientStops:type:", a3, 0);
}

+ (id)radialGradientWithStartColor:(id)a3 endColor:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartColor:endColor:type:", a3, a4, 1);
}

+ (id)radialGradientWithGradientStops:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGradientStops:type:", a3, 1);
}

- (NSArray)gradientStops
{
  return &self->mStops->super;
}

- (TSUColor)firstColor
{
  return (TSUColor *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", 0), "color");
}

- (TSUColor)lastColor
{
  return (TSUColor *)objc_msgSend((id)-[NSMutableArray lastObject](self->mStops, "lastObject"), "color");
}

- (CGShading)shadingRef
{
  CGShading *result;
  CGColorSpace *v4;
  CGFunction *v5;
  CGShading *Radial;
  CGFunctionCallbacks callbacks;
  CGFloat range[2];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat domain[3];
  uint64_t v16;
  CGPoint v17;
  CGPoint v18;
  CGPoint v19;
  CGPoint v20;

  v16 = *MEMORY[0x24BDAC8D0];
  result = self->mShadingRef;
  if (!result)
  {
    v4 = (CGColorSpace *)TSUDeviceRGBColorSpace();
    range[0] = 0.0;
    v9 = 0;
    v11 = 0;
    range[1] = 1.0;
    v10 = 0x3FF0000000000000;
    v12 = 0x3FF0000000000000;
    v13 = 0;
    v14 = 0x3FF0000000000000;
    *(_OWORD *)domain = xmmword_217C28F30;
    *(_QWORD *)&callbacks.version = 0;
    callbacks.evaluate = (CGFunctionEvaluateCallback)p_evaluateGradient;
    callbacks.releaseInfo = _release;
    v5 = CGFunctionCreate((void *)-[TSDGradient copy](self, "copy"), 1uLL, domain, 4uLL, range, &callbacks);
    if (-[TSDGradient gradientType](self, "gradientType"))
    {
      v17.x = 0.0;
      v17.y = 0.0;
      v20.x = 0.0;
      v20.y = 0.0;
      Radial = CGShadingCreateRadial(v4, v17, 0.0, v20, 100.0, v5, 1, 1);
    }
    else
    {
      v19.x = 100.0;
      v18.x = 0.0;
      v18.y = 0.0;
      v19.y = 0.0;
      Radial = CGShadingCreateAxial(v4, v18, v19, v5, 1, 1);
    }
    self->mShadingRef = Radial;
    CGFunctionRelease(v5);
    return self->mShadingRef;
  }
  return result;
}

- (void)releaseShadingRef
{
  CGShadingRelease(self->mShadingRef);
  self->mShadingRef = 0;
}

- (BOOL)isAdvancedGradient
{
  return self->mIsAdvancedGradient
      || -[TSDGradient isAdvancedGradientIgnoringFlag](self, "isAdvancedGradientIgnoringFlag");
}

- (BOOL)isAdvancedGradientIgnoringFlag
{
  double v3;
  double v4;
  double v6;

  if (self->mType)
    return 1;
  if (-[NSMutableArray count](self->mStops, "count") != 2)
    return 1;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", 0), "fraction");
  if (v3 != 0.0)
    return 1;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", 0), "inflection");
  if (v4 != 0.5 && fabs(v4 + -0.5) >= 5.0e-11)
    return 1;
  objc_msgSend((id)-[NSMutableArray lastObject](self->mStops, "lastObject"), "fraction");
  return v6 != 1.0;
}

- (id)stopBeforeFraction:(double)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  TSUClamp();
  v5 = v4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mStops, "reverseObjectEnumerator", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v7)
    return (id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", 0);
  v8 = v7;
  v9 = *(_QWORD *)v15;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
    objc_msgSend(v11, "fraction");
    if (v12 <= v5)
      return v11;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        goto LABEL_3;
      return (id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", 0);
    }
  }
}

- (id)stopAfterFraction:(double)a3
{
  double v4;
  double v6;
  NSMutableArray *mStops;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  TSUClamp();
  if (v4 == 1.0)
    return (id)-[NSMutableArray lastObject](self->mStops, "lastObject");
  v6 = v4;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  mStops = self->mStops;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
    return (id)-[NSMutableArray lastObject](self->mStops, "lastObject");
  v9 = v8;
  v10 = *(_QWORD *)v15;
LABEL_5:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v10)
      objc_enumerationMutation(mStops);
    v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
    objc_msgSend(v12, "fraction");
    if (v13 > v6)
      return v12;
    if (v9 == ++v11)
    {
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        goto LABEL_5;
      return (id)-[NSMutableArray lastObject](self->mStops, "lastObject");
    }
  }
}

- (id)stopAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", a3);
}

- (id)newColorAtFraction:(double)a3
{
  TSUColor *v4;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (a3 == 0.0)
  {
    v4 = -[TSDGradient firstColor](self, "firstColor");
    return v4;
  }
  if (a3 == 1.0)
  {
    v4 = -[TSDGradient lastColor](self, "lastColor");
    return v4;
  }
  v7 = -[TSDGradient stopBeforeFraction:](self, "stopBeforeFraction:", a3);
  v8 = -[TSDGradient stopAfterFraction:](self, "stopAfterFraction:", a3);
  if (v7 == v8)
  {
    v4 = (TSUColor *)objc_msgSend(v7, "color");
    return v4;
  }
  v9 = v8;
  objc_msgSend(v7, "fraction");
  v11 = v10;
  objc_msgSend(v9, "fraction");
  v13 = 0.0;
  if (v12 - v11 > 0.001)
  {
    TSUClamp();
    v15 = v14;
    v13 = v14;
    if (+[TSDGradient useInflections](TSDGradient, "useInflections"))
    {
      objc_msgSend(v7, "inflection");
      TSUClamp();
      if (v15 >= v16)
      {
        v13 = 0.5;
        if (v16 != 1.0)
          v13 = (v15 - v16) / (1.0 - v16) * 0.5 + 0.5;
      }
      else
      {
        v13 = v15 / v16 * 0.5;
      }
    }
  }
  return (id)objc_msgSend((id)objc_msgSend(v7, "color"), "newBlendedColorWithFraction:ofColor:", objc_msgSend(v9, "color"), v13);
}

- (void)colorComponents:(double *)a3 atFraction:(double)a4
{
  const CGFloat *Components;
  id v6;

  v6 = -[TSDGradient newColorAtFraction:](self, "newColorAtFraction:", a4);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v6, "CGColor"));
  *a3 = *Components;
  a3[1] = Components[1];
  a3[2] = Components[2];
  a3[3] = Components[3];

}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Subclass responsibility."), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Subclass responsibility."), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Subclass responsibility."));
}

- (CGAffineTransform)centeredRadialTransformInRect:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat MidX;
  CGFloat MidY;
  __int128 v13;
  CGAffineTransform *result;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = CGRectGetWidth(a4);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v10 = CGRectGetHeight(v19);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  CGAffineTransformMakeTranslation(retstr, MidX, MidY);
  CGAffineTransformMakeScale(&t1, v9 * 0.00707106781, v10 * 0.00707106781);
  v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v18, &t1, &v16);
  v15 = *(_OWORD *)&v18.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v18.tx;
  return result;
}

- (BOOL)isOpaque
{
  double v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  BOOL v8;

  -[TSDGradient opacity](self, "opacity");
  if (v3 == 1.0)
  {
    v4 = -[NSMutableArray count](self->mStops, "count");
    if (v4)
    {
      v5 = v4;
      v6 = 1;
      do
      {
        v7 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", v6 - 1), "color"), "isOpaque");
        if (v7)
          v8 = v6 >= v5;
        else
          v8 = 1;
        ++v6;
      }
      while (!v8);
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableGradient *v4;

  v4 = -[TSDGradient initWithGradientStops:type:opacity:](+[TSDMutableGradient allocWithZone:](TSDMutableGradient, "allocWithZone:", a3), "initWithGradientStops:type:opacity:", self->mStops, self->mType, self->mOpacity);
  -[TSDGradient setIsAdvancedGradient:](v4, "setIsAdvancedGradient:", self->mIsAdvancedGradient);
  return v4;
}

- (BOOL)hasAlpha
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)-[NSMutableArray objectEnumerator](self->mStops, "objectEnumerator");
  do
  {
    v3 = (void *)objc_msgSend(v2, "nextObject");
    v4 = v3;
  }
  while (v3 && CGColorGetAlpha((CGColorRef)objc_msgSend((id)objc_msgSend(v3, "color"), "CGColor")) == 1.0);
  return v4 != 0;
}

- (int)fillType
{
  return 1;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__TSDGradient_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __36__TSDGradient_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGradient mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 538, CFSTR("nil object after cast"));
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "gradientType");
  if (v5 != objc_msgSend(v2, "gradientType"))
    return 1;
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count");
  if (v6 != objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "count"))
    return 2;
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"))
    return 4;
  v7 = 0;
  v8 = 4;
  do
  {
    v8 = TSDMixingTypeBestFromMixingTypes(v8, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "objectAtIndex:", v7), "mixingTypeWithObject:", objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "objectAtIndex:", v7)));
    ++v7;
  }
  while (v7 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  return v8;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__TSDGradient_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDGradient *__48__TSDGradient_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "objectAtIndex:", v4), "mixedObjectWithFraction:ofObject:", objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "objectAtIndex:", v4), *(double *)(a1 + 48)));
      ++v4;
    }
    while (v4 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  }
  objc_msgSend(*(id *)(a1 + 40), "opacity");
  v6 = v5;
  objc_msgSend(v2, "opacity");
  return -[TSDGradient initWithGradientStops:type:opacity:]([TSDGradient alloc], "initWithGradientStops:type:opacity:", v3, objc_msgSend(*(id *)(a1 + 40), "gradientType"), TSDMixFloats(v6, v7, *(double *)(a1 + 48)));
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGPoint result;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGradient startPointForPath:andBounds:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 581, CFSTR("Subclasses should override."));
  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGPoint result;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGradient endPointForPath:andBounds:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 587, CFSTR("Subclasses should override."));
  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)p_setAlpha:(CGContext *)a3
{
  CGFloat v4;

  -[TSDGradient opacity](self, "opacity");
  CGContextSetAlpha(a3, v4);
}

- (CGContext)p_beginBitmapWrapperContextInContext:(CGContext *)a3 returningIntegralBounds:(CGRect *)a4
{
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  CGContext *v9;
  CGContext *v10;
  CGRect ClipBoundingBox;
  CGRect v13;

  if (!a3)
    return 0;
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v13 = CGRectIntegral(ClipBoundingBox);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v9 = TSDBitmapContextCreate(3, v13.size.width);
  v10 = v9;
  if (v9)
    CGContextTranslateCTM(v9, -x, -y);
  if (a4)
  {
    a4->origin.x = x;
    a4->origin.y = y;
    a4->size.width = width;
    a4->size.height = height;
  }
  return v10;
}

- (void)p_endBitmapWrapperContext:(CGContext *)a3 inContext:(CGContext *)a4 withIntegralBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGImageRef Image;
  CGImage *v12;
  CGRect v13;

  if (a3)
  {
    if (a4)
    {
      height = a5.size.height;
      width = a5.size.width;
      y = a5.origin.y;
      x = a5.origin.x;
      Image = CGBitmapContextCreateImage(a3);
      if (Image)
      {
        v12 = Image;
        CGContextSaveGState(a4);
        v13.origin.x = x;
        v13.origin.y = y;
        v13.size.width = width;
        v13.size.height = height;
        CGContextDrawImage(a4, v13, v12);
        CGContextRestoreGState(a4);
        CGImageRelease(v12);
      }
    }
    CGContextRelease(a3);
  }
}

+ (id)presetKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", String);
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  TSDAngleGradient *v18;
  id v19;

  if ((objc_msgSend(a3, "isEqual:", String) & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDGradient bootstrapPresetsOfKind:inTheme:alternate:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 677, CFSTR("Attempt to bootstrap gradient presets for kind %@ in theme <%p>."), a3, a4);
  }
  v10 = (void *)objc_msgSend(a4, "colors");
  if (!v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDGradient bootstrapPresetsOfKind:inTheme:alternate:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 679, CFSTR("invalid nil value for '%s'"), "colors");
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6);
  if (a5 >= 7)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDGradient bootstrapPresetsOfKind:inTheme:alternate:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 697, CFSTR("invalid theme alternate value"));
    v14 = 0;
  }
  else
  {
    v14 = (uint64_t)*(&off_24D82B8D8 + a5);
  }
  for (i = 0; i != 192; i += 32)
  {
    v18 = -[TSDAngleGradient initWithGradientStops:type:opacity:angle:]([TSDAngleGradient alloc], "initWithGradientStops:type:opacity:angle:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", objc_msgSend(v10, "objectAtIndex:", *(_QWORD *)(v14 + i)), 0.0), +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", objc_msgSend(v10, "objectAtIndex:", *(_QWORD *)(v14 + i + 8)), 1.0), 0), *(_QWORD *)(v14 + i + 24), 1.0, *(double *)(v14 + i + 16));
    objc_msgSend(v13, "addObject:", v18);

  }
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v13);
  objc_msgSend(a4, "setPresets:ofKind:", v19, a3);

}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapGradient_;
}

- (void)p_setGradientStops:(id)a3
{
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  CGColorSpace *ColorSpace;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (self->mStops != a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:");
    if (objc_msgSend(a3, "count"))
    {
      v6 = 0;
      v7 = 1;
      do
      {
        v8 = (void *)objc_msgSend(a3, "objectAtIndex:", v6);
        v9 = (void *)objc_msgSend(v8, "color");
        ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v9, "CGColor"));
        if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
        {
          v11 = (void *)MEMORY[0x24BEB3C40];
          objc_msgSend(v9, "redComponent");
          v13 = v12;
          objc_msgSend(v9, "greenComponent");
          v15 = v14;
          objc_msgSend(v9, "blueComponent");
          v17 = v16;
          objc_msgSend(v9, "alphaComponent");
          objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v6, objc_msgSend(v8, "gradientStopWithColor:", objc_msgSend(v11, "colorWithRed:green:blue:alpha:", v13, v15, v17, v18)));
        }
        v6 = v7;
      }
      while (objc_msgSend(a3, "count") > (unint64_t)v7++);
    }
    -[NSMutableArray removeAllObjects](self->mStops, "removeAllObjects");
    -[NSMutableArray addObjectsFromArray:](self->mStops, "addObjectsFromArray:", v5);
    -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
  }
}

- (void)p_insertGradientStop:(id)a3
{
  NSMutableArray *mStops;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (-[NSMutableArray count](self->mStops, "count"))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    v10 = -[NSMutableArray count](self->mStops, "count");
    mStops = self->mStops;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__TSDGradient_p_insertGradientStop___block_invoke;
    v6[3] = &unk_24D82B8B8;
    v6[4] = a3;
    v6[5] = &v7;
    -[NSMutableArray enumerateObjectsUsingBlock:](mStops, "enumerateObjectsUsingBlock:", v6);
    -[NSMutableArray insertObject:atIndex:](self->mStops, "insertObject:atIndex:", a3, v8[3]);
    -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    -[NSMutableArray addObject:](self->mStops, "addObject:", a3);
  }
}

uint64_t __36__TSDGradient_p_insertGradientStop___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  uint64_t result;
  double v10;

  objc_msgSend(a2, "fraction");
  v8 = v7;
  result = objc_msgSend(*(id *)(a1 + 32), "fraction");
  if (v8 > v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)p_removeStop:(id)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mStops, "count") < 3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Attempted to remove too many gradient stops. Must have at least 2."));
  else
    -[NSMutableArray removeObject:](self->mStops, "removeObject:", a3);
  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (id)p_removeStopAtIndex:(unint64_t)a3
{
  id v5;

  if ((unint64_t)-[NSMutableArray count](self->mStops, "count") < 3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Attempted to remove too many gradient stops. Must have at least 2."), 0));
  v5 = (id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->mStops, "removeObjectAtIndex:", a3);
  return v5;
}

- (id)p_insertStopAtFraction:(double)a3
{
  return -[TSDGradient p_insertStopAtFraction:withColor:](self, "p_insertStopAtFraction:withColor:", -[TSDGradient newColorAtFraction:](self, "newColorAtFraction:"), a3);
}

- (id)p_insertStopAtFraction:(double)a3 withColor:(id)a4
{
  TSDGradientStop *v5;

  v5 = +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", a4, a3);
  -[TSDGradient p_insertGradientStop:](self, "p_insertGradientStop:", v5);
  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
  return v5;
}

- (void)p_reverseStopOrder
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t j;
  TSDGradientStop *v18;

  v3 = -[NSMutableArray count](self->mStops, "count");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
      objc_msgSend(v4, "addObject:", (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", i), "mutableCopy"));
  }
  v6 = 1;
  v7 = v3 - 1;
  do
  {
    v8 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1);
    objc_msgSend(v8, "fraction");
    objc_msgSend(v8, "setFraction:", 1.0 - v9);
    if (v6 - 1 != v7)
    {
      v10 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      objc_msgSend(v10, "fraction");
      objc_msgSend(v10, "setFraction:", 1.0 - v11);
      objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", v6 - 1, v7);
    }
  }
  while (v6++ <= --v7);
  if (v3 != 1)
  {
    v13 = 0;
    v14 = v3 - 2;
    do
    {
      v15 = (void *)objc_msgSend(v4, "objectAtIndex:", v13);
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", v14), "inflection");
      objc_msgSend(v15, "setInflection:", 1.0 - v16);
      ++v13;
      --v14;
    }
    while (v14 != -1);
  }
  objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v3 - 1), "setInflection:", 0.5);
  if (v3)
  {
    for (j = 0; j != v3; ++j)
    {
      v18 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", objc_msgSend(v4, "objectAtIndexedSubscript:", j));
      -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v18, j);

    }
  }
  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_evenlyDistributeStops
{
  uint64_t v3;
  NSMutableArray *mStops;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableArray count](self->mStops, "count");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mStops = self->mStops;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 1.0 / (double)(unint64_t)(v3 - 1);
    v8 = *(_QWORD *)v12;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(mStops);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setFraction:", v9);
        v9 = v7 + v9;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_setGradientType:(unint64_t)a3
{
  self->mType = a3;
  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4
{
  id v7;
  TSDGradientStop *v8;

  v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  objc_msgSend(v7, "setFraction:", a4);
  v8 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);

  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4
{
  id v7;
  TSDGradientStop *v8;
  TSDGradientStop *v9;

  v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  v8 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", a4), "mutableCopy"));
  v9 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v9, a4);

  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4
{
  id v7;
  TSDGradientStop *v8;

  v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  objc_msgSend(v7, "setColor:", a4);
  v8 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);

  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4
{
  id v7;
  TSDGradientStop *v8;

  v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  objc_msgSend(v7, "setInflection:", a4);
  v8 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);

  -[TSDGradient releaseShadingRef](self, "releaseShadingRef");
}

- (unint64_t)gradientType
{
  return self->mType;
}

- (double)opacity
{
  return self->mOpacity;
}

- (void)setOpacity:(double)a3
{
  self->mOpacity = a3;
}

- (void)setIsAdvancedGradient:(BOOL)a3
{
  self->mIsAdvancedGradient = a3;
}

@end
