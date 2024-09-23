@implementation KNAnimationRandomGenerator

- (KNAnimationRandomGenerator)initWithSeed:(id)a3
{
  id v4;
  KNAnimationRandomGenerator *v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KNAnimationRandomGenerator;
  v5 = -[KNAnimationRandomGenerator init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if ((objc_msgSend(v6, "BOOLForKey:", CFSTR("RandomNumberSeedAlwaysZero")) & 1) != 0)
    {
      v7 = 0;
    }
    else if (objc_msgSend(v6, "BOOLForKey:", CFSTR("RandomNumberSeedAlwaysRandom")) || !v4)
    {
      v7 = (id)arc4random_uniform(0x7FFFFFFFu);
    }
    else
    {
      v7 = objc_msgSend(v4, "integerValue");
    }
    -[KNAnimationRandomGenerator setSeed:](v5, "setSeed:", v7);

  }
  return v5;
}

+ (id)randomGeneratorFromPluginContext:(id)a3
{
  return -[KNAnimationRandomGenerator initWithSeed:]([KNAnimationRandomGenerator alloc], "initWithSeed:", 0);
}

- (void)dealloc
{
  objc_super v2;

  if (self->_randGenerator)
    operator delete();
  v2.receiver = self;
  v2.super_class = (Class)KNAnimationRandomGenerator;
  -[KNAnimationRandomGenerator dealloc](&v2, "dealloc");
}

+ (unsigned)generateNewSeed
{
  return arc4random_uniform(0x7FFFFFFFu);
}

- (void)setSeed:(unint64_t)a3
{
  operator new();
}

- (double)randomDouble
{
  RandGenerator *randGenerator;
  void *v4;
  void *v5;
  void *v6;
  double result;

  randGenerator = self->_randGenerator;
  if (!randGenerator)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationRandomGenerator randomDouble]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNAnimationRandomGenerator.mm"));
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 149, CFSTR("invalid nil value for '%s'"), "_randGenerator");

    randGenerator = self->_randGenerator;
  }
  RandGenerator::randomDouble(randGenerator);
  return result;
}

- (int64_t)intBetween:(int64_t)a3 :(int64_t)a4
{
  RandGenerator *randGenerator;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  double v13;

  randGenerator = self->_randGenerator;
  if (!randGenerator)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationRandomGenerator intBetween::]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNAnimationRandomGenerator.mm"));
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 155, CFSTR("invalid nil value for '%s'"), "_randGenerator");

    randGenerator = self->_randGenerator;
  }
  if (a3 >= a4)
    v11 = a4;
  else
    v11 = a3;
  if (a3 <= a4)
    v12 = a4;
  else
    v12 = a3;
  RandGenerator::randWithMinMax(randGenerator, (double)v11, (double)v12);
  return vcvtmd_s64_f64(v13);
}

- (double)doubleBetween:(double)a3 :(double)a4
{
  RandGenerator *randGenerator;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;

  randGenerator = self->_randGenerator;
  if (!randGenerator)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationRandomGenerator doubleBetween::]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNAnimationRandomGenerator.mm"));
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 174, CFSTR("invalid nil value for '%s'"), "_randGenerator");

    randGenerator = self->_randGenerator;
  }
  if (a3 >= a4)
    v11 = a4;
  else
    v11 = a3;
  if (a3 >= a4)
    a4 = a3;
  RandGenerator::randomDouble(randGenerator);
  v13 = a4 * v12;
  v14 = v11 * v12;
  v15 = v11 + v13 - v14;
  result = v11 + v13 - v14;
  if (v11 < 0.0 != a4 >= 0.0)
    return v15;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DRandomDirection
{
  double v3;
  double v4;
  double v5;
  double v6;
  __double2 v7;
  float v8;
  float v9;
  float v10;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v4 = v3;
  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", 0.0, 6.28318531);
  v5 = sqrt(1.0 - v4 * v4);
  v7 = __sincos_stret(v6);
  v8 = v5 * v7.__cosval;
  v9 = v5 * v7.__sinval;
  v10 = v4;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)metalPoint2DRandomPoint
{
  double v3;
  double v4;
  float v5;
  double v6;
  float v7;
  float v8;
  $94F468A8D4C62B317260615823C2B210 result;

  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v4 = v3;
  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v5 = v4;
  v7 = v6;
  v8 = v5;
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DRandomPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v4 = v3;
  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v6 = v5;
  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v7 = v4;
  v8 = v6;
  v10 = v9;
  v11 = v7;
  result.var2 = v10;
  result.var1 = v8;
  result.var0 = v11;
  return result;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DRandomPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v4 = v3;
  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v6 = v5;
  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v8 = v7;
  -[KNAnimationRandomGenerator doubleBetween::](self, "doubleBetween::", -1.0, 1.0);
  v9 = v4;
  v10 = v6;
  v11 = v8;
  v13 = v12;
  v14 = v9;
  result.var3 = v13;
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v14;
  return result;
}

- (unint64_t)seed
{
  return self->_seed;
}

@end
