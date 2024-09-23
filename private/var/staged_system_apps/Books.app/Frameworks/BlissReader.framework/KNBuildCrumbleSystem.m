@implementation KNBuildCrumbleSystem

+ (BOOL)willOverrideGeometry
{
  return 1;
}

+ (unint64_t)numberOfVerticesPerParticle
{
  return 3;
}

- (void)p_setupParameters
{
  uint64_t v3;
  unint64_t v4;
  double v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  unsigned int v12;
  unsigned int v13;
  float v14;
  float v15;
  double v16;
  double v17;
  unsigned int v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double v23;
  double v24;
  float v25;
  float v26;
  double v27;
  long double v28;
  long double v29;
  int *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  float v39;
  float v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  float v51;
  $C0298B01DB5FC2E28DB3B6A6EBA1E8D4 *v52;
  double v53;
  float v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  float v58;
  id v59;

  v59 = (id)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem randomGenerator](self, "randomGenerator"));
  self->_cellParameters = ($C0298B01DB5FC2E28DB3B6A6EBA1E8D4 *)malloc_type_calloc(0x28uLL, (size_t)-[TSDGPUVoronoiTriangleData cellCount](self->_voronoiTriangleData, "cellCount"), 0x855BC78uLL);
  if (-[TSDGPUVoronoiTriangleData cellCount](self->_voronoiTriangleData, "cellCount"))
  {
    v3 = 0;
    v4 = 0;
    v5 = 1.0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDGPUVoronoiTriangleData cells](self->_voronoiTriangleData, "cells"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v4));
      objc_msgSend(v7, "centerPoint");
      v9 = v8;
      v11 = v10;

      objc_msgSend(v59, "metalPoint3DRandomDirection");
      v56 = v12;
      v55 = v13;
      v15 = v14;
      objc_msgSend(v59, "randomDouble");
      v17 = v16;
      objc_msgSend(v59, "metalPoint3DRandomDirection");
      v57 = v18;
      v20 = v19;
      v22 = v21;
      -[KNBuildCrumbleSystem objectSize](self, "objectSize");
      v24 = v23 * 0.5;
      v25 = fabsf(v20);
      if (v24 >= v11)
        v26 = -v25;
      else
        v26 = v25;
      v54 = v26;
      objc_msgSend(v59, "randomDouble");
      v28 = v27;
      -[KNBuildCrumbleSystem speedMaxLimiter](self, "speedMaxLimiter");
      v53 = pow(v28, v29);
      v30 = (int *)-[KNBuildCrumbleSystem direction](self, "direction");
      v58 = v11;
      if (v30 == (int32_t *)((char *)&stru_20.maxprot + 3))
        goto LABEL_12;
      if (v30 == &dword_C)
      {
        -[KNBuildCrumbleSystem objectSize](self, "objectSize");
        v33 = v9 / v34;
      }
      else
      {
        if (v30 != (int *)((char *)&dword_8 + 3))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildCrumbleSystem p_setupParameters]"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"));
          objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, v37, 736, CFSTR("Invalid direction!"));

LABEL_12:
          v33 = TSURandomBetween(v30, v31, 0.0, 1.0);
          goto LABEL_13;
        }
        -[KNBuildCrumbleSystem objectSize](self, "objectSize");
        v33 = v5 - v9 / v32;
      }
LABEL_13:
      v38 = v9;
      v39 = v17 * v17 * v15;
      v40 = v53 * (float)-fabsf(v22);
      -[KNBuildCrumbleSystem lifeSpanDelay](self, "lifeSpanDelay");
      v42 = v33 * v41;
      -[KNBuildCrumbleSystem lifeSpanRandomness](self, "lifeSpanRandomness");
      v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumbleSystem randomGenerator](self, "randomGenerator"));
      objc_msgSend(v45, "doubleBetween::", -1.0, 1.0);
      v47 = v42 + v44 * v46;

      -[KNBuildCrumbleSystem lifeSpanDelay](self, "lifeSpanDelay");
      v49 = TSUClamp(v47, 0.0, 1.0 - v48);
      -[KNBuildCrumbleSystem lifeSpanDelay](self, "lifeSpanDelay");
      v5 = 1.0;
      v51 = v49;
      *(float *)&v50 = 1.0 - v50;
      v52 = &self->_cellParameters[v3];
      v52->var0.var0 = v38;
      v52->var0.var1 = v58;
      *(float32x2_t *)&v52->var1.var0 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v55, v56)), v17 * v17));
      v52->var1.var2 = v39;
      *(float32x2_t *)&v52->var2.var0 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v54), v57)), v53));
      v52->var2.var2 = v40;
      v52->var3.var0 = v51;
      v52->var3.var1 = *(float *)&v50;
      ++v4;
      ++v3;
    }
    while (v4 < (unint64_t)-[TSDGPUVoronoiTriangleData cellCount](self->_voronoiTriangleData, "cellCount"));
  }

}

+ (id)newParticleSystemWithNumberOfParticles:(unint64_t)a3 objectSize:(CGSize)a4 slideSize:(CGSize)a5 duration:(double)a6 direction:(unint64_t)a7 shader:(id)a8 percentOfCellsToSplit:(double)a9 randomGenerator:(id)a10 metalContext:(id)a11
{
  double height;
  double width;
  double v17;
  double v18;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id *v29;
  objc_super v31;

  height = a5.height;
  width = a5.width;
  v17 = a4.height;
  v18 = a4.width;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  if (!v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[KNBuildCrumbleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:shader:percentOfCellsToSplit:randomGenerator:metalContext:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"));
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 762, CFSTR("invalid nil value for '%s'"), "randGen");

  }
  v27 = objc_alloc((Class)TSDGPUVoronoiTriangleData);
  v28 = objc_msgSend(v27, "initWithPoints:clippedToRect:percentOfCellsToSplit:randomGenerator:", a3, v22, TSDRectWithSize(v27));
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___KNBuildCrumbleSystem;
  v29 = (id *)objc_msgSendSuper2(&v31, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a7, v22, v21, v23, CGSizeZero.width, CGSizeZero.height, (double)(unint64_t)objc_msgSend(v28, "triangleCount"), 1.0, v18, v17, width, height, *(_QWORD *)&a6);
  if (v29)
  {
    objc_msgSend(v29, "setTriangleCount:", objc_msgSend(v28, "triangleCount"));
    objc_storeStrong(v29 + 1, v28);
  }

  return v29;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_cellParameters);
  v3.receiver = self;
  v3.super_class = (Class)KNBuildCrumbleSystem;
  -[KNBuildCrumbleSystem dealloc](&v3, "dealloc");
}

- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4
{
  id v6;
  void *v7;
  id v8;
  float *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $94F468A8D4C62B317260615823C2B210 result;

  v6 = -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDGPUVoronoiTriangleData cellFromTriangleIndex:](self->_voronoiTriangleData, "cellFromTriangleIndex:", v6));
  v8 = -[TSDGPUVoronoiTriangleData triangleIndexInCellFromGlobalTriangleIndex:](self->_voronoiTriangleData, "triangleIndexInCellFromGlobalTriangleIndex:", v6);
  v9 = (float *)((char *)objc_msgSend(v7, "vertexData") + 24 * (_QWORD)v8 + 8 * a3);
  v10 = *v9;
  v11 = v9[1];

  v12 = v10;
  v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3
{
  void *v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  $94F468A8D4C62B317260615823C2B210 result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDGPUVoronoiTriangleData cellFromTriangleIndex:](self->_voronoiTriangleData, "cellFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y)));
  objc_msgSend(v3, "centerPoint");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  $C0298B01DB5FC2E28DB3B6A6EBA1E8D4 *v6;
  float var0;
  float var1;
  float var2;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  y = a3.y;
  x = a3.x;
  if (!self->_cellParameters)
    -[KNBuildCrumbleSystem p_setupParameters](self, "p_setupParameters");
  v6 = &self->_cellParameters[(_QWORD)-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:](self->_voronoiTriangleData, "cellIndexFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", x, y))];
  var0 = v6->var1.var0;
  var1 = v6->var1.var1;
  var2 = v6->var1.var2;
  result.var2 = var2;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  $C0298B01DB5FC2E28DB3B6A6EBA1E8D4 *v6;
  float var0;
  float var1;
  float var2;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  y = a3.y;
  x = a3.x;
  if (!self->_cellParameters)
    -[KNBuildCrumbleSystem p_setupParameters](self, "p_setupParameters");
  v6 = &self->_cellParameters[(_QWORD)-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:](self->_voronoiTriangleData, "cellIndexFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", x, y))];
  var0 = v6->var2.var0;
  var1 = v6->var2.var1;
  var2 = v6->var2.var2;
  result.var2 = var2;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  $C0298B01DB5FC2E28DB3B6A6EBA1E8D4 *v6;
  float var0;
  float var1;
  $94F468A8D4C62B317260615823C2B210 result;

  y = a3.y;
  x = a3.x;
  if (!self->_cellParameters)
    -[KNBuildCrumbleSystem p_setupParameters](self, "p_setupParameters");
  v6 = &self->_cellParameters[(_QWORD)-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:](self->_voronoiTriangleData, "cellIndexFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", x, y))];
  var0 = v6->var3.var0;
  var1 = v6->var3.var1;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- (unint64_t)triangleCount
{
  return self->_triangleCount;
}

- (void)setTriangleCount:(unint64_t)a3
{
  self->_triangleCount = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voronoiTriangleData, 0);
}

@end
