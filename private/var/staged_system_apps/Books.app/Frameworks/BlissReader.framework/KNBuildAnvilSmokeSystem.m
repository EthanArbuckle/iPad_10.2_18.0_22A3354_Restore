@implementation KNBuildAnvilSmokeSystem

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v4 = (double)(unint64_t)-[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = v4 / (double)(unint64_t)-[KNBuildAnvilSmokeSystem particleCount](self, "particleCount");
  -[KNBuildAnvilSmokeSystem objectSize](self, "objectSize");
  v6 = -8.0;
  v8 = v5 * v7 + -8.0;
  result.y = v6;
  result.x = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvilSmokeSystem randomGenerator](self, "randomGenerator"));
  v7 = (double)(unint64_t)(2 * (_QWORD)-[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", x, y));
  v8 = v7 / (double)(unint64_t)-[KNBuildAnvilSmokeSystem particleCount](self, "particleCount") + -1.0;
  v9 = sqrt(fabs(v8));
  if (v8 >= 0.0)
    v10 = v9;
  else
    v10 = -v9;
  v11 = fabs(v9) + 0.25;
  objc_msgSend(v6, "doubleBetween::", -1.0, 0.1);
  v13 = v12;
  objc_msgSend(v6, "doubleBetween::", 0.25, 1.0);
  *(float *)&v14 = v14 * v10 * 5.6;
  v15 = v13 * v11 * -5.0;
  *(float *)&v13 = *(float *)&v14 / 6.25;
  v16 = v15 / 6.25;

  v17 = 0.0;
  v18 = *(float *)&v13;
  v19 = v16;
  result.var2 = v17;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (double)speedMax
{
  double v2;

  -[KNBuildAnvilSystem p_anvilGlobalScale](self, "p_anvilGlobalScale");
  return v2 * 6.25;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = (double)(unint64_t)(2
                                * (_QWORD)-[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y));
  v5 = v4 / (double)(unint64_t)-[KNBuildAnvilSmokeSystem particleCount](self, "particleCount") + -1.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvilSmokeSystem randomGenerator](self, "randomGenerator"));
  objc_msgSend(v6, "doubleBetween::", 0.5, 1.0);
  v8 = v5 * v7;

  v9 = v8;
  v10 = 0.0;
  v11 = 0.0;
  result.var2 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (double)rotationMax
{
  double v2;

  -[KNBuildAnvilSmokeSystem duration](self, "duration");
  return v2 * 3.14159265;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  id v4;
  double v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;

  v4 = -[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (double)(unint64_t)v4 + (double)(unint64_t)v4;
  v6 = -[KNBuildAnvilSmokeSystem particleCount](self, "particleCount");
  v7 = fabs(v5 / (double)(unint64_t)v6 + -1.0) + 1.25;
  v8 = TSURandom(v6);
  v10 = TSDMixFloats(v9, 1.0, 2.5, v8 * (v8 * v8)) * v7;
  -[KNBuildAnvilSystem p_anvilGlobalScale](self, "p_anvilGlobalScale");
  return v11 * 0.0625 * v10;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  float v8;
  float v9;
  $94F468A8D4C62B317260615823C2B210 result;

  -[KNBuildAnvilSmokeSystem duration](self, "duration", a3.x, a3.y);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvilSmokeSystem randomGenerator](self, "randomGenerator"));
  objc_msgSend(v6, "doubleBetween::", 0.15, 1.0);
  *(float *)&v5 = v5 * v7;

  v8 = 0.0;
  v9 = *(float *)&v5;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (BOOL)useVisibilities
{
  return 0;
}

@end
