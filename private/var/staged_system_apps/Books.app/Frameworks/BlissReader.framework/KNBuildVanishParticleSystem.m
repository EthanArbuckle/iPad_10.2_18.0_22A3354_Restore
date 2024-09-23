@implementation KNBuildVanishParticleSystem

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
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  __double2 v27;
  float v28;
  float v29;
  float v30;
  double v31;
  double v32;
  float v33;
  float v34;
  float v35;
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  double v40;
  float v41;
  float32x2_t v42;
  float32_t v43;
  float32x2_t v44;
  float v45;
  float v46;
  float v47;
  double v48;
  double v49;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  y = a3.y;
  x = a3.x;
  -[KNBuildVanishParticleSystem randomParticleSpeedMax](self, "randomParticleSpeedMax");
  v7 = v6;
  -[KNBuildVanishParticleSystem objectSize](self, "objectSize");
  v9 = v8;
  -[KNBuildVanishParticleSystem slideSize](self, "slideSize");
  v11 = v9 / v10;
  -[KNBuildVanishParticleSystem objectSize](self, "objectSize");
  v13 = v11 * v12;
  -[KNBuildVanishParticleSystem slideSize](self, "slideSize");
  v15 = v13 / v14;
  if (v13 / v14 > 1.0)
    v15 = 1.0;
  v49 = sqrt(v15) * -0.75 + 1.0;
  v48 = v7 * v49;
  v16 = -[KNBuildVanishParticleSystem particlesWide](self, "particlesWide");
  v17 = (_QWORD)-[KNBuildVanishParticleSystem particlesWide](self, "particlesWide") * (_QWORD)v16;
  v18 = -[KNBuildVanishParticleSystem particlesHigh](self, "particlesHigh");
  v19 = -[KNBuildVanishParticleSystem particlesHigh](self, "particlesHigh");
  v20 = (double)(unint64_t)(v17 + (_QWORD)v19 * (_QWORD)v18) * 0.25;
  v22 = TSURandomBetween(v19, v21, -1.0, 1.0);
  v25 = TSURandomBetween(v23, v24, 0.0, 6.28318531);
  v26 = sqrt(1.0 - v22 * v22);
  v27 = __sincos_stret(v25);
  v28 = v26 * v27.__cosval;
  v29 = v26 * v27.__sinval;
  v47 = v29;
  v30 = v22;
  v46 = -fabsf(v30);
  *(float *)&v22 = v48 * v28;
  v31 = x - (double)(unint64_t)-[KNBuildVanishParticleSystem particlesWide](self, "particlesWide") * 0.5;
  v32 = y - (double)(unint64_t)-[KNBuildVanishParticleSystem particlesHigh](self, "particlesHigh") * 0.5;
  v33 = v31;
  v34 = v49 * v33;
  v35 = *(float *)&v22 + v34;
  v36 = -[KNBuildVanishParticleSystem particlesWide](self, "particlesWide");
  v37 = -[KNBuildVanishParticleSystem particlesHigh](self, "particlesHigh");
  if (v36 <= v37)
    v39 = (unint64_t)v37;
  else
    v39 = (unint64_t)v36;
  v40 = TSURandomBetween(v37, v38, 0.0, 1.0) / ((double)v39 * 0.5 + 20.0);
  v41 = v40 * v35;
  v42.f32[0] = v32;
  v43 = sqrt(v20 - (float)((float)(v42.f32[0] * v42.f32[0]) + (float)(v33 * v33)));
  v42.f32[1] = v43;
  v44 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vadd_f32(vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v46), LODWORD(v47))), v48)), vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v42), v49)))), v40));
  v45 = v44.f32[1];
  result.var1 = v44.f32[0];
  result.var2 = v45;
  result.var0 = v41;
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

  -[KNBuildVanishParticleSystem objectSize](self, "objectSize");
  v4 = v3;
  -[KNBuildVanishParticleSystem objectSize](self, "objectSize");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  -[KNBuildVanishParticleSystem slideSize](self, "slideSize");
  v8 = v7;
  -[KNBuildVanishParticleSystem slideSize](self, "slideSize");
  if (v8 < v9)
    v8 = v9;
  -[KNBuildVanishParticleSystem maxSpeed](self, "maxSpeed");
  return v10 * (v6 / v8);
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;

  -[KNBuildVanishParticleSystem minScale](self, "minScale", a3.x, a3.y);
  v5 = v4;
  v6 = -[KNBuildVanishParticleSystem maxScale](self, "maxScale");
  v8 = v7;
  v10 = TSURandomBetween(v6, v9, 0.0, 1.0);
  return TSUMix(v5, v8, v10);
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double v3;
  float v4;
  float v5;
  $94F468A8D4C62B317260615823C2B210 result;

  v3 = TSURandomBetween(self, a2, 0.0, 1.0);
  v4 = TSUMix(0.1, 1.0, v3 * v3);
  v5 = 0.0;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (double)randomParticleSpeedMax
{
  return self->_randomParticleSpeedMax;
}

- (void)setRandomParticleSpeedMax:(double)a3
{
  self->_randomParticleSpeedMax = a3;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpan
{
  float start;
  float duration;
  $94F468A8D4C62B317260615823C2B210 result;

  start = self->_lifeSpan.start;
  duration = self->_lifeSpan.duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (void)setLifeSpan:(id)a3
{
  self->_lifeSpan = ($A1D7D23D68917446570C1E0BB0B375EB)a3;
}

- (double)maxSpeed
{
  return self->_maxSpeed;
}

- (void)setMaxSpeed:(double)a3
{
  self->_maxSpeed = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (double)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(double)a3
{
  self->_minScale = a3;
}

@end
