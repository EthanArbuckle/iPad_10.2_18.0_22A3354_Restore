@implementation KNBuildDiffuseSystem

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y;
  char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  __double2 v12;
  double v13;
  float v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  y = a3.y;
  v5 = (char *)-[KNBuildDiffuseSystem direction](self, "direction", a3.x);
  v7 = TSURandomBetween(v5, v6, -1.0, 1.0);
  v10 = TSURandomBetween(v8, v9, 0.0, 6.28318531);
  v11 = sqrt(1.0 - v7 * v7);
  v12 = __sincos_stret(v10);
  v13 = v11 * v12.__sinval;
  *(float *)&v11 = v11 * v12.__cosval;
  v14 = v13;
  v15 = (y + y) / (double)(unint64_t)-[KNBuildDiffuseSystem particlesHigh](self, "particlesHigh") + -1.0;
  v16 = (1.1 - v15 * v15) * 8.0;
  v17 = v16 * *(float *)&v11;
  v18 = v16 * v14;
  *(float *)&v7 = v7;
  v19 = v16 * *(float *)&v7;
  v20 = 2.0 - fabs(v15);
  if (v5 == (_BYTE *)&dword_8 + 3)
    v20 = -v20;
  v21 = v20;
  v22 = v15 + v15;
  v23 = (float)(v21 * 5.0) + v17;
  v24 = (float)(v22 * 5.0) + v18;
  v25 = v19 + 0.0;
  if (v23 == 0.0 && v24 == 0.0 && v25 == 0.0)
  {
    v26 = TSDMetalPoint3DZero[0];
    v27 = TSDMetalPoint3DZero[1];
    v28 = TSDMetalPoint3DZero[2];
  }
  else
  {
    v29 = 1.0 / sqrtf((float)((float)(v24 * v24) + (float)(v23 * v23)) + (float)(v25 * v25));
    v30 = v29 * v23;
    v31 = v29 * v24;
    v32 = v29 * v25;
    v26 = v30;
    v27 = v31;
    v28 = v32;
  }
  result.var2 = v28;
  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- (double)speedMax
{
  double v3;
  double v4;
  double v5;

  -[KNBuildDiffuseSystem objectSize](self, "objectSize");
  v4 = v3 * 1.5;
  -[KNBuildDiffuseSystem duration](self, "duration");
  return v4 / sqrt(v5);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  float v7;
  float v8;
  float v9;
  float v10;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = TSURandomBetween(self, a2, -1.0, 1.0);
  v6 = TSURandomBetween(v4, v5, -1.0, 1.0);
  v7 = v3;
  v8 = v6;
  v9 = 0.0;
  v10 = v7;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v10;
  return result;
}

- (double)rotationMax
{
  return 25.1327412;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double x;
  char *v5;
  double v6;
  double v7;
  float v8;
  float v9;
  $94F468A8D4C62B317260615823C2B210 result;

  x = a3.x;
  v5 = (char *)-[KNBuildDiffuseSystem direction](self, "direction", a3.x, a3.y);
  -[KNBuildDiffuseSystem duration](self, "duration");
  v7 = TSUClamp(0.8 / v6, 0.1, 0.9);
  if (v5 == (_BYTE *)&dword_8 + 3)
    x = (double)(unint64_t)-[KNBuildDiffuseSystem particlesWide](self, "particlesWide") - x;
  v8 = (1.0 - v7) * (x / (double)(unint64_t)-[KNBuildDiffuseSystem particlesWide](self, "particlesWide"));
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

@end
