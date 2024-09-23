@implementation KNShimmerParticleSystem

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  __double2 v25;
  CGPoint result;

  v4 = 4 * (_QWORD)-[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v6 = objc_msgSend(v5, "vertexCount");

  if (v4 >= (unint64_t)v6)
  {
    -[KNShimmerParticleSystem objectSize](self, "objectSize");
    v16 = v15 * 0.5;
    v17 = -[KNShimmerParticleSystem objectSize](self, "objectSize");
    v19 = v18 * 0.5;
    v21 = TSURandomBetween(v17, v20, 0.0, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem randomGenerator](self, "randomGenerator"));
    objc_msgSend(v22, "doubleBetween::", 0.0, 6.28318531);
    v24 = v23;

    v25 = __sincos_stret(v24);
    v13 = v16 + v16 * v21 * v25.__cosval;
    v14 = v19 + v21 * v19 * v25.__sinval;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem objectDataBufferAttributePosition](self, "objectDataBufferAttributePosition"));
    objc_msgSend(v7, "metalPoint2DForAttribute:atIndex:", v8, v4);
    v10 = v9;
    v12 = v11;

    v13 = v10;
    v14 = v12;
  }
  result.y = v14;
  result.x = v13;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = 4 * (_QWORD)-[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v6 = objc_msgSend(v5, "vertexCount");

  if (v4 >= (unint64_t)v6)
  {
    v10 = TSDMetalPoint3DZero[0];
    v12 = TSDMetalPoint3DZero[1];
    v14 = TSDMetalPoint3DZero[2];
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem objectDataBufferAttributeSpeed](self, "objectDataBufferAttributeSpeed"));
    objc_msgSend(v7, "metalPoint3DForAttribute:atIndex:", v8, v4);
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  v15 = v10;
  v16 = v12;
  v17 = v14;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  double v3;

  v3 = TSURandomBetween(self, a2, 0.0, 1.0);
  return TSUMix(1.0, 25.0, v3 * v3);
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  id v4;
  void *v5;
  id v6;
  float v7;
  float v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = -[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v6 = objc_msgSend(v5, "vertexCount");

  if ((unint64_t)v6 <= 4 * (uint64_t)v4)
  {
    v9 = -[KNShimmerParticleSystem duration](self, "duration");
    v11 = fmin(2.0 / v10, 0.9);
    v12 = TSURandom(v9);
    v13 = TSUReverseSquare(v12);
    v15 = TSDMixFloats(v14, 0.01, 0.99, 1.0 - v13);
    v16 = v11 * TSUReverseSquare(v15);
    v17 = 0.99 - v16;
    if (v15 < 0.99 - v16)
      v17 = v15;
    v8 = v17;
    v7 = v16;
  }
  else
  {
    v7 = 1.0;
    v8 = 0.0;
  }
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

+ (BOOL)willOverrideColors
{
  return 1;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3
{
  id v4;
  void *v5;
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = -[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v6 = objc_msgSend(v5, "vertexCount");

  v7 = 1.0;
  if ((unint64_t)v6 > 4 * (uint64_t)v4)
    v7 = 0.0;
  v8 = v7;
  v9 = v7;
  v10 = v7;
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BOOL)willOverrideColorTexCoords
{
  return 1;
}

- ($94F468A8D4C62B317260615823C2B210)colorTexCoordAtIndexPoint:(CGPoint)a3
{
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = 4 * (_QWORD)-[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v6 = objc_msgSend(v5, "vertexCount");

  if (v4 >= (unint64_t)v6)
  {
    v13 = 0.0;
    v14 = 0.0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem objectDataBufferAttributeColorTexCoord](self, "objectDataBufferAttributeColorTexCoord"));
    objc_msgSend(v7, "metalPoint2DForAttribute:atIndex:", v8, v4);
    v10 = v9;
    v12 = v11;

    v13 = v10;
    v14 = v12;
  }
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)drawWithPercent:(double)a3 opacity:(double)a4 rotation:(double)a5 clockwise:(BOOL)a6 texture:(id)a7 context:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float32x2_t v20;
  KNShimmerSystem v21;
  TSDGPUDataBufferAttribute *v22;
  float v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGAffineTransform v32;

  v9 = a6;
  v13 = a7;
  v14 = a8;
  v15 = -a3;
  if (v9)
    v15 = a3;
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeRotation(&v32, v15 + v15);
  v16 = pow(1.0 - a3, 15.0);
  v17 = TSUMix((1.0 - a3) * (1.0 - a3), a3 * 25.0, v16);
  if (v14)
  {
    v18 = a3;
    v19 = a4;
    *(float *)&self[1]._objectDataBufferAttributeColorTexCoord = v18;
    *((float *)&self[1]._objectDataBufferAttributeColorTexCoord + 1) = v19;
    v20 = vcvt_f32_f64(*(float64x2_t *)&v32.a);
    v21 = (KNShimmerSystem)vcvt_f32_f64(*(float64x2_t *)&v32.c);
    v22 = (TSDGPUDataBufferAttribute *)vcvt_f32_f64(*(float64x2_t *)&v32.tx);
    *(_DWORD *)&self[1]._vertexUniforms.ShouldSample = 0;
    *(float32x2_t *)&self[1]._vertexUniforms.ParticleScalePercent = v20;
    LODWORD(self[2]._objectSystem) = 0;
    self[2].super = v21;
    LODWORD(self[2]._objectDataBufferAttributePosition) = 1065353216;
    self[2]._objectDataBufferAttributeColor = v22;
    v23 = v17;
    self[1]._vertexUniforms.Percent = v23;
    -[KNShimmerSystem speedMax](self, "speedMax");
    *(float *)&v24 = v24;
    LODWORD(self[2]._objectDataBufferAttributeSpeed) = LODWORD(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metalTextureWithContext:", v14));
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "renderEncoder"));
      objc_msgSend(v26, "setVertexBytes:length:atIndex:", &self->_vertexUniforms, 256, 1);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem vertexColorTexture](self->_objectSystem, "vertexColorTexture"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "renderEncoder"));
      v29 = v28;
      if (v27)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem vertexColorTexture](self->_objectSystem, "vertexColorTexture"));
        objc_msgSend(v29, "setVertexTexture:atIndex:", v30, 0);

      }
      else
      {
        objc_msgSend(v28, "setVertexTexture:atIndex:", v25, 0);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "renderEncoder"));
      -[KNShimmerParticleSystem drawMetalWithEncoder:](self, "drawMetalWithEncoder:", v31);

    }
  }

}

+ (id)newDataBufferAttributeWithName:(id)a3
{
  uint64_t v3;

  v3 = kTSDGPUShaderAttributeParticleTexCoord;
  if (objc_msgSend(a3, "isEqualToString:", kTSDGPUShaderAttributeParticleTexCoord))
    return objc_msgSend(objc_alloc((Class)TSDGPUDataBufferAttribute), "initWithName:bufferUsage:dataType:normalized:componentCount:", v3, 35044, 3, 1, 2);
  else
    return 0;
}

- ($94F468A8D4C62B317260615823C2B210)p_hullPoint:(id)a3 inVertexRect:(CGRect)a4
{
  float v4;
  float v5;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = a4.origin.x + a4.size.width * a3.var0;
  v5 = a4.origin.y + a4.size.height * a3.var1;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)p_setupVertexData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  double v40;
  double v41;
  uint64_t v42;
  int *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  int v56;
  int v57;
  int v58;
  int v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  int v92;
  int v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  int v101;
  double v102;
  double v103;
  double v104;
  double v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  objc_super v114;

  v114.receiver = self;
  v114.super_class = (Class)KNShimmerParticleSystem;
  -[KNShimmerParticleSystem p_setupVertexData](&v114, "p_setupVertexData");
  if (objc_msgSend((id)objc_opt_class(self), "numberOfVerticesPerParticle") != &dword_4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerParticleSystem p_setupVertexData]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 765, CFSTR("Invalid verts per particle!"));

  }
  v6 = -[KNShimmerParticleSystem particleCount](self, "particleCount");
  v7 = 5 * (_QWORD)-[KNShimmerParticleSystem particleCount](self, "particleCount");
  v8 = 5 * (_QWORD)-[KNShimmerParticleSystem visibleParticleCount](self, "visibleParticleCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem positionAttribute](self, "positionAttribute"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem centerAttribute](self, "centerAttribute"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem colorAttribute](self, "colorAttribute"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem speedAttribute](self, "speedAttribute"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem scaleAttribute](self, "scaleAttribute"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem lifeSpanAttribute](self, "lifeSpanAttribute"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem colorTexCoordAttribute](self, "colorTexCoordAttribute"));
  -[KNShimmerParticleSystem p_setupDataBufferWithParticleCount:visibleParticleCount:](self, "p_setupDataBufferWithParticleCount:visibleParticleCount:", v7, v8);
  v94 = v6;
  if (v6)
  {
    v11 = 0;
    v12 = 0;
    v92 = *((_DWORD *)&TSDMetalPoint2DZero + 1);
    v93 = TSDMetalPoint2DZero;
    do
    {
      objc_msgSend(v9, "metalFloatForAttribute:atIndex:", v96, 4 * (_QWORD)v12);
      v113 = v13;
      objc_msgSend(v9, "metalPoint3DForAttribute:atIndex:", v97, 4 * (_QWORD)v12);
      v111 = v15;
      v112 = v14;
      v110 = v16;
      objc_msgSend(v9, "metalPoint4DForAttribute:atIndex:", v98, 4 * (_QWORD)v12);
      v108 = v18;
      v109 = v17;
      v106 = v20;
      v107 = v19;
      objc_msgSend(v9, "metalPoint2DForAttribute:atIndex:", v10, 4 * (_QWORD)v12);
      v22 = v21;
      v24 = v23;
      objc_msgSend(v9, "metalPoint2DForAttribute:atIndex:", v10, (4 * (_QWORD)v12) | 2);
      v27 = TSDRectWithPoints(v22, v24, v25, v26);
      v104 = v28;
      v105 = v27;
      v102 = v30;
      v103 = v29;
      objc_msgSend(v9, "metalPoint2DForAttribute:atIndex:", v99, 4 * (_QWORD)v12);
      v32 = v31;
      v34 = v33;
      objc_msgSend(v9, "metalPoint2DForAttribute:atIndex:", v95, 4 * (_QWORD)v12);
      v36 = v35;
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem colorTexCoordAttribute](self, "colorTexCoordAttribute"));

      v100 = v92;
      v101 = v93;
      if (v39)
      {
        objc_msgSend(v9, "metalPoint2DForAttribute:atIndex:", v91, 4 * (_QWORD)v12);
        v100 = LODWORD(v41);
        v101 = LODWORD(v40);
      }
      v42 = 0;
      v43 = (int *)&unk_314DD4;
      do
      {
        v44 = *(v43 - 1);
        v45 = *v43;
        LODWORD(v40) = v44;
        LODWORD(v41) = *v43;
        -[KNShimmerParticleSystem p_hullPoint:inVertexRect:](self, "p_hullPoint:inVertexRect:", v40, v41, v105, v104, v103, v102);
        v47 = v46;
        v49 = v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem positionAttribute](self, "positionAttribute"));
        LODWORD(v52) = v47;
        LODWORD(v53) = v49;
        objc_msgSend(v50, "setMetalPoint2D:forAttribute:atIndex:", v51, v11 + v42, v52, v53);

        LODWORD(v54) = v44;
        LODWORD(v55) = v45;
        -[KNShimmerParticleSystem p_hullPoint:inVertexRect:](self, "p_hullPoint:inVertexRect:", v54, v55, 0.0, 0.0, 1.0, 1.0);
        v57 = v56;
        v59 = v58;
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem particleTexCoordAttribute](self, "particleTexCoordAttribute"));
        LODWORD(v62) = v57;
        LODWORD(v63) = v59;
        objc_msgSend(v60, "setMetalPoint2D:forAttribute:atIndex:", v61, v11 + v42, v62, v63);

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem centerAttribute](self, "centerAttribute"));
        LODWORD(v66) = v32;
        LODWORD(v67) = v34;
        objc_msgSend(v64, "setMetalPoint2D:forAttribute:atIndex:", v65, v11 + v42, v66, v67);

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem colorAttribute](self, "colorAttribute"));
        LODWORD(v71) = v108;
        LODWORD(v70) = v109;
        LODWORD(v73) = v106;
        LODWORD(v72) = v107;
        objc_msgSend(v68, "setMetalPoint4D:forAttribute:atIndex:", v69, v11 + v42, v70, v71, v72, v73);

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem speedAttribute](self, "speedAttribute"));
        LODWORD(v77) = v111;
        LODWORD(v76) = v112;
        LODWORD(v78) = v110;
        objc_msgSend(v74, "setMetalPoint3D:forAttribute:atIndex:", v75, v11 + v42, v76, v77, v78);

        v79 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem scaleAttribute](self, "scaleAttribute"));
        LODWORD(v81) = v113;
        objc_msgSend(v79, "setMetalFloat:forAttribute:atIndex:", v80, v11 + v42, v81);

        v82 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem lifeSpanAttribute](self, "lifeSpanAttribute"));
        LODWORD(v84) = v36;
        LODWORD(v85) = v38;
        objc_msgSend(v82, "setMetalPoint2D:forAttribute:atIndex:", v83, v11 + v42, v84, v85);

        v86 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem colorTexCoordAttribute](self, "colorTexCoordAttribute"));
        if (v86)
        {
          v87 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem dataBuffer](self, "dataBuffer"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerParticleSystem colorTexCoordAttribute](self, "colorTexCoordAttribute"));
          LODWORD(v90) = v100;
          LODWORD(v89) = v101;
          objc_msgSend(v87, "setMetalPoint2D:forAttribute:atIndex:", v88, v11 + v42, v89, v90);

        }
        ++v42;
        v43 += 2;
      }
      while (v42 != 20);
      v12 = (char *)v12 + 1;
      v11 += 20;
    }
    while (v12 != v94);
  }

}

- (KNShimmerObjectSystem)objectSystem
{
  return self->_objectSystem;
}

- (void)setObjectSystem:(id)a3
{
  self->_objectSystem = (KNShimmerObjectSystem *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributeColor
{
  return self->_objectDataBufferAttributeColor;
}

- (void)setObjectDataBufferAttributeColor:(id)a3
{
  self->_objectDataBufferAttributeColor = (TSDGPUDataBufferAttribute *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributePosition
{
  return self->_objectDataBufferAttributePosition;
}

- (void)setObjectDataBufferAttributePosition:(id)a3
{
  self->_objectDataBufferAttributePosition = (TSDGPUDataBufferAttribute *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributeSpeed
{
  return self->_objectDataBufferAttributeSpeed;
}

- (void)setObjectDataBufferAttributeSpeed:(id)a3
{
  self->_objectDataBufferAttributeSpeed = (TSDGPUDataBufferAttribute *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributeColorTexCoord
{
  return self->_objectDataBufferAttributeColorTexCoord;
}

- (void)setObjectDataBufferAttributeColorTexCoord:(id)a3
{
  self->_objectDataBufferAttributeColorTexCoord = (TSDGPUDataBufferAttribute *)a3;
}

- ($ECD866EDE069D90F7D69854631A09708)vertexUniforms
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(_OWORD *)&self[12].var6;
  *(_OWORD *)&retstr[9].var5 = *(_OWORD *)&self[12].var1;
  *(_OWORD *)&retstr[10].var3 = v2;
  v3 = *(_OWORD *)&self[14].var3;
  *(_OWORD *)&retstr[11].var2 = *(_OWORD *)&self[13].var5;
  *(_OWORD *)&retstr[12].var1 = v3;
  v4 = *(_OWORD *)&self[9].var5;
  *(_OWORD *)&retstr[6].var3 = *(_OWORD *)&self[8].var6;
  *(_OWORD *)&retstr[7].var2 = v4;
  v5 = *(_OWORD *)&self[11].var2;
  *(_OWORD *)&retstr[8].var1 = *(_OWORD *)&self[10].var3;
  *(_OWORD *)&retstr[8].var6 = v5;
  v6 = *(_OWORD *)&self[6].var3;
  *(_OWORD *)&retstr[3].var2 = *(_OWORD *)&self[5].var5;
  *(_OWORD *)&retstr[4].var1 = v6;
  v7 = *(_OWORD *)&self[8].var1;
  *(_OWORD *)&retstr[4].var6 = *(_OWORD *)&self[7].var2;
  *(_OWORD *)&retstr[5].var5 = v7;
  v8 = *(_OWORD *)&self[3].var2;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var6 = v8;
  v9 = *(_OWORD *)&self[4].var6;
  *(_OWORD *)&retstr[1].var5 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr[2].var3 = v9;
  return self;
}

- (void)setVertexUniforms:(id *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = *(_OWORD *)&a3[2].var3;
  v6 = *(_OWORD *)&a3->var1;
  v5 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self[1]._objectSystem = *(_OWORD *)&a3[1].var5;
  *(_OWORD *)&self[1]._objectDataBufferAttributePosition = v4;
  *(_OWORD *)&self->_vertexUniforms.Percent = v6;
  *(_OWORD *)&self->_vertexUniforms.ShouldSample = v5;
  v7 = *(_OWORD *)&a3[5].var5;
  v9 = *(_OWORD *)&a3[3].var2;
  v8 = *(_OWORD *)&a3[4].var1;
  *(_OWORD *)self[2].super.TSDGPUParticleSystem_opaque = *(_OWORD *)&a3[4].var6;
  *(_OWORD *)&self[2]._objectDataBufferAttributeColor = v7;
  *(_OWORD *)&self[1]._objectDataBufferAttributeColorTexCoord = v9;
  *(_OWORD *)&self[1]._vertexUniforms.ParticleScalePercent = v8;
  v10 = *(_OWORD *)&a3[8].var6;
  v12 = *(_OWORD *)&a3[6].var3;
  v11 = *(_OWORD *)&a3[7].var2;
  *(_OWORD *)&self[2]._vertexUniforms.ShouldSample = *(_OWORD *)&a3[8].var1;
  *(_OWORD *)&self[3]._objectSystem = v10;
  *(_OWORD *)&self[2]._objectDataBufferAttributeSpeed = v12;
  *(_OWORD *)&self[2]._vertexUniforms.Percent = v11;
  v13 = *(_OWORD *)&a3[12].var1;
  v15 = *(_OWORD *)&a3[9].var5;
  v14 = *(_OWORD *)&a3[10].var3;
  *(_OWORD *)&self[3]._vertexUniforms.ParticleScalePercent = *(_OWORD *)&a3[11].var2;
  *(_OWORD *)self[4].super.TSDGPUParticleSystem_opaque = v13;
  *(_OWORD *)&self[3]._objectDataBufferAttributePosition = v15;
  *(_OWORD *)&self[3]._objectDataBufferAttributeColorTexCoord = v14;
}

@end
