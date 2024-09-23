@implementation KNBuildShadowSystem

+ (BOOL)willOverrideGeometry
{
  return 1;
}

+ (unint64_t)numberOfVerticesPerParticle
{
  return 3;
}

- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $94F468A8D4C62B317260615823C2B210 result;

  v5 = 3 * (_QWORD)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a4.x, a4.y) + a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem dataBuffer](self->_crumbleSystem, "dataBuffer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem positionAttribute](self->_crumbleSystem, "positionAttribute"));
  objc_msgSend(v6, "metalPoint2DForAttribute:atIndex:", v7, v5);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = 3 * (_QWORD)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem dataBuffer](self->_crumbleSystem, "dataBuffer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem centerAttribute](self->_crumbleSystem, "centerAttribute"));
  objc_msgSend(v5, "metalPoint2DForAttribute:atIndex:", v6, v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = 3 * (_QWORD)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem dataBuffer](self->_crumbleSystem, "dataBuffer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem rotationAttribute](self->_crumbleSystem, "rotationAttribute"));
  objc_msgSend(v5, "metalPoint3DForAttribute:atIndex:", v6, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v8;
  v14 = v10;
  v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = 3 * (_QWORD)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem dataBuffer](self->_crumbleSystem, "dataBuffer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem speedAttribute](self->_crumbleSystem, "speedAttribute"));
  objc_msgSend(v5, "metalPoint3DForAttribute:atIndex:", v6, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v8;
  v14 = v10;
  v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = 3 * (_QWORD)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem dataBuffer](self->_crumbleSystem, "dataBuffer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem lifeSpanAttribute](self->_crumbleSystem, "lifeSpanAttribute"));
  objc_msgSend(v5, "metalPoint2DForAttribute:atIndex:", v6, v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (KNBuildCrumbleSystem)crumbleSystem
{
  return self->_crumbleSystem;
}

- (void)setCrumbleSystem:(id)a3
{
  self->_crumbleSystem = (KNBuildCrumbleSystem *)a3;
}

- (double)speedMaxLimiter
{
  return self->_speedMaxLimiter;
}

- (void)setSpeedMaxLimiter:(double)a3
{
  self->_speedMaxLimiter = a3;
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

- (double)lifeSpanRandomness
{
  return self->_lifeSpanRandomness;
}

- (void)setLifeSpanRandomness:(double)a3
{
  self->_lifeSpanRandomness = a3;
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
