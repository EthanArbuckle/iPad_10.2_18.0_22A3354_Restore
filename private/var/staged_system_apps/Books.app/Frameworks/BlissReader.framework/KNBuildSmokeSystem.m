@implementation KNBuildSmokeSystem

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = -[KNBuildSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  -[KNBuildSmokeSystem objectSize](self, "objectSize");
  v6 = v5
     * (double)(unint64_t)v4
     / (double)(unint64_t)-[KNBuildSmokeSystem particleCount](self, "particleCount");
  v7 = -[KNBuildSmokeSystem particleSize](self, "particleSize");
  v9 = v6 + v8 * -0.5;
  v10 = TSURandom(v7);
  -[KNBuildSmokeSystem objectSize](self, "objectSize");
  v12 = v11;
  -[KNBuildSmokeSystem particleSize](self, "particleSize");
  v14 = v13 * -0.5 + v10 * v12;
  v15 = v9;
  result.y = v14;
  result.x = v15;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  void *v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildSmokeSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  objc_msgSend(v3, "doubleBetween::", -1.0, -0.3);
  v5 = v4;

  v6 = 0.0;
  v7 = 0.0;
  v8 = v5;
  result.var2 = v7;
  result.var1 = v8;
  result.var0 = v6;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  void *v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildSmokeSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  objc_msgSend(v3, "doubleBetween::", -1.0, 1.0);
  v5 = v4;

  v6 = 0.0;
  v7 = 0.0;
  v8 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildSmokeSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  -[KNBuildSmokeSystem scaleMax](self, "scaleMax");
  objc_msgSend(v4, "doubleBetween::", 1.0, v5);
  v7 = v6;

  return v7;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  int *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = -[KNBuildSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  -[KNBuildSmokeSystem objectSize](self, "objectSize");
  v6 = v5;
  v7 = -[KNBuildSmokeSystem particleCount](self, "particleCount");
  v8 = (int *)-[KNBuildSmokeSystem direction](self, "direction");
  if (v8 == (int32_t *)((char *)&stru_20.maxprot + 3))
    goto LABEL_7;
  v10 = v6 * (double)(unint64_t)v4 / (double)(unint64_t)v7;
  if (v8 == &dword_C)
  {
    -[KNBuildSmokeSystem objectSize](self, "objectSize");
    v12 = v10 / v13;
    goto LABEL_8;
  }
  if (v8 != (int *)((char *)&dword_8 + 3))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildSmokeSystem lifeSpanAtIndexPoint:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"));
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 941, CFSTR("Invalid direction!"));

LABEL_7:
    v12 = TSURandomBetween(v8, v9, 0.0, 1.0);
    goto LABEL_8;
  }
  -[KNBuildSmokeSystem objectSize](self, "objectSize");
  v12 = 1.0 - v10 / v11;
LABEL_8:
  -[KNBuildSmokeSystem lifeSpanDelay](self, "lifeSpanDelay");
  v18 = v12 * v17;
  -[KNBuildSmokeSystem lifeSpanDelay](self, "lifeSpanDelay");
  v20 = TSUClamp(v18, 0.0, 1.0 - v19);
  -[KNBuildSmokeSystem lifeSpanDelay](self, "lifeSpanDelay");
  v22 = 1.0 - v21;
  v23 = v20;
  v24 = v22;
  result.var1 = v24;
  result.var0 = v23;
  return result;
}

- (double)speedMax
{
  return self->_speedMax;
}

- (void)setSpeedMax:(double)a3
{
  self->_speedMax = a3;
}

- (double)rotationMax
{
  return self->_rotationMax;
}

- (void)setRotationMax:(double)a3
{
  self->_rotationMax = a3;
}

- (double)scaleMax
{
  return self->_scaleMax;
}

- (void)setScaleMax:(double)a3
{
  self->_scaleMax = a3;
}

- (double)lifeSpanDelay
{
  return self->_lifeSpanDelay;
}

- (void)setLifeSpanDelay:(double)a3
{
  self->_lifeSpanDelay = a3;
}

@end
