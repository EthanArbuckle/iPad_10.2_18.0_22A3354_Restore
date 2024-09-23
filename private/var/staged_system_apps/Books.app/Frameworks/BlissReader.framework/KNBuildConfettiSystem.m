@implementation KNBuildConfettiSystem

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = TSURandomBetween(self, a2, -1.0, 1.0);
  v6 = TSURandomBetween(v4, v5, -1.0, 1.0);
  v9 = TSURandomBetween(v7, v8, -1.0, 1.0);
  v10 = v3;
  v11 = v6;
  v12 = v9;
  v13 = v10;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v13;
  return result;
}

- (double)rotationMax
{
  return 25.1327412;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  __double2 v25;
  float v26;
  float v27;
  float v28;
  double v29;
  double v30;
  float v31;
  float v32;
  float v33;
  id v34;
  id v35;
  unint64_t v36;
  double v37;
  float v38;
  float32x2_t v39;
  float32_t v40;
  float32x2_t v41;
  float v42;
  float v43;
  float v44;
  double v45;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  y = a3.y;
  x = a3.x;
  -[KNBuildConfettiSystem objectSize](self, "objectSize");
  v7 = v6;
  -[KNBuildConfettiSystem slideSize](self, "slideSize");
  v9 = v7 / v8;
  -[KNBuildConfettiSystem objectSize](self, "objectSize");
  v11 = v9 * v10;
  -[KNBuildConfettiSystem slideSize](self, "slideSize");
  v13 = v11 / v12;
  if (v11 / v12 > 1.0)
    v13 = 1.0;
  v45 = sqrt(v13) * -0.75 + 1.0;
  v14 = -[KNBuildConfettiSystem particlesWide](self, "particlesWide");
  v15 = (_QWORD)-[KNBuildConfettiSystem particlesWide](self, "particlesWide") * (_QWORD)v14;
  v16 = -[KNBuildConfettiSystem particlesHigh](self, "particlesHigh");
  v17 = -[KNBuildConfettiSystem particlesHigh](self, "particlesHigh");
  v18 = (double)(unint64_t)(v15 + (_QWORD)v17 * (_QWORD)v16) * 0.25;
  v20 = TSURandomBetween(v17, v19, -1.0, 1.0);
  v23 = TSURandomBetween(v21, v22, 0.0, 6.28318531);
  v24 = sqrt(1.0 - v20 * v20);
  v25 = __sincos_stret(v23);
  v26 = v24 * v25.__cosval;
  v27 = v24 * v25.__sinval;
  v44 = v27;
  v28 = v20;
  v43 = -fabsf(v28);
  *(float *)&v20 = v45 * 20.0 * v26;
  v29 = x - (double)(unint64_t)-[KNBuildConfettiSystem particlesWide](self, "particlesWide") * 0.5;
  v30 = y - (double)(unint64_t)-[KNBuildConfettiSystem particlesHigh](self, "particlesHigh") * 0.5;
  v31 = v29;
  v32 = v45 * v31;
  v33 = *(float *)&v20 + v32;
  v34 = -[KNBuildConfettiSystem particlesWide](self, "particlesWide");
  v35 = -[KNBuildConfettiSystem particlesHigh](self, "particlesHigh");
  if (v34 <= v35)
    v36 = (unint64_t)v35;
  else
    v36 = (unint64_t)v34;
  v37 = 1.0 / ((double)v36 * 0.5 + 20.0);
  v38 = v37 * v33;
  v39.f32[0] = v30;
  v40 = sqrt(v18 - (float)((float)(v39.f32[0] * v39.f32[0]) + (float)(v31 * v31)));
  v39.f32[1] = v40;
  v41 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vadd_f32(vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v43), LODWORD(v44))), v45 * 20.0)), vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v39), v45)))), v37));
  v42 = v41.f32[1];
  result.var1 = v41.f32[0];
  result.var2 = v42;
  result.var0 = v38;
  return result;
}

- (double)speedMax
{
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  unint64_t v8;

  -[KNBuildConfettiSystem objectSize](self, "objectSize");
  v4 = v3;
  -[KNBuildConfettiSystem objectSize](self, "objectSize");
  if (v4 >= v5)
    v4 = v5;
  v6 = -[KNBuildConfettiSystem particlesWide](self, "particlesWide");
  v7 = -[KNBuildConfettiSystem particlesHigh](self, "particlesHigh");
  if (v6 <= v7)
    v8 = (unint64_t)v7;
  else
    v8 = (unint64_t)v6;
  return v4 * 0.025 * ((double)v8 * 0.5 + 20.0);
}

@end
