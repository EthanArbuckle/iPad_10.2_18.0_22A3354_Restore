@implementation KNBuildFireworksSystem

- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5
{
  _BOOL8 v5;
  double width;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  id v35;
  double v36;
  TSUColor *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  float v43;
  float v44;
  double v45;
  double height;
  objc_super v47;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v8 = a3;
  -[KNBuildFireworksSystem fireworkStartingPositionX](self, "fireworkStartingPositionX");
  v10 = v9;
  -[KNBuildFireworksSystem objectSize](self, "objectSize");
  v12 = v11;
  -[KNBuildFireworksSystem slideSize](self, "slideSize");
  v13 = 1.0;
  v14 = 1.0;
  if (v15 > 0.0)
  {
    -[KNBuildFireworksSystem slideSize](self, "slideSize");
    v14 = v16;
  }
  objc_msgSend(v8, "frame");
  v18 = v17;
  objc_msgSend(v8, "frame");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworksSystem randomGenerator](self, "randomGenerator"));
  -[KNBuildFireworksSystem objectSize](self, "objectSize");
  v23 = v22;
  -[KNBuildFireworksSystem slideSize](self, "slideSize");
  v25 = v24 / 10.0;
  if (v23 < v24 / 10.0)
    v25 = v23;
  v26 = -v25;
  -[KNBuildFireworksSystem objectSize](self, "objectSize");
  objc_msgSend(v21, "doubleBetween::", v26);
  v28 = v27;

  -[KNBuildFireworksSystem slideSize](self, "slideSize");
  if (v29 > 0.0)
  {
    -[KNBuildFireworksSystem slideSize](self, "slideSize");
    v13 = v30;
  }
  v31 = v18 + v20 * (v10 * v12 / v14);
  v32 = v28 / v13;
  objc_msgSend(v8, "frame");
  v34 = v33;
  v35 = objc_msgSend(v8, "frame");
  self->_startingPoint.x = v31;
  self->_startingPoint.y = v34 + v36 * v32;
  v37 = +[TSUColor colorWithHue:saturation:brightness:alpha:](TSUColor, "colorWithHue:saturation:brightness:alpha:", TSURandom(v35), 1.0, 1.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  objc_msgSend(v38, "redComponent");
  v40 = v39;
  objc_msgSend(v38, "greenComponent");
  v42 = v41;
  objc_msgSend(v38, "blueComponent");
  v43 = v40;
  v44 = v42;
  *(float *)&v45 = v45;
  self->_startingColorRGB.x = v43;
  self->_startingColorRGB.y = v44;
  self->_startingColorRGB.z = *(float *)&v45;
  v47.receiver = self;
  v47.super_class = (Class)KNBuildFireworksSystem;
  -[KNBuildFireworksSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](&v47, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, v5, width, height);

}

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingPoint.x;
  y = self->_startingPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

+ (BOOL)willOverrideColors
{
  return 1;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = objc_opt_class(KNAnimationRandomGenerator);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworksSystem randomGenerator](self, "randomGenerator"));
  TSUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "metalPoint3DRandomDirection");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[KNBuildFireworksSystem colorRandomness](self, "colorRandomness");
  v15 = v14 * v9;
  v16 = v14 * v11;
  *(float *)&v14 = v14 * v13;
  v17 = self->_startingColorRGB.y + v16;
  v18 = self->_startingColorRGB.z + *(float *)&v14;
  v19 = TSUClamp((float)(self->_startingColorRGB.x + v15), 0.0, 1.0);
  v20 = TSUClamp(v17, 0.0, 1.0);
  v21 = TSUClamp(v18, 0.0, 1.0);

  v22 = 1.0;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  result.var3 = v22;
  result.var2 = v25;
  result.var1 = v24;
  result.var0 = v23;
  return result;
}

- (double)speedMax
{
  double result;

  -[KNBuildFireworksSystem maxDistance](self, "maxDistance");
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  void *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworksSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  objc_msgSend(v4, "metalPoint3DRandomDirection");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[KNBuildFireworksSystem randomParticleSpeedMinMax](self, "randomParticleSpeedMinMax");
  v12 = v11;
  -[KNBuildFireworksSystem randomParticleSpeedMinMax](self, "randomParticleSpeedMinMax");
  objc_msgSend(v4, "doubleBetween::", v12);
  v14 = v13 * v6;
  v15 = v13 * v8;
  v16 = v13 * v10;

  v17 = v14;
  v18 = v15;
  v19 = v16;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworksSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  -[KNBuildFireworksSystem randomParticleSizeMinMax](self, "randomParticleSizeMinMax");
  v6 = v5;
  -[KNBuildFireworksSystem randomParticleSizeMinMax](self, "randomParticleSizeMinMax");
  objc_msgSend(v4, "doubleBetween::", v6);
  v8 = v7;

  return v8;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  float v6;
  float v7;
  float v8;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworksSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  -[KNBuildFireworksSystem lifeSpanMinDuration](self, "lifeSpanMinDuration");
  objc_msgSend(v4, "doubleBetween::");
  v6 = v5;

  v7 = 0.0;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)lifeSpanMinDuration
{
  return self->_lifeSpanMinDuration;
}

- (void)setLifeSpanMinDuration:(double)a3
{
  self->_lifeSpanMinDuration = a3;
}

- (double)colorRandomness
{
  return self->_colorRandomness;
}

- (void)setColorRandomness:(double)a3
{
  self->_colorRandomness = a3;
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

- (double)maxDistance
{
  return self->_maxDistance;
}

- (void)setMaxDistance:(double)a3
{
  self->_maxDistance = a3;
}

- (CGSize)randomParticleSizeMinMax
{
  double width;
  double height;
  CGSize result;

  width = self->_randomParticleSizeMinMax.width;
  height = self->_randomParticleSizeMinMax.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRandomParticleSizeMinMax:(CGSize)a3
{
  self->_randomParticleSizeMinMax = a3;
}

- (CGPoint)randomParticleSpeedMinMax
{
  double x;
  double y;
  CGPoint result;

  x = self->_randomParticleSpeedMinMax.x;
  y = self->_randomParticleSpeedMinMax.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRandomParticleSpeedMinMax:(CGPoint)a3
{
  self->_randomParticleSpeedMinMax = a3;
}

- (double)fireworkStartingPositionX
{
  return self->_fireworkStartingPositionX;
}

- (void)setFireworkStartingPositionX:(double)a3
{
  self->_fireworkStartingPositionX = a3;
}

- (BOOL)didDrawCenterBurst
{
  return self->_didDrawCenterBurst;
}

- (void)setDidDrawCenterBurst:(BOOL)a3
{
  self->_didDrawCenterBurst = a3;
}

- (CGPoint)startingPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingPoint.x;
  y = self->_startingPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
