@implementation KNBuildSparkleSystem

- (double)p_globalScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[KNBuildSparkleSystem objectSize](self, "objectSize");
  v4 = v3;
  -[KNBuildSparkleSystem objectSize](self, "objectSize");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  -[KNBuildSparkleSystem slideSize](self, "slideSize");
  v8 = v7;
  -[KNBuildSparkleSystem slideSize](self, "slideSize");
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  return v6 / sqrt(sqrt(v6 / v10)) * 0.25;
}

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[KNBuildSparkleSystem duration](self, "duration");
  v7 = v6;
  v8 = -[KNBuildSparkleSystem direction](self, "direction") == (char *)&dword_C + 1
    || -[KNBuildSparkleSystem direction](self, "direction") == (char *)&dword_C + 2;
  v9 = -[KNBuildSparkleSystem direction](self, "direction") == &dword_C
    || -[KNBuildSparkleSystem direction](self, "direction") == (char *)&dword_C + 1;
  v10 = 0.1 / v7;
  v11 = (double)(unint64_t)-[KNBuildSparkleSystem indexFromPoint:](self, "indexFromPoint:", x, y);
  v12 = v11 / (float)(unint64_t)-[KNBuildSparkleSystem particleCount](self, "particleCount");
  if (v9)
    v13 = 1.0 - v12;
  else
    v13 = v12;
  v14 = objc_msgSend(-[KNBuildSparkleSystem randomGenerator](self, "randomGenerator"), "doubleBetween::", -1.0, 1.0);
  v16 = v13 + v10 * v15;
  v17 = TSURandom(v14);
  v18 = ((v17 * 2.0 + -1.0) * fabs(v17 * 2.0 + -1.0) + 1.0) * 0.5;
  if (v8)
    v19 = v18;
  else
    v19 = v16;
  if (v8)
    v20 = v16;
  else
    v20 = v18;
  -[KNBuildSparkleSystem objectSize](self, "objectSize");
  v22 = v21;
  -[KNBuildSparkleSystem particleSize](self, "particleSize");
  v24 = v23 * -0.5 + v19 * v22;
  -[KNBuildSparkleSystem objectSize](self, "objectSize");
  v26 = v25;
  -[KNBuildSparkleSystem particleSize](self, "particleSize");
  v28 = v27 * -0.5 + v20 * v26;
  v29 = v24;
  result.y = v28;
  result.x = v29;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  id v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = -[KNBuildSparkleSystem randomGenerator](self, "randomGenerator", a3.x, a3.y);
  objc_msgSend(v3, "metalPoint3DRandomDirection");
  v5 = v4;
  v7 = v6;
  v9 = v8 * 0.01;
  objc_msgSend(v3, "randomDouble");
  v11 = v10 * v7;
  v12 = v10 * v9;
  v13 = v10 * v5;
  v14 = v11;
  v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (double)speedMax
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[KNBuildSparkleSystem objectSize](self, "objectSize");
  v4 = v3;
  -[KNBuildSparkleSystem objectSize](self, "objectSize");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  -[KNBuildSparkleSystem slideSize](self, "slideSize");
  v8 = v7;
  -[KNBuildSparkleSystem slideSize](self, "slideSize");
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  return v6 / pow(v6 / v10, 0.667) * 0.25 * 1.5;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;

  -[KNBuildSparkleSystem p_globalScale](self, "p_globalScale", a3.x, a3.y);
  v5 = v4;
  -[KNBuildSparkleSystem particleSize](self, "particleSize");
  return v5 / v6;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float v9;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = (double)(unint64_t)-[KNBuildSparkleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = v4 / (double)(unint64_t)-[KNBuildSparkleSystem particleCount](self, "particleCount");
  -[KNBuildSparkleSystem duration](self, "duration");
  v7 = 0.667 / v6;
  if (v6 <= 0.75)
    v7 = 0.889333333;
  v8 = v5 * (1.0 - v7);
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (BOOL)useVisibilities
{
  return 0;
}

@end
