@implementation TSDGPUParticleSystem

+ (id)newDataBufferAttributeWithName:(id)a3
{
  return 0;
}

+ (id)newParticleSystemWithNumberOfParticles:(unint64_t)a3 objectSize:(CGSize)a4 slideSize:(CGSize)a5 duration:(double)a6 direction:(unint64_t)a7 randomGenerator:(id)a8 shader:(id)a9 metalContext:(id)a10
{
  double width;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double height;

  height = a5.height;
  width = a5.width;
  v16 = a4.height;
  v17 = a4.width;
  +[TSDGPUParticleSystem p_particleSystemSizeWithRequestedNumber:objectSize:](TSDGPUParticleSystem, "p_particleSystemSizeWithRequestedNumber:objectSize:", a3);
  v20 = v19;
  v22 = v21;
  if (!a8)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDGPUParticleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:]");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 72, CFSTR("invalid nil value for '%s'"), "randomGenerator");
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a7, a8, a9, a10, ceil(v17 / v20), ceil(v16 / v22), v20, v22, v17, v16, width, height, *(_QWORD *)&a6);
}

+ (id)newParticleSystemWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9 shader:(id)a10 metalContext:(id)a11
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a8, a9, a10, a11, a3.width, a3.height, a4.width, a4.height, a5.width, a5.height, a6.width, a6.height);
}

- (TSDGPUParticleSystem)initWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9 shader:(id)a10 metalContext:(id)a11
{
  double height;
  double width;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v24;
  void *v26;
  uint64_t v27;
  TSDGPUParticleSystem *v28;
  TSDGPUParticleSystem *v29;
  uint64_t v30;
  objc_super v32;

  height = a6.height;
  width = a6.width;
  v17 = a5.height;
  v18 = a5.width;
  v19 = a4.height;
  v20 = a4.width;
  v21 = a3.height;
  v22 = a3.width;
  v24 = objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle");
  if (v24 > 4 || ((1 << v24) & 0x1A) == 0)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem initWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:]");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 115, CFSTR("%@: We don't support %d vertices per particle... aborting init."), objc_opt_class(), v24);
  }
  v32.receiver = self;
  v32.super_class = (Class)TSDGPUParticleSystem;
  v28 = -[TSDGPUParticleSystem init](&v32, sel_init);
  v29 = v28;
  if (v28)
  {
    -[TSDGPUParticleSystem p_setupParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:](v28, "p_setupParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:", a8, a9, v22, v21, v20, v19, v18, v17, width, height, *(_QWORD *)&a7);
    v29->_metalContext = (TSDMetalContext *)a11;
    v30 = -[TSDGPUParticleSystem particleCount](v29, "particleCount");
    -[TSDGPUParticleSystem setupMetalWithShader:](v29, "setupMetalWithShader:", a10);
    if ((objc_msgSend((id)objc_opt_class(), "shouldDrawInvisibleParticles") & 1) == 0)
      v29->_visibilities = (BOOL *)malloc_type_calloc(v30 * v24, 1uLL, 0x100004077774924uLL);
    -[TSDGPUParticleSystem p_setupDataBufferWithParticleCount:visibleParticleCount:](v29, "p_setupDataBufferWithParticleCount:visibleParticleCount:", -[TSDGPUParticleSystem particleCount](v29, "particleCount"), -[TSDGPUParticleSystem visibleParticleCount](v29, "visibleParticleCount"));
  }
  return v29;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL *visibilities;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[TSDGPUParticleSystem dataBufferAttributes](self, "dataBufferAttributes");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);

      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  visibilities = self->_visibilities;
  if (visibilities)
  {
    free(visibilities);
    self->_visibilities = 0;
  }
  self->_attributesInShader = 0;
  v9.receiver = self;
  v9.super_class = (Class)TSDGPUParticleSystem;
  -[TSDGPUParticleSystem dealloc](&v9, sel_dealloc);
}

- (void)p_setupParticleSystemWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9
{
  CGFloat height;
  CGFloat width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  uint64_t v20;
  double v22;
  double v23;
  double v24;

  height = a6.height;
  width = a6.width;
  v13 = a5.height;
  v14 = a5.width;
  v15 = a4.height;
  v16 = a4.width;
  v24 = a3.height;
  v17 = a3.width;
  if (!a9)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem p_setupParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 166, CFSTR("invalid nil value for '%s'"), "randomGenerator");
  }
  self->_randomGenerator = a9;
  self->_shouldDraw = 1;
  self->_objectSize.width = v14;
  self->_objectSize.height = v13;
  self->_slideSize.width = width;
  self->_slideSize.height = height;
  self->_duration = a7;
  self->_direction = a8;
  if (v16 == *MEMORY[0x24BDBF148] && v15 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v16 = ceil(v14 / v17);
    v15 = ceil(v13 / v24);
  }
  -[TSDGPUParticleSystem p_resizeSystemToFitWithinMaxVerticesWithSystemSize:](self, "p_resizeSystemToFitWithinMaxVerticesWithSystemSize:", v16, v15);
  self->_particleSize.width = v17;
  self->_particleSize.height = v24;
  self->_particlesWide = (unint64_t)v22;
  self->_particlesHigh = (unint64_t)v23;
  self->_particleCount = (unint64_t)v22 * (unint64_t)v23;
}

- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5
{
  -[TSDGPUParticleSystem setupWithTexture:particleTextureSize:reverseDrawOrder:capabilities:](self, "setupWithTexture:particleTextureSize:reverseDrawOrder:capabilities:", a3, a5, 0, a4.width, a4.height);
}

- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5 capabilities:(id)a6
{
  _BOOL4 v6;

  v6 = a5;
  -[TSDGPUParticleSystem p_setupParticleTextureDataWithTexture:capabilities:](self, "p_setupParticleTextureDataWithTexture:capabilities:", a3, a6, a4.width, a4.height);
  -[TSDGPUParticleSystem p_setupParticleDataWithTexture:](self, "p_setupParticleDataWithTexture:", a3);
  if (v6)
    -[TSDGPUParticleSystem p_reverseParticleDataDrawOrder](self, "p_reverseParticleDataDrawOrder");
  if (!self->_isDataBufferInitialized)
    -[TSDGPUParticleSystem p_setupVertexData](self, "p_setupVertexData");
}

- (id)randomGenerator
{
  return self->_randomGenerator;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  objc_super v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (self->_isInitialized)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("initialized:%@"), v4));
  if (self->_isDataBufferInitialized)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dataBufferInitialized:%@"), v5));
  if (!-[TSDGPUParticleSystem shouldDraw](self, "shouldDraw"))
    objc_msgSend(v3, "addObject:", CFSTR("NOT drawing"));
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("visibleParticleCount:%ld"), -[TSDGPUParticleSystem visibleParticleCount](self, "visibleParticleCount")));
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("particleSystemSize:%ldx%ld)"), -[TSDGPUParticleSystem particlesWide](self, "particlesWide"), -[TSDGPUParticleSystem particlesHigh](self, "particlesHigh")));
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dataBuffer:%@"), -[TSDGPUParticleSystem dataBuffer](self, "dataBuffer")));
  v7.receiver = self;
  v7.super_class = (Class)TSDGPUParticleSystem;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: {%@}"), -[TSDGPUParticleSystem description](&v7, sel_description), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
}

- (unint64_t)indexFromPoint:(CGPoint)a3
{
  return (unint64_t)(a3.x + (double)-[TSDGPUParticleSystem particlesWide](self, "particlesWide") * a3.y);
}

- (CGPoint)indexPointFromIndex:(unint64_t)a3
{
  double v4;
  double v5;
  CGPoint result;

  v4 = (double)(a3 / -[TSDGPUParticleSystem particlesWide](self, "particlesWide"));
  v5 = (double)a3 - v4;
  result.y = v4;
  result.x = v5;
  return result;
}

- (NSArray)dataBufferAttributes
{
  NSArray *v3;
  NSArray *v4;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = v3;
  if (self->_positionAttribute)
    -[NSArray addObject:](v3, "addObject:");
  if (self->_centerAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_texCoordAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_particleTexCoordAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_colorAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_speedAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_rotationAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_scaleAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_lifeSpanAttribute)
    -[NSArray addObject:](v4, "addObject:");
  if (self->_colorTexCoordAttribute)
    -[NSArray addObject:](v4, "addObject:");
  return v4;
}

- (CGContext)newContextFromTexture:(id)a3
{
  uint64_t v3;
  CGImage *v4;
  CGContext *v5;
  double Width;
  CGRect v8;

  if (!a3)
    return 0;
  v3 = objc_msgSend(a3, "image");
  if (!v3)
    return 0;
  v4 = (CGImage *)v3;
  if ((objc_msgSend((id)objc_opt_class(), "willOverrideColors") & 1) != 0)
    return 0;
  Width = (double)CGImageGetWidth(v4);
  CGImageGetHeight(v4);
  v5 = TSDBitmapContextCreate(3, Width);
  v8.origin.x = TSDRectWithSize();
  CGContextDrawImage(v5, v8, v4);
  return v5;
}

+ (unint64_t)numberOfVerticesPerParticle
{
  return 4;
}

+ (BOOL)willOverrideGeometry
{
  return 0;
}

- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4
{
  void *v4;
  uint64_t v5;
  float v6;
  float v7;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.x, a4.y);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem vertexPositionAtVertexIndex:particleIndexPoint:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 310, CFSTR("Subclass should implement this method!"));
  v6 = 0.0;
  v7 = 0.0;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  float v5;
  float v6;
  $94F468A8D4C62B317260615823C2B210 result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem centerAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 315, CFSTR("Subclass should implement this method!"));
  v5 = 0.0;
  v6 = 0.0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BOOL)willOverrideStartingPoints
{
  return 0;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  CGPoint result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem startingPointAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 323, CFSTR("Subclass should implement this method!"));
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v6;
  result.x = v5;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  double v11;
  float v12;
  float v13;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem speedAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 328, CFSTR("Subclass should implement this method!"));
  TSURandom();
  v6 = v5;
  TSURandom();
  v8 = v7;
  TSURandom();
  v9 = v6;
  v10 = v8;
  v12 = v11;
  v13 = v9;
  result.var2 = v12;
  result.var1 = v10;
  result.var0 = v13;
  return result;
}

- (double)speedMax
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem speedMax]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 332, CFSTR("TSDGPUParticleSystem kindly requests you also implement speedMax if you wanna use Speed!"));
  return 1.0;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  double v11;
  float v12;
  float v13;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem rotationAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 337, CFSTR("Subclass should implement this method!"));
  TSURandomBetween();
  v6 = v5;
  TSURandomBetween();
  v8 = v7;
  TSURandomBetween();
  v9 = v6;
  v10 = v8;
  v12 = v11;
  v13 = v9;
  result.var2 = v12;
  result.var1 = v10;
  result.var0 = v13;
  return result;
}

- (double)rotationMax
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem rotationMax]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 341, CFSTR("TSDGPUParticleSystem kindly requests you also implement rotationMax if you wanna use Rotation!"));
  return 1.0;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  double result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem scaleAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 346, CFSTR("Subclass should implement this method!"));
  TSURandom();
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  float v5;
  float v6;
  $94F468A8D4C62B317260615823C2B210 result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem lifeSpanAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 351, CFSTR("Subclass should implement this method!"));
  v5 = 0.0;
  v6 = 1.0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BOOL)willOverrideColors
{
  return 0;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem colorAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 359, CFSTR("Subclass should implement this method!"));
  TSURandomBetween();
  v6 = v5;
  TSURandomBetween();
  v8 = v7;
  TSURandomBetween();
  v10 = v9;
  TSURandomBetween();
  v11 = v6;
  v12 = v8;
  v13 = v10;
  v15 = v14;
  v16 = v11;
  result.var3 = v15;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v16;
  return result;
}

+ (BOOL)shouldDrawInvisibleParticles
{
  return 0;
}

+ (BOOL)willOverrideVisibilities
{
  return 0;
}

- (BOOL)visibilityAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem visibilityAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 370, CFSTR("Subclass should implement this method!"));
  return 1;
}

+ (BOOL)willOverrideColorTexCoords
{
  return 0;
}

- ($94F468A8D4C62B317260615823C2B210)colorTexCoordAtIndexPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  float v5;
  float v6;
  $94F468A8D4C62B317260615823C2B210 result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.x, a3.y);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem colorTexCoordAtIndexPoint:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 380, CFSTR("Subclass should implement this method!"));
  v5 = 0.0;
  v6 = 0.0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)setupMetalWithShader:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldDraw)
  {
    v4 = objc_msgSend(a3, "pipelineReflectionObject");
    if (v4)
    {
      v5 = (void *)v4;
      self->_attributesInShader = (NSMutableSet *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = (void *)objc_msgSend(v5, "vertexBindings");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v12 = (void *)TSUProtocolCast();
            if (!objc_msgSend(v11, "type") && objc_msgSend(v12, "bufferDataType") == 1)
            {
              v20 = 0u;
              v21 = 0u;
              v18 = 0u;
              v19 = 0u;
              v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "bufferStructType", 0), "members");
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v19;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v19 != v16)
                      objc_enumerationMutation(v13);
                    -[NSMutableSet addObject:](self->_attributesInShader, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "name"));
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
                }
                while (v15);
              }
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v8);
      }
    }
  }
}

- (void)drawMetalWithEncoder:(id)a3
{
  if (self->_shouldDraw)
  {
    if (!self->_isInitialized)
      -[TSDGPUParticleSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    if (!self->_isDataBufferInitialized)
      -[TSDGPUParticleSystem p_setupVertexData](self, "p_setupVertexData");
    -[TSDGPUDataBuffer drawWithEncoder:atIndex:](-[TSDGPUParticleSystem dataBuffer](self, "dataBuffer"), "drawWithEncoder:atIndex:", a3, 0);
  }
}

- (TSDMetalContext)metalContext
{
  return self->_metalContext;
}

- (MTLTexture)vertexColorTexture
{
  return self->_vertexColorTexture;
}

- (CGSize)vertexTextureSize
{
  double width;
  double height;
  CGSize result;

  width = self->_vertexTextureSize.width;
  height = self->_vertexTextureSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)particleCount
{
  return self->_particleCount;
}

- (unint64_t)visibleParticleCount
{
  return self->_visibleParticleCount;
}

- (unint64_t)particlesWide
{
  return self->_particlesWide;
}

- (unint64_t)particlesHigh
{
  return self->_particlesHigh;
}

- (CGSize)particleSize
{
  double width;
  double height;
  CGSize result;

  width = self->_particleSize.width;
  height = self->_particleSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)objectSize
{
  double width;
  double height;
  CGSize result;

  width = self->_objectSize.width;
  height = self->_objectSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)slideSize
{
  double width;
  double height;
  CGSize result;

  width = self->_slideSize.width;
  height = self->_slideSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (TSDGPUDataBufferAttribute)positionAttribute
{
  return self->_positionAttribute;
}

- (TSDGPUDataBufferAttribute)centerAttribute
{
  return self->_centerAttribute;
}

- (TSDGPUDataBufferAttribute)texCoordAttribute
{
  return self->_texCoordAttribute;
}

- (TSDGPUDataBufferAttribute)particleTexCoordAttribute
{
  return self->_particleTexCoordAttribute;
}

- (TSDGPUDataBufferAttribute)colorAttribute
{
  return self->_colorAttribute;
}

- (TSDGPUDataBufferAttribute)lifeSpanAttribute
{
  return self->_lifeSpanAttribute;
}

- (TSDGPUDataBufferAttribute)speedAttribute
{
  return self->_speedAttribute;
}

- (TSDGPUDataBufferAttribute)rotationAttribute
{
  return self->_rotationAttribute;
}

- (TSDGPUDataBufferAttribute)scaleAttribute
{
  return self->_scaleAttribute;
}

- (TSDGPUDataBufferAttribute)colorTexCoordAttribute
{
  return self->_colorTexCoordAttribute;
}

- (TSDGPUDataBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (BOOL)shouldDraw
{
  return self->_shouldDraw;
}

- (void)p_setupParticleTextureDataWithTexture:(id)a3 capabilities:(id)a4
{
  MTLDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[3];
  uint64_t v23;

  if (self->_colorTexCoordAttribute && (objc_msgSend((id)objc_opt_class(), "willOverrideColorTexCoords") & 1) == 0)
  {
    v6 = -[TSDMetalContext device](self->_metalContext, "device");
    v7 = (void *)objc_msgSend(+[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](TSDMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v6), "newFunctionWithName:", CFSTR("TSDMetalParticleSystem_ReduceTexture"));
    v23 = 0;
    v8 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](v6, "newComputePipelineStateWithFunction:error:", v7, &v23);

    if (v8)
    {
      v9 = (void *)objc_msgSend(a3, "metalTexture");
      v10 = (unint64_t)objc_msgSend(v9, "width") >> 2;
      v11 = (unint64_t)objc_msgSend(v9, "height") >> 2;
      -[TSDGPUParticleSystem particleSize](self, "particleSize");
      -[TSDGPUParticleSystem particleSize](self, "particleSize");
      v12 = (void *)objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"), v10, v11, 0);
      objc_msgSend(v12, "setUsage:", 3);
      objc_msgSend(v12, "setResourceOptions:", 32);
      objc_msgSend(v12, "setStorageMode:", 2);
      self->_vertexColorTexture = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](v6, "newTextureWithDescriptor:", v12);
      self->_vertexTextureSize.width = (double)v10;
      self->_vertexTextureSize.height = (double)v11;
      v13 = objc_msgSend(v8, "threadExecutionWidth");
      v14 = objc_msgSend(v8, "maxTotalThreadsPerThreadgroup") / v13;
      v15 = (v13 + objc_msgSend(v9, "width") - 1) / v13;
      v16 = (v14 + objc_msgSend(v9, "height") - 1) / v14;
      v17 = (void *)-[MTLCommandQueue commandBuffer](-[TSDMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
      v18 = (void *)objc_msgSend(v17, "computeCommandEncoder");
      objc_msgSend(v18, "setComputePipelineState:", v8);
      objc_msgSend(v18, "setTexture:atIndex:", v9, 0);
      objc_msgSend(v18, "setTexture:atIndex:", self->_vertexColorTexture, 1);
      v22[0] = v15;
      v22[1] = v16;
      v22[2] = 1;
      v21[0] = v13;
      v21[1] = v14;
      v21[2] = 1;
      objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v22, v21);
      objc_msgSend(v18, "endEncoding");
      objc_msgSend(v17, "commit");

    }
    else
    {
      v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem(Private) p_setupParticleTextureDataWithTexture:capabilities:]");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 448, CFSTR("Failed to create compute shader"));
    }
  }
}

- (void)p_setDataBufferAttribute:(id *)a3 withName:(id)a4 defaultDataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  _BOOL8 v8;
  void *v13;

  v8 = a6;

  *a3 = 0;
  if (-[NSMutableSet containsObject:](self->_attributesInShader, "containsObject:", a4))
  {
    v13 = (void *)objc_msgSend((id)objc_opt_class(), "newDataBufferAttributeWithName:", a4);
    *a3 = v13;
    if (!v13)
      *a3 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", a4, 35044, a5, v8, a7);
  }
}

- (void)p_setupDataBufferWithParticleCount:(unint64_t)a3 visibleParticleCount:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  unint64_t particleCount;
  TSDGPUDataBuffer *v10;

  self->_particleCount = a3;
  self->_visibleParticleCount = a4;
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_positionAttribute, CFSTR("Position"), 5, 0, 2);
  if (!self->_positionAttribute)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem(Private) p_setupDataBufferWithParticleCount:visibleParticleCount:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 555, CFSTR("Always need a position attribute!"));
  }
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_centerAttribute, CFSTR("Center"), 5, 0, 2);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_texCoordAttribute, CFSTR("TexCoord"), 3, 1, 2);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_particleTexCoordAttribute, CFSTR("ParticleTexCoord"), 3, 1, 2);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_colorAttribute, CFSTR("Color"), 3, 1, 4);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_speedAttribute, CFSTR("Speed"), 3, 1, 3);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_rotationAttribute, CFSTR("Rotation"), 3, 1, 3);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_scaleAttribute, CFSTR("Scale"), 5, 0, 1);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_lifeSpanAttribute, CFSTR("LifeSpan"), 3, 1, 2);
  -[TSDGPUParticleSystem p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:](self, "p_setDataBufferAttribute:withName:defaultDataType:normalized:componentCount:", &self->_colorTexCoordAttribute, CFSTR("ColorTexCoord"), 3, 1, 2);

  v7 = objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle");
  v8 = -[TSDGPUParticleSystem dataBufferAttributes](self, "dataBufferAttributes");
  particleCount = self->_particleCount;
  if (v7 == 4)
  {
    self->_dataBuffer = (TSDGPUDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:quadParticleCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:quadParticleCount:device:", v8, particleCount, -[TSDMetalContext device](self->_metalContext, "device"));
  }
  else
  {
    v10 = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", v8, objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle") * particleCount, 0, -[TSDMetalContext device](self->_metalContext, "device"));
    self->_dataBuffer = v10;
    -[TSDGPUDataBuffer setMetalDrawMode:](v10, "setMetalDrawMode:", 3);
  }
}

- (void)p_setupParticleDataWithTexture:(id)a3
{
  unint64_t v4;
  void *v6;
  uint64_t v7;
  double width;
  double height;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  char v16;
  NSArray *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  char v32;
  char v33;
  char v34;
  char v35;
  BOOL *visibilities;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  _QWORD v53[40];
  BOOL v54;
  BOOL v55;
  BOOL v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;

  v4 = objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle");
  if (v4 > 4 || ((1 << v4) & 0x1A) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem(Private) p_setupParticleDataWithTexture:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 636, CFSTR("Only support 1, 3, or 4 vertices per particle!"));
  }
  width = self->_objectSize.width;
  height = self->_objectSize.height;
  v10 = TSDRectWithSize();
  v51 = v11;
  v52 = v10;
  v49 = v13;
  v50 = v12;
  v14 = height != (double)(unint64_t)height || width != (double)(unint64_t)width;
  v15 = self->_texCoordAttribute != 0;
  v16 = objc_msgSend((id)objc_opt_class(), "willOverrideGeometry");
  v17 = -[TSDGPUParticleSystem dataBufferAttributes](self, "dataBufferAttributes");
  v18 = v17;
  if (self->_positionAttribute)
    v48 = -[NSArray indexOfObject:](v17, "indexOfObject:");
  else
    v48 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_texCoordAttribute)
    v47 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v47 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_particleTexCoordAttribute)
    v46 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v46 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_centerAttribute)
    v45 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v45 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_speedAttribute)
    v44 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_rotationAttribute)
    v43 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v43 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_scaleAttribute)
    v42 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v42 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_lifeSpanAttribute)
    v41 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v41 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_colorAttribute)
    v40 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v40 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_colorTexCoordAttribute)
    v39 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  else
    v39 = 0x7FFFFFFFFFFFFFFFLL;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 1;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v38 = -[TSDGPUParticleSystem particlesHigh](self, "particlesHigh");
  v37 = -[TSDGPUParticleSystem particlesWide](self, "particlesWide");
  -[TSDGPUParticleSystem particleSize](self, "particleSize");
  v20 = v19;
  v22 = v21;
  -[TSDGPUParticleSystem objectSize](self, "objectSize");
  v24 = v23;
  v26 = v25;
  if (-[TSDGPUParticleSystem vertexColorTexture](self, "vertexColorTexture"))
  {
    -[TSDGPUParticleSystem vertexTextureSize](self, "vertexTextureSize");
    v28 = v27;
    v30 = v29;
    v31 = v29 != v26 || v27 != v24;
  }
  else
  {
    v31 = 0;
    v28 = v24;
    v30 = v26;
  }
  v32 = objc_msgSend((id)objc_opt_class(), "willOverrideVisibilities");
  v33 = objc_msgSend((id)objc_opt_class(), "willOverrideStartingPoints");
  v34 = objc_msgSend((id)objc_opt_class(), "willOverrideColors");
  v35 = objc_msgSend((id)objc_opt_class(), "willOverrideColorTexCoords");
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __64__TSDGPUParticleSystem_Private__p_setupParticleDataWithTexture___block_invoke;
  v53[3] = &unk_24D82C930;
  v53[8] = v48;
  v53[9] = v47;
  v53[10] = v46;
  v53[11] = v45;
  v53[12] = v44;
  v53[13] = v43;
  v53[14] = v42;
  v53[15] = v41;
  v53[16] = v40;
  v53[17] = v39;
  v53[18] = v38;
  v53[19] = v37;
  v53[20] = v4;
  v53[21] = v20;
  v53[22] = v22;
  v54 = v15;
  v53[23] = 0;
  v53[24] = 0;
  *(double *)&v53[25] = width;
  *(double *)&v53[26] = height;
  v55 = v31;
  *(double *)&v53[27] = v28;
  *(double *)&v53[28] = v30;
  *(double *)&v53[29] = v24;
  *(double *)&v53[30] = v26;
  v56 = v14;
  *(double *)&v53[31] = v52;
  v53[32] = v51;
  v53[33] = v50;
  v53[34] = v49;
  v57 = 0;
  v53[35] = 0;
  v53[36] = (unint64_t)width;
  v53[4] = self;
  v53[5] = self;
  v58 = 0;
  v53[37] = (unint64_t)height;
  v53[38] = 0;
  v53[39] = 0;
  v59 = v32;
  v53[6] = &v68;
  v53[7] = &v64;
  v60 = v33;
  v61 = v16;
  v62 = v34;
  v63 = v35;
  -[TSDGPUDataBuffer updateMetalDataBufferAttributes:withBlock:](-[TSDGPUParticleSystem dataBuffer](self, "dataBuffer"), "updateMetalDataBufferAttributes:withBlock:", v18, v53);
  visibilities = self->_visibilities;
  if (*((_BYTE *)v69 + 24))
  {
    if (visibilities)
    {
      free(visibilities);
      self->_visibilities = 0;
    }
    goto LABEL_49;
  }
  if (!visibilities)
LABEL_49:
    self->_visibleParticleCount = -[TSDGPUParticleSystem particleCount](self, "particleCount");
  self->_shouldDraw = *((_BYTE *)v65 + 24);
  self->_isInitialized = 1;
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
}

void __64__TSDGPUParticleSystem_Private__p_setupParticleDataWithTexture___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  double v45;
  unint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  double width;
  double height;
  double x;
  double y;
  double v54;
  uint64_t v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double MaxPoint;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  int v77;
  double MaxX;
  unint64_t MaxY;
  unint64_t v80;
  double v81;
  float v82;
  float v83;
  float32x2_t v84;
  unint64_t v85;
  char v86;
  int v87;
  double v88;
  double v89;
  unint64_t v90;
  unint64_t v91;
  double v92;
  double v93;
  int v94;
  float v95;
  float v96;
  uint64_t v97;
  float v98;
  unsigned int v99;
  uint64_t v100;
  int8x8_t v101;
  uint64x2_t v102;
  int v103;
  uint64_t v104;
  double v105;
  unint64_t v106;
  double v107;
  float v108;
  float v109;
  float32x2_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  double v115;
  unint64_t v116;
  unint64_t v117;
  _DWORD *v118;
  int v119;
  int v120;
  double MinX;
  CGFloat MinY;
  float v123;
  double v124;
  CGFloat v125;
  float v126;
  double v127;
  CGFloat v128;
  float v129;
  double v130;
  CGFloat v131;
  float v132;
  unint64_t v133;
  float *v134;
  float v135;
  float v136;
  float v137;
  float MidY;
  double MidX;
  unint64_t v140;
  uint64_t v141;
  BOOL v142;
  unint64_t v143;
  float *v144;
  double v145;
  float v146;
  double v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  unint64_t v154;
  float v155;
  float v156;
  float v157;
  float v158;
  float v159;
  float v160;
  unint64_t v161;
  double v162;
  unint64_t v163;
  float v164;
  float v165;
  float v166;
  float v167;
  float v168;
  unint64_t v169;
  float v170;
  float v171;
  float v172;
  float v173;
  float v174;
  float v175;
  float v176;
  float v177;
  unint64_t v178;
  _QWORD *v179;
  float v180;
  float v181;
  float v182;
  float v183;
  CGFloat v184;
  unint64_t v185;
  unint64_t v186;
  double v187;
  double v188;
  CGFloat v189;
  CGFloat v190;
  double v191;
  double v192;
  double v193;
  double v194;
  float64x2_t v195;
  double v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  uint64_t v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  uint64_t v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  uint64_t v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  uint64_t v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  uint64_t v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  uint64_t v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  uint64_t v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  uint64_t v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  uint64_t v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  uint64_t v262;
  float v263;
  _DWORD v264[7];
  uint64_t v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;

  v265 = *MEMORY[0x24BDAC8D0];
  v259 = xmmword_217C2A388;
  v260 = unk_217C2A398;
  v261 = xmmword_217C2A3A8;
  v262 = 0;
  v257 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v258 = unk_217C2A378;
  v3 = *(_QWORD *)(a1 + 64);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a2 + 88 * v3;
    v5 = *(_OWORD *)(v4 + 48);
    v259 = *(_OWORD *)(v4 + 32);
    v260 = v5;
    v261 = *(_OWORD *)(v4 + 64);
    v262 = *(_QWORD *)(v4 + 80);
    v6 = *(_OWORD *)(v4 + 16);
    v257 = *(_OWORD *)v4;
    v258 = v6;
  }
  v253 = xmmword_217C2A388;
  v254 = unk_217C2A398;
  v255 = xmmword_217C2A3A8;
  v256 = 0;
  v251 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v252 = unk_217C2A378;
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = a2 + 88 * v7;
    v9 = *(_OWORD *)(v8 + 48);
    v253 = *(_OWORD *)(v8 + 32);
    v254 = v9;
    v255 = *(_OWORD *)(v8 + 64);
    v256 = *(_QWORD *)(v8 + 80);
    v10 = *(_OWORD *)(v8 + 16);
    v251 = *(_OWORD *)v8;
    v252 = v10;
  }
  v247 = xmmword_217C2A388;
  v248 = unk_217C2A398;
  v249 = xmmword_217C2A3A8;
  v250 = 0;
  v245 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v246 = unk_217C2A378;
  v11 = *(_QWORD *)(a1 + 80);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = a2 + 88 * v11;
    v13 = *(_OWORD *)(v12 + 48);
    v247 = *(_OWORD *)(v12 + 32);
    v248 = v13;
    v249 = *(_OWORD *)(v12 + 64);
    v250 = *(_QWORD *)(v12 + 80);
    v14 = *(_OWORD *)(v12 + 16);
    v245 = *(_OWORD *)v12;
    v246 = v14;
  }
  v241 = xmmword_217C2A388;
  v242 = unk_217C2A398;
  v243 = xmmword_217C2A3A8;
  v244 = 0;
  v239 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v240 = unk_217C2A378;
  v15 = *(_QWORD *)(a1 + 88);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = a2 + 88 * v15;
    v17 = *(_OWORD *)(v16 + 48);
    v241 = *(_OWORD *)(v16 + 32);
    v242 = v17;
    v243 = *(_OWORD *)(v16 + 64);
    v244 = *(_QWORD *)(v16 + 80);
    v18 = *(_OWORD *)(v16 + 16);
    v239 = *(_OWORD *)v16;
    v240 = v18;
  }
  v235 = xmmword_217C2A388;
  v236 = unk_217C2A398;
  v237 = xmmword_217C2A3A8;
  v238 = 0;
  v233 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v234 = unk_217C2A378;
  v19 = *(_QWORD *)(a1 + 96);
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = a2 + 88 * v19;
    v21 = *(_OWORD *)(v20 + 48);
    v235 = *(_OWORD *)(v20 + 32);
    v236 = v21;
    v237 = *(_OWORD *)(v20 + 64);
    v238 = *(_QWORD *)(v20 + 80);
    v22 = *(_OWORD *)(v20 + 16);
    v233 = *(_OWORD *)v20;
    v234 = v22;
  }
  v229 = xmmword_217C2A388;
  v230 = unk_217C2A398;
  v231 = xmmword_217C2A3A8;
  v232 = 0;
  v227 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v228 = unk_217C2A378;
  v23 = *(_QWORD *)(a1 + 104);
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = a2 + 88 * v23;
    v25 = *(_OWORD *)(v24 + 48);
    v229 = *(_OWORD *)(v24 + 32);
    v230 = v25;
    v231 = *(_OWORD *)(v24 + 64);
    v232 = *(_QWORD *)(v24 + 80);
    v26 = *(_OWORD *)(v24 + 16);
    v227 = *(_OWORD *)v24;
    v228 = v26;
  }
  v223 = xmmword_217C2A388;
  v224 = unk_217C2A398;
  v225 = xmmword_217C2A3A8;
  v226 = 0;
  v221 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v222 = unk_217C2A378;
  v27 = *(_QWORD *)(a1 + 112);
  if (v27 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = a2 + 88 * v27;
    v29 = *(_OWORD *)(v28 + 48);
    v223 = *(_OWORD *)(v28 + 32);
    v224 = v29;
    v225 = *(_OWORD *)(v28 + 64);
    v226 = *(_QWORD *)(v28 + 80);
    v30 = *(_OWORD *)(v28 + 16);
    v221 = *(_OWORD *)v28;
    v222 = v30;
  }
  v217 = xmmword_217C2A388;
  v218 = unk_217C2A398;
  v219 = xmmword_217C2A3A8;
  v220 = 0;
  v215 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v216 = unk_217C2A378;
  v31 = *(_QWORD *)(a1 + 120);
  if (v31 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = a2 + 88 * v31;
    v33 = *(_OWORD *)(v32 + 48);
    v217 = *(_OWORD *)(v32 + 32);
    v218 = v33;
    v219 = *(_OWORD *)(v32 + 64);
    v220 = *(_QWORD *)(v32 + 80);
    v34 = *(_OWORD *)(v32 + 16);
    v215 = *(_OWORD *)v32;
    v216 = v34;
  }
  v211 = xmmword_217C2A388;
  v212 = unk_217C2A398;
  v213 = xmmword_217C2A3A8;
  v214 = 0;
  v209 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v210 = unk_217C2A378;
  v35 = *(_QWORD *)(a1 + 128);
  if (v35 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v36 = a2 + 88 * v35;
    v37 = *(_OWORD *)(v36 + 48);
    v211 = *(_OWORD *)(v36 + 32);
    v212 = v37;
    v213 = *(_OWORD *)(v36 + 64);
    v214 = *(_QWORD *)(v36 + 80);
    v38 = *(_OWORD *)(v36 + 16);
    v209 = *(_OWORD *)v36;
    v210 = v38;
  }
  v205 = xmmword_217C2A388;
  v206 = unk_217C2A398;
  v207 = xmmword_217C2A3A8;
  v208 = 0;
  v203 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  v204 = unk_217C2A378;
  v39 = *(_QWORD *)(a1 + 136);
  if (v39 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v40 = a2 + 88 * v39;
    v41 = *(_OWORD *)(v40 + 48);
    v205 = *(_OWORD *)(v40 + 32);
    v206 = v41;
    v207 = *(_OWORD *)(v40 + 64);
    v208 = *(_QWORD *)(v40 + 80);
    v42 = *(_OWORD *)(v40 + 16);
    v203 = *(_OWORD *)v40;
    v204 = v42;
  }
  v43 = *(_QWORD *)(a1 + 144);
  if (!v43)
    return;
  v186 = 0;
  v44 = *(_QWORD *)(a1 + 152);
  v45 = 1.0;
  do
  {
    if (!v44)
      goto LABEL_146;
    v46 = 0;
    v47 = (double)v186;
    v191 = (double)v186;
    do
    {
      v48 = objc_msgSend(*(id *)(a1 + 32), "indexFromPoint:", (double)v46, v47, v186);
      v49 = *(_QWORD *)(a1 + 160);
      width = *(double *)(a1 + 168);
      height = *(double *)(a1 + 176);
      x = width * (double)v46;
      y = height * v47;
      if (*(_BYTE *)(a1 + 320) && (v46 == *(_QWORD *)(a1 + 152) - 1 || v186 == *(_QWORD *)(a1 + 144) - 1))
      {
        v266.origin.x = width * (double)v46;
        v266.origin.y = y;
        v266.size.width = *(CGFloat *)(a1 + 168);
        v266.size.height = *(CGFloat *)(a1 + 176);
        v267 = CGRectIntersection(v266, *(CGRect *)(a1 + 184));
        x = v267.origin.x;
        y = v267.origin.y;
        width = v267.size.width;
        height = v267.size.height;
      }
      v192 = (double)v46;
      if (*(_BYTE *)(a1 + 321))
      {
        v195 = vdivq_f64(*(float64x2_t *)(a1 + 216), *(float64x2_t *)(a1 + 232));
        v54 = TSDMultiplyPointBySize(x, y, v195.f64[0]);
        v57 = TSDRectWithOriginAndSize(v55, v54, v56, width * v195.f64[0], vmuld_lane_f64(height, v195, 1));
      }
      else
      {
        v193 = y;
        v194 = height;
        v61 = width;
        v62 = x;
        if (!*(_BYTE *)(a1 + 322))
          goto LABEL_34;
        v63 = TSDNormalizedPointInRect(x, y, *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
        v65 = v64;
        MaxPoint = TSDRectGetMaxPoint(x, y, width, height);
        v68 = TSDNormalizedPointInRect(MaxPoint, v67, *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
        v69 = TSDRectWithPoints(v63, v65, v68);
        TSDRectFromNormalizedSubrect(*(double *)(a1 + 248), *(double *)(a1 + 256), *(double *)(a1 + 264), *(double *)(a1 + 272), v69, v70, v71, v72);
      }
      v62 = TSDRoundedRect(v57, v58, v59, v60);
      v193 = v73;
      v194 = v74;
      v61 = v75;
LABEL_34:
      v189 = y;
      v190 = x;
      v76 = v49 * v48;
      if (*(_QWORD *)(a1 + 280))
      {
        v187 = height;
        v188 = width;
        v77 = *(unsigned __int8 *)(a1 + 323);
        v268.origin.x = v62;
        v268.origin.y = v193;
        v268.size.width = v61;
        v268.size.height = v194;
        MaxX = CGRectGetMaxX(v268);
        v269.origin.x = v62;
        v269.origin.y = v193;
        v269.size.width = v61;
        v269.size.height = v194;
        MaxY = (unint64_t)CGRectGetMaxY(v269);
        v80 = (unint64_t)v193;
        v81 = 0.0;
        v83 = 0.0;
        v82 = 0.0;
        v84 = 0;
        if ((unint64_t)v193 < MaxY)
        {
          v85 = (unint64_t)MaxX;
          if (v77)
            v86 = 3;
          else
            v86 = 2;
          v87 = ~(_DWORD)v80;
          v83 = 0.0;
          v82 = 0.0;
          v84 = 0;
          do
          {
            if ((unint64_t)v62 < v85)
            {
              v88 = ((double)v80 - v193 + (double)v80 - v193) / v194 + -1.0;
              v89 = 1.0 - v88 * v88;
              v90 = (unint64_t)v62;
              do
              {
                if (v90 < *(_QWORD *)(a1 + 288))
                {
                  v91 = *(_QWORD *)(a1 + 296);
                  if (v80 < v91)
                  {
                    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 160))
                    {
                      v92 = 1.0;
                      if (v61 > 1.0)
                      {
                        v93 = ((double)v90 - v62 + (double)v90 - v62) / v61 + -1.0;
                        v92 = v89 + 1.0 - v93 * v93;
                      }
                      v196 = v92;
                      if (*(_BYTE *)(a1 + 323))
                      {
                        *(float32x2_t *)&v88 = TSDMetalColor4fWithUIntAndFormat(*(_QWORD *)(*(_QWORD *)(a1 + 280)+ 8* (int)(v90 + (*(_QWORD *)(a1 + 304) >> v86) * (v87 + v91))), *(_QWORD *)(a1 + 312));
                      }
                      else
                      {
                        v99 = *(_DWORD *)(*(_QWORD *)(a1 + 280)
                                        + 4 * (int)(v90 + (*(_QWORD *)(a1 + 304) >> v86) * (v87 + v91)));
                        if (*(_BYTE *)(a1 + 324))
                        {
                          *(float *)&v88 = TSDMetalColor4fWith32BitUIntAndFormat(v99, *(_QWORD *)(a1 + 312));
                        }
                        else
                        {
                          v101 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v99), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
                          v102.i64[0] = v101.u32[0];
                          v102.i64[1] = v101.u32[1];
                          v88 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(v102), (float64x2_t)vdupq_n_s64(0x3F700028F62B6A81uLL))));
                          v95 = (double)*(_DWORD *)(*(_QWORD *)(a1 + 280)
                                                                   + 4
                                                                   * (int)(v90
                                                                         + (*(_QWORD *)(a1 + 304) >> v86) * (v87 + v91)))
                              * 0.00390640259;
                          v96 = (double)HIBYTE(v99) * 0.00390640259;
                          v94 = HIDWORD(v88);
                        }
                      }
                      if (v96 != 0.0)
                      {
                        *(double *)&v100 = v96;
                        HIDWORD(v88) = v94;
                        v84 = vcvt_f32_f64(vaddq_f64(vdivq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&v88), v196), (float64x2_t)vdupq_lane_s64(v100, 0)), vcvtq_f64_f32(v84)));
                        v82 = v196 * v95 / *(double *)&v100 + v82;
                        v88 = v83 + v196 * *(double *)&v100;
                        v83 = v88;
                        v81 = v81 + v196;
                      }
                    }
                    else
                    {
                      v97 = (int)(v90 + (*(_QWORD *)(a1 + 304) >> v86) * (v87 + v91));
                      if (*(_BYTE *)(a1 + 323))
                      {
                        *(float *)&v88 = TSDMetalColor4fWithUIntAndFormatOnlyAlpha();
                      }
                      else
                      {
                        LOBYTE(v88) = *(_BYTE *)(*(_QWORD *)(a1 + 280) + 4 * v97 + 3);
                        v88 = (double)*(unint64_t *)&v88 * 0.00390640259;
                        v98 = v88;
                      }
                      v83 = v83 + v98;
                    }
                  }
                }
                ++v90;
              }
              while (v85 != v90);
            }
            ++v80;
            --v87;
          }
          while (v80 != MaxY);
        }
        v103 = v83 > 0.0;
        v104 = *(_QWORD *)(a1 + 40);
        v47 = v191;
        if (*(_QWORD *)(v104 + 160))
        {
          if (v83 <= 0.0 && *(_QWORD *)(v104 + 8))
          {
            v103 = 0;
            v45 = 1.0;
            v105 = (double)v46;
            height = v187;
            width = v188;
            goto LABEL_79;
          }
          if (*(_QWORD *)(a1 + 160))
          {
            v106 = 0;
            v107 = 1.0 / v81;
            if (v81 == 0.0)
              v107 = 1.0;
            v108 = v107 * v83;
            v109 = v107 * v82;
            v110 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v84), v107));
            do
            {
              v199 = v211;
              v200 = v212;
              v201 = v213;
              v202 = v214;
              v197 = v209;
              v198 = v210;
              TSDGPUUpdateDataSetMetalPoint4DAtIndex((uint64_t)&v197, v76 + v106++, v110.f32[0], v110.f32[1], v109, v108);
            }
            while (v106 < *(_QWORD *)(a1 + 160));
          }
        }
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
        {
          v45 = 1.0;
          v105 = (double)v46;
          height = v187;
          width = v188;
          goto LABEL_82;
        }
        v45 = 1.0;
        height = v187;
        width = v188;
        if (v83 <= 0.0)
        {
          v103 = 0;
          v105 = (double)v46;
          goto LABEL_79;
        }
      }
      else
      {
        v47 = v191;
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
        {
          v103 = 1;
          v105 = (double)v46;
          goto LABEL_82;
        }
      }
      v105 = (double)v46;
      if (*(_BYTE *)(a1 + 325))
        v103 = objc_msgSend(*(id *)(a1 + 32), "visibilityAtIndexPoint:", v192, v47);
      else
        v103 = 1;
LABEL_79:
      v111 = *(_QWORD *)(a1 + 160);
      if (v111)
      {
        v112 = v76;
        do
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v112++) = v103;
          --v111;
        }
        while (v111);
      }
LABEL_82:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) &= v103;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= v103;
      v113 = *(_QWORD *)(a1 + 40);
      if (v103)
      {
        ++*(_QWORD *)(v113 + 88);
      }
      else if (*(_QWORD *)(v113 + 8))
      {
        goto LABEL_144;
      }
      if (*(_BYTE *)(a1 + 326))
      {
        objc_msgSend(*(id *)(a1 + 32), "startingPointAtIndexPoint:", v105, v47);
        v189 = v115;
        v190 = v114;
      }
      if (*(_BYTE *)(a1 + 327))
      {
        v116 = *(_QWORD *)(a1 + 160);
        if (!v116)
          goto LABEL_97;
        v117 = 0;
        v118 = v264;
        do
        {
          objc_msgSend(*(id *)(a1 + 32), "vertexPositionAtVertexIndex:particleIndexPoint:", v117, v105, v47);
          *(v118 - 1) = v119;
          *v118 = v120;
          ++v117;
          v116 = *(_QWORD *)(a1 + 160);
          v118 += 2;
        }
        while (v117 < v116);
      }
      else
      {
        v270.origin.x = v190;
        v270.origin.y = v189;
        v270.size.width = width;
        v270.size.height = height;
        MinX = CGRectGetMinX(v270);
        v271.origin.x = v190;
        v45 = 1.0;
        v271.origin.y = v189;
        v271.size.width = width;
        v271.size.height = height;
        MinY = CGRectGetMinY(v271);
        v123 = MinX;
        *(float *)&MinY = MinY;
        v263 = v123;
        v264[0] = LODWORD(MinY);
        v116 = *(_QWORD *)(a1 + 160);
        if (v116 >= 2)
        {
          v272.origin.x = v190;
          v272.origin.y = v189;
          v272.size.width = width;
          v272.size.height = height;
          v124 = CGRectGetMaxX(v272);
          v273.origin.x = v190;
          v273.origin.y = v189;
          v273.size.width = width;
          v273.size.height = height;
          v125 = CGRectGetMinY(v273);
          v126 = v124;
          *(float *)&v125 = v125;
          *(float *)&v264[1] = v126;
          v264[2] = LODWORD(v125);
          v274.origin.x = v190;
          v274.origin.y = v189;
          v274.size.width = width;
          v274.size.height = height;
          v127 = CGRectGetMaxX(v274);
          v275.origin.x = v190;
          v275.origin.y = v189;
          v275.size.width = width;
          v275.size.height = height;
          v128 = CGRectGetMaxY(v275);
          v129 = v127;
          *(float *)&v128 = v128;
          *(float *)&v264[3] = v129;
          v264[4] = LODWORD(v128);
          v276.origin.x = v190;
          v276.origin.y = v189;
          v276.size.width = width;
          v276.size.height = height;
          v130 = CGRectGetMinX(v276);
          v277.origin.x = v190;
          v45 = 1.0;
          v277.origin.y = v189;
          v277.size.width = width;
          v277.size.height = height;
          v131 = CGRectGetMaxY(v277);
          v132 = v130;
          *(float *)&v131 = v131;
          *(float *)&v264[5] = v132;
          v264[6] = LODWORD(v131);
          v116 = *(_QWORD *)(a1 + 160);
        }
      }
      if (v116)
      {
        v133 = 0;
        v134 = (float *)v264;
        do
        {
          v199 = v259;
          v200 = v260;
          v201 = v261;
          v202 = v262;
          v197 = v257;
          v198 = v258;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + v133++, *(v134 - 1), *v134);
          v116 = *(_QWORD *)(a1 + 160);
          v134 += 2;
        }
        while (v133 < v116);
      }
LABEL_97:
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 136))
      {
        if (*(_BYTE *)(a1 + 327))
        {
          objc_msgSend(*(id *)(a1 + 32), "centerAtIndexPoint:", v105, v47);
          v136 = v135;
          MidY = v137;
        }
        else
        {
          v278.origin.x = v190;
          v278.origin.y = v189;
          v278.size.width = width;
          v278.size.height = height;
          MidX = CGRectGetMidX(v278);
          v279.origin.x = v190;
          v45 = 1.0;
          v279.origin.y = v189;
          v279.size.width = width;
          v279.size.height = height;
          v136 = MidX;
          MidY = CGRectGetMidY(v279);
        }
        if (!*(_QWORD *)(a1 + 160))
          goto LABEL_111;
        v140 = 0;
        do
        {
          v199 = v241;
          v200 = v242;
          v201 = v243;
          v202 = v244;
          v197 = v239;
          v198 = v240;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + v140++, v136, MidY);
          v116 = *(_QWORD *)(a1 + 160);
        }
        while (v140 < v116);
        v105 = (double)v46;
      }
      v141 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v141 + 144))
        v142 = v116 == 0;
      else
        v142 = 1;
      if (v142)
        goto LABEL_112;
      v143 = 0;
      v144 = (float *)v264;
      do
      {
        v145 = *(v144 - 1) / *(double *)(a1 + 232);
        v146 = *v144;
        v144 += 2;
        v147 = v45 - v146 / *(double *)(a1 + 240);
        *(float *)&v145 = v145;
        v199 = v253;
        v200 = v254;
        v201 = v255;
        v202 = v256;
        *(float *)&v147 = v147;
        v197 = v251;
        v198 = v252;
        TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + v143++, *(float *)&v145, *(float *)&v147);
      }
      while (v143 < *(_QWORD *)(a1 + 160));
LABEL_111:
      v141 = *(_QWORD *)(a1 + 40);
      v105 = (double)v46;
LABEL_112:
      if (*(_QWORD *)(v141 + 152))
      {
        v199 = v247;
        v200 = v248;
        v201 = v249;
        v202 = v250;
        v197 = v245;
        v198 = v246;
        TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76, 0.0, 0.0);
        if (*(_QWORD *)(a1 + 160) >= 2uLL)
        {
          v199 = v247;
          v200 = v248;
          v201 = v249;
          v202 = v250;
          v197 = v245;
          v198 = v246;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + 1, 1.0, 0.0);
          v199 = v247;
          v200 = v248;
          v201 = v249;
          v202 = v250;
          v197 = v245;
          v198 = v246;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + 2, 1.0, 1.0);
          v199 = v247;
          v200 = v248;
          v201 = v249;
          v202 = v250;
          v197 = v245;
          v198 = v246;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + 3, 0.0, 1.0);
        }
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 176))
      {
        objc_msgSend(*(id *)(a1 + 32), "speedAtIndexPoint:", v105, v47);
        if (*(_QWORD *)(a1 + 160))
        {
          v151 = v148;
          v152 = v149;
          v153 = v150;
          v154 = 0;
          do
          {
            v199 = v235;
            v200 = v236;
            v201 = v237;
            v202 = v238;
            v197 = v233;
            v198 = v234;
            TSDGPUUpdateDataSetMetalPoint3DAtIndex((uint64_t)&v197, v76 + v154++, v151, v152, v153);
          }
          while (v154 < *(_QWORD *)(a1 + 160));
        }
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184))
      {
        objc_msgSend(*(id *)(a1 + 32), "rotationAtIndexPoint:", v105, v47);
        if (*(_QWORD *)(a1 + 160))
        {
          v158 = v155;
          v159 = v156;
          v160 = v157;
          v161 = 0;
          do
          {
            v199 = v229;
            v200 = v230;
            v201 = v231;
            v202 = v232;
            v197 = v227;
            v198 = v228;
            TSDGPUUpdateDataSetMetalPoint3DAtIndex((uint64_t)&v197, v76 + v161++, v158, v159, v160);
          }
          while (v161 < *(_QWORD *)(a1 + 160));
        }
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 192))
      {
        objc_msgSend(*(id *)(a1 + 32), "scaleAtIndexPoint:", v105, v47);
        if (*(_QWORD *)(a1 + 160))
        {
          v163 = 0;
          v164 = v162;
          do
          {
            v199 = v223;
            v200 = v224;
            v201 = v225;
            v202 = v226;
            v197 = v221;
            v198 = v222;
            TSDGPUUpdateDataSetMetalFloatAtIndex((uint64_t)&v197, v76 + v163++, v164);
          }
          while (v163 < *(_QWORD *)(a1 + 160));
        }
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 168))
      {
        objc_msgSend(*(id *)(a1 + 32), "lifeSpanAtIndexPoint:", v105, v47);
        if (*(_QWORD *)(a1 + 160))
        {
          v167 = v165;
          v168 = v166;
          v169 = 0;
          do
          {
            v199 = v217;
            v200 = v218;
            v201 = v219;
            v202 = v220;
            v197 = v215;
            v198 = v216;
            TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + v169++, v167, v168);
          }
          while (v169 < *(_QWORD *)(a1 + 160));
        }
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 160))
      {
        if (*(_BYTE *)(a1 + 328))
        {
          objc_msgSend(*(id *)(a1 + 32), "colorAtIndexPoint:", v192, v47);
          if (*(_QWORD *)(a1 + 160))
          {
            v174 = v170;
            v175 = v171;
            v176 = v172;
            v177 = v173;
            v178 = 0;
            do
            {
              v199 = v211;
              v200 = v212;
              v201 = v213;
              v202 = v214;
              v197 = v209;
              v198 = v210;
              TSDGPUUpdateDataSetMetalPoint4DAtIndex((uint64_t)&v197, v76 + v178++, v174, v175, v176, v177);
            }
            while (v178 < *(_QWORD *)(a1 + 160));
          }
        }
      }
      v179 = *(_QWORD **)(a1 + 40);
      if (v179[25])
      {
        if (*(_BYTE *)(a1 + 329))
        {
          objc_msgSend(v179, "colorTexCoordAtIndexPoint:", v192, v191);
          v181 = v180;
          v183 = v182;
        }
        else
        {
          v280.origin.x = v62;
          v280.origin.y = v193;
          v280.size.width = v61;
          v280.size.height = v194;
          v184 = CGRectGetMidX(v280) / *(double *)(a1 + 216);
          v281.origin.x = v62;
          v281.origin.y = v193;
          v281.size.width = v61;
          v281.size.height = v194;
          v181 = v184;
          v45 = 1.0;
          v183 = 1.0 - CGRectGetMidY(v281) / *(double *)(a1 + 224);
        }
        if (*(_QWORD *)(a1 + 160))
        {
          v185 = 0;
          do
          {
            v199 = v205;
            v200 = v206;
            v201 = v207;
            v202 = v208;
            v197 = v203;
            v198 = v204;
            TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v197, v76 + v185++, v181, v183);
          }
          while (v185 < *(_QWORD *)(a1 + 160));
        }
      }
      v47 = v191;
LABEL_144:
      ++v46;
      v44 = *(_QWORD *)(a1 + 152);
    }
    while (v46 < v44);
    v43 = *(_QWORD *)(a1 + 144);
LABEL_146:
    ++v186;
  }
  while (v186 < v43);
}

- (void)p_setupVertexData
{
  unint64_t v3;
  uint64_t v4;
  BOOL *visibilities;
  unint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  TSDGPUDataBuffer *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  BOOL *v18;
  NSArray *obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[TSDGPUParticleSystem shouldDraw](self, "shouldDraw"))
  {
    v3 = -[TSDGPUParticleSystem particleCount](self, "particleCount");
    v4 = objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle") * v3;
    visibilities = self->_visibilities;
    v6 = v4;
    if (visibilities)
    {
      v6 = 0;
      if (v4)
      {
        v7 = v4;
        do
        {
          v8 = *visibilities++;
          v6 += v8;
          --v7;
        }
        while (v7);
      }
    }
    self->_particleCount = v6 / objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle");
    self->_visibleParticleCount = -[TSDGPUParticleSystem particleCount](self, "particleCount");
    if (v6 != v4)
    {
      v9 = -[TSDGPUParticleSystem dataBuffer](self, "dataBuffer");
      -[TSDGPUParticleSystem p_setupDataBufferWithParticleCount:visibleParticleCount:](self, "p_setupDataBufferWithParticleCount:visibleParticleCount:", self->_particleCount, self->_visibleParticleCount);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      obj = -[TSDGPUDataBuffer vertexAttributes](v9, "vertexAttributes");
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v20 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v20)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v14 = -[TSDGPUDataBuffer vertexAttributeNamed:](-[TSDGPUParticleSystem dataBuffer](self, "dataBuffer"), "vertexAttributeNamed:", objc_msgSend(v13, "name"));
            if (v4)
            {
              v15 = v14;
              v16 = 0;
              v17 = 0;
              do
              {
                if (self->_visibilities[v16])
                  -[TSDGPUDataBuffer setDataForAttribute:atIndex:fromAttribute:dataBuffer:index:](-[TSDGPUParticleSystem dataBuffer](self, "dataBuffer"), "setDataForAttribute:atIndex:fromAttribute:dataBuffer:index:", v15, v17++, v13, v9, v16);
                ++v16;
              }
              while (v4 != v16);
            }
          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);
      }

      v18 = self->_visibilities;
      if (v18)
      {
        free(v18);
        self->_visibilities = 0;
      }
    }
    self->_isDataBufferInitialized = 1;
  }
}

- (CGSize)p_resizeSystemToFitWithinMaxVerticesWithSystemSize:(CGSize)a3
{
  double height;
  unint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  v4 = (unint64_t)(a3.width * a3.height);
  v5 = 0xFFFFuLL / objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle");
  if (v5 >= v4)
    v5 = v4;
  v6 = (double)(unint64_t)((double)v5 / height);
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)p_reverseParticleDataDrawOrder
{
  void *v2;
  uint64_t v3;

  if (-[TSDGPUParticleSystem shouldDraw](self, "shouldDraw"))
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUParticleSystem(Private) p_reverseParticleDataDrawOrder]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 1022, CFSTR("Reversing particle order is not yet implemented, but probably should be if you're calling this!"));
  }
}

+ (CGSize)p_particleSystemSizeWithRequestedNumber:(unint64_t)a3 objectSize:(CGSize)a4
{
  double height;
  double width;
  double i;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  int v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGSize result;

  height = a4.height;
  width = a4.width;
  i = a4.height;
  v8 = objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle");
  v9 = 0xFFFF / v8;
  if (0xFFFF / v8 < a3)
    a3 = 0xFFFF / v8;
  v10 = width == *MEMORY[0x24BDBF148] && i == *(double *)(MEMORY[0x24BDBF148] + 8);
  if (!v10
    && ((v11 = objc_msgSend((id)objc_opt_class(), "willOverrideStartingPoints"), a3 != 1) ? (v12 = v11 == 0) : (v12 = 0),
        v12))
  {
    v13 = width;
    if (width * height > (double)a3)
    {
      if (a3)
      {
        v15 = round(sqrt(width * height));
        v16 = (unint64_t)(ceil(width / v15) * ceil(height / v15));
        if (a3 <= v16)
        {
          do
          {
            v19 = v16;
            v15 = v15 + 1.0;
            v16 = (unint64_t)(ceil(width / v15) * ceil(height / v15));
          }
          while (v15 > 2.0 && v16 > a3);
          v18 = 2.0;
          if (v15 > 2.0)
          {
            v20 = v16 - a3;
            if (v20 < 0)
              v20 = -v20;
            v21 = v19 - a3;
            if (v21 < 0)
              v21 = -v21;
            if (v20 <= (unint64_t)v21)
              v18 = v15;
            else
              v18 = v15 + -1.0;
          }
        }
        else
        {
          do
          {
            v17 = v16;
            v15 = v15 + -1.0;
            v16 = (unint64_t)(ceil(width / v15) * ceil(height / v15));
          }
          while (v15 > 2.0 && a3 > v16);
          v18 = 2.0;
          if (v15 > 2.0)
          {
            if (vabdd_f64((double)v16, (double)a3) <= vabdd_f64((double)v17, (double)a3))
              v18 = v15;
            else
              v18 = v15 + 1.0;
          }
        }
        v13 = ceil(width / v18);
        for (i = ceil(height / v18); v9 < (unint64_t)(v13 * i); i = ceil(height / v18))
        {
          v18 = v18 + 1.0;
          v13 = ceil(width / v18);
        }
      }
      else
      {
        i = 1.0;
        v13 = 1.0;
      }
    }
  }
  else
  {
    v13 = (double)a3;
    i = 1.0;
  }
  v14 = i;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)p_logParticleInformation
{
  BOOL *visibilities;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL *v7;

  NSLog((NSString *)CFSTR("%@"), a2, self);
  visibilities = self->_visibilities;
  v4 = -[TSDGPUParticleSystem particleCount](self, "particleCount");
  if (visibilities)
  {
    if (v4)
    {
      v5 = 0;
      LODWORD(v6) = 0;
      do
      {
        v7 = self->_visibilities;
        v6 = v6 + v7[objc_msgSend((id)objc_opt_class(), "numberOfVerticesPerParticle") * v5++];
      }
      while (v5 < -[TSDGPUParticleSystem particleCount](self, "particleCount"));
    }
    else
    {
      v6 = 0;
    }
    NSLog((NSString *)CFSTR("TSDGPUParticleSystem: Particles visible: %i (%.1f%%)"), v6, (double)(int)v6 / (double)-[TSDGPUParticleSystem particleCount](self, "particleCount") * 100.0);
  }
  else
  {
    NSLog((NSString *)CFSTR("TSDGPUParticleSystem: Particles visible: %li (ALL)"), v4);
  }
}

@end
