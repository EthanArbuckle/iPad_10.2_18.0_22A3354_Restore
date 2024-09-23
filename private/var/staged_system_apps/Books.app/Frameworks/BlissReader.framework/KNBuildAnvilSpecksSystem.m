@implementation KNBuildAnvilSpecksSystem

+ (BOOL)willOverrideStartingPoint
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

  v4 = (double)(unint64_t)-[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = v4 / (double)(unint64_t)-[KNBuildAnvilSpecksSystem particleCount](self, "particleCount");
  -[KNBuildAnvilSpecksSystem objectSize](self, "objectSize");
  v6 = 8.0;
  v8 = v5 * v7 + 8.0;
  result.y = v6;
  result.x = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvilSpecksSystem randomGenerator](self, "randomGenerator"));
  v7 = -[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", x, y);
  v8 = (double)(unint64_t)(2 * (_QWORD)v7)
     / (double)(unint64_t)-[KNBuildAnvilSpecksSystem particleCount](self, "particleCount")
     + -1.0;
  objc_msgSend(v6, "doubleBetween::", 0.2, 1.0);
  v10 = v9;
  if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v7 + 0x5555555555555555 >= 0x5555555555555555)
  {
    objc_msgSend(v6, "randomDouble");
    v8 = v8 * 10.0;
    v10 = v10 * dbl_314E80[v12 < 0.5] * 10.0;
    v11 = 0.2;
  }
  else
  {
    v11 = 1.0;
  }
  v13 = v10 / 52.5 * 4.0;
  v14 = v8 / 52.5 * 5.25;
  v15 = v13;

  v16 = v14;
  v17 = v15;
  v18 = v11;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (double)speedMax
{
  double v2;

  -[KNBuildAnvilSystem p_anvilGlobalScale](self, "p_anvilGlobalScale");
  return v2 * 10.0 * 5.25;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = -[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvilSpecksSystem randomGenerator](self, "randomGenerator"));
  objc_msgSend(v5, "doubleBetween::", 3.0, 5.0);
  v7 = v6;

  if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v4 + 0x5555555555555555 >= 0x5555555555555555)
    v7 = v7 * 3.0;
  -[KNBuildAnvilSystem p_anvilGlobalScale](self, "p_anvilGlobalScale");
  return v7 * (v8 * 0.0625);
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  float v9;
  float v10;
  float v11;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = -[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  -[KNBuildAnvilSpecksSystem duration](self, "duration");
  if (v5 <= 1.0)
    v6 = v5;
  else
    v6 = 1.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvilSpecksSystem randomGenerator](self, "randomGenerator"));
  objc_msgSend(v7, "doubleBetween::", 0.2, 0.5);
  v9 = v6 * v8;

  if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v4 + 0x5555555555555555 >= 0x5555555555555555)
    v10 = v9 * 10.0;
  else
    v10 = v9;
  v11 = 0.0;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

+ (BOOL)useVisibilities
{
  return 0;
}

@end
